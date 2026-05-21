import 'package:dartz/dartz.dart';
import 'package:nutritrack_br/core/error/failures.dart';
import 'package:nutritrack_br/data/daos/meal_plan_dao.dart';
import 'package:nutritrack_br/domain/entities/meal_plan.dart';
import 'package:nutritrack_br/domain/entities/meal_plan_day.dart';
import 'package:nutritrack_br/domain/entities/meal_plan_entry.dart';
import 'package:nutritrack_br/domain/repositories/meal_plan_repository.dart';

/// Implementação do MealPlanRepository via Drift (MealPlanDao).
class MealPlanRepositoryImpl implements MealPlanRepository {
  final MealPlanDao dao;

  MealPlanRepositoryImpl(this.dao);

  @override
  Future<Either<Failure, MealPlan>> saveMealPlan(MealPlan plan) async {
    try {
      final saved = await dao.upsertMealPlan(plan);
      return Right(saved);
    } catch (e) {
      return Left(DatabaseFailure('Erro ao salvar plano alimentar: $e'));
    }
  }

  @override
  Future<Either<Failure, MealPlan?>> getActiveMealPlan() async {
    try {
      final plan = await dao.getActiveMealPlan();
      return Right(plan);
    } catch (e) {
      return Left(DatabaseFailure('Erro ao buscar plano ativo: $e'));
    }
  }

  @override
  Future<Either<Failure, List<MealPlan>>> getAllMealPlans() async {
    try {
      final plans = await dao.getAllMealPlans();
      return Right(plans);
    } catch (e) {
      return Left(DatabaseFailure('Erro ao listar planos: $e'));
    }
  }

  @override
  Future<Either<Failure, List<MealPlanDay>>> saveMealPlanDays(
    List<MealPlanDay> days,
  ) async {
    try {
      final saved = await dao.upsertMealPlanDays(days);
      return Right(saved);
    } catch (e) {
      return Left(DatabaseFailure('Erro ao salvar dias do plano: $e'));
    }
  }

  @override
  Future<Either<Failure, List<MealPlanDay>>> getMealPlanDays(
    String mealPlanId,
  ) async {
    try {
      final days = await dao.getMealPlanDays(mealPlanId);
      return Right(days);
    } catch (e) {
      return Left(DatabaseFailure('Erro ao buscar dias do plano: $e'));
    }
  }

  @override
  Future<Either<Failure, List<MealPlanEntry>>> saveMealPlanEntries(
    List<MealPlanEntry> entries,
  ) async {
    try {
      final saved = await dao.upsertMealPlanEntries(entries);
      return Right(saved);
    } catch (e) {
      return Left(DatabaseFailure('Erro ao salvar entradas do plano: $e'));
    }
  }

  @override
  Future<Either<Failure, List<MealPlanEntry>>> getMealPlanEntries(
    String mealPlanDayId,
  ) async {
    try {
      final entries = await dao.getMealPlanEntries(mealPlanDayId);
      return Right(entries);
    } catch (e) {
      return Left(DatabaseFailure('Erro ao buscar metas do dia: $e'));
    }
  }
}
