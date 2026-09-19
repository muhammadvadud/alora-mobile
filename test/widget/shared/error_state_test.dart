import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/shared/widgets/error_state.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('ErrorState Widget Testlari', () {
    testWidgets('default sarlavha ko\'rsatiladi', (WidgetTester tester) async {
      await tester.pumpWidget(ErrorState(title: 'Xato', onAction: () {}).pumpApp());

      expect(find.text('Xato'), findsOneWidget);
    });

    testWidgets('maxsus sarlavha ko\'rsatiladi', (WidgetTester tester) async {
      await tester.pumpWidget(ErrorState(title: 'Tarmoq xatosi', onAction: () {}).pumpApp());

      expect(find.text('Tarmoq xatosi'), findsOneWidget);
    });

    testWidgets('matn ko\'rsatiladi', (WidgetTester tester) async {
      await tester.pumpWidget(
        ErrorState(message: 'Internetni tekshiring', title: 'Xato', onAction: () {}).pumpApp(),
      );

      expect(find.text('Internetni tekshiring'), findsOneWidget);
    });

    testWidgets('Qayta urinish tugmasi bosilganda onRetry chaqiriladi', (
      WidgetTester tester,
    ) async {
      bool retryCalled = false;

      await tester.pumpWidget(
        ErrorState(
          title: 'Xato',
          onAction: () {
            retryCalled = true;
          },
        ).pumpApp(),
      );

      await tester.tap(find.text('Qayta urinish'));
      await tester.pump();

      expect(retryCalled, isTrue);
    });

    testWidgets('xatolik ikonkasi ko\'rsatiladi', (WidgetTester tester) async {
      await tester.pumpWidget(ErrorState(title: 'Xato', onAction: () {}).pumpApp());

      expect(find.byType(Icon), findsWidgets);
    });
  });
}
