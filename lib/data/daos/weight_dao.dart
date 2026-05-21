import 'package:drift/drift.dart';
import 'package:nutritrack_br/data/database/app_database.dart';
import 'package:nutritrack_br/data/database/tables/weight_logs_table.dart';
import 'package:nutritrack_br/domain/entities/weight_log.dart' as domain;

part 'weight_dao.g.dart';

/// DAO dedicado para operações de registro de peso.
@DriftAccessor(tables: [WeightLogs])
class WeightDao extends DatabaseAccessor<AppDatabase> with _$WeightDaoMixin {
  WeightDao(super.db);

  /// Insere um registro de peso.
  Future<domain.WeightLog> insertLog(domain.WeightLog log) async {
    await into(weightLogs).insert(
      WeightLogsCompanion(
        id: Value(log.id),
        weightKg: Value(log.weightKg),
        date: Value(log.date),
        notes: log.notes != null ? Value(log.notes!) : const Value.absent(),
      ),
    );
    return log;
  }

  /// Obtém histórico de peso ordenado por data (mais recente primeiro).
  Future<List<domain.WeightLog>> getHistory() async {
    final rows = await (select(
      weightLogs,
    )..orderBy([(t) => OrderingTerm.desc(t.date)])).get();

    return rows
        .map(
          (r) => domain.WeightLog(
            id: r.id,
            weightKg: r.weightKg,
            date: r.date,
            notes: r.notes,
          ),
        )
        .toList();
  }

  /// Remove um registro de peso.
  Future<void> deleteLog(String id) async {
    await (delete(weightLogs)..where((t) => t.id.equals(id))).go();
  }
}
