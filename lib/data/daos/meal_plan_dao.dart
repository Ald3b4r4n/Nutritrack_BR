import 'package:drift/drift.dart';
import 'package:nutritrack_br/data/database/app_database.dart';
import 'package:nutritrack_br/data/database/tables/meal_plan_days_table.dart';
import 'package:nutritrack_br/data/database/tables/meal_plan_entries_table.dart';
import 'package:nutritrack_br/data/database/tables/meal_plans_table.dart';
import 'package:nutritrack_br/domain/entities/meal_plan.dart' as domain;
import 'package:nutritrack_br/domain/entities/meal_plan_day.dart' as domain;
import 'package:nutritrack_br/domain/entities/meal_plan_entry.dart' as domain;
import 'package:nutritrack_br/domain/value_objects/meal_type.dart';

part 'meal_plan_dao.g.dart';

@DriftAccessor(tables: [MealPlans, MealPlanDays, MealPlanEntries])
class MealPlanDao extends DatabaseAccessor<AppDatabase>
    with _$MealPlanDaoMixin {
  MealPlanDao(super.db);

  // --- Meal Plans ---

  Future<domain.MealPlan> upsertMealPlan(domain.MealPlan plan) async {
    await into(mealPlans).insertOnConflictUpdate(
      MealPlansCompanion(
        id: Value(plan.id),
        name: Value(plan.name),
        isActive: Value(plan.isActive),
      ),
    );
    return plan;
  }

  Future<domain.MealPlan?> getActiveMealPlan() async {
    final row = await (select(
      mealPlans,
    )..where((t) => t.isActive.equals(true))).getSingleOrNull();
    if (row == null) return null;
    return domain.MealPlan(id: row.id, name: row.name, isActive: row.isActive);
  }

  Future<List<domain.MealPlan>> getAllMealPlans() async {
    final rows = await select(mealPlans).get();
    return rows
        .map(
          (r) => domain.MealPlan(id: r.id, name: r.name, isActive: r.isActive),
        )
        .toList();
  }

  // --- Meal Plan Days ---

  Future<List<domain.MealPlanDay>> upsertMealPlanDays(
    List<domain.MealPlanDay> days,
  ) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
        mealPlanDays,
        days.map(
          (d) => MealPlanDaysCompanion(
            id: Value(d.id),
            mealPlanId: Value(d.mealPlanId),
            dayOfWeek: Value(d.dayOfWeek),
          ),
        ),
      );
    });
    return days;
  }

  Future<List<domain.MealPlanDay>> getMealPlanDays(String mealPlanId) async {
    final rows = await (select(
      mealPlanDays,
    )..where((t) => t.mealPlanId.equals(mealPlanId))).get();
    return rows
        .map(
          (r) => domain.MealPlanDay(
            id: r.id,
            mealPlanId: r.mealPlanId,
            dayOfWeek: r.dayOfWeek,
          ),
        )
        .toList();
  }

  // --- Meal Plan Entries ---

  Future<List<domain.MealPlanEntry>> upsertMealPlanEntries(
    List<domain.MealPlanEntry> entries,
  ) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
        mealPlanEntries,
        entries.map(
          (e) => MealPlanEntriesCompanion(
            id: Value(e.id),
            mealPlanDayId: Value(e.mealPlanDayId),
            mealType: Value(e.mealType.name),
            targetCalories: Value(e.targetCalories),
            targetProtein: Value(e.targetProtein),
            targetCarbs: Value(e.targetCarbs),
            targetFat: Value(e.targetFat),
          ),
        ),
      );
    });
    return entries;
  }

  Future<List<domain.MealPlanEntry>> getMealPlanEntries(
    String mealPlanDayId,
  ) async {
    final rows = await (select(
      mealPlanEntries,
    )..where((t) => t.mealPlanDayId.equals(mealPlanDayId))).get();
    return rows
        .map(
          (r) => domain.MealPlanEntry(
            id: r.id,
            mealPlanDayId: r.mealPlanDayId,
            mealType: MealType.values.firstWhere((e) => e.name == r.mealType),
            targetCalories: r.targetCalories,
            targetProtein: r.targetProtein,
            targetCarbs: r.targetCarbs,
            targetFat: r.targetFat,
          ),
        )
        .toList();
  }
}
