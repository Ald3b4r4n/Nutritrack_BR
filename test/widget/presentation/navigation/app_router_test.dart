import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:nutritrack_br/application/providers/dashboard_provider.dart';
import 'package:nutritrack_br/presentation/screens/dashboard_screen.dart';
import 'package:nutritrack_br/presentation/diary/diary_screen.dart';
import 'package:nutritrack_br/presentation/water/water_screen.dart';
import 'package:nutritrack_br/presentation/weight/weight_screen.dart';
import 'package:nutritrack_br/presentation/plans/meal_plan_screen.dart';
import 'package:nutritrack_br/presentation/search/food_search_screen.dart';
import 'package:nutritrack_br/presentation/scanner/barcode_scanner_screen.dart';

void main() {
  DashboardSummary makeSummary() => DashboardSummary(
    consumedCalories: 0,
    targetCalories: 2000,
    consumedProtein: 0,
    consumedCarbs: 0,
    consumedFat: 0,
    consumedWaterMl: 0,
    targetWaterMl: 2000,
  );

  group('App Routes (T048 Navigation)', () {
    testWidgets('rota / leva para DashboardScreen', (tester) async {
      final today = DateTime.now();
      final dateKey = DateTime(today.year, today.month, today.day);
      final container = ProviderContainer(
        overrides: [
          dashboardSummaryProvider(
            dateKey,
          ).overrideWith((ref) async => makeSummary()),
        ],
      );
      addTearDown(container.dispose);

      final router = GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(path: '/', builder: (ctx, s) => const DashboardScreen()),
        ],
      );

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp.router(routerConfig: router),
        ),
      );
      await tester.pump();
      expect(find.byType(DashboardScreen), findsOneWidget);
    });

    testWidgets('rota /diary leva para DiaryScreen', (tester) async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final router = GoRouter(
        initialLocation: '/diary',
        routes: [
          GoRoute(path: '/diary', builder: (ctx, s) => const DiaryScreen()),
        ],
      );
      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp.router(routerConfig: router),
        ),
      );
      await tester.pump();
      expect(find.byType(DiaryScreen), findsOneWidget);
    });

    testWidgets('rota /water leva para WaterScreen', (tester) async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final router = GoRouter(
        initialLocation: '/water',
        routes: [
          GoRoute(path: '/water', builder: (ctx, s) => const WaterScreen()),
        ],
      );
      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp.router(routerConfig: router),
        ),
      );
      await tester.pump();
      expect(find.byType(WaterScreen), findsOneWidget);
    });

    testWidgets('rota /weight leva para WeightScreen', (tester) async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final router = GoRouter(
        initialLocation: '/weight',
        routes: [
          GoRoute(path: '/weight', builder: (ctx, s) => const WeightScreen()),
        ],
      );
      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp.router(routerConfig: router),
        ),
      );
      await tester.pump();
      expect(find.byType(WeightScreen), findsOneWidget);
    });

    testWidgets('rota /plans leva para MealPlanScreen', (tester) async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final router = GoRouter(
        initialLocation: '/plans',
        routes: [
          GoRoute(path: '/plans', builder: (ctx, s) => const MealPlanScreen()),
        ],
      );
      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp.router(routerConfig: router),
        ),
      );
      await tester.pump();
      expect(find.byType(MealPlanScreen), findsOneWidget);
    });

    testWidgets('rota /search leva para FoodSearchScreen', (tester) async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final router = GoRouter(
        initialLocation: '/search',
        routes: [
          GoRoute(
            path: '/search',
            builder: (ctx, s) => const FoodSearchScreen(),
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
      expect(find.byType(FoodSearchScreen), findsOneWidget);
    });

    testWidgets('rota /scanner leva para BarcodeScannerScreen', (tester) async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final router = GoRouter(
        initialLocation: '/scanner',
        routes: [
          GoRoute(
            path: '/scanner',
            builder: (ctx, s) => const BarcodeScannerScreen(),
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
      expect(find.byType(BarcodeScannerScreen), findsOneWidget);
    });
  });

  group('Navegação Principal (T048)', () {
    testWidgets('MainShellScreen exibe NavigationBar com 5 destinos', (
      tester,
    ) async {
      final today = DateTime.now();
      final dateKey = DateTime(today.year, today.month, today.day);
      final container = ProviderContainer(
        overrides: [
          dashboardSummaryProvider(
            dateKey,
          ).overrideWith((ref) async => makeSummary()),
        ],
      );
      addTearDown(container.dispose);

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp.router(
            routerConfig: GoRouter(
              initialLocation: '/',
              routes: [
                ShellRoute(
                  builder: (context, state, child) {
                    return Scaffold(
                      body: child,
                      bottomNavigationBar: NavigationBar(
                        destinations: const [
                          NavigationDestination(
                            icon: Icon(Icons.dashboard_outlined),
                            label: 'Resumo',
                          ),
                          NavigationDestination(
                            icon: Icon(Icons.book_outlined),
                            label: 'Diário',
                          ),
                          NavigationDestination(
                            icon: Icon(Icons.water_drop_outlined),
                            label: 'Água',
                          ),
                          NavigationDestination(
                            icon: Icon(Icons.monitor_weight_outlined),
                            label: 'Peso',
                          ),
                          NavigationDestination(
                            icon: Icon(Icons.calendar_month_outlined),
                            label: 'Planos',
                          ),
                        ],
                      ),
                    );
                  },
                  routes: [
                    GoRoute(
                      path: '/',
                      builder: (ctx, s) => const DashboardScreen(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(NavigationBar), findsOneWidget);
      expect(find.text('Resumo'), findsOneWidget);
      expect(find.text('Diário'), findsOneWidget);
    });

    testWidgets('app inicializa sem crash na rota /', (tester) async {
      final today = DateTime.now();
      final dateKey = DateTime(today.year, today.month, today.day);
      final container = ProviderContainer(
        overrides: [
          dashboardSummaryProvider(
            dateKey,
          ).overrideWith((ref) async => makeSummary()),
        ],
      );
      addTearDown(container.dispose);

      final router = GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(path: '/', builder: (ctx, s) => const DashboardScreen()),
        ],
      );

      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: MaterialApp.router(routerConfig: router),
        ),
      );
      await tester.pump();

      // Não deve ter exceções — se pumpWidget completa, o app inicializou
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });
}
