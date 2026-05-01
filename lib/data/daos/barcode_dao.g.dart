// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barcode_dao.dart';

// ignore_for_file: type=lint
mixin _$BarcodeDaoMixin on DatabaseAccessor<AppDatabase> {
  $BarcodeEntitiesTable get barcodeEntities => attachedDatabase.barcodeEntities;
  BarcodeDaoManager get managers => BarcodeDaoManager(this);
}

class BarcodeDaoManager {
  final _$BarcodeDaoMixin _db;
  BarcodeDaoManager(this._db);
  $$BarcodeEntitiesTableTableManager get barcodeEntities =>
      $$BarcodeEntitiesTableTableManager(
        _db.attachedDatabase,
        _db.barcodeEntities,
      );
}
