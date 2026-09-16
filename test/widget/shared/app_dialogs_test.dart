import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/shared/widgets/app_bottom_sheet.dart';
import 'package:alora_mobile/shared/widgets/app_dialog.dart';
import 'package:alora_mobile/shared/widgets/app_snackbar.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('Dialog, BottomSheet va Snackbar testlari', () {
    testWidgets('AppBottomSheet ochiladi va matnlar ko\'rsatiladi', (
      tester,
    ) async {
      await tester.pumpWidget(
        Builder(
          builder: (context) {
            return ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) => const AppBottomSheet(
                    title: 'Oyna sarlavhasi',
                    content: Text('Oyna matni'),
                  ),
                );
              },
              child: const Text('Ochish'),
            );
          },
        ).pumpApp(),
      );

      await tester.tap(find.text('Ochish'));
      await tester.pumpAndSettle();

      expect(find.text('Oyna sarlavhasi'), findsOneWidget);
      expect(find.text('Oyna matni'), findsOneWidget);
    });

    testWidgets('AppDialog ochiladi va tugmalar ishlaydi', (tester) async {
      bool isPrimaryTapped = false;
      bool isSecondaryTapped = false;

      await tester.pumpWidget(
        Builder(
          builder: (context) {
            return ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AppDialog(
                    title: 'Tasdiqlash',
                    content: 'Haqiqatan ham o\'chirmoqchimisiz?',
                    primaryActionText: 'Ha',
                    onPrimaryAction: () {
                      isPrimaryTapped = true;
                      Navigator.of(context).pop();
                    },
                    secondaryActionText: 'Yo\'q',
                    onSecondaryAction: () {
                      isSecondaryTapped = true;
                      Navigator.of(context).pop();
                    },
                    isDestructive: true,
                  ),
                );
              },
              child: const Text('Ochish'),
            );
          },
        ).pumpApp(),
      );

      await tester.tap(find.text('Ochish'));
      await tester.pumpAndSettle();

      expect(find.text('Tasdiqlash'), findsOneWidget);
      expect(find.text('Haqiqatan ham o\'chirmoqchimisiz?'), findsOneWidget);

      await tester.tap(find.text('Ha'));
      await tester.pumpAndSettle();

      expect(isPrimaryTapped, true);
    });

    testWidgets('AppSnackbar ochiladi va harakat tugmasi ishlaydi', (
      tester,
    ) async {
      bool isActionTapped = false;

      await tester.pumpWidget(
        Builder(
          builder: (context) {
            return ElevatedButton(
              onPressed: () {
                AppSnackbar.show(
                  context,
                  message: 'Xatolik yuz berdi',
                  isError: true,
                  actionText: 'Qayta urinish',
                  onAction: () {
                    isActionTapped = true;
                  },
                );
              },
              child: const Text('Ochish'),
            );
          },
        ).pumpApp(),
      );

      await tester.tap(find.text('Ochish'));
      await tester.pumpAndSettle();

      expect(find.text('Xatolik yuz berdi'), findsOneWidget);

      await tester.tap(find.text('Qayta urinish'));
      await tester.pumpAndSettle();

      expect(isActionTapped, true);
    });
  });
}
