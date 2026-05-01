import 'package:dartz/dartz.dart';
import 'package:nutritrack_br/core/error/failures.dart';
import 'package:nutritrack_br/domain/entities/water_log.dart';
import 'package:nutritrack_br/domain/repositories/water_repository.dart';

/// Registra ingestão de água.
class AddWaterLogUseCase {
  final WaterRepository repository;

  AddWaterLogUseCase(this.repository);

  Future<Either<Failure, WaterLog>> call(WaterLog log) async {
    return repository.addWaterLog(log);
  }
}
