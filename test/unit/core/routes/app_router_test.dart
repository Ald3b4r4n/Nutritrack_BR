import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:nutritrack_br/core/routes/app_router.dart';

void main() {
  test('Router should have initial route at /', () {
    final router = AppRouter.router;
    // A rota raiz '/' está dentro do ShellRoute — verificamos via configuração recursiva
    bool hasRootRoute(List<RouteBase> routes) {
      for (final route in routes) {
        if (route is GoRoute && route.path == '/') return true;
        if (route is ShellRoute && hasRootRoute(route.routes)) return true;
        if (route is StatefulShellRoute &&
            hasRootRoute(
              route.branches.map((b) => b).expand((b) => b.routes).toList(),
            ))
          return true;
      }
      return false;
    }

    expect(hasRootRoute(router.configuration.routes), isTrue);
  });
}
