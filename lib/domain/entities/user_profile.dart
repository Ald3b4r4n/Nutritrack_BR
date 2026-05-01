/// Perfil do usuário com metas nutricionais.
class UserProfile {
  final String id;
  final String name;
  final int calorieGoal;
  final int waterGoalMl;
  final double weightGoalKg;

  const UserProfile({
    required this.id,
    required this.name,
    required this.calorieGoal,
    required this.waterGoalMl,
    required this.weightGoalKg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserProfile && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
