/// Enum de rastreabilidade da fonte nutricional de um alimento.
/// Garante que todo alimento tenha sua origem explicitamente identificada.
enum FoodSource {
  tbca,
  usda,
  proprietary,
  custom;

  /// Serializa para o nome da enum (ex: 'tbca', 'usda').
  String get label {
    switch (this) {
      case FoodSource.tbca:
        return 'TBCA';
      case FoodSource.usda:
        return 'USDA';
      case FoodSource.proprietary:
        return 'Proprietário';
      case FoodSource.custom:
        return 'Personalizado';
    }
  }

  /// Deserializa a partir do [name] (case-insensitive).
  /// Lança [ArgumentError] se o nome for inválido.
  static FoodSource fromName(String name) {
    final normalized = name.toLowerCase();
    for (final source in FoodSource.values) {
      if (source.name == normalized) return source;
    }
    throw ArgumentError('FoodSource inválido: "$name"');
  }
}
