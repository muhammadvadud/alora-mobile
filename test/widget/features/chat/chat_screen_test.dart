import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/core/sse/sse_event.dart';
import 'package:alora_mobile/features/chat/domain/entities/message.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/chat_empty_view.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/message_bubble.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/options_card.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/order_draft_card.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/product_carousel.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/quote_card.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/tool_chip_block.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_chip.dart';
import 'package:alora_mobile/shared/widgets/limit_exceeded_view.dart';
import 'package:alora_mobile/shared/widgets/offline_banner.dart';
import 'package:alora_mobile/shared/widgets/product_card.dart';

import '../../../helpers/chat/chat_test_helpers.dart';

void main() {
  late MockChatRepository repo;
  late AppLocalizations l10n;

  setUpAll(() async {
    await loadAppFonts();
  });

  setUp(() {
    repo = MockChatRepository();
    l10n = lookupAppLocalizations(testLocale);
  });

  Future<void> pumpChat(WidgetTester tester) async {
    await tester.pumpWidget(chatApp(repo));
    await tester.pump();
  }

  group('ChatScreen — bo\'sh holat', () {
    testWidgets('Boshlang\'ich holatda 6 ta boshlang\'ich chip ko\'rsatiladi', (
      tester,
    ) async {
      stubGetMessages(repo, []);
      await pumpChat(tester);

      expect(find.text(l10n.chat_emptyTitle), findsOneWidget);
      expect(find.byType(ChatEmptyView), findsOneWidget);

      final chips = [
        l10n.chat_start_livingRoom,
        l10n.chat_start_bedroom,
        l10n.chat_start_couple,
        l10n.chat_start_kitchen,
        l10n.chat_start_kids,
        l10n.chat_start_office,
      ];
      for (final chip in chips) {
        expect(find.text(chip), findsOneWidget);
      }
      expect(find.byType(AppChip), findsNWidgets(6));
    });

    testWidgets('Chip bosilsa ship matni sendMessage\'ga yuboriladi', (
      tester,
    ) async {
      stubGetMessages(repo, []);

      when(
        () => repo.sendMessage(
          any(),
          any(),
          any(),
          any(),
          any(),
          cancelToken: any(named: 'cancelToken'),
        ),
      ).thenAnswer((_) => const Stream<SseEvent>.empty());

      await pumpChat(tester);

      await tester.tap(find.text(l10n.chat_start_livingRoom));
      await tester.pump();

      verify(
        () => repo.sendMessage(
          'conv-1',
          l10n.chat_start_livingRoom,
          'uz',
          false,
          null,
          cancelToken: any(named: 'cancelToken'),
        ),
      ).called(1);
    });
  });

  group('ChatScreen — xabarlar', () {
    testWidgets('Foydalanuvchi xabari o\'ngga hizalangan pufakda chiqadi', (
      tester,
    ) async {
      repo = MockChatRepository();
      stubGetMessages(repo, [userMessage()]);
      await pumpChat(tester);

      await tester.pump();
      expect(find.byType(UserBubble), findsOneWidget);

      final align = tester.widget<Align>(
        find
            .ancestor(of: find.text('Mehmonxona'), matching: find.byType(Align))
            .first,
      );
      expect(align.alignment, Alignment.centerRight);
    });

    testWidgets('Assistent matni chap tomonda ko\'rsatiladi', (tester) async {
      stubGetMessages(repo, [
        assistantMessage(content: 'Salom, qanday yordam kerak?'),
      ]);
      await pumpChat(tester);

      await tester.pump();
      expect(find.text('Salom, qanday yordam kerak?'), findsOneWidget);
      expect(find.byType(AssistantMessageView), findsOneWidget);
    });
  });

  group('ChatScreen — rich bloklar', () {
    testWidgets('ToolChip running/done holatlarini ko\'rsatadi', (
      tester,
    ) async {
      stubGetMessages(repo, [
        assistantMessage(
          richBlocks: const [
            RichBlock.toolChip(
              tool: 'product_search',
              state: ToolChipState.running,
            ),
            RichBlock.toolChip(
              tool: 'curtain_calculate',
              state: ToolChipState.done,
              resultText: 'Hisoblab bo\'lindi',
            ),
          ],
        ),
      ]);
      await pumpChat(tester);

      await tester.pump();
      expect(find.byType(ToolChipBlockView), findsNWidgets(2));
      expect(find.text('Mahsulot qidirilmoqda…'), findsOneWidget);
      expect(find.text('Hisoblab bo\'lindi'), findsOneWidget);
    });

    testWidgets('ProductCarousel 180px kenglikdagi kartalarni ko\'rsatadi', (
      tester,
    ) async {
      stubGetMessages(repo, [
        assistantMessage(
          richBlocks: [RichBlock.products(products: productsFixture())],
        ),
      ]);
      await pumpChat(tester);

      await tester.pump();
      expect(find.byType(ProductCarousel), findsOneWidget);
      expect(find.byType(ProductCard), findsNWidgets(2));

      final sized = find.byWidgetPredicate(
        (w) => w is SizedBox && w.width == 180,
      );
      expect(sized, findsNWidgets(2));
    });

    testWidgets(
      'QuoteCard 3 ta bo\'lim, bo\'sh qoldiq va formula ko\'rsatadi',
      (tester) async {
        stubGetMessages(repo, [
          assistantMessage(
            richBlocks: [RichBlock.quote(quote: quoteFixture())],
          ),
        ]);
        await pumpChat(tester);

        await tester.pump();
        expect(find.byType(QuoteCardView), findsOneWidget);

        expect(find.text('MATOLAR'), findsOneWidget);
        expect(find.text('BEZAKLAR'), findsOneWidget);
        expect(find.text('XIZMATLAR'), findsOneWidget);

        expect(find.text('Kesim ortigcha chiqadi'), findsOneWidget);

        expect(find.text('Qanday hisoblandi?'), findsOneWidget);
        expect(find.text('Yana 4 ta bo\'lak'), findsOneWidget);

        expect(find.text('JAMI'), findsOneWidget);
      },
    );

    testWidgets('"Yana N ta bo\'lak" bosilsa barcha matolar ko\'rinadi', (
      tester,
    ) async {
      stubGetMessages(repo, [
        assistantMessage(
          richBlocks: [RichBlock.quote(quote: quoteFixture(fabricCount: 8))],
        ),
      ]);
      await pumpChat(tester);

      await tester.pump();

      final moreButton = find.text('Yana 4 ta bo\'lak');
      expect(moreButton, findsOneWidget);

      await tester.ensureVisible(moreButton);
      await tester.pump();
      await tester.tap(moreButton);
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('Yana 4 ta bo\'lak'), findsNothing);
      for (var i = 0; i < 8; i++) {
        expect(find.text('Mato rangi $i'), findsOneWidget);
      }
    });

    testWidgets('Formula bosilsa hisoblash formulasi ochiladi', (tester) async {
      stubGetMessages(repo, [
        assistantMessage(
          richBlocks: [RichBlock.quote(quote: quoteFixture(fabricCount: 1))],
        ),
      ]);
      await pumpChat(tester);

      await tester.pump();
      final formulaTile = find.text('Qanday hisoblandi?');
      await tester.ensureVisible(formulaTile);
      await tester.tap(formulaTile);
      await tester.pumpAndSettle();

      expect(
        find.text('2.5 m × 1.5 m × 2 × 120 000 = 900 000'),
        findsOneWidget,
      );
    });

    testWidgets('OptionsCard mid reja ko\'rsatiladi', (tester) async {
      stubGetMessages(repo, [
        assistantMessage(
          richBlocks: [RichBlock.options(options: optionsFixture())],
        ),
      ]);
      await pumpChat(tester);

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 400));

      expect(find.byType(OptionsCardView), findsOneWidget);
      expect(find.text('Tanlash'), findsWidgets);

      final pageView = tester.widget<PageView>(find.byType(PageView));
      expect(pageView.controller?.initialPage, 1);
    });

    testWidgets('OrderDraftCard yetishmayotgan maydonlarni ko\'rsatadi', (
      tester,
    ) async {
      stubGetMessages(repo, [
        assistantMessage(
          richBlocks: [RichBlock.orderDraft(draft: orderDraftFixture())],
        ),
      ]);
      await pumpChat(tester);

      await tester.pump();
      expect(find.byType(OrderDraftCardView), findsOneWidget);

      expect(find.text('Telefon raqam'), findsOneWidget);
      expect(find.text('Manzil'), findsOneWidget);

      final createButton = find.widgetWithText(AppButton, 'Buyurtma yaratish');
      expect(createButton, findsOneWidget);
      final button = tester.widget<AppButton>(createButton);
      expect(button.onPressed, isNull);
    });
  });

  group('ChatScreen — xatolik holatlari', () {
    testWidgets('Xatolik banneri va "Qayta urinish" tugmasi ko\'rsatiladi', (
      tester,
    ) async {
      repo = MockChatRepository();
      stubGetMessages(repo, [], error: Exception('Tarmoq xatosi'));
      when(
        () => repo.sendMessage(
          any(),
          any(),
          any(),
          any(),
          any(),
          cancelToken: any(named: 'cancelToken'),
        ),
      ).thenAnswer((_) => const Stream<SseEvent>.empty());
      await pumpChat(tester);

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.textContaining('Tarmoq xatosi'), findsOneWidget);
      expect(find.text('Qayta yuborish'), findsOneWidget);

      await tester.tap(find.text('Qayta yuborish'));
      await tester.pump();
      verify(
        () => repo.sendMessage(
          'conv-1',
          'Retry',
          any(),
          any(),
          any(),
          cancelToken: any(named: 'cancelToken'),
        ),
      ).called(1);
    });

    testWidgets('429 xatosi LimitExceededView ko\'rsatadi', (tester) async {
      repo = MockChatRepository();
      stubGetMessages(repo, [], error: Exception('429 limit exceeded'));
      await pumpChat(tester);

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byType(LimitExceededView), findsOneWidget);
      expect(find.text('Limit tugadi'), findsOneWidget);
    });

    testWidgets('Oflayn holatda OfflineBanner ko\'rinadi va input o\'chiq', (
      tester,
    ) async {
      repo = MockChatRepository();
      stubGetMessages(repo, []);
      await tester.pumpWidget(chatApp(repo, online: false));
      await tester.pump();

      expect(find.byType(OfflineBanner), findsOneWidget);
      expect(
        find.text('Internet yo\'q. Ulanish tiklanganda avtomatik yuboriladi'),
        findsOneWidget,
      );

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.enabled, isFalse);
    });
  });
}
