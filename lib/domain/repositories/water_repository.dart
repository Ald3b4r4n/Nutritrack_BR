import 'package:dartz/dartz.dart';
import 'package:nutritrack_br/core/error/failures.dart';
import 'package:nutritrack_br/domain/entities/water_log.dart';

/// Contrato do repositório de água.
abstract class WaterRepository {
  /// Registra ingestão de água.
  Future<Either<Failure, WaterLog>> addWaterLog(WaterLog log);

  /// Obtém todos os registros do dia.
  Future<Either<Failure, List<WaterLog>>> getDailyWaterLogs(DateTime date);

  /// Remove um registro de água.
  Future<Either<Failure, void>> removeWaterLog(String id);
}
