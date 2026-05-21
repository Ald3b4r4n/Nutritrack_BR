import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nutritrack_br/application/usecases/food/create_food_usecase.dart';
import 'package:nutritrack_br/domain/entities/food_item.dart';
import 'package:nutritrack_br/domain/repositories/food_repository.dart';
import 'package:nutritrack_br/domain/value_objects/food_source.dart';
import 'package:nutritrack_br/domain/value_objects/nutrient_profile.dart';

class MockFoodRepository extends Mock implements FoodRepository {}

void main() {
  late MockFoodRepository mockRepository;
  late CreateFoodUseCase useCase;

  setUp(() {
    mockRepository = MockFoodRepository();
    useCase = CreateFoodUseCase(mockRepository);

    registerFallbackValue(
      const FoodItem(
        id: 'fallback',
        name: 'fallback',
        source: FoodSource.custom,
        nutrients: NutrientProfile(
          calories: 0,
          protein: 0,
          carbohydrates: 0,
          fat: 0,
          fiber: 0,
        ),
      ),
    );
  });

  group('CreateFoodUseCase (T025)', () {
    const tCustomFood = FoodItem(
      id: 'custom-001',
      name: 'Pão de queijo caseiro',
      source: FoodSource.custom,
      nutrients: NutrientProfile(
        calories: 363,
        protein: 5.0,
        carbohydrates: 34.0,
        fat: 23.0,
        fiber: 0.5,
      ),
    );

    test(
      'deve cadastrar alimento com FoodSource.custom e macros corretos',
      () async {
        when(
          () => mockRepository.createFood(any()),
        ).thenAnswer((_) async => const Right(tCustomFood));

        final result = await useCase(tCustomFood);

        expect(result.isRight(), true);
        result.fold((l) => fail('should be right'), (food) {
          expect(food.source, FoodSource.custom);
          expect(food.name, 'Pão de queijo caseiro');
          expect(food.nutrients.calories, 363);
          expect(food.nutrients.protein, 5.0);
          expect(food.nutrients.carbohydrates, 34.0);
          expect(food.nutrients.fat, 23.0);
          expect(food.nutrients.fiber, 0.5);
        });
        verify(() => mockRepository.createFood(tCustomFood)).called(1);
      },
    );

    test('deve preservar metadados de fonte no alimento salvo', () async {
      when(
        () => mockRepository.createFood(any()),
      ).thenAnswer((_) async => const Right(tCustomFood));

      final result = await useCase(tCustomFood);

      result.fold((l) => fail('should be right'), (food) {
        expect(food.source, FoodSource.custom);
        expect(food.source.label, 'Personalizado');
      });
    });
  });
}
