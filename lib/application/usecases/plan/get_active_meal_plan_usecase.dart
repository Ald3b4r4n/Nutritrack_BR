import 'package:dartz/dartz.dart';
import 'package:nutritrack_br/core/error/failures.dart';
import 'package:nutritrack_br/application/usecases/plan/create_meal_plan_usecase.dart';
import 'package:nutritrack_br/domain/entities/meal_plan_entry.dart';
import 'package:nutritrack_br/domain/repositories/meal_plan_repository.dart';

/// Obtém o plano alimentar ativo completo.
class GetActiveMealPlanUseCase {
  final MealPlanRepository repository;
  GetActiveMealPlanUseCase(this.repository);

  Future<Either<Failure, FullMealPlan?>> call() async {
    final planResult = await repository.getActiveMealPlan();
    if (planResult.isLeft())
      return Left(planResult.fold((l) => l, (r) => throw Exception()));
    final plan = planResult.fold((l) => throw Exception(), (r) => r);

    if (plan == null) return const Right(null);

    final daysResult = await repository.getMealPlanDays(plan.id);
    if (daysResult.isLeft())
      return Left(daysResult.fold((l) => l, (r) => throw Exception()));
    final days = daysResult.fold((l) => throw Exception(), (r) => r);

    final entries = <MealPlanEntry>[];
    for (final day in days) {
      final entriesResult = await repository.getMealPlanEntries(day.id);
      if (entriesResult.isLeft())
        return Left(entriesResult.fold((l) => l, (r) => throw Exception()));
      entries.addAll(entriesResult.fold((l) => throw Exception(), (r) => r));
    }

    return Right(FullMealPlan(plan: plan, days: days, entries: entries));
  }
}
