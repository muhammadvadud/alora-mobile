import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/shared/widgets/tool_chip.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('ToolChip Widget Tests', () {
    testWidgets('ToolChip running holatda tekshiriladi, bosilmaydi', (WidgetTester tester) async {
      bool isTapped = false;
      await tester.pumpWidget(
        ToolChip(
          text: 'Yuklanmoqda',
          state: ToolChipState.running,
          onTap: () {
            isTapped = true;
          },
        ).pumpApp(),
      );

      expect(find.text('Yuklanmoqda…'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.tap(find.byType(ToolChip));
      await tester.pump();
      expect(isTapped, isFalse);
    });

    testWidgets('ToolChip done holatda tekshiriladi va bosiladi', (WidgetTester tester) async {
      bool isTapped = false;
      await tester.pumpWidget(
        ToolChip(
          text: 'Bajarildi',
          state: ToolChipState.done,
          onTap: () {
            isTapped = true;
          },
        ).pumpApp(),
      );

      expect(find.text('Bajarildi'), findsOneWidget);
      expect(find.byIcon(AppIcons.chevronRight), findsOneWidget);

      await tester.tap(find.byType(ToolChip));
      await tester.pump();
      expect(isTapped, isTrue);
    });

    testWidgets('ToolChip error holatda tekshiriladi', (WidgetTester tester) async {
      await tester.pumpWidget(
        const ToolChip(text: 'Xatolik', state: ToolChipState.error).pumpApp(),
      );

      expect(find.text('Xatolik'), findsOneWidget);
      expect(find.byIcon(AppIcons.chevronRight), findsOneWidget);
    });
  });
}
