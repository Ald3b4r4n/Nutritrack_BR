import 'package:dartz/dartz.dart';
import 'package:nutritrack_br/core/error/failures.dart';
import 'package:nutritrack_br/data/daos/food_dao.dart';
import 'package:nutritrack_br/domain/entities/food_item.dart';
import 'package:nutritrack_br/domain/repositories/food_repository.dart';
import 'package:nutritrack_br/domain/value_objects/food_source.dart';

/// Implementação do repositório de alimentos usando FoodDao/Drift.
class FoodRepositoryImpl implements FoodRepository {
  final FoodDao dao;

  FoodRepositoryImpl(this.dao);

  @override
  Future<Either<Failure, List<FoodItem>>> searchFoods(
    String query, {
    FoodSource? source,
  }) async {
    try {
      final foods = await dao.searchFoods(query, source: source);
      return Right(foods);
    } catch (e) {
      return Left(DatabaseFailure('Erro ao buscar alimentos: $e'));
    }
  }

  @override
  Future<Either<Failure, FoodItem>> createFood(FoodItem food) async {
    try {
      final saved = await dao.insertFood(food);
      return Right(saved);
    } catch (e) {
      return Left(DatabaseFailure('Erro ao cadastrar alimento: $e'));
    }
  }

  @override
  Future<Either<Failure, FoodItem>> updateFood(FoodItem food) async {
    try {
      final updated = await dao.updateFood(food);
      return Right(updated);
    } catch (e) {
      return Left(DatabaseFailure('Erro ao atualizar alimento: $e'));
    }
  }

  @override
  Future<Either<Failure, FoodItem>> getFoodById(String id) async {
    try {
      final food = await dao.getFoodById(id);
      if (food == null) {
        return Left(DatabaseFailure('Alimento não encontrado: $id'));
      }
      return Right(food);
    } catch (e) {
      return Left(DatabaseFailure('Erro ao buscar alimento: $e'));
    }
  }
}
