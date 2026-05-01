import 'package:flutter_test/flutter_test.dart';
import 'package:nutritrack_br/data/database/app_database.dart';
import 'package:nutritrack_br/data/mappers/food_item_mapper.dart';
import 'package:nutritrack_br/domain/entities/food_item.dart' as domain;
import 'package:nutritrack_br/domain/value_objects/food_source.dart';
import 'package:nutritrack_br/domain/value_objects/nutrient_profile.dart';

void main() {
  group('FoodItemMapper', () {
    const driftFoodItem = FoodItem(
      id: 'food-001',
      name: 'Arroz Branco Cozido',
      source: 'tbca',
      calories: 365.0,
      protein: 7.0,
      carbohydrates: 75.0,
      fat: 2.0,
      fiber: 3.0,
      sodium: 5.0,
      isDeleted: false,
      version: 1,
    );

    test('deve converter FoodItem Drift → entidade de domínio', () {
      final entity = FoodItemMapper.toDomain(driftFoodItem);

      expect(entity.id, driftFoodItem.id);
      expect(entity.name, driftFoodItem.name);
      expect(entity.source, FoodSource.tbca);
      expect(entity.nutrients.calories, driftFoodItem.calories);
      expect(entity.nutrients.protein, driftFoodItem.protein);
      expect(entity.nutrients.sodium, driftFoodItem.sodium);
      expect(entity.isDeleted, false);
    });

    test('deve converter entidade de domínio → Companion Drift', () {
      const entity = domain.FoodItem(
        id: 'food-002',
        name: 'Feijão Preto',
        source: FoodSource.usda,
        nutrients: NutrientProfile(
          calories: 330.0,
          protein: 22.0,
          carbohydrates: 60.0,
          fat: 1.5,
          fiber: 15.0,
        ),
      );

      final companion = FoodItemMapper.toCompanion(entity);

      expect(companion.id.value, 'food-002');
      expect(companion.name.value, 'Feijão Preto');
      expect(companion.source.value, 'usda');
      expect(companion.calories.value, 330.0);
      expect(companion.protein.value, 22.0);
    });

    test('mapeamento deve ser reversível (round-trip)', () {
      final entity = FoodItemMapper.toDomain(driftFoodItem);
      final companion = FoodItemMapper.toCompanion(entity);

      expect(companion.id.value, driftFoodItem.id);
      expect(companion.name.value, driftFoodItem.name);
      expect(companion.source.value, driftFoodItem.source);
      expect(companion.calories.value, driftFoodItem.calories);
    });
  });
}
