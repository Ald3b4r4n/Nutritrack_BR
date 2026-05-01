import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutritrack_br/presentation/widgets/primary_button.dart';
import 'package:nutritrack_br/presentation/widgets/meal_card.dart';
import 'package:nutritrack_br/presentation/widgets/empty_state_view.dart';

void main() {
  group('Base Widgets', () {
    testWidgets('PrimaryButton should render label', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PrimaryButton(label: 'Test Button', onPressed: () {}),
          ),
        ),
      );
      expect(find.text('Test Button'), findsOneWidget);
    });

    testWidgets('MealCard should render title and macros', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MealCard(
              title: 'Lunch',
              calories: '500 kcal',
              subtitle: 'Carbs: 50g | Prot: 30g | Fat: 15g',
            ),
          ),
        ),
      );
      expect(find.text('Lunch'), findsOneWidget);
      expect(find.text('500 kcal'), findsOneWidget);
    });

    testWidgets('EmptyStateView should render message', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: EmptyStateView(message: 'Nothing here')),
        ),
      );
      expect(find.text('Nothing here'), findsOneWidget);
    });
  });
}
