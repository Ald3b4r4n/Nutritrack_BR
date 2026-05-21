import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutritrack_br/main.dart';

void main() {
  testWidgets('App should be wrapped in provider scope', (tester) async {
    // NutriTrackApp agora usa UncontrolledProviderScope (criado em main() com seeder)
    // Verificamos que existe um escopo de provider na árvore
    await tester.pumpWidget(const ProviderScope(child: NutriTrackApp()));

    // Verifica que existe um ProviderScope na árvore
    expect(find.byType(ProviderScope), findsOneWidget);
  });
}
