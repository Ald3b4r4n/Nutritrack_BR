import 'package:drift/drift.dart';

/// Tabela de registro de água.
class WaterLogs extends Table {
  TextColumn get id => text()();
  IntColumn get amountMl => integer()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
