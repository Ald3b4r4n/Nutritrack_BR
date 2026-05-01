import 'package:dartz/dartz.dart';
import 'package:nutritrack_br/core/error/failures.dart';
import 'package:nutritrack_br/domain/entities/weight_log.dart';
import 'package:nutritrack_br/domain/repositories/weight_repository.dart';

/// Obtém histórico de peso ordenado por data.
class GetWeightHistoryUseCase {
  final WeightRepository repository;
  GetWeightHistoryUseCase(this.repository);

  Future<Either<Failure, List<WeightLog>>> call() async {
    return repository.getWeightHistory();
  }
}
