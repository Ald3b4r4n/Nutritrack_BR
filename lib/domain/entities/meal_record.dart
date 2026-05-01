/// Entidade representando o diário de um dia específico.
class MealRecord {
  final String id;
  final DateTime date;

  const MealRecord({required this.id, required this.date});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MealRecord && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
