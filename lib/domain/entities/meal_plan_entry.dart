import 'package:nutritrack_br/domain/value_objects/meal_type.dart';

/// Metas macronutrientes para uma refeição específica em um dia de plano.
class MealPlanEntry {
  final String id;
  final String mealPlanDayId;
  final MealType mealType;
  final double targetCalories;
  final double targetProtein;
  final double targetCarbs;
  final double targetFat;

  const MealPlanEntry({
    required this.id,
    required this.mealPlanDayId,
    required this.mealType,
    required this.targetCalories,
    required this.targetProtein,
    required this.targetCarbs,
    required this.targetFat,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MealPlanEntry && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
