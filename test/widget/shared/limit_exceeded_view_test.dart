import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/shared/widgets/limit_exceeded_view.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('LimitExceededView Widget Testlari', () {
    testWidgets('limit tugagan matni ko\'rsatiladi', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const LimitExceededView().pumpApp());

      expect(find.text('Limit tugadi'), findsOneWidget);
      expect(find.byType(Icon), findsOneWidget);
    });

    testWidgets('dark rejimda ham to\'g\'ri ko\'rsatiladi', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const LimitExceededView().pumpApp(themeMode: ThemeMode.dark),
      );

      expect(find.text('Limit tugadi'), findsOneWidget);
    });
  });
}
