import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutritrack_br/presentation/diary/diary_screen.dart';

void main() {
  testWidgets('Tela do Diário deve exibir as refeições e botões Adicionar (T021)', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: DiaryScreen(),
        ),
      ),
    );

    expect(find.text('Café da manhã'), findsOneWidget);
    expect(find.text('Almoço'), findsOneWidget);
    expect(find.text('Jantar'), findsOneWidget);
    expect(find.text('Lanches'), findsOneWidget);

    // Deve haver 4 botões de adicionar
    expect(find.text('Adicionar'), findsNWidgets(4));
  });
}
