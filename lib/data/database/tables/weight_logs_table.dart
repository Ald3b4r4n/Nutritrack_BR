import 'package:drift/drift.dart';

/// Tabela de registro de peso.
class WeightLogs extends Table {
  TextColumn get id => text()();
  RealColumn get weightKg => real()();
  DateTimeColumn get date => dateTime()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
