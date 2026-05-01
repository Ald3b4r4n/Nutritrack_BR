import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutritrack_br/data/database/app_database.dart';

// TDD T015 (Green) — testa inserção e recuperação de FoodItem no banco Drift em memória.
void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
  });

  tearDown(() async {
    await db.close();
  });

  group('AppDatabase - FoodItems CRUD', () {
    test('deve inserir e recuperar um FoodItem', () async {
      await db
          .into(db.foodItems)
          .insert(
            FoodItemsCompanion.insert(
              id: 'food-001',
              name: 'Arroz Branco Cozido',
              source: 'tbca',
              calories: 365.0,
              protein: 7.0,
              carbohydrates: 75.0,
              fat: 2.0,
              fiber: 3.0,
            ),
          );

      final results = await db.select(db.foodItems).get();

      expect(results, hasLength(1));
      expect(results.first.id, 'food-001');
      expect(results.first.name, 'Arroz Branco Cozido');
      expect(results.first.source, 'tbca');
      expect(results.first.calories, 365.0);
    });

    test('deve atualizar um FoodItem existente', () async {
      await db
          .into(db.foodItems)
          .insert(
            FoodItemsCompanion.insert(
              id: 'food-002',
              name: 'Feijão Cru',
              source: 'tbca',
              calories: 330.0,
              protein: 22.0,
              carbohydrates: 60.0,
              fat: 1.5,
              fiber: 15.0,
            ),
          );

      await (db.update(db.foodItems)..where((t) => t.id.equals('food-002')))
          .write(const FoodItemsCompanion(name: Value('Feijão Preto Cru')));

      final updated = await (db.select(
        db.foodItems,
      )..where((t) => t.id.equals('food-002'))).getSingle();

      expect(updated.name, 'Feijão Preto Cru');
    });

    test('deve realizar soft-delete (isDeleted = true)', () async {
      await db
          .into(db.foodItems)
          .insert(
            FoodItemsCompanion.insert(
              id: 'food-003',
              name: 'Maçã',
              source: 'usda',
              calories: 52.0,
              protein: 0.3,
              carbohydrates: 14.0,
              fat: 0.2,
              fiber: 2.4,
            ),
          );

      await (db.update(db.foodItems)..where((t) => t.id.equals('food-003')))
          .write(const FoodItemsCompanion(isDeleted: Value(true)));

      final item = await (db.select(
        db.foodItems,
      )..where((t) => t.id.equals('food-003'))).getSingle();

      expect(item.isDeleted, isTrue);
    });

    test('deve filtrar FoodItems não deletados', () async {
      await db.batch((batch) {
        batch.insertAll(db.foodItems, [
          FoodItemsCompanion.insert(
            id: 'food-004',
            name: 'Banana',
            source: 'tbca',
            calories: 89.0,
            protein: 1.1,
            carbohydrates: 22.8,
            fat: 0.3,
            fiber: 2.6,
          ),
          FoodItemsCompanion.insert(
            id: 'food-005',
            name: 'Deletado',
            source: 'tbca',
            calories: 0.0,
            protein: 0.0,
            carbohydrates: 0.0,
            fat: 0.0,
            fiber: 0.0,
            isDeleted: const Value(true),
          ),
        ]);
      });

      final active = await (db.select(
        db.foodItems,
      )..where((t) => t.isDeleted.equals(false))).get();

      expect(active, hasLength(1));
      expect(active.first.id, 'food-004');
    });

    test('deve deletar um FoodItem do banco', () async {
      await db
          .into(db.foodItems)
          .insert(
            FoodItemsCompanion.insert(
              id: 'food-006',
              name: 'Pão de Forma',
              source: 'proprietary',
              calories: 265.0,
              protein: 8.0,
              carbohydrates: 50.0,
              fat: 3.5,
              fiber: 2.0,
            ),
          );

      await (db.delete(
        db.foodItems,
      )..where((t) => t.id.equals('food-006'))).go();

      final remaining = await db.select(db.foodItems).get();
      expect(remaining, isEmpty);
    });
  });

  group('AppDatabase - FoodSource rastreabilidade', () {
    test('deve preservar fontes TBCA, USDA, proprietary e custom', () async {
      final sources = ['tbca', 'usda', 'proprietary', 'custom'];
      for (final (i, source) in sources.indexed) {
        await db
            .into(db.foodItems)
            .insert(
              FoodItemsCompanion.insert(
                id: 'src-$i',
                name: 'Alimento $source',
                source: source,
                calories: 100.0,
                protein: 5.0,
                carbohydrates: 10.0,
                fat: 2.0,
                fiber: 1.0,
              ),
            );
      }

      for (final (i, source) in sources.indexed) {
        final item = await (db.select(
          db.foodItems,
        )..where((t) => t.id.equals('src-$i'))).getSingle();
        expect(item.source, source);
      }
    });
  });

  group('AppDatabase - ServingSizes', () {
    test(
      'deve inserir e recuperar serving size vinculado a um alimento',
      () async {
        await db
            .into(db.foodItems)
            .insert(
              FoodItemsCompanion.insert(
                id: 'food-s1',
                name: 'Azeite de Oliva',
                source: 'usda',
                calories: 884.0,
                protein: 0.0,
                carbohydrates: 0.0,
                fat: 100.0,
                fiber: 0.0,
              ),
            );

        await db
            .into(db.servingSizes)
            .insert(
              ServingSizesCompanion.insert(
                id: 'serving-s1',
                foodItemId: 'food-s1',
                description: '1 colher de sopa',
                weightInGrams: 13.5,
              ),
            );

        final servings = await (db.select(
          db.servingSizes,
        )..where((t) => t.foodItemId.equals('food-s1'))).get();

        expect(servings, hasLength(1));
        expect(servings.first.description, '1 colher de sopa');
        expect(servings.first.weightInGrams, 13.5);
      },
    );
  });
}
