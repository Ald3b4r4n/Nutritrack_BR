/// Dia específico dentro de um MealPlan.
class MealPlanDay {
  final String id;
  final String mealPlanId;
  final int dayOfWeek; // 1=Segunda, 7=Domingo

  const MealPlanDay({
    required this.id,
    required this.mealPlanId,
    required this.dayOfWeek,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MealPlanDay && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
