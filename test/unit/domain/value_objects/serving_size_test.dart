import 'package:flutter_test/flutter_test.dart';
import 'package:nutritrack_br/domain/value_objects/serving_size.dart';

void main() {
  group('ServingSize', () {
    test('deve criar instância com valores válidos', () {
      const serving = ServingSize(
        id: 'serving-001',
        foodItemId: 'food-001',
        description: '1 colher de sopa',
        weightInGrams: 15.0,
        defaultAmount: 1.0,
      );

      expect(serving.id, 'serving-001');
      expect(serving.foodItemId, 'food-001');
      expect(serving.description, '1 colher de sopa');
      expect(serving.weightInGrams, 15.0);
      expect(serving.defaultAmount, 1.0);
    });

    test('deve calcular peso total para uma quantidade dada', () {
      const serving = ServingSize(
        id: 'serving-001',
        foodItemId: 'food-001',
        description: '1 fatia',
        weightInGrams: 30.0,
        defaultAmount: 1.0,
      );

      // 2 fatias = 60g
      expect(serving.totalWeightInGrams(2.0), closeTo(60.0, 0.001));
    });

    test('dois ServingSize com mesmos valores devem ser iguais', () {
      const s1 = ServingSize(
        id: 'x',
        foodItemId: 'y',
        description: 'desc',
        weightInGrams: 10.0,
        defaultAmount: 1.0,
      );
      const s2 = ServingSize(
        id: 'x',
        foodItemId: 'y',
        description: 'desc',
        weightInGrams: 10.0,
        defaultAmount: 1.0,
      );

      expect(s1, equals(s2));
    });
  });
}
