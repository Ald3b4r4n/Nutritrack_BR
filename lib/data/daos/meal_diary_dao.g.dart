// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_diary_dao.dart';

// ignore_for_file: type=lint
mixin _$MealDiaryDaoMixin on DatabaseAccessor<AppDatabase> {
  $MealRecordsTable get mealRecords => attachedDatabase.mealRecords;
  $FoodItemsTable get foodItems => attachedDatabase.foodItems;
  $MealEntriesTable get mealEntries => attachedDatabase.mealEntries;
  MealDiaryDaoManager get managers => MealDiaryDaoManager(this);
}

class MealDiaryDaoManager {
  final _$MealDiaryDaoMixin _db;
  MealDiaryDaoManager(this._db);
  $$MealRecordsTableTableManager get mealRecords =>
      $$MealRecordsTableTableManager(_db.attachedDatabase, _db.mealRecords);
  $$FoodItemsTableTableManager get foodItems =>
      $$FoodItemsTableTableManager(_db.attachedDatabase, _db.foodItems);
  $$MealEntriesTableTableManager get mealEntries =>
      $$MealEntriesTableTableManager(_db.attachedDatabase, _db.mealEntries);
}
