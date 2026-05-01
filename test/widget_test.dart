import 'package:flutter_test/flutter_test.dart';
import 'package:nutritrack_br/main.dart';

void main() {
  testWidgets('App smoke test - Dashboard placeholder', (tester) async {
    await tester.pumpWidget(const NutriTrackApp());
    await tester.pumpAndSettle(); // Wait for GoRouter to settle

    expect(find.text('Dashboard - Placeholder'), findsOneWidget);
  });
}
