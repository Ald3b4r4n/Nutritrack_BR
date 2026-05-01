import 'package:nutritrack_br/domain/value_objects/meal_type.dart';

/// Entidade de domínio representando um item consumido numa refeição.
class MealEntry {
  final String id;
  final String mealRecordId;
  final MealType mealType;
  final String foodItemId;
  final double quantity;
  final String servingDescription;
  final double servingWeightGrams;
  final DateTime createdAt;

  const MealEntry({
    required this.id,
    required this.mealRecordId,
    required this.mealType,
    required this.foodItemId,
    required this.quantity,
    required this.servingDescription,
    required this.servingWeightGrams,
    required this.createdAt,
  });

  /// Peso total consumido em gramas (quantity × servingWeightGrams).
  double get totalWeightGrams => quantity * servingWeightGrams;

  MealEntry copyWith({
    String? id,
    String? mealRecordId,
    MealType? mealType,
    String? foodItemId,
    double? quantity,
    String? servingDescription,
    double? servingWeightGrams,
    DateTime? createdAt,
  }) {
    return MealEntry(
      id: id ?? this.id,
      mealRecordId: mealRecordId ?? this.mealRecordId,
      mealType: mealType ?? this.mealType,
      foodItemId: foodItemId ?? this.foodItemId,
      quantity: quantity ?? this.quantity,
      servingDescription: servingDescription ?? this.servingDescription,
      servingWeightGrams: servingWeightGrams ?? this.servingWeightGrams,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MealEntry && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() =>
      'MealEntry(id: $id, mealType: ${mealType.name}, foodItemId: $foodItemId)';
}
