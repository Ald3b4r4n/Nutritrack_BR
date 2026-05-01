import 'package:dartz/dartz.dart';
import 'package:nutritrack_br/core/error/failures.dart';
import 'package:nutritrack_br/domain/entities/barcode_entity.dart';
import 'package:nutritrack_br/domain/repositories/barcode_repository.dart';

/// Vincula um código de barras (EAN/UPC) a um alimento do banco local.
class LinkBarcodeUseCase {
  final BarcodeRepository repository;

  LinkBarcodeUseCase(this.repository);

  Future<Either<Failure, BarcodeEntity>> call(BarcodeEntity entity) async {
    return repository.linkBarcode(entity);
  }
}
