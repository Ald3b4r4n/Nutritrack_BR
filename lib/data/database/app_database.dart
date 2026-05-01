import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'package:nutritrack_br/data/database/tables/barcode_entities_table.dart';
import 'package:nutritrack_br/data/database/tables/food_items_table.dart';
import 'package:nutritrack_br/data/database/tables/meal_entries_table.dart';
import 'package:nutritrack_br/data/database/tables/meal_records_table.dart';
import 'package:nutritrack_br/data/database/tables/recent_foods_by_meal_table.dart';
import 'package:nutritrack_br/data/database/tables/serving_sizes_table.dart';
import 'package:nutritrack_br/data/database/tables/water_logs_table.dart';
import 'package:nutritrack_br/data/database/tables/weight_logs_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    FoodItems,
    ServingSizes,
    BarcodeEntities,
    MealRecords,
    MealEntries,
    WaterLogs,
    WeightLogs,
    RecentFoodsByMeal,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  /// Construtor para testes — aceita uma QueryExecutor customizada (ex: NativeDatabase.memory()).
  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
      // Índice para busca textual de alimentos por nome
      await customStatement(
        'CREATE INDEX IF NOT EXISTS idx_food_items_name ON food_items(name);',
      );
      // Índice por fonte para filtros rápidos
      await customStatement(
        'CREATE INDEX IF NOT EXISTS idx_food_items_source ON food_items(source);',
      );
    },
  );
}

/// Constrói a conexão com o banco SQLite no diretório de documentos do app.
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'nutritrack_br.sqlite'));
    return NativeDatabase.createBackgroundConnection(file);
  });
}

/// Factory function para uso na injeção de dependência (Riverpod).
AppDatabase createAppDatabase() => AppDatabase(_openConnection());
