import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/shared/models/price_unit.dart';
import 'package:alora_mobile/shared/widgets/unit_text.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('UnitText Widget Testlari', () {
    testWidgets('perSqm uchun so\'m/m² ko\'rsatiladi', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const UnitText(amount: 2748000, unit: PriceUnit.perSqm).pumpApp(),
      );

      expect(find.text('2 748 000'), findsOneWidget);
      expect(find.text(' so\'m/m²'), findsOneWidget);
    });

    testWidgets('perPiece uchun so\'m/dona ko\'rsatiladi', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const UnitText(amount: 50000, unit: PriceUnit.perPiece).pumpApp(),
      );

      expect(find.text('50 000'), findsOneWidget);
      expect(find.text(' so\'m/dona'), findsOneWidget);
    });

    testWidgets('perMeter uchun so\'m/m ko\'rsatiladi', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const UnitText(amount: 15000, unit: PriceUnit.perMeter).pumpApp(),
      );

      expect(find.text('15 000'), findsOneWidget);
      expect(find.text(' so\'m/m'), findsOneWidget);
    });

    testWidgets('unknown birlik uchun bo\'sh suffix ko\'rsatiladi', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const UnitText(amount: 1000, unit: PriceUnit.unknown).pumpApp(),
      );

      expect(find.text('1 000'), findsOneWidget);
      expect(find.text(' '), findsOneWidget);
    });

    testWidgets('maxsus style ko\'rsatiladi', (WidgetTester tester) async {
      await tester.pumpWidget(
        const UnitText(
          amount: 1200,
          unit: PriceUnit.perSqm,
          style: TextStyle(fontFamily: 'Inherit', fontSize: 20),
        ).pumpApp(),
      );

      expect(find.text('1 200'), findsOneWidget);
    });
  });
}
