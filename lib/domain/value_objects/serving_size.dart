/// Value Object representando uma porção de um alimento.
/// Imutável e sem dependência de framework.
class ServingSize {
  final String id;
  final String foodItemId;
  final String description;
  final double weightInGrams;
  final double defaultAmount;

  const ServingSize({
    required this.id,
    required this.foodItemId,
    required this.description,
    required this.weightInGrams,
    required this.defaultAmount,
  });

  /// Calcula o peso total em gramas para uma [quantity] de porções.
  double totalWeightInGrams(double quantity) => weightInGrams * quantity;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ServingSize &&
        other.id == id &&
        other.foodItemId == foodItemId &&
        other.description == description &&
        other.weightInGrams == weightInGrams &&
        other.defaultAmount == defaultAmount;
  }

  @override
  int get hashCode =>
      Object.hash(id, foodItemId, description, weightInGrams, defaultAmount);

  @override
  String toString() =>
      'ServingSize(id: $id, description: $description, weightInGrams: $weightInGrams)';
}
