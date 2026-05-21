import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutritrack_br/data/database/seeds.dart';
import 'package:nutritrack_br/data/daos/food_dao.dart';
import 'package:nutritrack_br/data/database/app_database.dart';

void main() {
  group('FoodSeeder idempotência (T048)', () {
    late AppDatabase db;
    late FoodDao dao;
    late FoodSeeder seeder;

    setUp(() {
      db = AppDatabase.forTesting(NativeDatabase.memory());
      dao = FoodDao(db);
      seeder = FoodSeeder(dao);
    });

    tearDown(() async {
      await db.close();
    });

    test('seed() insere alimentos quando banco está vazio', () async {
      await seeder.seed();
      final foods = await dao.searchFoods('');
      expect(foods.isNotEmpty, isTrue);
      expect(foods.length, greaterThanOrEqualTo(12));
    });

    test('seed() é idempotente — não duplica ao executar duas vezes', () async {
      await seeder.seed();
      final firstCount = (await dao.searchFoods('')).length;

      await seeder.seed(); // segunda execução
      final secondCount = (await dao.searchFoods('')).length;

      expect(
        secondCount,
        equals(firstCount),
        reason: 'Seed não deve duplicar registros',
      );
    });
  });
}
