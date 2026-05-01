import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutritrack_br/main.dart';

void main() {
  testWidgets('App should be wrapped in ProviderScope', (tester) async {
    await tester.pumpWidget(const NutriTrackApp());

    // Procura por um ProviderScope no esqueleto do app
    expect(find.byType(ProviderScope), findsOneWidget);
  });
}
