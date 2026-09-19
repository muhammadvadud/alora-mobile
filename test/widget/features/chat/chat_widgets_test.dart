import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'package:alora_mobile/features/chat/domain/entities/message.dart';
import 'package:alora_mobile/features/chat/domain/entities/pricing_option.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/message_bubble.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/options_card.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/order_draft_card.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/product_carousel.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/quote_card.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/tool_chip_block.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/product_card.dart';

import '../../../helpers/pump_app.dart';
import '../../../helpers/chat/chat_test_helpers.dart';

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  group('UserBubble', () {
    testWidgets('Matn o\'ng tomonda hizalanadi', (tester) async {
      await tester.pumpWidget(const UserBubble(text: 'Mehmonxona podorni').pumpApp());

      final align = tester.widget<Align>(
        find.ancestor(of: find.text('Mehmonxona podorni'), matching: find.byType(Align)),
      );
      expect(align.alignment, Alignment.centerRight);
    });
  });

  group('AssistantMessageView', () {
    testWidgets('** qalin** matnni RichText sifatida ajratadi', (tester) async {
      await tester.pumpWidget(const AssistantMessageView(text: '**Salom** dunyo').pumpApp());

      final richText = tester.widget<RichText>(find.byType(RichText));
      final text = richText.text.toPlainText();
      expect(text, 'Salom dunyo');
    });
  });

  group('ToolChipBlockView', () {
    testWidgets('running holatda chop etilmoqda belgisi va ... ko\'rinadi', (tester) async {
      await tester.pumpWidget(
        const ToolChipBlockView(tool: 'product_search', state: ToolChipState.running).pumpApp(),
      );

      expect(find.text('Mahsulot qidirilmoqda…'), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('done holatida resultText ko\'rsatiladi', (tester) async {
      await tester.pumpWidget(
        const ToolChipBlockView(
          tool: 'curtain_calculate',
          state: ToolChipState.done,
          resultText: '3 bo\'lak hisoblandi',
        ).pumpApp(),
      );

      expect(find.text('3 bo\'lak hisoblandi'), findsOneWidget);
    });

    testWidgets('done holatida resultText bo\'lmasa "Natija" ko\'rsatiladi', (tester) async {
      await tester.pumpWidget(
        const ToolChipBlockView(tool: 'curtain_calculate', state: ToolChipState.done).pumpApp(),
      );

      expect(find.text('Natija'), findsOneWidget);
    });

    testWidgets('error holatida xatolik ko\'rsatiladi', (tester) async {
      await tester.pumpWidget(
        const ToolChipBlockView(tool: 'curtain_calculate', state: ToolChipState.error).pumpApp(),
      );

      expect(find.text('Xatolik yuz berdi'), findsOneWidget);
    });
  });

  group('ProductCarousel', () {
    testWidgets('Har karta 180px kengligida ko\'rsatiladi', (tester) async {
      await tester.pumpWidget(ProductCarousel(products: productsFixture()).pumpApp());

      expect(find.byType(ProductCard), findsNWidgets(2));

      final sized = find.byWidgetPredicate((w) => w is SizedBox && w.width == 180);
      expect(sized, findsNWidgets(2));
    });
  });

  group('QuoteCardView', () {
    Widget inScroll(Widget child) {
      return SingleChildScrollView(child: child).pumpApp();
    }

    testWidgets('Uch bo\'lim, JAMI, yana N ta va ogohlantirish ko\'rsatiladi', (tester) async {
      await tester.pumpWidget(inScroll(QuoteCardView(quote: quoteFixture())));

      expect(find.text('MATOLAR'), findsOneWidget);
      expect(find.text('BEZAKLAR'), findsOneWidget);
      expect(find.text('XIZMATLAR'), findsOneWidget);
      expect(find.text('JAMI'), findsOneWidget);

      expect(find.text('Kesim ortigcha chiqadi'), findsOneWidget);
      expect(find.text('Yana 4 ta bo\'lak'), findsNWidgets(1));
    });

    testWidgets('"Yana N ta bo\'lak" bosilsa hammasi ko\'rinadi', (tester) async {
      await tester.pumpWidget(inScroll(QuoteCardView(quote: quoteFixture())));

      final moreButton = find.text('Yana 4 ta bo\'lak');
      await tester.ensureVisible(moreButton);
      await tester.tap(moreButton);
      await tester.pumpAndSettle();

      for (var i = 0; i < 8; i++) {
        expect(find.text('Mato rangi $i'), findsOneWidget);
      }
      expect(find.text('Yana 4 ta bo\'lak'), findsNothing);
    });

    testWidgets('Formula ochilganda matn chiqadi', (tester) async {
      await tester.pumpWidget(inScroll(QuoteCardView(quote: quoteFixture())));

      expect(find.text('Qanday hisoblandi?'), findsOneWidget);
      final formulaTile = find.text('Qanday hisoblandi?');
      await tester.ensureVisible(formulaTile);
      await tester.tap(formulaTile);
      await tester.pumpAndSettle();

      expect(find.text('2.5 m × 1.5 m × 2 × 120 000 = 900 000'), findsOneWidget);
    });

    testWidgets('Jami summa MoneyText bilan ko\'rsatiladi', (tester) async {
      await tester.pumpWidget(inScroll(QuoteCardView(quote: quoteFixture())));

      expect(find.text('2 140 000'), findsOneWidget);
    });

    testWidgets('onAddPart va onShowOptions chaqiriladi', (tester) async {
      var addPart = false;
      var showOptions = false;
      await tester.pumpWidget(
        inScroll(
          QuoteCardView(
            quote: quoteFixture(),
            onAddPart: () => addPart = true,
            onShowOptions: () => showOptions = true,
          ),
        ),
      );

      await tester.ensureVisible(find.text('Bo\'lak qo\'shish'));
      await tester.tap(find.text('Bo\'lak qo\'shish'));
      await tester.ensureVisible(find.text('Variantlarni ko\'rish'));
      await tester.tap(find.text('Variantlarni ko\'rish'));
      await tester.pump();

      expect(addPart, isTrue);
      expect(showOptions, isTrue);
    });
  });

  group('OptionsCardView', () {
    Finder optionTitle(String title) => find.text(title.toUpperCase());

    Finder containerWithAccentBorder() {
      const accent = Color(0xFF0E5751);
      return find.byWidgetPredicate(
        (w) =>
            w is Container &&
            w.decoration is BoxDecoration &&
            (w.decoration as BoxDecoration).border is BoxBorder &&
            ((w.decoration as BoxDecoration).border as Border?)?.top.color == accent,
      );
    }

    testWidgets('Telefonda mid reja markazda tanlangan', (tester) async {
      await tester.pumpWidget(OptionsCardView(optionsBlock: optionsFixture()).pumpApp());
      await tester.pump(const Duration(milliseconds: 400));

      final pageView = tester.widget<PageView>(find.byType(PageView));
      expect(pageView.controller?.initialPage, 1);

      final midCard = find.ancestor(of: optionTitle('O\'RTA'), matching: find.byType(Container));

      expect(containerWithAccentBorder(), findsWidgets);
      expect(
        find.descendant(of: containerWithAccentBorder(), matching: find.text('1 000 000')),
        findsWidgets,
      );
      expect(midCard, findsWidgets);
    });

    testWidgets('Tabletda barcha variantlar qatorda va mid tanlangan', (tester) async {
      tester.view.physicalSize = const Size(1024 * 3, 800 * 3);
      tester.view.devicePixelRatio = 3.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(
        OptionsCardView(optionsBlock: optionsFixture(), onSelect: (_) {}).pumpApp(),
      );

      expect(find.byType(PageView), findsNothing);
      expect(optionTitle('ARZON'), findsOneWidget);
      expect(optionTitle('O\'RTA'), findsOneWidget);
      expect(optionTitle('PREMIUM'), findsOneWidget);
      expect(containerWithAccentBorder(), findsOneWidget);
    });

    testWidgets('Tabletdagi "Tanlash" bosilganda to\'g\'ri variant uzatiladi', (tester) async {
      tester.view.physicalSize = const Size(1024 * 3, 800 * 3);
      tester.view.devicePixelRatio = 3.0;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      PricingTier? selected;
      await tester.pumpWidget(
        OptionsCardView(
          optionsBlock: optionsFixture(),
          onSelect: (o) => selected = o.tier,
        ).pumpApp(),
      );

      final midButton = find.descendant(
        of: find.ancestor(of: optionTitle('O\'RTA'), matching: find.byType(Container)).first,
        matching: find.text('Tanlash'),
      );
      await tester.ensureVisible(midButton);
      await tester.tap(midButton);
      await tester.pump();

      expect(selected, PricingTier.mid);
    });
  });

  group('OrderDraftCardView', () {
    Widget inScroll(Widget child) {
      return SingleChildScrollView(child: child).pumpApp();
    }

    testWidgets('Yetishmayotgan maydonlar va bloklangan buyurtma tugmasi', (tester) async {
      await tester.pumpWidget(inScroll(OrderDraftCardView(draft: orderDraftFixture())));

      expect(find.text('Telefon raqam'), findsOneWidget);
      expect(find.text('Manzil'), findsOneWidget);
      expect(find.text('QORALAMA'), findsOneWidget);

      final create = tester.widget<AppButton>(find.widgetWithText(AppButton, 'Buyurtma yaratish'));
      expect(create.onPressed, isNull);

      final edit = tester.widget<AppButton>(find.widgetWithText(AppButton, 'Tahrirlash'));
      expect(edit.onPressed, isNull);
    });

    testWidgets('Maydonlar to\'liq bo\'lsa onEdit va onCreate ishlaydi', (tester) async {
      var edited = false;
      var created = false;
      await tester.pumpWidget(
        inScroll(
          OrderDraftCardView(
            draft: orderDraftFixture(missingFields: const []),
            onEdit: () => edited = true,
            onCreate: () => created = true,
          ),
        ),
      );

      await tester.tap(find.text('Tahrirlash'));
      await tester.tap(find.text('Buyurtma yaratish'));
      await tester.pump();

      expect(edited, isTrue);
      expect(created, isTrue);
    });
  });
}
