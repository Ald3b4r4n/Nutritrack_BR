import 'package:drift/drift.dart';
import 'package:nutritrack_br/data/database/tables/meal_plans_table.dart';

/// Tabela de dias de um plano alimentar.
class MealPlanDays extends Table {
  TextColumn get id => text()();
  TextColumn get mealPlanId => text().references(MealPlans, #id)();
  IntColumn get dayOfWeek => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
