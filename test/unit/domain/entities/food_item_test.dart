import 'package:flutter_test/flutter_test.dart';
import 'package:nutritrack_br/domain/entities/food_item.dart';
import 'package:nutritrack_br/domain/value_objects/food_source.dart';
import 'package:nutritrack_br/domain/value_objects/nutrient_profile.dart';

void main() {
  group('FoodItem', () {
    const testNutrients = NutrientProfile(
      calories: 365.0,
      protein: 7.0,
      carbohydrates: 75.0,
      fat: 2.0,
      fiber: 3.0,
      sodium: 5.0,
    );

    const testFoodItem = FoodItem(
      id: 'food-001',
      name: 'Arroz Branco Cozido',
      source: FoodSource.tbca,
      nutrients: testNutrients,
    );

    test('deve criar FoodItem com valores válidos', () {
      expect(testFoodItem.id, 'food-001');
      expect(testFoodItem.name, 'Arroz Branco Cozido');
      expect(testFoodItem.source, FoodSource.tbca);
      expect(testFoodItem.nutrients.calories, 365.0);
      expect(testFoodItem.isDeleted, false);
      expect(testFoodItem.version, 1);
    });

    test('isDeleted deve ser false por padrão', () {
      const item = FoodItem(
        id: 'food-002',
        name: 'Feijão Preto',
        source: FoodSource.tbca,
        nutrients: testNutrients,
      );
      expect(item.isDeleted, false);
      expect(item.version, 1);
    });

    test('deve preservar rastreabilidade de fonte nutricional', () {
      const tdbItem = FoodItem(
        id: 'tbca-001',
        name: 'Arroz',
        source: FoodSource.tbca,
        nutrients: testNutrients,
      );
      const usdaItem = FoodItem(
        id: 'usda-001',
        name: 'Rice',
        source: FoodSource.usda,
        nutrients: testNutrients,
      );
      const customItem = FoodItem(
        id: 'user-001',
        name: 'Minha Receita',
        source: FoodSource.custom,
        nutrients: testNutrients,
      );

      expect(tdbItem.source, FoodSource.tbca);
      expect(usdaItem.source, FoodSource.usda);
      expect(customItem.source, FoodSource.custom);
    });

    test('dois FoodItem com mesmo id devem ser iguais', () {
      const item1 = FoodItem(
        id: 'food-001',
        name: 'Arroz',
        source: FoodSource.tbca,
        nutrients: testNutrients,
      );
      const item2 = FoodItem(
        id: 'food-001',
        name: 'Arroz Editado',
        source: FoodSource.custom,
        nutrients: testNutrients,
      );

      expect(item1, equals(item2));
    });
  });
}
