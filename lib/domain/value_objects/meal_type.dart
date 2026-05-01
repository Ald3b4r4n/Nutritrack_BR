/// Enum para tipos de refeição do diário alimentar.
enum MealType {
  breakfast,
  lunch,
  dinner,
  snacks;

  /// Rótulo em PT-BR para exibição na UI.
  String get label {
    switch (this) {
      case MealType.breakfast:
        return 'Café da Manhã';
      case MealType.lunch:
        return 'Almoço';
      case MealType.dinner:
        return 'Jantar';
      case MealType.snacks:
        return 'Lanches';
    }
  }

  static MealType fromName(String name) {
    final normalized = name.toLowerCase();
    for (final type in MealType.values) {
      if (type.name == normalized) return type;
    }
    throw ArgumentError('MealType inválido: "$name"');
  }
}
