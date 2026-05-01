import 'package:dartz/dartz.dart';
import 'package:nutritrack_br/core/error/failures.dart';
import 'package:nutritrack_br/data/daos/meal_diary_dao.dart';
import 'package:nutritrack_br/domain/entities/meal_entry.dart';
import 'package:nutritrack_br/domain/entities/meal_entry_details.dart';
import 'package:nutritrack_br/domain/repositories/meal_repository.dart';

class MealRepositoryImpl implements MealRepository {
  final MealDiaryDao dao;

  MealRepositoryImpl(this.dao);

  @override
  Future<Either<Failure, MealEntry>> addMealEntry(
      MealEntry entry, DateTime date) async {
    try {
      final saved = await dao.addEntry(entry, date);
      return Right(saved);
    } catch (e) {
      return Left(DatabaseFailure('Erro ao adicionar refeição: $e'));
    }
  }

  @override
  Future<Either<Failure, List<MealEntryDetails>>> getDailyMeals(
      DateTime date) async {
    try {
      final meals = await dao.getDailyMeals(date);
      return Right(meals);
    } catch (e) {
      return Left(DatabaseFailure('Erro ao buscar refeições: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> removeMealEntry(String entryId) async {
    try {
      await dao.removeEntry(entryId);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure('Erro ao remover refeição: $e'));
    }
  }

  @override
  Future<Either<Failure, MealEntry>> updateMealEntry(MealEntry entry) async {
    try {
      final updated = await dao.updateEntry(entry);
      return Right(updated);
    } catch (e) {
      return Left(DatabaseFailure('Erro ao atualizar refeição: $e'));
    }
  }
}
