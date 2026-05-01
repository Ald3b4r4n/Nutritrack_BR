import 'package:drift/drift.dart';

import 'package:nutritrack_br/data/database/app_database.dart';
import 'package:nutritrack_br/domain/entities/food_item.dart' as domain;
import 'package:nutritrack_br/domain/value_objects/food_source.dart';
import 'package:nutritrack_br/domain/value_objects/nutrient_profile.dart';

/// Mapper responsável pela conversão bidirecional entre
/// o DataClass [FoodItem] do Drift e a entidade de domínio [domain.FoodItem].
class FoodItemMapper {
  FoodItemMapper._();

  /// Drift DataClass → entidade de domínio.
  static domain.FoodItem toDomain(FoodItem row) {
    return domain.FoodItem(
      id: row.id,
      name: row.name,
      source: FoodSource.fromName(row.source),
      nutrients: NutrientProfile(
        calories: row.calories,
        protein: row.protein,
        carbohydrates: row.carbohydrates,
        fat: row.fat,
        fiber: row.fiber,
        sodium: row.sodium,
      ),
      isDeleted: row.isDeleted,
      version: row.version,
    );
  }

  /// Entidade de domínio → Companion para insert/update no Drift.
  static FoodItemsCompanion toCompanion(domain.FoodItem entity) {
    return FoodItemsCompanion(
      id: Value(entity.id),
      name: Value(entity.name),
      source: Value(entity.source.name),
      calories: Value(entity.nutrients.calories),
      protein: Value(entity.nutrients.protein),
      carbohydrates: Value(entity.nutrients.carbohydrates),
      fat: Value(entity.nutrients.fat),
      fiber: Value(entity.nutrients.fiber),
      sodium: entity.nutrients.sodium != null
          ? Value(entity.nutrients.sodium!)
          : const Value.absent(),
      isDeleted: Value(entity.isDeleted),
      version: Value(entity.version),
    );
  }
}
