import 'package:drift/drift.dart';
import 'package:nutritrack_br/data/database/tables/meal_records_table.dart';
import 'package:nutritrack_br/data/database/tables/food_items_table.dart';

/// Tabela de itens consumidos em refeições (MealEntry).
class MealEntries extends Table {
  TextColumn get id => text()();
  TextColumn get mealRecordId =>
      text().references(MealRecords, #id, onDelete: KeyAction.cascade)();
  TextColumn get mealType => text()(); // MealType.name
  TextColumn get foodItemId => text().references(FoodItems, #id)();
  RealColumn get quantity => real()();
  TextColumn get servingDescription => text()();
  RealColumn get servingWeightGrams => real()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
