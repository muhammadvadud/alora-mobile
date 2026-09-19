import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'package:alora_mobile/features/chat/presentation/widgets/options_card.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/order_draft_card.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/product_carousel.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/quote_card.dart';

import '../../../helpers/chat/chat_test_helpers.dart';
import '../../../helpers/golden/chat_golden_devices.dart';
import '../../../helpers/golden/quote_from_calc_cases.dart';
import '../../../helpers/pump_app.dart';

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  testGoldens('S-04 mahsulot tavsiyasi karusel', (tester) async {
    await tester.pumpWidgetBuilder(
      ProductCarousel(products: productsFixture()).pumpApp(),
      surfaceSize: chatPhone.size,
    );
    await tester.pumpAndSettle();
    await screenMatchesGolden(tester, 's04_product_carousel');
  });

  testGoldens('S-05 QuoteCard — 3 guruh, Yana N, ogohlantirish', (tester) async {
    final quote = quoteFromCalcCasesMaxParts();
    expect(quote.fabrics.length, greaterThanOrEqualTo(7));
    expect(quote.accessories, isNotEmpty);
    expect(quote.services, isNotEmpty);
    expect(quote.wasteWarnings, isNotEmpty);

    await tester.pumpWidgetBuilder(
      SingleChildScrollView(child: QuoteCardView(quote: quote)).pumpApp(),
      surfaceSize: const Size(390, 1200),
    );
    await tester.pumpAndSettle();
    await screenMatchesGolden(tester, 's05_quote_card');
  });

  testGoldens("S-05 QuoteCard — qorong'i", (tester) async {
    final quote = quoteFromCalcCasesMaxParts();

    await tester.pumpWidgetBuilder(
      SingleChildScrollView(child: QuoteCardView(quote: quote)).pumpApp(themeMode: ThemeMode.dark),
      surfaceSize: const Size(390, 1200),
    );
    await tester.pumpAndSettle();
    await screenMatchesGolden(tester, 's05_quote_card_dark');
  });

  testGoldens("S-06 OptionsCard — mid tanlangan (yorug')", (tester) async {
    await tester.pumpWidgetBuilder(
      OptionsCardView(optionsBlock: optionsFixture()).pumpApp(),
      surfaceSize: chatPhone.size,
    );
    await tester.pump(const Duration(milliseconds: 400));
    await screenMatchesGolden(tester, 's06_options_card_light');
  });

  testGoldens("S-06 OptionsCard — qorong'i", (tester) async {
    await tester.pumpWidgetBuilder(
      OptionsCardView(optionsBlock: optionsFixture()).pumpApp(themeMode: ThemeMode.dark),
      surfaceSize: chatPhone.size,
    );
    await tester.pump(const Duration(milliseconds: 400));
    await screenMatchesGolden(tester, 's06_options_card_dark');
  });

  testGoldens('S-06 OptionsCard — planshet 3 ustun (1024×768)', (tester) async {
    await tester.pumpWidgetBuilder(
      OptionsCardView(optionsBlock: optionsFixture(), onSelect: (_) {}).pumpApp(),
      surfaceSize: chatTablet.size,
    );
    await tester.pumpAndSettle();
    await screenMatchesGolden(tester, 's06_options_card_tablet');
  });

  testGoldens('S-07 OrderDraftCard — yetishmayotgan maydonlar', (tester) async {
    await tester.pumpWidgetBuilder(
      SingleChildScrollView(child: OrderDraftCardView(draft: orderDraftFixture())).pumpApp(),
      surfaceSize: chatPhone.size,
    );
    await tester.pumpAndSettle();
    await screenMatchesGolden(tester, 's07_order_draft_card');
  });
}
