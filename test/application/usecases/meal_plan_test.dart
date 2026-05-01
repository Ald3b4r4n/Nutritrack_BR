import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nutritrack_br/application/usecases/plan/create_meal_plan_usecase.dart';
import 'package:nutritrack_br/application/usecases/plan/get_active_meal_plan_usecase.dart';
import 'package:nutritrack_br/domain/entities/meal_plan.dart';
import 'package:nutritrack_br/domain/entities/meal_plan_day.dart';
import 'package:nutritrack_br/domain/entities/meal_plan_entry.dart';
import 'package:nutritrack_br/domain/repositories/meal_plan_repository.dart';
import 'package:nutritrack_br/domain/value_objects/meal_type.dart';

class MockMealPlanRepository extends Mock implements MealPlanRepository {}

void main() {
  late MockMealPlanRepository mockRepository;
  late CreateMealPlanUseCase createUseCase;
  late GetActiveMealPlanUseCase getActiveUseCase;

  setUp(() {
    mockRepository = MockMealPlanRepository();
    createUseCase = CreateMealPlanUseCase(mockRepository);
    getActiveUseCase = GetActiveMealPlanUseCase(mockRepository);

    registerFallbackValue(const MealPlan(id: '1', name: 'Plan', isActive: true));
  });

  group('Meal Plan Usecases (T043)', () {
    final tPlan = const MealPlan(id: 'p1', name: 'Plano Base', isActive: true);
    const tDays = [
      MealPlanDay(id: 'd1', mealPlanId: 'p1', dayOfWeek: 1), // Segunda
    ];
    const tEntries = [
      MealPlanEntry(
        id: 'e1',
        mealPlanDayId: 'd1',
        mealType: MealType.breakfast,
        targetCalories: 400,
        targetProtein: 20,
        targetCarbs: 40,
        targetFat: 15,
      ),
    ];
    final tFullPlan = FullMealPlan(plan: tPlan, days: tDays, entries: tEntries);

    test('deve criar um plano manual com dias e metas por refeição', () async {
      when(() => mockRepository.saveMealPlan(any()))
          .thenAnswer((_) async => Right(tPlan));
      when(() => mockRepository.saveMealPlanDays(any()))
          .thenAnswer((_) async => Right(tDays));
      when(() => mockRepository.saveMealPlanEntries(any()))
          .thenAnswer((_) async => Right(tEntries));

      final result = await createUseCase(tFullPlan);

      expect(result.isRight(), true);
      verify(() => mockRepository.saveMealPlan(tPlan)).called(1);
      verify(() => mockRepository.saveMealPlanDays(tDays)).called(1);
      verify(() => mockRepository.saveMealPlanEntries(tEntries)).called(1);
    });

    test('deve buscar o plano ativo com seus dias e entradas', () async {
      when(() => mockRepository.getActiveMealPlan())
          .thenAnswer((_) async => Right(tPlan));
      when(() => mockRepository.getMealPlanDays('p1'))
          .thenAnswer((_) async => Right(tDays));
      when(() => mockRepository.getMealPlanEntries('d1'))
          .thenAnswer((_) async => Right(tEntries));

      final result = await getActiveUseCase();

      expect(result.isRight(), true);
      result.fold(
        (l) => fail('should be right'),
        (fullPlan) {
          expect(fullPlan, isNotNull);
          expect(fullPlan!.plan.id, 'p1');
          expect(fullPlan.days.length, 1);
          expect(fullPlan.entries.length, 1);
          expect(fullPlan.entries.first.mealType, MealType.breakfast);
        },
      );
    });

    test('deve retornar null se não houver plano ativo', () async {
      when(() => mockRepository.getActiveMealPlan())
          .thenAnswer((_) async => const Right(null));

      final result = await getActiveUseCase();

      expect(result.isRight(), true);
      result.fold(
        (l) => fail('should be right'),
        (fullPlan) => expect(fullPlan, isNull),
      );
    });
  });
}
