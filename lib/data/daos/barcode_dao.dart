import 'package:drift/drift.dart';
import 'package:nutritrack_br/data/database/app_database.dart';
import 'package:nutritrack_br/data/database/tables/barcode_entities_table.dart';
import 'package:nutritrack_br/domain/entities/barcode_entity.dart' as domain;

part 'barcode_dao.g.dart';

/// DAO dedicado para operações de barcode.
@DriftAccessor(tables: [BarcodeEntities])
class BarcodeDao extends DatabaseAccessor<AppDatabase>
    with _$BarcodeDaoMixin {
  BarcodeDao(super.db);

  /// Busca um vínculo barcode→alimento.
  Future<domain.BarcodeEntity?> findByBarcode(String barcode) async {
    final row = await (select(barcodeEntities)
          ..where((t) => t.barcode.equals(barcode)))
        .getSingleOrNull();
    if (row == null) return null;
    return domain.BarcodeEntity(
      barcode: row.barcode,
      foodItemId: row.foodItemId,
      scannedAt: row.scannedAt,
    );
  }

  /// Vincula (upsert) um barcode a um alimento.
  Future<domain.BarcodeEntity> linkBarcode(domain.BarcodeEntity entity) async {
    final companion = BarcodeEntitiesCompanion(
      barcode: Value(entity.barcode),
      foodItemId: Value(entity.foodItemId),
      scannedAt: Value(entity.scannedAt),
    );
    await into(barcodeEntities).insertOnConflictUpdate(companion);
    return entity;
  }
}
