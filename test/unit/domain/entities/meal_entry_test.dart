import 'package:flutter_test/flutter_test.dart';
import 'package:nutritrack_br/domain/entities/meal_entry.dart';
import 'package:nutritrack_br/domain/value_objects/meal_type.dart';

void main() {
  group('MealEntry', () {
    final createdAt = DateTime(2026, 5, 1, 12, 30);

    test('deve criar MealEntry com valores válidos', () {
      final entry = MealEntry(
        id: 'entry-001',
        mealRecordId: 'meal-001',
        mealType: MealType.lunch,
        foodItemId: 'food-001',
        quantity: 2.0,
        servingDescription: '1 concha',
        servingWeightGrams: 90.0,
        createdAt: createdAt,
      );

      expect(entry.id, 'entry-001');
      expect(entry.mealType, MealType.lunch);
      expect(entry.quantity, 2.0);
      expect(entry.servingWeightGrams, 90.0);
    });

    test('deve calcular peso total da porção consumida', () {
      final entry = MealEntry(
        id: 'entry-001',
        mealRecordId: 'meal-001',
        mealType: MealType.breakfast,
        foodItemId: 'food-001',
        quantity: 3.0,
        servingDescription: '1 fatia',
        servingWeightGrams: 30.0,
        createdAt: createdAt,
      );

      // 3 fatias de 30g = 90g
      expect(entry.totalWeightGrams, closeTo(90.0, 0.001));
    });

    test('dois MealEntry com mesmo id devem ser iguais', () {
      final entry1 = MealEntry(
        id: 'entry-001',
        mealRecordId: 'meal-001',
        mealType: MealType.lunch,
        foodItemId: 'food-001',
        quantity: 1.0,
        servingDescription: '1 porção',
        servingWeightGrams: 100.0,
        createdAt: createdAt,
      );
      final entry2 = MealEntry(
        id: 'entry-001',
        mealRecordId: 'meal-002',
        mealType: MealType.dinner,
        foodItemId: 'food-002',
        quantity: 2.0,
        servingDescription: 'outra porção',
        servingWeightGrams: 200.0,
        createdAt: createdAt,
      );

      expect(entry1, equals(entry2));
    });
  });
}
