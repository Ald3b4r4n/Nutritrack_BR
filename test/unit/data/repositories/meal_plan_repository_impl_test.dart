import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutritrack_br/data/daos/meal_plan_dao.dart';
import 'package:nutritrack_br/data/database/app_database.dart' hide MealPlan, MealPlanDay, MealPlanEntry;
import 'package:nutritrack_br/data/repositories/meal_plan_repository_impl.dart';
import 'package:nutritrack_br/domain/entities/meal_plan.dart';
import 'package:nutritrack_br/domain/entities/meal_plan_day.dart';
import 'package:nutritrack_br/domain/entities/meal_plan_entry.dart';
import 'package:nutritrack_br/domain/value_objects/meal_type.dart';

void main() {
  late AppDatabase db;
  late MealPlanDao dao;
  late MealPlanRepositoryImpl repository;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    dao = MealPlanDao(db);
    repository = MealPlanRepositoryImpl(dao);
  });

  tearDown(() async {
    await db.close();
  });

  group('MealPlanRepositoryImpl com Drift em memória (T044)', () {
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

    test('deve salvar e recuperar o plano, dias e entradas', () async {
      await repository.saveMealPlan(tPlan);
      await repository.saveMealPlanDays(tDays);
      await repository.saveMealPlanEntries(tEntries);

      final activePlanResult = await repository.getActiveMealPlan();
      expect(activePlanResult.isRight(), true);
      activePlanResult.fold(
        (l) => fail('should be right'),
        (plan) {
          expect(plan?.id, 'p1');
          expect(plan?.name, 'Plano Base');
        },
      );

      final daysResult = await repository.getMealPlanDays('p1');
      expect(daysResult.isRight(), true);
      daysResult.fold(
        (l) => fail('should be right'),
        (days) {
          expect(days.length, 1);
          expect(days.first.dayOfWeek, 1);
        },
      );

      final entriesResult = await repository.getMealPlanEntries('d1');
      expect(entriesResult.isRight(), true);
      entriesResult.fold(
        (l) => fail('should be right'),
        (entries) {
          expect(entries.length, 1);
          expect(entries.first.mealType, MealType.breakfast);
          expect(entries.first.targetCalories, 400);
        },
      );
    });
  });
}
