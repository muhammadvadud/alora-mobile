import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/shared/widgets/app_snackbar.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppSnackbar Widget Testlari', () {
    testWidgets('success snackbar xabar matni bilan ko\'rsatiladi', (WidgetTester tester) async {
      await tester.pumpWidget(
        Builder(
          builder: (context) {
            return Scaffold(
              body: Builder(
                builder: (ctx) {
                  return TextButton(
                    onPressed: () {
                      AppSnackbar.show(ctx, message: 'Saqlandi');
                    },
                    child: const Text('Show'),
                  );
                },
              ),
            );
          },
        ).pumpApp(),
      );

      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();

      expect(find.text('Saqlandi'), findsOneWidget);
    });

    testWidgets('error snackbar danger rangli nuqta bilan ko\'rsatiladi', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        Builder(
          builder: (context) {
            return Scaffold(
              body: Builder(
                builder: (ctx) {
                  return TextButton(
                    onPressed: () {
                      AppSnackbar.show(ctx, message: 'Xatolik yuz berdi', isError: true);
                    },
                    child: const Text('Show'),
                  );
                },
              ),
            );
          },
        ).pumpApp(),
      );

      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();

      expect(find.text('Xatolik yuz berdi'), findsOneWidget);
    });

    testWidgets('amal tugmasi bosilganda onAction callback chaqiriladi', (
      WidgetTester tester,
    ) async {
      bool actionCalled = false;

      await tester.pumpWidget(
        Builder(
          builder: (context) {
            return Scaffold(
              body: Builder(
                builder: (ctx) {
                  return TextButton(
                    onPressed: () {
                      AppSnackbar.show(
                        ctx,
                        message: 'Saqlandi',
                        actionText: 'Qaytarish',
                        onAction: () {
                          actionCalled = true;
                        },
                      );
                    },
                    child: const Text('Show'),
                  );
                },
              ),
            );
          },
        ).pumpApp(),
      );

      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();

      expect(find.text('Qaytarish'), findsOneWidget);
      await tester.tap(find.text('Qaytarish'));
      await tester.pumpAndSettle();

      expect(actionCalled, isTrue);
    });

    testWidgets('actionText berilgan lekin onAction null bo\'lsa tugma ko\'rinmaydi', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        Builder(
          builder: (context) {
            return Scaffold(
              body: Builder(
                builder: (ctx) {
                  return TextButton(
                    onPressed: () {
                      AppSnackbar.show(ctx, message: 'Xabar', actionText: 'Tugma');
                    },
                    child: const Text('Show'),
                  );
                },
              ),
            );
          },
        ).pumpApp(),
      );

      await tester.tap(find.text('Show'));
      await tester.pumpAndSettle();

      expect(find.text('Xabar'), findsOneWidget);
      expect(find.text('Tugma'), findsNothing);
    });
  });
}
