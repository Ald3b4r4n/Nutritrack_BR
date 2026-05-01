import 'package:dartz/dartz.dart';
import 'package:nutritrack_br/core/error/failures.dart';
import 'package:nutritrack_br/domain/entities/weight_log.dart';
import 'package:nutritrack_br/domain/repositories/weight_repository.dart';

/// Registra peso corporal por data.
class AddWeightLogUseCase {
  final WeightRepository repository;
  AddWeightLogUseCase(this.repository);

  Future<Either<Failure, WeightLog>> call(WeightLog log) async {
    return repository.addWeightLog(log);
  }
}
