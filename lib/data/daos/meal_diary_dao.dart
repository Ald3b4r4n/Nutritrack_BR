import 'package:drift/drift.dart';
import 'package:nutritrack_br/data/database/app_database.dart';
import 'package:nutritrack_br/data/database/tables/food_items_table.dart';
import 'package:nutritrack_br/data/database/tables/meal_entries_table.dart';
import 'package:nutritrack_br/data/database/tables/meal_records_table.dart';
import 'package:nutritrack_br/data/mappers/food_item_mapper.dart';
import 'package:nutritrack_br/domain/entities/meal_entry.dart' as domain;
import 'package:nutritrack_br/domain/entities/meal_entry_details.dart';
import 'package:nutritrack_br/domain/value_objects/meal_type.dart';

part 'meal_diary_dao.g.dart';

@DriftAccessor(tables: [MealRecords, MealEntries, FoodItems])
class MealDiaryDao extends DatabaseAccessor<AppDatabase> with _$MealDiaryDaoMixin {
  MealDiaryDao(super.db);

  /// Obtém o diário de um dia (buscando ou criando)
  Future<MealRecord> _getOrCreateMealRecord(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    
    final existing = await (select(mealRecords)
          ..where((t) => t.date.equals(startOfDay)))
        .getSingleOrNull();

    if (existing != null) return existing;

    final newId = 'record-${startOfDay.millisecondsSinceEpoch}';
    final companion = MealRecordsCompanion.insert(
      id: newId,
      date: startOfDay,
    );
    await into(mealRecords).insert(companion);
    return MealRecord(id: newId, date: startOfDay);
  }

  /// Adiciona uma entrada ao diário
  Future<domain.MealEntry> addEntry(domain.MealEntry entry, DateTime date) async {
    final record = await _getOrCreateMealRecord(date);
    
    final companion = MealEntriesCompanion.insert(
      id: entry.id,
      mealRecordId: record.id,
      mealType: entry.mealType.name,
      foodItemId: entry.foodItemId,
      quantity: entry.quantity,
      servingDescription: entry.servingDescription,
      servingWeightGrams: entry.servingWeightGrams,
      createdAt: entry.createdAt,
    );

    await into(mealEntries).insert(companion);
    
    return entry.copyWith(mealRecordId: record.id);
  }

  /// Atualiza uma entrada
  Future<domain.MealEntry> updateEntry(domain.MealEntry entry) async {
    final companion = MealEntriesCompanion(
      quantity: Value(entry.quantity),
      servingDescription: Value(entry.servingDescription),
      servingWeightGrams: Value(entry.servingWeightGrams),
    );

    await (update(mealEntries)..where((t) => t.id.equals(entry.id))).write(companion);
    return entry;
  }

  /// Remove uma entrada
  Future<void> removeEntry(String entryId) async {
    await (delete(mealEntries)..where((t) => t.id.equals(entryId))).go();
  }

  /// Obtém as entradas do dia, com os FoodItems correspondentes
  Future<List<MealEntryDetails>> getDailyMeals(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    
    final record = await (select(mealRecords)
          ..where((t) => t.date.equals(startOfDay)))
        .getSingleOrNull();

    if (record == null) return [];

    final query = select(mealEntries).join([
      innerJoin(foodItems, foodItems.id.equalsExp(mealEntries.foodItemId)),
    ])..where(mealEntries.mealRecordId.equals(record.id));

    final results = await query.get();

    return results.map((row) {
      final entryRow = row.readTable(mealEntries);
      final foodRow = row.readTable(foodItems);

      final entry = domain.MealEntry(
        id: entryRow.id,
        mealRecordId: entryRow.mealRecordId,
        mealType: MealType.values.firstWhere((e) => e.name == entryRow.mealType),
        foodItemId: entryRow.foodItemId,
        quantity: entryRow.quantity,
        servingDescription: entryRow.servingDescription,
        servingWeightGrams: entryRow.servingWeightGrams,
        createdAt: entryRow.createdAt,
      );

      final food = FoodItemMapper.toDomain(foodRow);

      return MealEntryDetails(entry: entry, foodItem: food);
    }).toList();
  }
}
