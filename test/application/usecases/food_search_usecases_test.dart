import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nutritrack_br/application/usecases/food/search_foods_usecase.dart';
import 'package:nutritrack_br/domain/entities/food_item.dart';
import 'package:nutritrack_br/domain/repositories/food_repository.dart';
import 'package:nutritrack_br/domain/value_objects/food_source.dart';
import 'package:nutritrack_br/domain/value_objects/nutrient_profile.dart';

class MockFoodRepository extends Mock implements FoodRepository {}

void main() {
  late MockFoodRepository mockRepository;
  late SearchFoodsUseCase useCase;

  setUp(() {
    mockRepository = MockFoodRepository();
    useCase = SearchFoodsUseCase(mockRepository);
  });

  const tArroz = FoodItem(
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

  const tChicken = FoodItem(
    id: 'usda-001',
    name: 'Chicken breast',
    source: FoodSource.usda,
    nutrients: NutrientProfile(
      calories: 165,
      protein: 31.0,
      carbohydrates: 0.0,
      fat: 3.6,
      fiber: 0.0,
    ),
  );

  const tFeijao = FoodItem(
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

  group('SearchFoodsUseCase (T024)', () {
    test('deve retornar alimentos que contenham o termo buscado', () async {
      when(
        () => mockRepository.searchFoods('arroz'),
      ).thenAnswer((_) async => const Right([tArroz]));

      final result = await useCase('arroz');

      expect(result.isRight(), true);
      result.fold((l) => fail('should be right'), (foods) {
        expect(foods.length, 1);
        expect(foods.first.name, contains('Arroz'));
        expect(foods.first.source, FoodSource.tbca);
      });
      verify(() => mockRepository.searchFoods('arroz')).called(1);
    });

    test(
      'deve retornar lista vazia quando nenhum alimento corresponder',
      () async {
        when(
          () => mockRepository.searchFoods('xyz'),
        ).thenAnswer((_) async => const Right([]));

        final result = await useCase('xyz');

        expect(result.isRight(), true);
        result.fold(
          (l) => fail('should be right'),
          (foods) => expect(foods, isEmpty),
        );
      },
    );

    test('deve filtrar alimentos por fonte nutricional (TBCA)', () async {
      when(
        () => mockRepository.searchFoods('', source: FoodSource.tbca),
      ).thenAnswer((_) async => const Right([tArroz, tFeijao]));

      final result = await useCase('', source: FoodSource.tbca);

      expect(result.isRight(), true);
      result.fold((l) => fail('should be right'), (foods) {
        expect(foods.length, 2);
        for (final f in foods) {
          expect(f.source, FoodSource.tbca);
        }
      });
    });

    test(
      'deve filtrar por fonte USDA e retornar apenas alimentos dessa fonte',
      () async {
        when(
          () => mockRepository.searchFoods('chicken', source: FoodSource.usda),
        ).thenAnswer((_) async => const Right([tChicken]));

        final result = await useCase('chicken', source: FoodSource.usda);

        expect(result.isRight(), true);
        result.fold((l) => fail('should be right'), (foods) {
          expect(foods.length, 1);
          expect(foods.first.source, FoodSource.usda);
        });
      },
    );
  });
}
