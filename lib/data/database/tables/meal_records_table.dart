import 'package:drift/drift.dart';

/// Tabela de diários diários (MealRecord).
class MealRecords extends Table {
  TextColumn get id => text()();
  DateTimeColumn get date => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
