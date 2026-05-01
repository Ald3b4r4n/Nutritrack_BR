import 'package:flutter_test/flutter_test.dart';
import 'package:nutritrack_br/domain/value_objects/food_source.dart';

void main() {
  group('FoodSource', () {
    test('deve ter os valores TBCA, USDA, PROPRIETARY e CUSTOM', () {
      expect(FoodSource.values, hasLength(4));
      expect(
        FoodSource.values,
        containsAll([
          FoodSource.tbca,
          FoodSource.usda,
          FoodSource.proprietary,
          FoodSource.custom,
        ]),
      );
    });

    test('deve serializar e deserializar corretamente', () {
      for (final source in FoodSource.values) {
        final serialized = source.name;
        final deserialized = FoodSource.fromName(serialized);
        expect(deserialized, source);
      }
    });

    test('fromName deve lançar exceção para nome inválido', () {
      expect(() => FoodSource.fromName('INVALID_SOURCE'), throwsArgumentError);
    });
  });
}
