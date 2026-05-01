import 'package:nutritrack_br/data/daos/food_dao.dart';
import 'package:nutritrack_br/domain/entities/food_item.dart';
import 'package:nutritrack_br/domain/value_objects/food_source.dart';
import 'package:nutritrack_br/domain/value_objects/nutrient_profile.dart';

/// Seed inicial de alimentos para demonstração offline.
/// Valores nutricionais por 100g — fontes indicadas via FoodSource.
class FoodSeeder {
  final FoodDao _dao;

  FoodSeeder(this._dao);

  /// Popula o banco local com alimentos de exemplo TBCA e USDA.
  /// Idempotente: verifica se já existem registros antes de inserir.
  Future<void> seed() async {
    final existing = await _dao.searchFoods('');
    if (existing.isNotEmpty) return; // já populado

    await _dao.insertFoodsBatch(_seedFoods);
  }

  static const _seedFoods = <FoodItem>[
    // ── TBCA ──
    FoodItem(
      id: 'tbca-C0081',
      name: 'Arroz branco cozido',
      source: FoodSource.tbca,
      nutrients: NutrientProfile(
        calories: 128,
        protein: 2.5,
        carbohydrates: 28.1,
        fat: 0.2,
        fiber: 1.6,
      ),
    ),
    FoodItem(
      id: 'tbca-C0846',
      name: 'Feijão preto cozido',
      source: FoodSource.tbca,
      nutrients: NutrientProfile(
        calories: 77,
        protein: 4.5,
        carbohydrates: 14.0,
        fat: 0.5,
        fiber: 8.4,
      ),
    ),
    FoodItem(
      id: 'tbca-C0210',
      name: 'Banana prata',
      source: FoodSource.tbca,
      nutrients: NutrientProfile(
        calories: 98,
        protein: 1.3,
        carbohydrates: 26.0,
        fat: 0.1,
        fiber: 2.0,
      ),
    ),
    FoodItem(
      id: 'tbca-C0302',
      name: 'Ovo de galinha cozido',
      source: FoodSource.tbca,
      nutrients: NutrientProfile(
        calories: 146,
        protein: 13.3,
        carbohydrates: 0.6,
        fat: 9.5,
        fiber: 0.0,
      ),
    ),
    FoodItem(
      id: 'tbca-C0478',
      name: 'Pão francês',
      source: FoodSource.tbca,
      nutrients: NutrientProfile(
        calories: 300,
        protein: 8.0,
        carbohydrates: 58.6,
        fat: 3.1,
        fiber: 2.3,
      ),
    ),
    FoodItem(
      id: 'tbca-C0614',
      name: 'Leite integral',
      source: FoodSource.tbca,
      nutrients: NutrientProfile(
        calories: 58,
        protein: 3.0,
        carbohydrates: 4.5,
        fat: 3.2,
        fiber: 0.0,
      ),
    ),
    FoodItem(
      id: 'tbca-C0900',
      name: 'Mandioca cozida',
      source: FoodSource.tbca,
      nutrients: NutrientProfile(
        calories: 125,
        protein: 0.6,
        carbohydrates: 30.1,
        fat: 0.3,
        fiber: 1.5,
      ),
    ),
    FoodItem(
      id: 'tbca-C1010',
      name: 'Batata doce cozida',
      source: FoodSource.tbca,
      nutrients: NutrientProfile(
        calories: 77,
        protein: 0.6,
        carbohydrates: 18.4,
        fat: 0.1,
        fiber: 2.2,
      ),
    ),
    // ── USDA ──
    FoodItem(
      id: 'usda-05064',
      name: 'Chicken breast grilled',
      source: FoodSource.usda,
      nutrients: NutrientProfile(
        calories: 165,
        protein: 31.0,
        carbohydrates: 0.0,
        fat: 3.6,
        fiber: 0.0,
      ),
    ),
    FoodItem(
      id: 'usda-23567',
      name: 'Beef sirloin cooked',
      source: FoodSource.usda,
      nutrients: NutrientProfile(
        calories: 206,
        protein: 26.1,
        carbohydrates: 0.0,
        fat: 10.6,
        fiber: 0.0,
      ),
    ),
    FoodItem(
      id: 'usda-09040',
      name: 'Avocado raw',
      source: FoodSource.usda,
      nutrients: NutrientProfile(
        calories: 160,
        protein: 2.0,
        carbohydrates: 8.5,
        fat: 14.7,
        fiber: 6.7,
      ),
    ),
    FoodItem(
      id: 'usda-11124',
      name: 'Broccoli cooked',
      source: FoodSource.usda,
      nutrients: NutrientProfile(
        calories: 35,
        protein: 2.4,
        carbohydrates: 7.2,
        fat: 0.4,
        fiber: 3.3,
      ),
    ),
  ];
}
