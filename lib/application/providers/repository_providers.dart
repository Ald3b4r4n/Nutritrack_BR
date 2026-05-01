import 'package:nutritrack_br/data/daos/meal_diary_dao.dart';
import 'package:nutritrack_br/data/database/app_database.dart';
import 'package:nutritrack_br/data/repositories/meal_repository_impl.dart';
import 'package:nutritrack_br/domain/repositories/meal_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'repository_providers.g.dart';

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  // Inicialização padrão do banco para o app real
  return createAppDatabase();
}

@Riverpod(keepAlive: true)
MealRepository mealRepository(Ref ref) {
  final db = ref.watch(appDatabaseProvider);
  return MealRepositoryImpl(MealDiaryDao(db));
}
