import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutritrack_br/data/daos/water_dao.dart';
import 'package:nutritrack_br/data/database/app_database.dart' hide WaterLog;
import 'package:nutritrack_br/data/repositories/water_repository_impl.dart';
import 'package:nutritrack_br/domain/entities/water_log.dart';

void main() {
  late AppDatabase db;
  late WaterDao dao;
  late WaterRepositoryImpl repository;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    dao = WaterDao(db);
    repository = WaterRepositoryImpl(dao);
  });

  tearDown(() async {
    await db.close();
  });

  final tDate = DateTime(2023, 10, 10, 12);

  group('WaterRepositoryImpl com Drift em memória (T037)', () {
    test('deve registrar 200ml de água', () async {
      final log = WaterLog(
        id: 'w1',
        amountMl: 200,
        date: tDate,
        createdAt: tDate,
      );

      final result = await repository.addWaterLog(log);

      expect(result.isRight(), true);
      result.fold(
        (l) => fail('should be right'),
        (saved) => expect(saved.amountMl, 200),
      );
    });

    test('deve somar registros diários (200 + 300 = 500)', () async {
      final log1 = WaterLog(
        id: 'w1',
        amountMl: 200,
        date: tDate,
        createdAt: tDate,
      );
      final log2 = WaterLog(
        id: 'w2',
        amountMl: 300,
        date: tDate.add(const Duration(hours: 1)),
        createdAt: tDate.add(const Duration(hours: 1)),
      );

      await repository.addWaterLog(log1);
      await repository.addWaterLog(log2);

      final result = await repository.getDailyWaterLogs(tDate);
      expect(result.isRight(), true);
      result.fold(
        (l) => fail('should be right'),
        (logs) {
          final total = logs.fold<int>(0, (sum, l) => sum + l.amountMl);
          expect(total, 500);
          expect(logs.length, 2);
        },
      );
    });

    test('deve retornar lista vazia quando não houver registros no dia', () async {
      final result = await repository.getDailyWaterLogs(tDate);
      expect(result.isRight(), true);
      result.fold(
        (l) => fail('should be right'),
        (logs) => expect(logs, isEmpty),
      );
    });

    test('deve remover um registro de água', () async {
      final log = WaterLog(
        id: 'w1',
        amountMl: 200,
        date: tDate,
        createdAt: tDate,
      );
      await repository.addWaterLog(log);
      await repository.removeWaterLog('w1');

      final result = await repository.getDailyWaterLogs(tDate);
      result.fold(
        (l) => fail('should be right'),
        (logs) => expect(logs, isEmpty),
      );
    });
  });
}
