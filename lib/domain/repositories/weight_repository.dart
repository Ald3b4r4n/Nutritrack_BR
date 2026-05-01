import 'package:dartz/dartz.dart';
import 'package:nutritrack_br/core/error/failures.dart';
import 'package:nutritrack_br/domain/entities/weight_log.dart';

/// Contrato do repositório de peso.
abstract class WeightRepository {
  /// Registra um peso por data.
  Future<Either<Failure, WeightLog>> addWeightLog(WeightLog log);

  /// Obtém histórico de peso ordenado por data (mais recente primeiro).
  Future<Either<Failure, List<WeightLog>>> getWeightHistory();

  /// Remove um registro de peso.
  Future<Either<Failure, void>> removeWeightLog(String id);
}
