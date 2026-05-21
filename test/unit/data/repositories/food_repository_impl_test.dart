import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutritrack_br/data/daos/food_dao.dart';
import 'package:nutritrack_br/data/database/app_database.dart';
import 'package:nutritrack_br/data/repositories/food_repository_impl.dart';
import 'package:nutritrack_br/domain/entities/food_item.dart' as domain;
import 'package:nutritrack_br/domain/value_objects/food_source.dart';
import 'package:nutritrack_br/domain/value_objects/nutrient_profile.dart';

void main() {
  late AppDatabase db;
  late FoodDao dao;
  late FoodRepositoryImpl repository;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    dao = FoodDao(db);
    repository = FoodRepositoryImpl(dao);
  });

  tearDown(() async {
    await db.close();
  });

  const tArroz = domain.FoodItem(
    id: 'tbca-001',
    name: 'Arroz branco cozido',
    source: FoodSource.tbca,
    nutrients: NutrientProfile(
      calories: 128,
      protein: 2.5,
      carbohydrates: 28.1,
      fat: 0.2,
      fiber: 1.6,
    ),
  );

  const tFeijao = domain.FoodItem(
    id: 'tbca-002',
    name: 'Feijão preto cozido',
    source: FoodSource.tbca,
    nutrients: NutrientProfile(
      calories: 77,
      protein: 4.5,
      carbohydrates: 14.0,
      fat: 0.5,
      fiber: 8.4,
    ),
  );

  const tChicken = domain.FoodItem(
    id: 'usda-001',
    name: 'Chicken breast grilled',
    source: FoodSource.usda,
    nutrients: NutrientProfile(
      calories: 165,
      protein: 31.0,
      carbohydrates: 0.0,
      fat: 3.6,
      fiber: 0.0,
    ),
  );

  group('FoodRepositoryImpl com Drift em memória (T026)', () {
    test('deve cadastrar e buscar alimento por nome', () async {
      await repository.createFood(tArroz);

      final result = await repository.searchFoods('arroz');

      expect(result.isRight(), true);
      result.fold((l) => fail('should be right'), (foods) {
        expect(foods.length, 1);
        expect(foods.first.name, 'Arroz branco cozido');
        expect(foods.first.source, FoodSource.tbca);
      });
    });

    test(
      'deve retornar lista vazia quando nenhum alimento corresponder',
      () async {
        await repository.createFood(tArroz);

        final result = await repository.searchFoods('xyz');

        expect(result.isRight(), true);
        result.fold(
          (l) => fail('should be right'),
          (foods) => expect(foods, isEmpty),
        );
      },
    );

    test('deve filtrar por fonte TBCA', () async {
      await repository.createFood(tArroz);
      await repository.createFood(tFeijao);
      await repository.createFood(tChicken);

      final result = await repository.searchFoods('', source: FoodSource.tbca);

      expect(result.isRight(), true);
      result.fold((l) => fail('should be right'), (foods) {
        expect(foods.length, 2);
        for (final f in foods) {
          expect(f.source, FoodSource.tbca);
        }
      });
    });

    test('deve filtrar por fonte USDA', () async {
      await repository.createFood(tArroz);
      await repository.createFood(tChicken);

      final result = await repository.searchFoods('', source: FoodSource.usda);

      expect(result.isRight(), true);
      result.fold((l) => fail('should be right'), (foods) {
        expect(foods.length, 1);
        expect(foods.first.source, FoodSource.usda);
      });
    });

    test('deve atualizar um alimento existente', () async {
      await repository.createFood(tArroz);

      final updated = tArroz.copyWith(
        name: 'Arroz integral cozido',
        nutrients: const NutrientProfile(
          calories: 124,
          protein: 2.6,
          carbohydrates: 25.8,
          fat: 1.0,
          fiber: 2.7,
        ),
      );

      await repository.updateFood(updated);

      final result = await repository.getFoodById('tbca-001');
      expect(result.isRight(), true);
      result.fold((l) => fail('should be right'), (food) {
        expect(food.name, 'Arroz integral cozido');
        expect(food.nutrients.calories, 124);
        expect(food.nutrients.fiber, 2.7);
      });
    });

    test('deve cadastrar alimento custom e preservar fonte', () async {
      const tCustom = domain.FoodItem(
        id: 'custom-001',
        name: 'Pão de queijo caseiro',
        source: FoodSource.custom,
        nutrients: NutrientProfile(
          calories: 363,
          protein: 5.0,
          carbohydrates: 34.0,
          fat: 23.0,
          fiber: 0.5,
        ),
      );

      await repository.createFood(tCustom);

      final result = await repository.getFoodById('custom-001');
      expect(result.isRight(), true);
      result.fold((l) => fail('should be right'), (food) {
        expect(food.source, FoodSource.custom);
        expect(food.source.label, 'Personalizado');
      });
    });

    test('deve retornar falha para alimento não encontrado por id', () async {
      final result = await repository.getFoodById('inexistente');
      expect(result.isLeft(), true);
    });

    test('deve inserir batch de alimentos via DAO', () async {
      await dao.insertFoodsBatch([tArroz, tFeijao, tChicken]);

      final result = await repository.searchFoods('');
      expect(result.isRight(), true);
      result.fold(
        (l) => fail('should be right'),
        (foods) => expect(foods.length, 3),
      );
    });
  });
}
