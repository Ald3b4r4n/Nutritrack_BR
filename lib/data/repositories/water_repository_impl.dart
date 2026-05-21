import 'package:dartz/dartz.dart';
import 'package:nutritrack_br/core/error/failures.dart';
import 'package:nutritrack_br/data/daos/water_dao.dart';
import 'package:nutritrack_br/domain/entities/water_log.dart';
import 'package:nutritrack_br/domain/repositories/water_repository.dart';

/// Implementação do repositório de água usando WaterDao/Drift.
class WaterRepositoryImpl implements WaterRepository {
  final WaterDao dao;

  WaterRepositoryImpl(this.dao);

  @override
  Future<Either<Failure, WaterLog>> addWaterLog(WaterLog log) async {
    try {
      final saved = await dao.insertLog(log);
      return Right(saved);
    } catch (e) {
      return Left(DatabaseFailure('Erro ao registrar água: $e'));
    }
  }

  @override
  Future<Either<Failure, List<WaterLog>>> getDailyWaterLogs(
    DateTime date,
  ) async {
    try {
      final logs = await dao.getDailyLogs(date);
      return Right(logs);
    } catch (e) {
      return Left(DatabaseFailure('Erro ao buscar registros de água: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> removeWaterLog(String id) async {
    try {
      await dao.deleteLog(id);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Erro ao remover registro de água: $e'));
    }
  }
}
