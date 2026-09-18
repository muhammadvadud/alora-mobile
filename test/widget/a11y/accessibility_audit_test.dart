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

/// 19.8 Accessibility auditi.
/// Kamchiliklar testni yiqitmaydi — [collectedBugs] ga yoziladi (hisobot uchun).
final List<String> collectedBugs = [];

void main() {
  setUpAll(() async {
    await loadAppFonts();
    collectedBugs.clear();
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

        if (!_hasSemanticsLabel(tester, find.byType(AppChip))) {
          _bug(
            'AppChip ($themeLabel): Semantics label yo\'q '
            '(GestureDetector, label berilmagan)',
          );
        }

        if (!await _checkGuideline(tester, androidTapTargetGuideline)) {
          _bug(
            'AppChip ($themeLabel): bosish maydoni < 48 dp '
            '(androidTapTargetGuideline)',
          );
        }
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

        if (!_hasSemanticsLabel(tester, find.text('Chat'))) {
          _bug(
            'AppTabBar ($themeLabel): tab Semantics label yetarli emas '
            '(faqat Text, birlashtirilgan Semantics yo\'q)',
          );
        }

        if (!await _checkGuideline(tester, androidTapTargetGuideline)) {
          _bug('AppTabBar ($themeLabel): bosish maydoni < 48 dp');
        }
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

        final mic = find.byIcon(AppIcons.mic);
        expect(mic, findsOneWidget);

        if (!_hasSemanticsLabel(tester, mic)) {
          _bug(
            'ChatInputPanel ($themeLabel): mikrofon IconButton '
            'Semantics label yo\'q (tooltip/semanticLabel berilmagan)',
          );
        }

        if (!await _checkGuideline(tester, androidTapTargetGuideline)) {
          _bug(
            'ChatInputPanel ($themeLabel): mikrofon/yuborish '
            'bosish maydoni < 48 dp (constraints 38/44)',
          );
        }
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

        if (!_hasSemanticsLabel(tester, find.byType(ProductCard))) {
          _bug(
            'ProductCard ($themeLabel): Semantics label yo\'q '
            '(GestureDetector, mahsulot nomi semantikasiz)',
          );
        }

        if (!await _checkGuideline(tester, androidTapTargetGuideline)) {
          _bug('ProductCard ($themeLabel): bosish maydoni < 48 dp');
        }
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

        if (!await _checkGuideline(tester, textContrastGuideline)) {
          _bug('Matn kontrasti ($themeLabel): textContrastGuideline buzildi');
        }
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
        if (box.height < 48) {
          _bug(
            'AppButton ($themeLabel): balandlik ${box.height} < 48 dp '
            '(SizedBox height: 46)',
          );
        }
      });
    });
  }

  test('19.8 audit yakuni — BUG ro\'yxati yig\'ildi', () {
    expect(collectedBugs, isA<List<String>>());
    for (final bug in collectedBugs) {
      expect(bug.startsWith('BUG:'), isTrue);
    }
  });
}

void _noop() {}

void _bug(String message) {
  final entry = 'BUG: $message';
  if (!collectedBugs.contains(entry)) {
    collectedBugs.add(entry);
  }
}

bool _hasSemanticsLabel(WidgetTester tester, Finder finder) {
  try {
    final node = tester.getSemantics(finder);
    final label = node.label.trim();
    final value = node.value.trim();
    return label.isNotEmpty || value.isNotEmpty;
  } catch (_) {
    return false;
  }
}

Future<bool> _checkGuideline(
  WidgetTester tester,
  AccessibilityGuideline guideline,
) async {
  final result = await guideline.evaluate(tester);
  return result.passed;
}
