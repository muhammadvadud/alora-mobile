import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/shared/widgets/app_card.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppCard testlari', () {
    testWidgets('AppCard normal holatda ko\'rsatiladi va bosiladi', (tester) async {
      bool isTapped = false;

      await tester.pumpWidget(
        AppCard(
          isSelected: false,
          onTap: () {
            isTapped = true;
          },
          child: const Text('Karta matni'),
        ).pumpApp(),
      );

      expect(find.text('Karta matni'), findsOneWidget);

      await tester.tap(find.byType(AppCard));
      await tester.pumpAndSettle();

      expect(isTapped, true);
    });

    testWidgets('AppCard selected holatda ko\'rsatiladi', (tester) async {
      await tester.pumpWidget(
        const AppCard(isSelected: true, child: Text('Tanlangan karta')).pumpApp(),
      );

      expect(find.text('Tanlangan karta'), findsOneWidget);
    });
  });
}
