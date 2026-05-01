import 'package:dartz/dartz.dart';
import 'package:nutritrack_br/core/error/failures.dart';
import 'package:nutritrack_br/domain/entities/meal_plan.dart';
import 'package:nutritrack_br/domain/entities/meal_plan_day.dart';
import 'package:nutritrack_br/domain/entities/meal_plan_entry.dart';
import 'package:nutritrack_br/domain/repositories/meal_plan_repository.dart';

/// Classe auxiliar que encapsula um plano completo para simplificar o uso.
class FullMealPlan {
  final MealPlan plan;
  final List<MealPlanDay> days;
  final List<MealPlanEntry> entries;

  FullMealPlan({
    required this.plan,
    required this.days,
    required this.entries,
  });
}

/// Cria um plano alimentar com seus dias e metas por refeição.
class CreateMealPlanUseCase {
  final MealPlanRepository repository;
  CreateMealPlanUseCase(this.repository);

  Future<Either<Failure, FullMealPlan>> call(FullMealPlan fullPlan) async {
    // 1. Salvar o plano
    final planResult = await repository.saveMealPlan(fullPlan.plan);
    if (planResult.isLeft()) return Left(planResult.fold((l) => l, (r) => throw Exception()));

    // 2. Salvar os dias
    final daysResult = await repository.saveMealPlanDays(fullPlan.days);
    if (daysResult.isLeft()) return Left(daysResult.fold((l) => l, (r) => throw Exception()));

    // 3. Salvar as entradas
    final entriesResult = await repository.saveMealPlanEntries(fullPlan.entries);
    if (entriesResult.isLeft()) return Left(entriesResult.fold((l) => l, (r) => throw Exception()));

    return Right(fullPlan);
  }
}
