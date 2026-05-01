import 'package:dartz/dartz.dart';
import 'package:nutritrack_br/core/error/failures.dart';
import 'package:nutritrack_br/domain/entities/meal_entry.dart';
import 'package:nutritrack_br/domain/repositories/meal_repository.dart';

class AddMealEntryUseCase {
  final MealRepository repository;

  AddMealEntryUseCase(this.repository);

  Future<Either<Failure, MealEntry>> call({
    required MealEntry entry,
    required DateTime date,
  }) async {
    return repository.addMealEntry(entry, date);
  }
}
