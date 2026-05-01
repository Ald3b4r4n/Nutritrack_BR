import 'package:drift/drift.dart';
import 'package:nutritrack_br/data/database/tables/meal_plan_days_table.dart';

/// Tabela de entradas (metas) por refeição em um dia do plano.
class MealPlanEntries extends Table {
  TextColumn get id => text()();
  TextColumn get mealPlanDayId => text().references(MealPlanDays, #id)();
  TextColumn get mealType => text()();
  RealColumn get targetCalories => real()();
  RealColumn get targetProtein => real()();
  RealColumn get targetCarbs => real()();
  RealColumn get targetFat => real()();

  @override
  Set<Column> get primaryKey => {id};
}
