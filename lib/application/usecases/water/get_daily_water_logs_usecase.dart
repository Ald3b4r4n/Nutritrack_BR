import 'package:dartz/dartz.dart';
import 'package:nutritrack_br/core/error/failures.dart';
import 'package:nutritrack_br/domain/entities/water_log.dart';
import 'package:nutritrack_br/domain/repositories/water_repository.dart';

/// Obtém os registros de água do dia.
class GetDailyWaterLogsUseCase {
  final WaterRepository repository;

  GetDailyWaterLogsUseCase(this.repository);

  Future<Either<Failure, List<WaterLog>>> call(DateTime date) async {
    return repository.getDailyWaterLogs(date);
  }
}
