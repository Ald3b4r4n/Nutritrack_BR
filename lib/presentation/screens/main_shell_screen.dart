import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Shell de navegação principal com NavigationBar Material 3.
/// Cada destino possui ícone + label textual (acessibilidade: ícones não são
/// o único meio de transmitir informação).
class MainShellScreen extends StatelessWidget {
  final Widget child;

  const MainShellScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _calculateSelectedIndex(context),
        onDestinationSelected: (int idx) => _onItemTapped(idx, context),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Resumo',
            tooltip: 'Painel de resumo do dia',
          ),
          NavigationDestination(
            icon: Icon(Icons.book_outlined),
            selectedIcon: Icon(Icons.book),
            label: 'Diário',
            tooltip: 'Diário alimentar',
          ),
          NavigationDestination(
            icon: Icon(Icons.water_drop_outlined),
            selectedIcon: Icon(Icons.water_drop),
            label: 'Água',
            tooltip: 'Registro de hidratação',
          ),
          NavigationDestination(
            icon: Icon(Icons.monitor_weight_outlined),
            selectedIcon: Icon(Icons.monitor_weight),
            label: 'Peso',
            tooltip: 'Acompanhamento de peso',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            selectedIcon: Icon(Icons.calendar_month),
            label: 'Planos',
            tooltip: 'Planos alimentares',
          ),
        ],
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/diary')) return 1;
    if (location.startsWith('/water')) return 2;
    if (location.startsWith('/weight')) return 3;
    if (location.startsWith('/plans')) return 4;
    return 0; // Dashboard
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/diary');
        break;
      case 2:
        context.go('/water');
        break;
      case 3:
        context.go('/weight');
        break;
      case 4:
        context.go('/plans');
        break;
    }
  }
}
