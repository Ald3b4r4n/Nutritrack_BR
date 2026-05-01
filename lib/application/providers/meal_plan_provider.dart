import 'package:nutritrack_br/application/providers/repository_providers.dart';
import 'package:nutritrack_br/application/usecases/plan/create_meal_plan_usecase.dart';
import 'package:nutritrack_br/application/usecases/plan/get_active_meal_plan_usecase.dart';
import 'package:nutritrack_br/data/daos/meal_plan_dao.dart';
import 'package:nutritrack_br/data/repositories/meal_plan_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'meal_plan_provider.g.dart';

@riverpod
class ActiveMealPlanNotifier extends _$ActiveMealPlanNotifier {
  @override
  FutureOr<FullMealPlan?> build() async {
    return _fetchActivePlan();
  }

  Future<FullMealPlan?> _fetchActivePlan() async {
    final db = ref.read(appDatabaseProvider);
    final repo = MealPlanRepositoryImpl(MealPlanDao(db));
    final usecase = GetActiveMealPlanUseCase(repo);
    final result = await usecase();
    return result.fold(
      (l) => throw Exception(l.message),
      (r) => r,
    );
  }

  Future<void> saveNewPlan(FullMealPlan plan) async {
    final db = ref.read(appDatabaseProvider);
    final repo = MealPlanRepositoryImpl(MealPlanDao(db));
    final usecase = CreateMealPlanUseCase(repo);
    final result = await usecase(plan);
    if (result.isRight()) {
      ref.invalidateSelf();
    }
  }
}
