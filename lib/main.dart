import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutritrack_br/core/routes/app_router.dart';
import 'package:nutritrack_br/core/theme/app_theme.dart';
import 'package:nutritrack_br/core/utils/safe_logger.dart';
import 'package:nutritrack_br/application/providers/repository_providers.dart';
import 'package:nutritrack_br/data/daos/food_dao.dart';
import 'package:nutritrack_br/data/database/seeds.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  final db = container.read(appDatabaseProvider);

  // Seed idempotente — não duplica alimentos se já existirem.
  final foodDao = FoodDao(db);
  try {
    await FoodSeeder(foodDao).seed();
    SafeLogger.info('Seed inicial concluído');
  } catch (e) {
    SafeLogger.error('Falha no seed inicial', error: e);
  }

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const NutriTrackApp(),
    ),
  );
}

class NutriTrackApp extends StatelessWidget {
  const NutriTrackApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const NutriTrackMaterialApp();
  }
}

class NutriTrackMaterialApp extends StatelessWidget {
  const NutriTrackMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'NutriTrack BR',
      routerConfig: AppRouter.router,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR'), Locale('en')],
      locale: const Locale('pt', 'BR'),
    );
  }
}
