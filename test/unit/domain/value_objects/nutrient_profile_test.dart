import 'package:flutter_test/flutter_test.dart';
import 'package:nutritrack_br/domain/value_objects/nutrient_profile.dart';

void main() {
  group('NutrientProfile', () {
    test('deve criar instância com valores válidos', () {
      const profile = NutrientProfile(
        calories: 150.0,
        protein: 10.0,
        carbohydrates: 20.0,
        fat: 5.0,
        fiber: 3.0,
        sodium: 200.0,
      );

      expect(profile.calories, 150.0);
      expect(profile.protein, 10.0);
      expect(profile.carbohydrates, 20.0);
      expect(profile.fat, 5.0);
      expect(profile.fiber, 3.0);
      expect(profile.sodium, 200.0);
    });

    test('sodium deve ser nullable', () {
      const profile = NutrientProfile(
        calories: 100.0,
        protein: 5.0,
        carbohydrates: 10.0,
        fat: 3.0,
        fiber: 1.0,
      );
      expect(profile.sodium, isNull);
    });

    test('deve calcular nutrientes proporcionais para uma quantidade', () {
      const profile = NutrientProfile(
        calories: 200.0,
        protein: 20.0,
        carbohydrates: 30.0,
        fat: 10.0,
        fiber: 5.0,
      );

      // Para 50g (50% de 100g)
      final scaled = profile.scaledTo(50.0);
      expect(scaled.calories, closeTo(100.0, 0.001));
      expect(scaled.protein, closeTo(10.0, 0.001));
      expect(scaled.carbohydrates, closeTo(15.0, 0.001));
      expect(scaled.fat, closeTo(5.0, 0.001));
      expect(scaled.fiber, closeTo(2.5, 0.001));
    });

    test('dois NutrientProfile com mesmos valores devem ser iguais', () {
      const p1 = NutrientProfile(
        calories: 100.0,
        protein: 5.0,
        carbohydrates: 10.0,
        fat: 3.0,
        fiber: 1.0,
      );
      const p2 = NutrientProfile(
        calories: 100.0,
        protein: 5.0,
        carbohydrates: 10.0,
        fat: 3.0,
        fiber: 1.0,
      );

      expect(p1, equals(p2));
    });
  });
}
