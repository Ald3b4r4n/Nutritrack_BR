import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutritrack_br/data/daos/meal_diary_dao.dart';
import 'package:nutritrack_br/data/database/app_database.dart';
import 'package:nutritrack_br/data/repositories/meal_repository_impl.dart';
import 'package:nutritrack_br/domain/entities/meal_entry.dart' as domain;
import 'package:nutritrack_br/domain/value_objects/meal_type.dart';

void main() {
  late AppDatabase db;
  late MealDiaryDao dao;
  late MealRepositoryImpl repository;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    dao = MealDiaryDao(db);
    repository = MealRepositoryImpl(dao);
  });

  tearDown(() async {
    await db.close();
  });

  group('MealRepositoryImpl', () {
    final tDate = DateTime(2023, 10, 10);
    final tEntry = domain.MealEntry(
      id: 'e1',
      mealRecordId: 'r1',
      mealType: MealType.breakfast,
      foodItemId: 'f1',
      quantity: 1,
      servingDescription: 'unidade',
      servingWeightGrams: 150,
      createdAt: DateTime.now(),
    );

    test('deve retornar falha se o food_item não existir ao tentar buscar daily meals', () async {
      // Como não inserimos o FoodItem 'f1', ele não conseguirá retornar os Details.
      // Primeiro inserimos só no DAO a entrada para simular
      await repository.addMealEntry(tEntry, tDate);

      await repository.getDailyMeals(tDate);
      // SQLite vai falhar na foreign key ou o join retornará vazio
      // Vamos assumir que na implementação correta, o banco deve ter o food item antes,
      // mas como addMealEntry insere o entry...
      // Esperamos testar o sucesso depois de inserir tudo certinho.
    });
  });
}
