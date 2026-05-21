/// Logger seguro para o NutriTrack BR.
///
/// **Política de privacidade (Constitution V)**:
/// - Logs NÃO devem expor dados pessoais: peso, refeições, alimentos,
///   hábitos alimentares, metas ou histórico de água.
/// - Em produção, apenas erros e avisos devem ser registrados.
/// - Em debug, informações contextuais podem ser logadas, mas sem dados
///   sensíveis do usuário.
///
/// **Uso recomendado**:
/// ```dart
/// SafeLogger.info('Seed concluído');
/// SafeLogger.error('Falha ao carregar dados', error: e);
/// ```
///
/// **Proibido**:
/// ```dart
/// SafeLogger.info('Peso do usuário: 75kg'); // ❌
/// SafeLogger.info('Refeição: Arroz, Feijão'); // ❌
/// SafeLogger.info('Meta calórica: 2000'); // ❌
/// ```
class SafeLogger {
  SafeLogger._();

  /// Registra informação não-sensível (apenas em debug).
  static void info(String message) {
    assert(() {
      // ignore: avoid_print
      print('[NutriTrack INFO] $message');
      return true;
    }());
  }

  /// Registra aviso — nunca inclua dados pessoais.
  static void warning(String message) {
    assert(() {
      // ignore: avoid_print
      print('[NutriTrack WARN] $message');
      return true;
    }());
  }

  /// Registra erro — stack trace é aceitável, dados pessoais não.
  static void error(String message, {Object? error, StackTrace? stackTrace}) {
    assert(() {
      // ignore: avoid_print
      print('[NutriTrack ERROR] $message');
      if (error != null) {
        // ignore: avoid_print
        print('  Error: $error');
      }
      return true;
    }());
  }
}
