import 'package:dartz/dartz.dart';
import 'package:nutritrack_br/core/error/failures.dart';
import 'package:nutritrack_br/data/daos/weight_dao.dart';
import 'package:nutritrack_br/domain/entities/weight_log.dart';
import 'package:nutritrack_br/domain/repositories/weight_repository.dart';

/// Implementação do repositório de peso usando WeightDao/Drift.
class WeightRepositoryImpl implements WeightRepository {
  final WeightDao dao;

  WeightRepositoryImpl(this.dao);

  @override
  Future<Either<Failure, WeightLog>> addWeightLog(WeightLog log) async {
    try {
      final saved = await dao.insertLog(log);
      return Right(saved);
    } catch (e) {
      return Left(DatabaseFailure('Erro ao registrar peso: $e'));
    }
  }

  @override
  Future<Either<Failure, List<WeightLog>>> getWeightHistory() async {
    try {
      final logs = await dao.getHistory();
      return Right(logs);
    } catch (e) {
      return Left(DatabaseFailure('Erro ao buscar histórico de peso: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> removeWeightLog(String id) async {
    try {
      await dao.deleteLog(id);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Erro ao remover registro de peso: $e'));
    }
  }
}
