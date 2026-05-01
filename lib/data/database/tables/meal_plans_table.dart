import 'package:drift/drift.dart';

/// Tabela de planos alimentares.
class MealPlans extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  BoolColumn get isActive => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
