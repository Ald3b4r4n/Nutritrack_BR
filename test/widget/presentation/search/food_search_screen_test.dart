import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutritrack_br/presentation/search/food_search_screen.dart';

void main() {
  group('Tela de Busca e Cadastro de Alimentos (T028)', () {
    testWidgets('deve exibir campo de busca', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(child: MaterialApp(home: FoodSearchScreen())),
      );

      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('deve exibir botão Criar novo alimento', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(child: MaterialApp(home: FoodSearchScreen())),
      );

      expect(find.text('Criar novo'), findsOneWidget);
    });
  });
}
