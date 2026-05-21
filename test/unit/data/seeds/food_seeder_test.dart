import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nutritrack_br/data/daos/food_dao.dart';
import 'package:nutritrack_br/data/database/seeds.dart';
import 'package:nutritrack_br/domain/entities/food_item.dart';
import 'package:nutritrack_br/domain/value_objects/food_source.dart';
import 'package:nutritrack_br/domain/value_objects/nutrient_profile.dart';

class MockFoodDao extends Mock implements FoodDao {}

void main() {
  group('FoodSeeder (T048 seed idempotente)', () {
    late MockFoodDao mockDao;
    late FoodSeeder seeder;

    setUp(() {
      mockDao = MockFoodDao();
      seeder = FoodSeeder(mockDao);

      registerFallbackValue(<FoodItem>[]);
    });

    test('não insere se já existem alimentos (idempotente)', () async {
      when(() => mockDao.searchFoods('')).thenAnswer(
        (_) async => [
          const FoodItem(
            id: 'existing-1',
            name: 'Alimento existente',
            source: FoodSource.tbca,
            nutrients: NutrientProfile(
              calories: 100,
              protein: 5,
              carbohydrates: 20,
              fat: 2,
              fiber: 0,
            ),
          ),
        ],
      );

      await seeder.seed();

      verify(() => mockDao.searchFoods('')).called(1);
      verifyNever(() => mockDao.insertFoodsBatch(any()));
    });

    test('insere alimentos quando banco está vazio', () async {
      when(() => mockDao.searchFoods('')).thenAnswer((_) async => []);
      when(() => mockDao.insertFoodsBatch(any())).thenAnswer((_) async {});

      await seeder.seed();

      verify(() => mockDao.searchFoods('')).called(1);
      verify(() => mockDao.insertFoodsBatch(any())).called(1);
    });

    test(
      'não chama insertFoodsBatch duas vezes ao chamar seed() duas vezes',
      () async {
        // 1ª chamada: banco vazio → insere
        when(() => mockDao.searchFoods('')).thenAnswer((_) async => []);
        when(() => mockDao.insertFoodsBatch(any())).thenAnswer((_) async {});
        await seeder.seed();

        // 2ª chamada: banco já populado → não insere
        when(() => mockDao.searchFoods('')).thenAnswer(
          (_) async => [
            const FoodItem(
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
          ],
        );
        await seeder.seed();

        // insertFoodsBatch deve ter sido chamado apenas 1x no total
        verify(() => mockDao.insertFoodsBatch(any())).called(1);
      },
    );
  });
}
