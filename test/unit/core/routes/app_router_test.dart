import 'package:flutter_test/flutter_test.dart';
import 'package:nutritrack_br/core/routes/app_router.dart';
import 'package:go_router/go_router.dart';

void main() {
  test('Router should have initial route at /', () {
    final router = AppRouter.router;
    expect(
      router.configuration.routes.any(
        (route) => route is GoRoute && route.path == '/',
      ),
      isTrue,
    );
  });
}
