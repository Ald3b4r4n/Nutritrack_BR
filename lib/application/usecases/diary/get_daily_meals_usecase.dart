import 'package:dartz/dartz.dart';
import 'package:nutritrack_br/core/error/failures.dart';
import 'package:nutritrack_br/domain/entities/meal_entry_details.dart';
import 'package:nutritrack_br/domain/repositories/meal_repository.dart';

class GetDailyMealsUseCase {
  final MealRepository repository;

  GetDailyMealsUseCase(this.repository);

  Future<Either<Failure, List<MealEntryDetails>>> call(DateTime date) async {
    return repository.getDailyMeals(date);
  }
}
