import 'package:flutter_test/flutter_test.dart';
import 'package:nutritrack_br/core/error/failures.dart';

void main() {
  group('Failures', () {
    test('ServerFailure should hold a message', () {
      const message = 'Server error occurred';
      const failure = ServerFailure(message);
      expect(failure.message, message);
    });

    test('DatabaseFailure should hold a message', () {
      const message = 'Database error occurred';
      const failure = DatabaseFailure(message);
      expect(failure.message, message);
    });

    test('CacheFailure should hold a message', () {
      const message = 'Cache error occurred';
      const failure = CacheFailure(message);
      expect(failure.message, message);
    });
  });
}
