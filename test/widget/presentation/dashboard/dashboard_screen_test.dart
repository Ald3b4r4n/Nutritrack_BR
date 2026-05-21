import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutritrack_br/application/providers/dashboard_provider.dart';
import 'package:nutritrack_br/presentation/screens/dashboard_screen.dart';

void main() {
  DashboardSummary makeSummary({
    double consumedCalories = 800,
    double targetCalories = 2000,
    double consumedProtein = 60,
    double consumedCarbs = 120,
    double consumedFat = 30,
    int consumedWaterMl = 1200,
    int targetWaterMl = 2000,
    double? currentWeightKg = 75.5,
  }) => DashboardSummary(
    consumedCalories: consumedCalories,
    targetCalories: targetCalories,
    consumedProtein: consumedProtein,
    consumedCarbs: consumedCarbs,
    consumedFat: consumedFat,
    consumedWaterMl: consumedWaterMl,
    targetWaterMl: targetWaterMl,
    currentWeightKg: currentWeightKg,
  );

  ProviderContainer makeContainer({DashboardSummary? summary}) {
    final today = DateTime.now();
    final dateKey = DateTime(today.year, today.month, today.day);
    return ProviderContainer(
      overrides: [
        dashboardSummaryProvider(
          dateKey,
        ).overrideWith((ref) async => summary ?? makeSummary()),
      ],
    );
  }

  Widget buildApp({DashboardSummary? summary}) {
    final container = makeContainer(summary: summary);
    return UncontrolledProviderScope(
      container: container,
      child: const MaterialApp(home: DashboardScreen()),
    );
  }

  group('DashboardScreen (T048)', () {
    testWidgets('exibe título NutriTrack BR', (tester) async {
      await tester.pumpWidget(buildApp());
      await tester.pump();
      expect(find.text('NutriTrack BR'), findsOneWidget);
    });

    testWidgets('exibe seção Calorias do Dia com valores reais', (
      tester,
    ) async {
      await tester.pumpWidget(buildApp());
      await tester.pump();
      expect(find.text('Calorias do Dia'), findsOneWidget);
      expect(find.text('800'), findsOneWidget);
      expect(find.text('/ 2000 kcal'), findsOneWidget);
    });

    testWidgets('exibe progresso de macros (P, C, G)', (tester) async {
      await tester.pumpWidget(buildApp());
      await tester.pump();
      // Macros labels
      expect(find.text('Proteínas'), findsOneWidget);
      expect(find.text('Carboidratos'), findsOneWidget);
      expect(find.text('Gorduras'), findsOneWidget);
    });

    testWidgets('exibe card de Água com progresso', (tester) async {
      await tester.pumpWidget(buildApp());
      await tester.pump();
      expect(find.text('Água'), findsAtLeastNWidgets(1));
      expect(find.text('1200 / 2000 ml'), findsOneWidget);
    });

    testWidgets('exibe card de Peso Atual', (tester) async {
      await tester.pumpWidget(buildApp());
      await tester.pump();
      expect(find.text('Peso Atual'), findsOneWidget);
      expect(find.text('75.5 kg'), findsOneWidget);
    });

    testWidgets('exibe N/A quando peso é nulo', (tester) async {
      await tester.pumpWidget(
        buildApp(summary: makeSummary(currentWeightKg: null)),
      );
      await tester.pump();
      expect(find.text('Sem registro'), findsOneWidget);
    });

    testWidgets('exibe seção Ações Rápidas com 3 botões', (tester) async {
      await tester.pumpWidget(buildApp());
      await tester.pump();
      expect(find.text('Ações Rápidas'), findsOneWidget);
      expect(find.text('Refeição'), findsOneWidget);
      expect(find.text('Água'), findsAtLeastNWidgets(1));
      expect(find.text('Peso'), findsAtLeastNWidgets(1));
    });

    testWidgets('não contém linguagem punitiva', (tester) async {
      await tester.pumpWidget(buildApp());
      await tester.pump();

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
      ];
      for (final term in punitiveTerms) {
        expect(
          allTexts.contains(term),
          isFalse,
          reason: 'Texto punitivo encontrado: $term',
        );
      }
    });

    testWidgets('botões de ação rápida possuem Semantics label', (
      tester,
    ) async {
      await tester.pumpWidget(buildApp());
      await tester.pump();

      // Quick action buttons should have semantic labels via tooltip or Semantics
      final refeicaoBtn = find.widgetWithText(ElevatedButton, 'Refeição');
      expect(refeicaoBtn, findsOneWidget);

      // ElevatedButton.icon already contains icon+text, providing text label
      final aguaBtn = find.widgetWithText(ElevatedButton, 'Água');
      expect(aguaBtn, findsAtLeastNWidgets(1));

      final pesoBtn = find.widgetWithText(ElevatedButton, 'Peso');
      expect(pesoBtn, findsAtLeastNWidgets(1));
    });

    testWidgets('CircularProgressIndicator exibido para calorias', (
      tester,
    ) async {
      await tester.pumpWidget(buildApp());
      await tester.pump();
      expect(find.byType(CircularProgressIndicator), findsAtLeastNWidgets(1));
    });
  });

  group('DashboardSummary', () {
    test('instancia com macros e valores neutros', () {
      final summary = makeSummary();
      expect(summary.consumedCalories, 800);
      expect(summary.consumedProtein, 60);
      expect(summary.consumedCarbs, 120);
      expect(summary.consumedFat, 30);
      expect(summary.consumedWaterMl, 1200);
      expect(summary.currentWeightKg, 75.5);
    });
  });
}
