import 'package:dartz/dartz.dart';
import 'package:nutritrack_br/core/error/failures.dart';
import 'package:nutritrack_br/domain/entities/food_item.dart';
import 'package:nutritrack_br/domain/value_objects/food_source.dart';

/// Contrato do repositório de alimentos.
abstract class FoodRepository {
  /// Busca alimentos por nome (LIKE) com filtro opcional por fonte.
  Future<Either<Failure, List<FoodItem>>> searchFoods(
    String query, {
    FoodSource? source,
  });

  /// Cadastra um alimento customizado.
  Future<Either<Failure, FoodItem>> createFood(FoodItem food);

  /// Atualiza um alimento existente.
  Future<Either<Failure, FoodItem>> updateFood(FoodItem food);

  /// Retorna um alimento por id.
  Future<Either<Failure, FoodItem>> getFoodById(String id);
}
