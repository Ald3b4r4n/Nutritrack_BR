import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutritrack_br/data/daos/weight_dao.dart';
import 'package:nutritrack_br/data/database/app_database.dart' hide WeightLog;
import 'package:nutritrack_br/data/repositories/weight_repository_impl.dart';
import 'package:nutritrack_br/domain/entities/weight_log.dart';

void main() {
  late AppDatabase db;
  late WeightDao dao;
  late WeightRepositoryImpl repository;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    dao = WeightDao(db);
    repository = WeightRepositoryImpl(dao);
  });

  tearDown(() async {
    await db.close();
  });

  group('WeightRepositoryImpl com Drift em memória (T040)', () {
    test('deve registrar peso por data', () async {
      final log = WeightLog(
        id: 'wt1',
        weightKg: 72.5,
        date: DateTime(2023, 10, 10),
      );

      final result = await repository.addWeightLog(log);
      expect(result.isRight(), true);
      result.fold(
        (l) => fail('should be right'),
        (saved) => expect(saved.weightKg, 72.5),
      );
    });

    test(
      'deve retornar histórico ordenado por data (mais recente primeiro)',
      () async {
        await repository.addWeightLog(
          WeightLog(id: 'wt1', weightKg: 72.5, date: DateTime(2023, 10, 10)),
        );
        await repository.addWeightLog(
          WeightLog(id: 'wt2', weightKg: 72.0, date: DateTime(2023, 10, 11)),
        );
        await repository.addWeightLog(
          WeightLog(id: 'wt3', weightKg: 71.0, date: DateTime(2023, 10, 12)),
        );

        final result = await repository.getWeightHistory();
        expect(result.isRight(), true);
        result.fold((l) => fail('should be right'), (history) {
          expect(history.length, 3);
          expect(history.first.weightKg, 71.0); // mais recente
          expect(history.last.weightKg, 72.5); // mais antigo
        });
      },
    );

    test('deve preservar notes quando fornecido', () async {
      final log = WeightLog(
        id: 'wt1',
        weightKg: 72.5,
        date: DateTime(2023, 10, 10),
        notes: 'Após treino',
      );

      await repository.addWeightLog(log);
      final result = await repository.getWeightHistory();
      result.fold(
        (l) => fail('should be right'),
        (history) => expect(history.first.notes, 'Após treino'),
      );
    });

    test('deve remover um registro de peso', () async {
      await repository.addWeightLog(
        WeightLog(id: 'wt1', weightKg: 72.5, date: DateTime(2023, 10, 10)),
      );
      await repository.removeWeightLog('wt1');

      final result = await repository.getWeightHistory();
      result.fold(
        (l) => fail('should be right'),
        (history) => expect(history, isEmpty),
      );
    });
  });
}
