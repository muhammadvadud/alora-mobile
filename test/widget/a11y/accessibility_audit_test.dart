import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'package:alora_mobile/features/chat/presentation/widgets/chat_input_panel.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/shared/models/price_unit.dart';
import 'package:alora_mobile/shared/models/product_card_data.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_chip.dart';
import 'package:alora_mobile/shared/widgets/app_tab_bar.dart';
import 'package:alora_mobile/shared/widgets/product_card.dart';

import '../../helpers/pump_app.dart';

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  for (final themeMode in [ThemeMode.light, ThemeMode.dark]) {
    final themeLabel = themeMode == ThemeMode.light ? "yorug'" : "qorong'i";

    group('19.8 a11y — $themeLabel', () {
      testWidgets('AppButton Semantics label mavjud', (tester) async {
        final handle = tester.ensureSemantics();

        await tester.pumpWidget(
          const AppButton(
            text: 'Tasdiqlash',
            onPressed: _noop,
          ).pumpApp(themeMode: themeMode),
        );

        final node = tester.getSemantics(find.text('Tasdiqlash'));
        expect(node.label, contains('Tasdiqlash'));
        handle.dispose();
      });

      testWidgets('AppChip Semantics / tap target audit', (tester) async {
        final handle = tester.ensureSemantics();

        await tester.pumpWidget(
          const AppChip(
            label: 'Mehmonxona',
            onTap: _noop,
          ).pumpApp(themeMode: themeMode),
        );

        expect(tester, meetsGuideline(labeledTapTargetGuideline));
        expect(tester, meetsGuideline(androidTapTargetGuideline));
        handle.dispose();
      });

      testWidgets('AppTabBar Semantics / tap target audit', (tester) async {
        final handle = tester.ensureSemantics();

        await tester.pumpWidget(
          AppTabBar(
            currentIndex: 0,
            onTap: (_) {},
            items: const [
              AppTabBarItem(
                icon: AppIcons.chat,
                activeIcon: AppIcons.chat,
                label: 'Chat',
              ),
              AppTabBarItem(
                icon: AppIcons.orders,
                activeIcon: AppIcons.orders,
                label: 'Buyurtmalar',
              ),
            ],
          ).pumpApp(themeMode: themeMode),
        );

        expect(tester, meetsGuideline(labeledTapTargetGuideline));
        expect(tester, meetsGuideline(androidTapTargetGuideline));
        handle.dispose();
      });

      testWidgets('ChatInputPanel yuborish/mikrofon audit', (tester) async {
        final handle = tester.ensureSemantics();

        await tester.pumpWidget(
          ChatInputPanel(
            onSend: (_) {},
            onMicPressed: _noop,
            onAddPressed: _noop,
          ).pumpApp(themeMode: themeMode),
        );

        expect(tester, meetsGuideline(labeledTapTargetGuideline));
        expect(tester, meetsGuideline(androidTapTargetGuideline));
        handle.dispose();
      });

      testWidgets('ProductCard Semantics / tap target audit', (tester) async {
        final handle = tester.ensureSemantics();

        await tester.pumpWidget(
          const ProductCard(
            data: ProductCardData(
              id: 'p1',
              name: 'Belgiya parda',
              price: 120000,
              priceUnit: PriceUnit.perSqm,
              colorHex: '#0E5751',
              colorName: 'Zumrad',
              imageUrl: '',
            ),
            isCarousel: true,
            onTap: _noop,
          ).pumpApp(themeMode: themeMode),
        );

        expect(tester, meetsGuideline(labeledTapTargetGuideline));
        expect(tester, meetsGuideline(androidTapTargetGuideline));
        handle.dispose();
      });

      testWidgets('Matn kontrasti (textContrastGuideline) audit', (
        tester,
      ) async {
        final handle = tester.ensureSemantics();

        await tester.pumpWidget(
          const Column(
            children: [
              AppButton(text: 'Asosiy tugma', onPressed: _noop),
              SizedBox(height: 16),
              AppChip(label: 'Chip matni', onTap: _noop),
            ],
          ).pumpApp(themeMode: themeMode),
        );

        expect(tester, meetsGuideline(textContrastGuideline));
        handle.dispose();
      });

      testWidgets('AppButton minimal balandlik audit (≥48 dp)', (tester) async {
        await tester.pumpWidget(
          const AppButton(
            text: 'Tasdiqlash',
            onPressed: _noop,
          ).pumpApp(themeMode: themeMode),
        );

        final box = tester.getSize(find.byType(AppButton));
        expect(box.height, greaterThanOrEqualTo(48.0));
      });
    });
  }
}

void _noop() {}
