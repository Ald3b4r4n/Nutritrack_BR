import 'package:dartz/dartz.dart';
import 'package:nutritrack_br/core/error/failures.dart';
import 'package:nutritrack_br/domain/entities/meal_plan.dart';
import 'package:nutritrack_br/domain/entities/meal_plan_day.dart';
import 'package:nutritrack_br/domain/entities/meal_plan_entry.dart';

/// Contrato para o repositório de planos alimentares.
abstract class MealPlanRepository {
  /// Salva ou atualiza um plano alimentar.
  Future<Either<Failure, MealPlan>> saveMealPlan(MealPlan plan);

  /// Obtém o plano ativo atual (se houver).
  Future<Either<Failure, MealPlan?>> getActiveMealPlan();

  /// Obtém todos os planos alimentares.
  Future<Either<Failure, List<MealPlan>>> getAllMealPlans();

  /// Salva ou atualiza os dias associados a um plano.
  Future<Either<Failure, List<MealPlanDay>>> saveMealPlanDays(List<MealPlanDay> days);

  /// Obtém os dias associados a um plano.
  Future<Either<Failure, List<MealPlanDay>>> getMealPlanDays(String mealPlanId);

  /// Salva ou atualiza as entradas (metas por refeição) de um dia.
  Future<Either<Failure, List<MealPlanEntry>>> saveMealPlanEntries(List<MealPlanEntry> entries);

  /// Obtém as entradas de um dia específico do plano.
  Future<Either<Failure, List<MealPlanEntry>>> getMealPlanEntries(String mealPlanDayId);
}
