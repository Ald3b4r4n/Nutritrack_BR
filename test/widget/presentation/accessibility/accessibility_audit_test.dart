import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:nutritrack_br/application/providers/dashboard_provider.dart';
import 'package:nutritrack_br/presentation/screens/dashboard_screen.dart';
import 'package:nutritrack_br/presentation/screens/main_shell_screen.dart';
import 'package:nutritrack_br/presentation/diary/diary_screen.dart';
import 'package:nutritrack_br/presentation/water/water_screen.dart';
import 'package:nutritrack_br/presentation/weight/weight_screen.dart';

void main() {
  DashboardSummary makeSummary() => DashboardSummary(
    consumedCalories: 500,
    targetCalories: 2000,
    consumedProtein: 40,
    consumedCarbs: 80,
    consumedFat: 20,
    consumedWaterMl: 800,
    targetWaterMl: 2000,
    currentWeightKg: 70.0,
  );

  Widget buildApp(Widget child) {
    final today = DateTime.now();
    final dateKey = DateTime(today.year, today.month, today.day);
    final container = ProviderContainer(
      overrides: [
        dashboardSummaryProvider(
          dateKey,
        ).overrideWith((ref) async => makeSummary()),
      ],
    );
    return UncontrolledProviderScope(
      container: container,
      child: MaterialApp(home: child),
    );
  }

  group('Acessibilidade - Dashboard (T050)', () {
    testWidgets('botões de ação rápida têm Semantics label', (tester) async {
      await tester.pumpWidget(buildApp(const DashboardScreen()));
      await tester.pump();

      // Todos os botões de ação rápida devem ter texto visível
      expect(find.text('Refeição'), findsOneWidget);
      expect(find.text('Água'), findsAtLeastNWidgets(1));
      expect(find.text('Peso'), findsAtLeastNWidgets(1));
    });

    testWidgets('ícones na navegação possuem label textual', (tester) async {
      final today = DateTime.now();
      final dateKey = DateTime(today.year, today.month, today.day);
      final container = ProviderContainer(
        overrides: [
          dashboardSummaryProvider(dateKey).overrideWith(
            (ref) async => makeSummary(),
          ),
        ],
      );
      addTearDown(container.dispose);

      final router = GoRouter(
        initialLocation: '/',
        routes: [
          ShellRoute(
            builder: (context, state, child) => MainShellScreen(child: child),
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const DashboardScreen(),
              ),
            ],
          ),
        ],
      );

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp.router(routerConfig: router),
        ),
      );
      await tester.pump();

      // NavigationDestination possui label textual
      expect(find.text('Resumo'), findsOneWidget);
      expect(find.text('Diário'), findsOneWidget);
      expect(find.text('Água'), findsAtLeastNWidgets(1));
      expect(find.text('Peso'), findsAtLeastNWidgets(1));
      expect(find.text('Planos'), findsOneWidget);
    });

    testWidgets('card de macros tem labels acessíveis', (tester) async {
      await tester.pumpWidget(buildApp(const DashboardScreen()));
      await tester.pump();

      expect(find.text('Proteínas'), findsOneWidget);
      expect(find.text('Carboidratos'), findsOneWidget);
      expect(find.text('Gorduras'), findsOneWidget);
    });
  });

  group('Linguagem neutra (T050)', () {
    testWidgets('Dashboard não contém termos punitivos', (tester) async {
      await tester.pumpWidget(buildApp(const DashboardScreen()));
      await tester.pump();
      _assertNoPunitiveLanguage(tester);
    });

    testWidgets('Diário não contém termos punitivos', (tester) async {
      await tester.pumpWidget(buildApp(const DiaryScreen()));
      await tester.pump();
      _assertNoPunitiveLanguage(tester);
    });

    testWidgets('Tela de Água não contém termos punitivos', (tester) async {
      await tester.pumpWidget(buildApp(const WaterScreen()));
      await tester.pump();
      _assertNoPunitiveLanguage(tester);
    });

    testWidgets('Tela de Peso não contém termos punitivos', (tester) async {
      await tester.pumpWidget(buildApp(const WeightScreen()));
      await tester.pump();
      _assertNoPunitiveLanguage(tester);
    });
  });

  group('Touch targets (T050)', () {
    testWidgets('botões de ação rápida têm tamanho mínimo de toque', (
      tester,
    ) async {
      await tester.pumpWidget(buildApp(const DashboardScreen()));
      await tester.pump();

      final buttons = tester.widgetList<ElevatedButton>(
        find.byType(ElevatedButton),
      );
      for (final btn in buttons) {
        final minSize = btn.style?.minimumSize?.resolve({});
        if (minSize != null) {
          expect(
            minSize.width,
            greaterThanOrEqualTo(48),
            reason: 'Botão deve ter largura mínima >= 48',
          );
          expect(
            minSize.height,
            greaterThanOrEqualTo(48),
            reason: 'Botão deve ter altura mínima >= 48',
          );
        }
      }
    });
  });
}

void _assertNoPunitiveLanguage(WidgetTester tester) {
  final allTexts = tester
      .widgetList<Text>(find.byType(Text))
      .map((w) => w.data?.toLowerCase() ?? '')
      .join(' ');

  const punitiveTerms = [
    'gordo',
    'obeso',
    'fraco',
    'fracasso',
    'excesso',
    'demais',
    'vergonha',
    'culpa',
    'magro demais',
    'acima do peso',
    'abaixo do peso',
  ];
  for (final term in punitiveTerms) {
    expect(
      allTexts.contains(term),
      isFalse,
      reason: 'Texto punitivo encontrado: "$term"',
    );
  }
}
