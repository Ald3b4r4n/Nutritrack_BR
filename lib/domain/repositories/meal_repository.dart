import 'package:nutritrack_br/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:nutritrack_br/domain/entities/meal_entry.dart';
import 'package:nutritrack_br/domain/entities/meal_entry_details.dart';

abstract class MealRepository {
  /// Obtém o diário do dia e as entradas com seus alimentos
  Future<Either<Failure, List<MealEntryDetails>>> getDailyMeals(DateTime date);

  /// Adiciona uma entrada ao diário (cria o MealRecord se não existir)
  Future<Either<Failure, MealEntry>> addMealEntry(MealEntry entry, DateTime date);

  /// Edita uma entrada existente
  Future<Either<Failure, MealEntry>> updateMealEntry(MealEntry entry);

  /// Remove uma entrada
  Future<Either<Failure, void>> removeMealEntry(String entryId);
}
