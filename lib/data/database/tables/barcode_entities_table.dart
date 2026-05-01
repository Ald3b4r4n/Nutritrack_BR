import 'package:drift/drift.dart';

/// Tabela de vínculos EAN/UPC → FoodItem.
class BarcodeEntities extends Table {
  TextColumn get barcode => text()();
  TextColumn get foodItemId => text()();
  DateTimeColumn get scannedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {barcode};
}
