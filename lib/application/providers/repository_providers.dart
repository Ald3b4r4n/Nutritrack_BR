import 'package:nutritrack_br/data/daos/food_dao.dart';
import 'package:nutritrack_br/data/daos/meal_diary_dao.dart';
import 'package:nutritrack_br/data/database/app_database.dart';
import 'package:nutritrack_br/data/repositories/food_repository_impl.dart';
import 'package:nutritrack_br/data/repositories/meal_repository_impl.dart';
import 'package:nutritrack_br/domain/repositories/food_repository.dart';
import 'package:nutritrack_br/domain/repositories/meal_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_providers.g.dart';

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  return createAppDatabase();
}

@Riverpod(keepAlive: true)
MealRepository mealRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return MealRepositoryImpl(MealDiaryDao(db));
}

@Riverpod(keepAlive: true)
FoodRepository foodRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return FoodRepositoryImpl(FoodDao(db));
}
