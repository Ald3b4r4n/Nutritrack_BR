import 'package:go_router/go_router.dart';
import 'package:nutritrack_br/presentation/screens/main_shell_screen.dart';
import 'package:nutritrack_br/presentation/screens/dashboard_screen.dart';
import 'package:nutritrack_br/presentation/diary/diary_screen.dart';
import 'package:nutritrack_br/presentation/search/food_search_screen.dart';
import 'package:nutritrack_br/presentation/scanner/barcode_scanner_screen.dart';
import 'package:nutritrack_br/presentation/water/water_screen.dart';
import 'package:nutritrack_br/presentation/weight/weight_screen.dart';
import 'package:nutritrack_br/presentation/plans/meal_plan_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return MainShellScreen(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const DashboardScreen(),
          ),
          GoRoute(
            path: '/diary',
            builder: (context, state) => const DiaryScreen(),
          ),
          GoRoute(
            path: '/water',
            builder: (context, state) => const WaterScreen(),
          ),
          GoRoute(
            path: '/weight',
            builder: (context, state) => const WeightScreen(),
          ),
          GoRoute(
            path: '/plans',
            builder: (context, state) => const MealPlanScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) => const FoodSearchScreen(),
      ),
      GoRoute(
        path: '/scanner',
        builder: (context, state) => const BarcodeScannerScreen(),
      ),
    ],
  );
}
