/// Plano alimentar — modelo base de template semanal.
class MealPlan {
  final String id;
  final String name;
  final bool isActive;

  const MealPlan({
    required this.id,
    required this.name,
    required this.isActive,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MealPlan && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
