import 'package:dartz/dartz.dart';
import 'package:nutritrack_br/core/error/failures.dart';
import 'package:nutritrack_br/domain/entities/barcode_entity.dart';

/// Contrato do repositório de códigos de barras.
abstract class BarcodeRepository {
  /// Busca um vínculo barcode→alimento.
  Future<Either<Failure, BarcodeEntity?>> findByBarcode(String barcode);

  /// Vincula um barcode a um alimento.
  Future<Either<Failure, BarcodeEntity>> linkBarcode(BarcodeEntity entity);
}
