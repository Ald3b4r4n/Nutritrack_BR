import 'package:drift/drift.dart';

/// Tabela de alimentos — base para busca nutricional offline.
/// Valores nutricionais são por 100g/100ml.
class FoodItems extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get source =>
      text()(); // FoodSource.name (tbca/usda/proprietary/custom)
  RealColumn get calories => real()();
  RealColumn get protein => real()();
  RealColumn get carbohydrates => real()();
  RealColumn get fat => real()();
  RealColumn get fiber => real()();
  RealColumn get sodium => real().nullable()();
  BoolColumn get isDeleted => boolean().withDefault(const Constant(false))();
  IntColumn get version => integer().withDefault(const Constant(1))();

  @override
  Set<Column> get primaryKey => {id};
}
