import 'dart:async';

import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:nutritrack_br/domain/services/barcode_scanner.dart';

/// Adapter que encapsula a dependência nativa [MobileScannerController].
/// Em testes, use o [BarcodeScanner] abstrato com mock/fake.
class MobileScannerAdapter implements BarcodeScanner {
  @override
  Future<BarcodeScanResult> scan() async {
    // A leitura real ocorre na UI (MobileScanner widget).
    // Este adapter é usado como fallback/programático.
    // A tela de scanner (BarcodeScannerScreen) controla o MobileScannerController
    // diretamente e converte o resultado para BarcodeScanResult.
    //
    // Este método existe para manter o contrato testável.
    // Na prática, o fluxo real é:
    //   UI (MobileScanner widget) → detecta barcode → chama use case.
    return const BarcodeScanFailure(
      'Use BarcodeScannerScreen para leitura via câmera',
    );
  }
}
