import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nutritrack_br/application/usecases/diary/add_meal_entry_usecase.dart';
import 'package:nutritrack_br/application/usecases/diary/get_daily_meals_usecase.dart';
import 'package:nutritrack_br/application/usecases/diary/remove_meal_entry_usecase.dart';
import 'package:nutritrack_br/application/usecases/diary/update_meal_entry_usecase.dart';
import 'package:nutritrack_br/domain/entities/food_item.dart';
import 'package:nutritrack_br/domain/entities/meal_entry.dart';
import 'package:nutritrack_br/domain/entities/meal_entry_details.dart';
import 'package:nutritrack_br/domain/repositories/meal_repository.dart';
import 'package:nutritrack_br/domain/value_objects/food_source.dart';
import 'package:nutritrack_br/domain/value_objects/meal_type.dart';
import 'package:nutritrack_br/domain/value_objects/nutrient_profile.dart';

class MockMealRepository extends Mock implements MealRepository {}

void main() {
  late MockMealRepository mockRepository;
  late AddMealEntryUseCase addUseCase;
  late UpdateMealEntryUseCase updateUseCase;
  late RemoveMealEntryUseCase removeUseCase;
  late GetDailyMealsUseCase getDailyUseCase;

  setUp(() {
    mockRepository = MockMealRepository();
    addUseCase = AddMealEntryUseCase(mockRepository);
    updateUseCase = UpdateMealEntryUseCase(mockRepository);
    removeUseCase = RemoveMealEntryUseCase(mockRepository);
    getDailyUseCase = GetDailyMealsUseCase(mockRepository);
    
    registerFallbackValue(
      MealEntry(
        id: '1',
        mealRecordId: 'r1',
        mealType: MealType.breakfast,
        foodItemId: 'f1',
        quantity: 1,
        servingDescription: 'g',
        servingWeightGrams: 100,
        createdAt: DateTime.now(),
      ),
    );
  });

  group('Meal Diary Usecases (T018)', () {
    final tDate = DateTime(2023, 10, 10);
    const tFood = FoodItem(
      id: 'f1',
      name: 'Arroz',
      source: FoodSource.tbca,
      nutrients: NutrientProfile(
        calories: 130,
        protein: 2.5,
        carbohydrates: 28,
        fat: 0.2,
        fiber: 1.2,
      ),
    );

    final tEntry = MealEntry(
      id: 'e1',
      mealRecordId: 'r1',
      mealType: MealType.lunch,
      foodItemId: 'f1',
      quantity: 2, // 2 porções
      servingDescription: '100g',
      servingWeightGrams: 100, // 200g no total
      createdAt: tDate,
    );

    final tDetails = MealEntryDetails(entry: tEntry, foodItem: tFood);

    test('deve adicionar um alimento e calcular os macros corretamente na entidade Details', () async {
      when(() => mockRepository.addMealEntry(any(), any()))
          .thenAnswer((_) async => Right(tEntry));

      final result = await addUseCase(entry: tEntry, date: tDate);

      expect(result.isRight(), true);
      verify(() => mockRepository.addMealEntry(tEntry, tDate)).called(1);

      // Valida que o MealEntryDetails calcula macros corretamente (130 kcal/100g * 2 = 260)
      expect(tDetails.calories, 260.0);
      expect(tDetails.protein, 5.0);
      expect(tDetails.carbohydrates, 56.0);
    });

    test('deve recuperar refeições do dia', () async {
      when(() => mockRepository.getDailyMeals(tDate))
          .thenAnswer((_) async => Right([tDetails]));

      final result = await getDailyUseCase(tDate);

      expect(result.isRight(), true);
      result.fold(
        (l) => fail('should be right'),
        (meals) {
          expect(meals.length, 1);
          expect(meals.first.entry.id, 'e1');
        },
      );
    });

    test('deve editar uma entrada', () async {
      when(() => mockRepository.updateMealEntry(any()))
          .thenAnswer((_) async => Right(tEntry));

      final result = await updateUseCase(tEntry);

      expect(result.isRight(), true);
      verify(() => mockRepository.updateMealEntry(tEntry)).called(1);
    });

    test('deve remover uma entrada', () async {
      when(() => mockRepository.removeMealEntry('e1'))
          .thenAnswer((_) async => const Right(null));

      final result = await removeUseCase('e1');

      expect(result.isRight(), true);
      verify(() => mockRepository.removeMealEntry('e1')).called(1);
    });
  });
}
