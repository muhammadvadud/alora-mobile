import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/app/theme/app_colors.dart';
import 'package:alora_mobile/shared/widgets/limit_progress_bar.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('LimitProgressBar Widget Testlari', () {
    testWidgets('80% dan past progress accent rangda', (WidgetTester tester) async {
      await tester.pumpWidget(const LimitProgressBar(progress: 0.5).pumpApp());

      final container = tester.widget<Container>(
        find.descendant(of: find.byType(FractionallySizedBox), matching: find.byType(Container)),
      );
      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.color, AppColors.light.accent);
    });

    testWidgets('80-99% progress brass rangda', (WidgetTester tester) async {
      await tester.pumpWidget(const LimitProgressBar(progress: 0.9).pumpApp());

      final container = tester.widget<Container>(
        find.descendant(of: find.byType(FractionallySizedBox), matching: find.byType(Container)),
      );
      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.color, AppColors.light.brass);
    });

    testWidgets('100% progress danger rangda', (WidgetTester tester) async {
      await tester.pumpWidget(const LimitProgressBar(progress: 1.0).pumpApp());

      final container = tester.widget<Container>(
        find.descendant(of: find.byType(FractionallySizedBox), matching: find.byType(Container)),
      );
      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.color, AppColors.light.danger);
    });

    testWidgets('progress 1.0 dan oshsa clamp qilinadi va danger rangda', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const LimitProgressBar(progress: 1.5).pumpApp());

      final fraction = tester.widget<FractionallySizedBox>(find.byType(FractionallySizedBox));
      expect(fraction.widthFactor, 1.0);

      final container = tester.widget<Container>(
        find.descendant(of: find.byType(FractionallySizedBox), matching: find.byType(Container)),
      );
      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.color, AppColors.light.danger);
    });

    testWidgets('progress 0 dan past bo\'lsa clamp qilinadi', (WidgetTester tester) async {
      await tester.pumpWidget(const LimitProgressBar(progress: -0.5).pumpApp());

      final fraction = tester.widget<FractionallySizedBox>(find.byType(FractionallySizedBox));
      expect(fraction.widthFactor, 0.0);
    });

    testWidgets('dark rejimda ranglar dark palitradan olinadi', (WidgetTester tester) async {
      await tester.pumpWidget(
        const LimitProgressBar(progress: 0.5).pumpApp(themeMode: ThemeMode.dark),
      );

      final container = tester.widget<Container>(
        find.descendant(of: find.byType(FractionallySizedBox), matching: find.byType(Container)),
      );
      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.color, AppColors.dark.accent);
    });
  });
}
