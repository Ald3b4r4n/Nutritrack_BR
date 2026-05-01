import 'package:nutritrack_br/domain/entities/food_item.dart';
import 'package:nutritrack_br/domain/entities/meal_entry.dart';

class MealEntryDetails {
  final MealEntry entry;
  final FoodItem foodItem;

  const MealEntryDetails({
    required this.entry,
    required this.foodItem,
  });

  double get calories =>
      foodItem.nutrients.calories * (entry.totalWeightGrams / 100);
  double get protein =>
      foodItem.nutrients.protein * (entry.totalWeightGrams / 100);
  double get carbohydrates =>
      foodItem.nutrients.carbohydrates * (entry.totalWeightGrams / 100);
  double get fat => foodItem.nutrients.fat * (entry.totalWeightGrams / 100);
}
