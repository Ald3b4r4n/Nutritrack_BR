import 'package:nutritrack_br/domain/value_objects/meal_type.dart';

/// Entrada de alimento recente por tipo de refeição (para sugestões rápidas).
class RecentFoodByMeal {
  final String foodItemId;
  final MealType mealType;
  final DateTime lastUsedAt;
  final int useCount;

  const RecentFoodByMeal({
    required this.foodItemId,
    required this.mealType,
    required this.lastUsedAt,
    required this.useCount,
  });
}
