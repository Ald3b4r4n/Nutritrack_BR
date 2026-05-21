import 'package:nutritrack_br/application/providers/repository_providers.dart';
import 'package:nutritrack_br/application/usecases/water/add_water_log_usecase.dart';
import 'package:nutritrack_br/application/usecases/water/get_daily_water_logs_usecase.dart';
import 'package:nutritrack_br/data/daos/water_dao.dart';
import 'package:nutritrack_br/data/repositories/water_repository_impl.dart';
import 'package:nutritrack_br/domain/entities/water_log.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'water_provider.g.dart';

@riverpod
class WaterNotifier extends _$WaterNotifier {
  @override
  FutureOr<List<WaterLog>> build(DateTime date) async {
    return _fetchLogs(date);
  }

  Future<List<WaterLog>> _fetchLogs(DateTime d) async {
    final db = ref.read(appDatabaseProvider);
    final repo = WaterRepositoryImpl(WaterDao(db));
    final usecase = GetDailyWaterLogsUseCase(repo);
    final result = await usecase(d);
    return result.fold((l) => throw Exception(l.message), (r) => r);
  }

  Future<void> addWater(int amountMl) async {
    final db = ref.read(appDatabaseProvider);
    final repo = WaterRepositoryImpl(WaterDao(db));
    final usecase = AddWaterLogUseCase(repo);
    final now = DateTime.now();
    final log = WaterLog(
      id: const Uuid().v4(),
      amountMl: amountMl,
      date: now,
      createdAt: now,
    );
    final result = await usecase(log);
    if (result.isRight()) {
      ref.invalidateSelf();
    }
  }
}
