import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppTextField Widget Tests', () {
    testWidgets('AppTextField normal holatda kiritiladi', (WidgetTester tester) async {
      String changedValue = '';
      await tester.pumpWidget(
        AppTextField(
          hintText: 'Ism kiriting',
          onChanged: (val) {
            changedValue = val;
          },
        ).pumpApp(),
      );

      expect(find.text('Ism kiriting'), findsOneWidget);

      await tester.enterText(find.byType(TextField), 'Sardor');
      await tester.pump();

      expect(changedValue, 'Sardor');
    });

    testWidgets('AppTextField error holatda tekshiriladi', (WidgetTester tester) async {
      await tester.pumpWidget(const AppTextField(errorText: 'Xato kiritildi').pumpApp());

      expect(find.text('Xato kiritildi'), findsOneWidget);
    });

    testWidgets('AppTextField disabled holatda kiritish mumkin emas', (WidgetTester tester) async {
      await tester.pumpWidget(const AppTextField(isEnabled: false, hintText: 'Manzil').pumpApp());

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.enabled, isFalse);
    });

    testWidgets('AppTextField password holatida ko\'rishni o\'zgartirish', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const AppTextField(type: AppTextFieldType.password, hintText: 'Parol').pumpApp(),
      );

      final textFieldFinder = find.byType(TextField);
      TextField textField = tester.widget<TextField>(textFieldFinder);
      expect(textField.obscureText, isTrue);

      final iconFinder = find.byType(IconButton);
      expect(iconFinder, findsOneWidget);

      await tester.tap(iconFinder);
      await tester.pumpAndSettle();

      textField = tester.widget<TextField>(textFieldFinder);
      expect(textField.obscureText, isFalse);
    });

    testWidgets('AppTextField search holatida icon tekshiriladi', (WidgetTester tester) async {
      await tester.pumpWidget(
        const AppTextField(type: AppTextFieldType.search, hintText: 'Qidirish').pumpApp(),
      );

      expect(find.byIcon(AppIcons.search), findsOneWidget);
    });
  });
}
