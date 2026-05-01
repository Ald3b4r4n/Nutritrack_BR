/// Value Object representando o perfil nutricional de um alimento por 100g/100ml.
/// É imutável e não depende de nenhum framework externo.
class NutrientProfile {
  final double calories;
  final double protein;
  final double carbohydrates;
  final double fat;
  final double fiber;
  final double? sodium;

  const NutrientProfile({
    required this.calories,
    required this.protein,
    required this.carbohydrates,
    required this.fat,
    required this.fiber,
    this.sodium,
  });

  /// Retorna um novo NutrientProfile proporcional a [grams] gramas.
  /// Os valores de referência são por 100g.
  NutrientProfile scaledTo(double grams) {
    final factor = grams / 100.0;
    return NutrientProfile(
      calories: calories * factor,
      protein: protein * factor,
      carbohydrates: carbohydrates * factor,
      fat: fat * factor,
      fiber: fiber * factor,
      sodium: sodium != null ? sodium! * factor : null,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NutrientProfile &&
        other.calories == calories &&
        other.protein == protein &&
        other.carbohydrates == carbohydrates &&
        other.fat == fat &&
        other.fiber == fiber &&
        other.sodium == sodium;
  }

  @override
  int get hashCode =>
      Object.hash(calories, protein, carbohydrates, fat, fiber, sodium);

  @override
  String toString() =>
      'NutrientProfile(calories: $calories, protein: $protein, '
      'carbohydrates: $carbohydrates, fat: $fat, fiber: $fiber, sodium: $sodium)';
}
