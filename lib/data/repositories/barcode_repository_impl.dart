import 'package:dartz/dartz.dart';
import 'package:nutritrack_br/core/error/failures.dart';
import 'package:nutritrack_br/data/daos/barcode_dao.dart';
import 'package:nutritrack_br/domain/entities/barcode_entity.dart';
import 'package:nutritrack_br/domain/repositories/barcode_repository.dart';

/// Implementação do repositório de barcode usando BarcodeDao/Drift.
class BarcodeRepositoryImpl implements BarcodeRepository {
  final BarcodeDao dao;

  BarcodeRepositoryImpl(this.dao);

  @override
  Future<Either<Failure, BarcodeEntity?>> findByBarcode(String barcode) async {
    try {
      final entity = await dao.findByBarcode(barcode);
      return Right(entity);
    } catch (e) {
      return Left(DatabaseFailure('Erro ao buscar barcode: $e'));
    }
  }

  @override
  Future<Either<Failure, BarcodeEntity>> linkBarcode(
    BarcodeEntity entity,
  ) async {
    try {
      final saved = await dao.linkBarcode(entity);
      return Right(saved);
    } catch (e) {
      return Left(DatabaseFailure('Erro ao vincular barcode: $e'));
    }
  }
}
