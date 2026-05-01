/// Resultado de uma leitura de barcode.
sealed class BarcodeScanResult {
  const BarcodeScanResult();
}

/// Leitura bem-sucedida.
class BarcodeScanSuccess extends BarcodeScanResult {
  final String code;
  const BarcodeScanSuccess(this.code);
}

/// Falha na leitura (permissão negada, câmera indisponível, cancelamento).
class BarcodeScanFailure extends BarcodeScanResult {
  final String reason;
  const BarcodeScanFailure(this.reason);
}

/// Contrato abstrato para o scanner de código de barras.
/// Isola a dependência nativa (mobile_scanner) da lógica de negócio.
abstract class BarcodeScanner {
  /// Abre o scanner e retorna o resultado.
  Future<BarcodeScanResult> scan();
}
