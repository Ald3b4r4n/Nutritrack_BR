import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nutritrack_br/domain/entities/barcode_entity.dart';
import 'package:nutritrack_br/domain/repositories/barcode_repository.dart';
import 'package:nutritrack_br/domain/services/barcode_scanner.dart';

class FakeBarcodeScanner extends Mock implements BarcodeScanner {}

class MockBarcodeRepository extends Mock implements BarcodeRepository {}

void main() {
  late FakeBarcodeScanner fakeScanner;
  late MockBarcodeRepository mockRepository;

  setUp(() {
    fakeScanner = FakeBarcodeScanner();
    mockRepository = MockBarcodeRepository();

    registerFallbackValue(
      BarcodeEntity(
        barcode: 'fallback',
        foodItemId: 'fallback',
        scannedAt: DateTime(2023),
      ),
    );
  });

  group('BarcodeScanner Adapter (T031)', () {
    test('deve retornar código quando scan for bem-sucedido', () async {
      when(
        () => fakeScanner.scan(),
      ).thenAnswer((_) async => const BarcodeScanSuccess('7891234567890'));

      final result = await fakeScanner.scan();

      expect(result, isA<BarcodeScanSuccess>());
      expect((result as BarcodeScanSuccess).code, '7891234567890');
    });

    test('deve retornar falha quando permissão for negada', () async {
      when(() => fakeScanner.scan()).thenAnswer(
        (_) async => const BarcodeScanFailure('Permissão de câmera negada'),
      );

      final result = await fakeScanner.scan();

      expect(result, isA<BarcodeScanFailure>());
      expect((result as BarcodeScanFailure).reason, contains('Permissão'));
    });

    test('deve retornar falha quando câmera não estiver disponível', () async {
      when(() => fakeScanner.scan()).thenAnswer(
        (_) async => const BarcodeScanFailure('Câmera indisponível'),
      );

      final result = await fakeScanner.scan();

      expect(result, isA<BarcodeScanFailure>());
    });
  });

  group('BarcodeRepository - busca e vínculo (T031)', () {
    test('deve encontrar alimento pelo barcode', () async {
      final entity = BarcodeEntity(
        barcode: '7891234567890',
        foodItemId: 'tbca-001',
        scannedAt: DateTime(2023, 10, 10),
      );

      when(
        () => mockRepository.findByBarcode('7891234567890'),
      ).thenAnswer((_) async => Right(entity));

      final result = await mockRepository.findByBarcode('7891234567890');

      expect(result.isRight(), true);
      result.fold((l) => fail('should be right'), (found) {
        expect(found, isNotNull);
        expect(found!.foodItemId, 'tbca-001');
      });
    });

    test('deve retornar null quando barcode não existir no banco', () async {
      when(
        () => mockRepository.findByBarcode('0000000000000'),
      ).thenAnswer((_) async => const Right(null));

      final result = await mockRepository.findByBarcode('0000000000000');

      expect(result.isRight(), true);
      result.fold(
        (l) => fail('should be right'),
        (found) => expect(found, isNull),
      );
    });

    test('deve vincular barcode a alimento', () async {
      final entity = BarcodeEntity(
        barcode: '7891234567890',
        foodItemId: 'custom-001',
        scannedAt: DateTime(2023, 10, 10),
      );

      when(
        () => mockRepository.linkBarcode(any()),
      ).thenAnswer((_) async => Right(entity));

      final result = await mockRepository.linkBarcode(entity);

      expect(result.isRight(), true);
      result.fold((l) => fail('should be right'), (saved) {
        expect(saved.barcode, '7891234567890');
        expect(saved.foodItemId, 'custom-001');
      });
    });
  });
}
