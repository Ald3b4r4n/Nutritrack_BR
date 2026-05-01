/// Entidade de registro de peso corporal.
class WeightLog {
  final String id;
  final double weightKg;
  final DateTime date;
  final String? notes;

  const WeightLog({
    required this.id,
    required this.weightKg,
    required this.date,
    this.notes,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WeightLog && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
