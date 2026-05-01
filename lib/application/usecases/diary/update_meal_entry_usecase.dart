import 'package:dartz/dartz.dart';
import 'package:nutritrack_br/core/error/failures.dart';
import 'package:nutritrack_br/domain/entities/meal_entry.dart';
import 'package:nutritrack_br/domain/repositories/meal_repository.dart';

class UpdateMealEntryUseCase {
  final MealRepository repository;

  UpdateMealEntryUseCase(this.repository);

  Future<Either<Failure, MealEntry>> call(MealEntry entry) async {
    return repository.updateMealEntry(entry);
  }
}
