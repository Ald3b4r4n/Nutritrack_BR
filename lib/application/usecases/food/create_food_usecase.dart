import 'package:dartz/dartz.dart';
import 'package:nutritrack_br/core/error/failures.dart';
import 'package:nutritrack_br/domain/entities/food_item.dart';
import 'package:nutritrack_br/domain/repositories/food_repository.dart';

/// Cadastra um alimento personalizado (FoodSource.custom).
class CreateFoodUseCase {
  final FoodRepository repository;

  CreateFoodUseCase(this.repository);

  Future<Either<Failure, FoodItem>> call(FoodItem food) async {
    return repository.createFood(food);
  }
}
