import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppButton Widget Tests', () {
    testWidgets('AppButton normal holatda bosiladi', (WidgetTester tester) async {
      bool isPressed = false;
      await tester.pumpWidget(
        AppButton(
          text: 'Saqlash',
          onPressed: () {
            isPressed = true;
          },
        ).pumpApp(),
      );

      expect(find.text('Saqlash'), findsOneWidget);
      await tester.tap(find.byType(AppButton));
      await tester.pump();

      expect(isPressed, isTrue);
    });

    testWidgets('AppButton disabled holatda bosilmaydi', (WidgetTester tester) async {
      bool isPressed = false;
      await tester.pumpWidget(
        AppButton(
          text: 'Saqlash',
          isEnabled: false,
          onPressed: () {
            isPressed = true;
          },
        ).pumpApp(),
      );

      await tester.tap(find.byType(AppButton));
      await tester.pump();

      expect(isPressed, isFalse);
    });

    testWidgets('AppButton loading holatda CircularProgressIndicator korsatiladi va bosilmaydi', (
      WidgetTester tester,
    ) async {
      bool isPressed = false;
      await tester.pumpWidget(
        AppButton(
          text: 'Saqlash',
          isLoading: true,
          onPressed: () {
            isPressed = true;
          },
        ).pumpApp(),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.tap(find.byType(AppButton));
      await tester.pump();

      expect(isPressed, isFalse);
    });

    testWidgets('AppButton secondary varianti tekshiriladi', (WidgetTester tester) async {
      await tester.pumpWidget(const AppButton.secondary(text: 'Bekor qilish').pumpApp());

      expect(find.text('Bekor qilish'), findsOneWidget);
    });

    testWidgets('AppButton text varianti tekshiriladi', (WidgetTester tester) async {
      await tester.pumpWidget(const AppButton.text(text: 'Tozalash').pumpApp());

      expect(find.text('Tozalash'), findsOneWidget);
    });

    testWidgets('AppButton destructive varianti tekshiriladi', (WidgetTester tester) async {
      await tester.pumpWidget(const AppButton.destructive(text: 'O\'chirish').pumpApp());

      expect(find.text('O\'chirish'), findsOneWidget);
    });
  });
}
