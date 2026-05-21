import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:nutritrack_br/presentation/diary/diary_screen.dart';
import 'package:nutritrack_br/presentation/search/food_search_screen.dart';

void main() {
  testWidgets(
    'Tela do Diário deve exibir as refeições e botões Adicionar (T021)',
    (tester) async {
      // DiaryScreen usa context.push('/search'), então precisa de um GoRouter
      final router = GoRouter(
        initialLocation: '/diary',
        routes: [
          GoRoute(path: '/diary', builder: (ctx, s) => const DiaryScreen()),
          GoRoute(
            path: '/search',
            builder: (ctx, s) => const FoodSearchScreen(),
          ),
        ],
      );

      await tester.pumpWidget(
        ProviderScope(child: MaterialApp.router(routerConfig: router)),
      );

      await tester.pump();

      expect(find.text('Café da manhã'), findsOneWidget);
      expect(find.text('Almoço'), findsOneWidget);
      expect(find.text('Jantar'), findsOneWidget);
      expect(find.text('Lanches'), findsOneWidget);

      // Deve haver 4 botões de adicionar (um por refeição)
      expect(find.text('Adicionar'), findsNWidgets(4));
    },
  );
}
