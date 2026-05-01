import 'package:drift/drift.dart';
import 'package:nutritrack_br/data/database/tables/food_items_table.dart';

/// Tabela de porções de alimentos.
class ServingSizes extends Table {
  TextColumn get id => text()();
  TextColumn get foodItemId =>
      text().references(FoodItems, #id, onDelete: KeyAction.cascade)();
  TextColumn get description => text()();
  RealColumn get weightInGrams => real()();
  RealColumn get defaultAmount => real().withDefault(const Constant(1.0))();

  @override
  Set<Column> get primaryKey => {id};
}
