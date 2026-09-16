import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/shared/widgets/phone_field.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('PhoneField Widget Tests', () {
    testWidgets('PhoneField ni to\'g\'ri formatda to\'ldirish', (
      WidgetTester tester,
    ) async {
      String typedValue = '';
      await tester.pumpWidget(
        PhoneField(
          onChanged: (val) {
            typedValue = val;
          },
        ).pumpApp(),
      );

      expect(find.byType(TextField), findsOneWidget);

      await tester.enterText(find.byType(TextField), '901234567');
      await tester.pump();

      expect(typedValue, '+998 90 123 45 67');
      expect(find.text('+998 90 123 45 67'), findsOneWidget);
    });

    testWidgets('PhoneField validation xatosi bilan', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const PhoneField(errorText: 'Telefon raqam xato').pumpApp(),
      );

      expect(find.text('Telefon raqam xato'), findsOneWidget);
    });

    testWidgets('PhoneField disabled holatda', (WidgetTester tester) async {
      await tester.pumpWidget(const PhoneField(isEnabled: false).pumpApp());

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.enabled, isFalse);
    });
  });
}
