import 'package:dartz/dartz.dart';
import 'package:nutritrack_br/core/error/failures.dart';
import 'package:nutritrack_br/domain/entities/barcode_entity.dart';
import 'package:nutritrack_br/domain/repositories/barcode_repository.dart';

/// Busca um alimento pelo código de barras no banco local.
class FindFoodByBarcodeUseCase {
  final BarcodeRepository repository;

  FindFoodByBarcodeUseCase(this.repository);

  Future<Either<Failure, BarcodeEntity?>> call(String barcode) async {
    return repository.findByBarcode(barcode);
  }
}
