/// Entidade representando o registro de ingestão de água.
class WaterLog {
  final String id;
  final int amountMl;
  final DateTime date;
  final DateTime createdAt;

  const WaterLog({
    required this.id,
    required this.amountMl,
    required this.date,
    required this.createdAt,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WaterLog && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
