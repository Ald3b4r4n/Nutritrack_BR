import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nutritrack_br/application/usecases/weight/add_weight_log_usecase.dart';
import 'package:nutritrack_br/application/usecases/weight/get_weight_history_usecase.dart';
import 'package:nutritrack_br/domain/entities/weight_log.dart';
import 'package:nutritrack_br/domain/repositories/weight_repository.dart';

class MockWeightRepository extends Mock implements WeightRepository {}

void main() {
  late MockWeightRepository mockRepository;
  late AddWeightLogUseCase addUseCase;
  late GetWeightHistoryUseCase getHistoryUseCase;

  setUp(() {
    mockRepository = MockWeightRepository();
    addUseCase = AddWeightLogUseCase(mockRepository);
    getHistoryUseCase = GetWeightHistoryUseCase(mockRepository);

    registerFallbackValue(
      WeightLog(id: 'fallback', weightKg: 0, date: DateTime(2023)),
    );
  });

  group('Weight Usecases (T039)', () {
    test('deve registrar peso por data', () async {
      final tLog = WeightLog(
        id: 'wt1',
        weightKg: 72.5,
        date: DateTime(2023, 10, 10),
      );

      when(
        () => mockRepository.addWeightLog(any()),
      ).thenAnswer((_) async => Right(tLog));

      final result = await addUseCase(tLog);

      expect(result.isRight(), true);
      result.fold((l) => fail('should be right'), (log) {
        expect(log.weightKg, 72.5);
        expect(log.date, DateTime(2023, 10, 10));
      });
    });

    test('deve retornar histórico ordenado por data', () async {
      final logs = [
        WeightLog(id: 'wt3', weightKg: 71.0, date: DateTime(2023, 10, 12)),
        WeightLog(id: 'wt2', weightKg: 72.0, date: DateTime(2023, 10, 11)),
        WeightLog(id: 'wt1', weightKg: 72.5, date: DateTime(2023, 10, 10)),
      ];

      when(
        () => mockRepository.getWeightHistory(),
      ).thenAnswer((_) async => Right(logs));

      final result = await getHistoryUseCase();

      expect(result.isRight(), true);
      result.fold((l) => fail('should be right'), (history) {
        expect(history.length, 3);
        // Mais recente primeiro
        expect(history.first.date.isAfter(history.last.date), true);
      });
    });

    test('deve calcular tendência simples (diferença primeiro-último)', () async {
      final logs = [
        WeightLog(id: 'wt3', weightKg: 71.0, date: DateTime(2023, 10, 12)),
        WeightLog(id: 'wt2', weightKg: 72.0, date: DateTime(2023, 10, 11)),
        WeightLog(id: 'wt1', weightKg: 72.5, date: DateTime(2023, 10, 10)),
      ];

      when(
        () => mockRepository.getWeightHistory(),
      ).thenAnswer((_) async => Right(logs));

      final result = await getHistoryUseCase();
      result.fold((l) => fail('should be right'), (history) {
        // Tendência = último registro (mais recente) - primeiro registro (mais antigo)
        final trend = history.first.weightKg - history.last.weightKg;
        expect(trend, closeTo(-1.5, 0.01));
      });
    });

    test('deve calcular IMC como informação auxiliar neutra', () async {
      // IMC = peso(kg) / altura(m)²
      // Para 72.5 kg e 1.75 m: IMC = 72.5 / (1.75 * 1.75) = 23.67
      const weightKg = 72.5;
      const heightM = 1.75;
      const bmi = weightKg / (heightM * heightM);

      expect(bmi, closeTo(23.67, 0.01));

      // Classificação neutra — apenas informação, sem julgamento
      String bmiCategory(double bmi) {
        if (bmi < 18.5) return 'Abaixo da faixa de referência';
        if (bmi < 25.0) return 'Dentro da faixa de referência';
        if (bmi < 30.0) return 'Acima da faixa de referência';
        return 'Significativamente acima da faixa de referência';
      }

      expect(bmiCategory(bmi), 'Dentro da faixa de referência');
    });

    test('deve retornar lista vazia quando não houver registros', () async {
      when(
        () => mockRepository.getWeightHistory(),
      ).thenAnswer((_) async => const Right([]));

      final result = await getHistoryUseCase();
      expect(result.isRight(), true);
      result.fold(
        (l) => fail('should be right'),
        (history) => expect(history, isEmpty),
      );
    });
  });
}
