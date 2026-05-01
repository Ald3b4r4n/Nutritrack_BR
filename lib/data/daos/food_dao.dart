import 'package:drift/drift.dart';
import 'package:nutritrack_br/data/database/app_database.dart';
import 'package:nutritrack_br/data/database/tables/food_items_table.dart';
import 'package:nutritrack_br/data/database/tables/serving_sizes_table.dart';
import 'package:nutritrack_br/data/mappers/food_item_mapper.dart';
import 'package:nutritrack_br/domain/entities/food_item.dart' as domain;
import 'package:nutritrack_br/domain/value_objects/food_source.dart';

part 'food_dao.g.dart';

/// DAO dedicado para operações de alimentos e porções.
@DriftAccessor(tables: [FoodItems, ServingSizes])
class FoodDao extends DatabaseAccessor<AppDatabase> with _$FoodDaoMixin {
  FoodDao(super.db);

  /// Busca alimentos cujo nome contém [query] (LIKE %query%).
  /// Se [source] for informada, filtra pela fonte.
  /// Exclui alimentos com soft-delete.
  Future<List<domain.FoodItem>> searchFoods(
    String query, {
    FoodSource? source,
  }) async {
    final q = select(foodItems)
      ..where((t) => t.isDeleted.equals(false));

    if (query.isNotEmpty) {
      q.where((t) => t.name.like('%$query%'));
    }

    if (source != null) {
      q.where((t) => t.source.equals(source.name));
    }

    q.orderBy([(t) => OrderingTerm.asc(t.name)]);

    final rows = await q.get();
    return rows.map(FoodItemMapper.toDomain).toList();
  }

  /// Insere um novo alimento.
  Future<domain.FoodItem> insertFood(domain.FoodItem food) async {
    await into(foodItems).insert(FoodItemMapper.toCompanion(food));
    return food;
  }

  /// Atualiza um alimento existente.
  Future<domain.FoodItem> updateFood(domain.FoodItem food) async {
    await (update(foodItems)..where((t) => t.id.equals(food.id)))
        .write(FoodItemMapper.toCompanion(food));
    return food;
  }

  /// Obtém um alimento pelo id.
  Future<domain.FoodItem?> getFoodById(String id) async {
    final row = await (select(foodItems)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    return row == null ? null : FoodItemMapper.toDomain(row);
  }

  /// Insere múltiplos alimentos em batch (para seed).
  Future<void> insertFoodsBatch(List<domain.FoodItem> foods) async {
    await batch((b) {
      b.insertAll(foodItems, foods.map(FoodItemMapper.toCompanion).toList());
    });
  }
}
