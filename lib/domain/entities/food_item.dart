import 'package:nutritrack_br/domain/value_objects/food_source.dart';
import 'package:nutritrack_br/domain/value_objects/nutrient_profile.dart';

/// Entidade de domínio representando um alimento.
/// Valores nutricionais são por 100g/100ml.
class FoodItem {
  final String id;
  final String name;
  final FoodSource source;
  final NutrientProfile nutrients;
  final bool isDeleted;
  final int version;

  const FoodItem({
    required this.id,
    required this.name,
    required this.source,
    required this.nutrients,
    this.isDeleted = false,
    this.version = 1,
  });

  FoodItem copyWith({
    String? id,
    String? name,
    FoodSource? source,
    NutrientProfile? nutrients,
    bool? isDeleted,
    int? version,
  }) {
    return FoodItem(
      id: id ?? this.id,
      name: name ?? this.name,
      source: source ?? this.source,
      nutrients: nutrients ?? this.nutrients,
      isDeleted: isDeleted ?? this.isDeleted,
      version: version ?? this.version,
    );
  }

  /// Igualdade baseada no id (identidade do domínio).
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FoodItem && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'FoodItem(id: $id, name: $name, source: ${source.name})';
}
