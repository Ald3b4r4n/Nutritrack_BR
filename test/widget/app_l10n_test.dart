import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutritrack_br/main.dart';

void main() {
  testWidgets('T012: app deve ter delegates de localização PT-BR', (
    tester,
  ) async {
    await tester.pumpWidget(const NutriTrackApp());

    final materialApp = tester.widget<MaterialApp>(
      find.byType(MaterialApp).first,
    );

    expect(
      materialApp.localizationsDelegates,
      containsAll([
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ]),
    );

    expect(materialApp.supportedLocales, contains(const Locale('pt', 'BR')));
  });
}
