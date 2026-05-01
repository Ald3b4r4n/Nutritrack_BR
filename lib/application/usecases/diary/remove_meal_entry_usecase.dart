import 'package:dartz/dartz.dart';
import 'package:nutritrack_br/core/error/failures.dart';
import 'package:nutritrack_br/domain/repositories/meal_repository.dart';

class RemoveMealEntryUseCase {
  final MealRepository repository;

  RemoveMealEntryUseCase(this.repository);

  Future<Either<Failure, void>> call(String entryId) async {
    return repository.removeMealEntry(entryId);
  }
}
