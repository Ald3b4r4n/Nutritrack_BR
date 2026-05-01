import 'package:dartz/dartz.dart';
import 'package:nutritrack_br/core/error/failures.dart';
import 'package:nutritrack_br/domain/entities/food_item.dart';
import 'package:nutritrack_br/domain/repositories/food_repository.dart';
import 'package:nutritrack_br/domain/value_objects/food_source.dart';

/// Busca alimentos por nome com filtro opcional por fonte nutricional.
class SearchFoodsUseCase {
  final FoodRepository repository;

  SearchFoodsUseCase(this.repository);

  Future<Either<Failure, List<FoodItem>>> call(
    String query, {
    FoodSource? source,
  }) async {
    return repository.searchFoods(query, source: source);
  }
}
