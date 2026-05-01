import 'package:nutritrack_br/application/providers/repository_providers.dart';
import 'package:nutritrack_br/application/providers/water_provider.dart';
import 'package:nutritrack_br/application/providers/meal_plan_provider.dart';
import 'package:nutritrack_br/data/daos/weight_dao.dart';
import 'package:nutritrack_br/data/daos/meal_diary_dao.dart';
import 'package:nutritrack_br/data/repositories/weight_repository_impl.dart';
import 'package:nutritrack_br/application/usecases/weight/get_weight_history_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_provider.g.dart';

/// Agrega os dados consolidados do dia para apresentação na tela inicial.
class DashboardSummary {
  final double consumedCalories;
  final double targetCalories;
  final int consumedWaterMl;
  final int targetWaterMl;
  final double? currentWeightKg;

  DashboardSummary({
    required this.consumedCalories,
    required this.targetCalories,
    required this.consumedWaterMl,
    required this.targetWaterMl,
    this.currentWeightKg,
  });
}

@riverpod
Future<DashboardSummary> dashboardSummary(Ref ref, DateTime date) async {
  // 1. Água
  final waterLogs = await ref.watch(waterProvider(date).future);
  final totalWater = waterLogs.fold<int>(0, (sum, log) => sum + log.amountMl);

  // 2. Peso mais recente
  final db = ref.read(appDatabaseProvider);
  final weightRepo = WeightRepositoryImpl(WeightDao(db));
  final getWeightUseCase = GetWeightHistoryUseCase(weightRepo);
  final weightResult = await getWeightUseCase();
  double? currentWeight;
  if (weightResult.isRight()) {
    final history = weightResult.fold((l) => throw Exception(), (r) => r);
    if (history.isNotEmpty) {
      currentWeight = history.first.weightKg; // O primeiro é o mais recente
    }
  }

  // 3. Plano ativo e calorias alvo
  final planState = await ref.watch(activeMealPlanProvider.future);
  double targetCals = 2000.0; // Padrão genérico neutro
  if (planState != null && planState.days.isNotEmpty) {
    final weekday = date.weekday; // 1=Seg, 7=Dom
    // Busca o dia correspondente ou cai no primeiro configurado
    final planDay = planState.days.firstWhere(
      (d) => d.dayOfWeek == weekday,
      orElse: () => planState.days.first,
    );
    final dayEntries = planState.entries.where((e) => e.mealPlanDayId == planDay.id).toList();
    targetCals = dayEntries.fold<double>(0, (sum, e) => sum + e.targetCalories);
  }

  // 4. Calorias consumidas (agregando do diário)
  final mealDao = MealDiaryDao(db);
  final dailyMeals = await mealDao.getDailyMeals(date);
  double totalCals = 0;
  for (final meal in dailyMeals) {
    totalCals += meal.calories;
  }

  return DashboardSummary(
    consumedCalories: totalCals,
    targetCalories: targetCals,
    consumedWaterMl: totalWater,
    targetWaterMl: 2000,
    currentWeightKg: currentWeight,
  );
}
