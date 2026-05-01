import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nutritrack_br/application/usecases/water/add_water_log_usecase.dart';
import 'package:nutritrack_br/application/usecases/water/get_daily_water_logs_usecase.dart';
import 'package:nutritrack_br/domain/entities/water_log.dart';
import 'package:nutritrack_br/domain/repositories/water_repository.dart';

class MockWaterRepository extends Mock implements WaterRepository {}

void main() {
  late MockWaterRepository mockRepository;
  late AddWaterLogUseCase addUseCase;
  late GetDailyWaterLogsUseCase getDailyUseCase;

  setUp(() {
    mockRepository = MockWaterRepository();
    addUseCase = AddWaterLogUseCase(mockRepository);
    getDailyUseCase = GetDailyWaterLogsUseCase(mockRepository);

    registerFallbackValue(
      WaterLog(
        id: 'fallback',
        amountMl: 0,
        date: DateTime(2023),
        createdAt: DateTime(2023),
      ),
    );
  });

  final tDate = DateTime(2023, 10, 10);

  group('Water Usecases (T036)', () {
    test('deve registrar 200ml de água e retornar o log salvo', () async {
      final tLog = WaterLog(
        id: 'w1',
        amountMl: 200,
        date: tDate,
        createdAt: tDate,
      );

      when(() => mockRepository.addWaterLog(any()))
          .thenAnswer((_) async => Right(tLog));

      final result = await addUseCase(tLog);

      expect(result.isRight(), true);
      result.fold(
        (l) => fail('should be right'),
        (log) {
          expect(log.amountMl, 200);
        },
      );
    });

    test('deve somar registros diários (200ml + 300ml = 500ml contra meta)', () async {
      final tLog1 = WaterLog(
        id: 'w1',
        amountMl: 200,
        date: tDate,
        createdAt: tDate,
      );
      final tLog2 = WaterLog(
        id: 'w2',
        amountMl: 300,
        date: tDate,
        createdAt: tDate,
      );

      when(() => mockRepository.getDailyWaterLogs(tDate))
          .thenAnswer((_) async => Right([tLog1, tLog2]));

      final result = await getDailyUseCase(tDate);

      expect(result.isRight(), true);
      result.fold(
        (l) => fail('should be right'),
        (logs) {
          final totalMl = logs.fold<int>(0, (sum, log) => sum + log.amountMl);
          expect(totalMl, 500);

          // Validar contra meta de 2000ml
          const waterGoalMl = 2000;
          expect(totalMl < waterGoalMl, true);
          expect(totalMl / waterGoalMl, closeTo(0.25, 0.01));
        },
      );
    });

    test('deve retornar lista vazia quando não houver registros no dia', () async {
      when(() => mockRepository.getDailyWaterLogs(tDate))
          .thenAnswer((_) async => const Right([]));

      final result = await getDailyUseCase(tDate);

      expect(result.isRight(), true);
      result.fold(
        (l) => fail('should be right'),
        (logs) {
          expect(logs, isEmpty);
          final totalMl = logs.fold<int>(0, (sum, log) => sum + log.amountMl);
          expect(totalMl, 0);
        },
      );
    });
  });
}
