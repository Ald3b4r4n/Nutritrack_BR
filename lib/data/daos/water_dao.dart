import 'package:drift/drift.dart';
import 'package:nutritrack_br/data/database/app_database.dart';
import 'package:nutritrack_br/data/database/tables/water_logs_table.dart';
import 'package:nutritrack_br/domain/entities/water_log.dart' as domain;

part 'water_dao.g.dart';

/// DAO dedicado para operações de registro de água.
@DriftAccessor(tables: [WaterLogs])
class WaterDao extends DatabaseAccessor<AppDatabase> with _$WaterDaoMixin {
  WaterDao(super.db);

  /// Insere um registro de água.
  Future<domain.WaterLog> insertLog(domain.WaterLog log) async {
    await into(waterLogs).insert(
      WaterLogsCompanion(
        id: Value(log.id),
        amountMl: Value(log.amountMl),
        date: Value(log.date),
        createdAt: Value(log.createdAt),
      ),
    );
    return log;
  }

  /// Obtém todos os registros do dia.
  Future<List<domain.WaterLog>> getDailyLogs(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    final rows =
        await (select(waterLogs)
              ..where(
                (t) =>
                    t.date.isBiggerOrEqualValue(startOfDay) &
                    t.date.isSmallerThanValue(endOfDay),
              )
              ..orderBy([(t) => OrderingTerm.asc(t.createdAt)]))
            .get();

    return rows
        .map(
          (r) => domain.WaterLog(
            id: r.id,
            amountMl: r.amountMl,
            date: r.date,
            createdAt: r.createdAt,
          ),
        )
        .toList();
  }

  /// Remove um registro de água.
  Future<void> deleteLog(String id) async {
    await (delete(waterLogs)..where((t) => t.id.equals(id))).go();
  }
}
