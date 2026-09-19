import 'dart:typed_data';

import 'package:flutter/material.dart';
import "package:alora_mobile/shared/widgets/suggestion_chip.dart";
import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/core/error/failure.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

import 'package:alora_mobile/shared/icons/app_icons.dart';
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
import 'package:alora_mobile/features/orders/domain/repositories/orders_repository.dart';
import 'package:alora_mobile/shared/models/payment_status.dart';
import 'package:alora_mobile/shared/models/order_status.dart';
import 'package:alora_mobile/features/orders/domain/entities/order.dart';
import 'package:alora_mobile/features/orders/application/providers.dart' as orders_providers;
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/limit_exceeded_view.dart';
import 'package:alora_mobile/shared/widgets/offline_banner.dart';
import 'package:alora_mobile/shared/widgets/product_card.dart';

import '../../../helpers/chat/chat_test_helpers.dart';

class _FakePathProvider extends PathProviderPlatform {
  @override
  Future<String?> getTemporaryPath() async => '/tmp';

  @override
  Future<String?> getApplicationSupportPath() async => '/tmp';

  @override
  Future<String?> getLibraryPath() async => '/tmp';

  @override
  Future<String?> getApplicationDocumentsPath() async => '/tmp';

  @override
  Future<String?> getExternalStoragePath() async => '/tmp';
}

class MockOrdersRepo extends Mock implements OrdersRepository {}

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
    testWidgets('Boshlang\'ich holatda 6 ta boshlang\'ich chip ko\'rsatiladi', (tester) async {
      stubGetMessages(repo, []);
      await pumpChat(tester);

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
      expect(find.byType(SuggestionChip), findsNWidgets(6));
    });

    testWidgets('Chip bosilsa ship matni sendMessage\'ga yuboriladi', (tester) async {
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
    testWidgets('Foydalanuvchi xabari o\'ngga hizalangan pufakda chiqadi', (tester) async {
      repo = MockChatRepository();
      stubGetMessages(repo, [userMessage()]);
      await pumpChat(tester);

      await tester.pump();
      expect(find.byType(UserBubble), findsOneWidget);

      final align = tester.widget<Align>(
        find.ancestor(of: find.text('Mehmonxona'), matching: find.byType(Align)).first,
      );
      expect(align.alignment, Alignment.centerRight);
    });

    testWidgets('Assistent matni chap tomonda ko\'rsatiladi', (tester) async {
      stubGetMessages(repo, [assistantMessage(content: 'Salom, qanday yordam kerak?')]);
      await pumpChat(tester);

      await tester.pump();
      expect(find.text('Salom, qanday yordam kerak?'), findsOneWidget);
      expect(find.byType(AssistantMessageView), findsOneWidget);
    });
  });

  group('ChatScreen — rich bloklar', () {
    testWidgets('ToolChip running/done holatlarini ko\'rsatadi', (tester) async {
      stubGetMessages(repo, [
        assistantMessage(
          richBlocks: const [
            RichBlock.toolChip(tool: 'product_search', state: ToolChipState.running),
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

    testWidgets('ProductCarousel 327px kenglikdagi kartalarni ko\'rsatadi', (tester) async {
      stubGetMessages(repo, [
        assistantMessage(richBlocks: [RichBlock.products(products: productsFixture())]),
      ]);
      await pumpChat(tester);

      await tester.pump();
      expect(find.byType(ProductCarousel), findsOneWidget);
      expect(find.byType(ProductCard), findsNWidgets(2));

      final sized = find.byWidgetPredicate((w) => w is SizedBox && w.width == 327);
      expect(sized, findsNWidgets(2));
    });

    testWidgets('QuoteCard 3 ta bo\'lim, bo\'sh qoldiq va formula ko\'rsatadi', (tester) async {
      stubGetMessages(repo, [
        assistantMessage(richBlocks: [RichBlock.quote(quote: quoteFixture())]),
      ]);
      await pumpChat(tester);

      await tester.pump();
      expect(find.byType(QuoteCardView), findsOneWidget);

      expect(find.text('Matolar'), findsOneWidget);
      expect(find.text('Bezaklar'), findsOneWidget);
      expect(find.text('Xizmatlar'), findsOneWidget);

      expect(find.text('Kesim ortigcha chiqadi'), findsOneWidget);

      expect(find.text('Qanday hisoblandi?'), findsOneWidget);
      expect(find.text('Yana 4 ta bo\'lak'), findsOneWidget);

      expect(find.text('Jami'), findsOneWidget);
    });

    testWidgets('"Yana N ta bo\'lak" bosilsa barcha matolar ko\'rinadi', (tester) async {
      stubGetMessages(repo, [
        assistantMessage(richBlocks: [RichBlock.quote(quote: quoteFixture(fabricCount: 8))]),
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
        assistantMessage(richBlocks: [RichBlock.quote(quote: quoteFixture(fabricCount: 1))]),
      ]);
      await pumpChat(tester);

      await tester.pump();
      final formulaTile = find.text('Qanday hisoblandi?');
      await tester.ensureVisible(formulaTile);
      await tester.tap(formulaTile);
      await tester.pumpAndSettle();

      expect(find.text('2.5 m × 1.5 m × 2 × 120 000 = 900 000'), findsOneWidget);
    });

    testWidgets('OptionsCard mid reja ko\'rsatiladi', (tester) async {
      stubGetMessages(repo, [
        assistantMessage(richBlocks: [RichBlock.options(options: optionsFixture())]),
      ]);
      await pumpChat(tester);

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 400));

      expect(find.byType(OptionsCardView), findsOneWidget);
      expect(find.text('Tanlash'), findsWidgets);
    });

    testWidgets('OrderDraftCard yetishmayotgan maydonlarni ko\'rsatadi', (tester) async {
      stubGetMessages(repo, [
        assistantMessage(richBlocks: [RichBlock.orderDraft(draft: orderDraftFixture())]),
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

    testWidgets("to'liq qoralamada 'Buyurtma yaratish' → POST orders/ (7.12)", (tester) async {
      final ordersRepo = MockOrdersRepo();
      when(() => ordersRepo.createOrder(any())).thenAnswer(
        (_) async => const Order(
          id: 'ord-1',
          number: 'ALR-2026-000001',
          status: OrderStatus.draft,
          paymentStatus: PaymentStatus.unpaid,
          total: 2140000,
        ),
      );
      stubGetMessages(repo, [
        assistantMessage(
          richBlocks: [RichBlock.orderDraft(draft: orderDraftFixture(missingFields: []))],
        ),
      ]);
      await tester.pumpWidget(
        chatApp(
          repo,
          withRouter: true,
          extraOverrides: [orders_providers.ordersRepositoryProvider.overrideWithValue(ordersRepo)],
        ),
      );
      await tester.pump();

      await tester.tap(find.widgetWithText(AppButton, 'Buyurtma yaratish'));
      await tester.pumpAndSettle();
      expect(find.text('order:ord-1'), findsOneWidget);

      final body =
          verify(() => ordersRepo.createOrder(captureAny())).captured.single
              as Map<String, dynamic>;
      expect(body['customer_name'], 'Ali Valiyev');
      expect(body['conversation_id'], 'conv-1');
    });
  });

  group('ChatScreen — xatolik holatlari', () {
    testWidgets('Xatolik banneri va "Qayta urinish" tugmasi ko\'rsatiladi', (tester) async {
      repo = MockChatRepository();
      // Repository tiplangan Failure beradi; xom Exception matni UI'ga chiqmaydi (§8.3)
      stubGetMessages(repo, [], error: const Failure.network());
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

      expect(find.textContaining('Ulanish yo\'q'), findsOneWidget);
      expect(find.text('Qayta yuborish'), findsOneWidget);

      await tester.tap(find.text('Qayta yuborish'));
      await tester.pump();
      // Tarix yuklanmagan holatda retry → getMessages qayta chaqiriladi.
      verify(() => repo.getMessages('conv-1', cursor: null)).called(2);
    });

    testWidgets('429 xatosi LimitExceededView ko\'rsatadi', (tester) async {
      repo = MockChatRepository();
      stubGetMessages(repo, [], error: const Failure.limit(''));
      await pumpChat(tester);

      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.byType(LimitExceededView), findsOneWidget);
      expect(find.text('Limit tugadi'), findsOneWidget);
    });

    testWidgets('Oflayn holatda input o\'chiq (banner shell darajasida — 17.1)', (tester) async {
      repo = MockChatRepository();
      stubGetMessages(repo, []);
      await tester.pumpWidget(chatApp(repo, online: false));
      await tester.pump();

      // Banner AppShell'da bitta marta ko'rsatiladi; ekran ichida dublikat yo'q.
      expect(find.byType(OfflineBanner), findsNothing);

      final textField = tester.widget<TextField>(find.byType(TextField));
      expect(textField.enabled, isFalse);
    });

    testWidgets('Menyuda PDF: orderId bor bo\'lsa openPdf chaqiradi', (tester) async {
      PathProviderPlatform.instance = _FakePathProvider();
      repo = MockChatRepository();
      stubGetMessages(repo, []);
      final ordersRepo = MockOrdersRepo();
      when(() => ordersRepo.getPdf('ord-9')).thenAnswer((_) async => Uint8List.fromList([1, 2, 3]));

      await tester.pumpWidget(
        chatApp(
          repo,
          extraOverrides: [
            registerConversations(['conv-1'], orderId: 'ord-9'),
            orders_providers.ordersRepositoryProvider.overrideWithValue(ordersRepo),
          ],
        ),
      );
      await tester.pump();

      await tester.tap(find.byIcon(AppIcons.more));
      await tester.pumpAndSettle();
      expect(find.text(l10n.chat_menuPdf), findsOneWidget);

      await tester.tap(find.text(l10n.chat_menuPdf));
      await tester.pump();
      await tester.pump();

      verify(() => ordersRepo.getPdf('ord-9')).called(1);
    });

    testWidgets('Menyuda PDF: orderId yo\'q bo\'lsa snackbar ko\'rsatadi', (tester) async {
      repo = MockChatRepository();
      stubGetMessages(repo, []);

      await tester.pumpWidget(
        chatApp(
          repo,
          extraOverrides: [
            registerConversations(['conv-1'], orderId: null),
          ],
        ),
      );
      await tester.pump();

      await tester.tap(find.byIcon(AppIcons.more));
      await tester.pumpAndSettle();

      await tester.tap(find.text(l10n.chat_menuPdf));
      await tester.pump();
      await tester.pump();

      expect(find.text(l10n.chat_pdfRequireOrder), findsOneWidget);
      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}
