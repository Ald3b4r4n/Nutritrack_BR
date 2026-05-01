import 'package:drift/drift.dart';

/// Tabela de alimentos recentes por tipo de refeição.
class RecentFoodsByMeal extends Table {
  TextColumn get foodItemId => text()();
  TextColumn get mealType => text()();
  DateTimeColumn get lastUsedAt => dateTime()();
  IntColumn get useCount => integer().withDefault(const Constant(1))();

  @override
  Set<Column> get primaryKey => {foodItemId, mealType};
}
