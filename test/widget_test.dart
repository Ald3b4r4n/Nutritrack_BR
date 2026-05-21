import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutritrack_br/application/providers/dashboard_provider.dart';
import 'package:nutritrack_br/core/routes/app_router.dart';
import 'package:nutritrack_br/core/theme/app_theme.dart';

void main() {
  testWidgets('App smoke test - Dashboard real abre sem crash', (tester) async {
    final today = DateTime.now();
    final dateKey = DateTime(today.year, today.month, today.day);

    final container = ProviderContainer(
      overrides: [
        dashboardSummaryProvider(dateKey).overrideWith(
          (ref) async => DashboardSummary(
            consumedCalories: 0,
            targetCalories: 2000,
            consumedProtein: 0,
            consumedCarbs: 0,
            consumedFat: 0,
            consumedWaterMl: 0,
            targetWaterMl: 2000,
          ),
        ),
      ],
    );
    addTearDown(container.dispose);

    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );

    await tester.pump();

    // Verifica que o app renderizou sem crash e mostra o título principal
    expect(find.text('NutriTrack BR'), findsOneWidget);
  });
}
