import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/app/theme/app_colors.dart';
import 'package:alora_mobile/shared/widgets/offline_banner.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('OfflineBanner Widget Testlari', () {
    testWidgets('internet yo\'q matni ko\'rsatiladi', (WidgetTester tester) async {
      await tester.pumpWidget(const OfflineBanner().pumpApp());

      expect(find.text('Internet yo\'q. Ulanish tiklanganda avtomatik yuboriladi'), findsOneWidget);
    });

    testWidgets('yuqoridan to\'liq eni bo\'ylab cho\'ziladi', (WidgetTester tester) async {
      await tester.pumpWidget(const OfflineBanner().pumpApp());

      final size = tester.getSize(find.byType(OfflineBanner));
      final screenW = tester.view.physicalSize.width / tester.view.devicePixelRatio;
      expect(size.width, screenW);
    });

    testWidgets('surfaceMuted fon va textSecondary matn rangi ishlatiladi (SPEC v2)', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const OfflineBanner().pumpApp());

      final container = tester.widget<Container>(find.byType(Container).first);
      expect(container.color, AppColors.light.surfaceMuted);

      final textWidget = tester.widget<Text>(find.byType(Text).first);
      expect(textWidget.style?.color, AppColors.light.textSecondary);
    });
  });
}
