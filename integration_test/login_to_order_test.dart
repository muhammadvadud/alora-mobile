import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:alora_mobile/features/auth/application/auth_notifier.dart';
import 'package:alora_mobile/features/auth/application/auth_state.dart';
import 'package:alora_mobile/features/auth/presentation/screens/login_screen.dart';
import 'package:alora_mobile/features/chat/presentation/screens/chat_screen.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/chat_input_panel.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/order_draft_card.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/quote_card.dart';
import 'package:alora_mobile/features/conversations/presentation/screens/conversations_screen.dart';
import 'package:alora_mobile/features/orders/domain/entities/order.dart';
import 'package:alora_mobile/features/orders/presentation/screens/order_detail_screen.dart';
import 'package:alora_mobile/features/orders/presentation/screens/orders_screen.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/shared/models/order_status.dart';
import 'package:alora_mobile/shared/models/payment_status.dart';
import 'package:alora_mobile/shared/models/role.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_tab_bar.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';
import 'package:alora_mobile/shared/widgets/phone_field.dart';

import '../test/helpers/integration/fakes.dart';
import '../test/helpers/integration/test_app.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late FakeAuthRepository auth;
  late FakeChatRepository chat;
  late FakeConversationsRepository conversations;
  late FakeOrdersRepository orders;
  late FakeCatalogRepository catalog;
  late FakeConnectivityNotifier connectivity;
  late FakeUsageRepository usage;
  late ProviderContainer container;

  setUpAll(initTestStorage);

  setUp(() {
    auth = FakeAuthRepository();
    chat = FakeChatRepository();
    conversations = FakeConversationsRepository();
    orders = FakeOrdersRepository();
    catalog = FakeCatalogRepository();
    connectivity = FakeConnectivityNotifier();
    usage = FakeUsageRepository();
    container = createTestContainer(
      auth: auth,
      chat: chat,
      conversations: conversations,
      orders: orders,
      catalog: catalog,
      connectivity: connectivity,
      usage: usage,
    );
  });

  tearDown(() => container.dispose());

  testWidgets('19.3: login → chat → hisob → qoralama → buyurtma → tasdiqlash', (tester) async {
    chat.sendHandler = (content, locale, customerMode, stage) =>
        Stream.fromIterable(quoteAndDraftSseEvents());

    await tester.pumpWidget(wrapApp(container));
    await tester.pumpAndSettle();

    // Refresh token yo'q → login ekrani.
    expect(find.byType(LoginScreen), findsOneWidget);

    await tester.enterText(find.byType(PhoneField), '+998901234567');
    await tester.enterText(find.byType(AppTextField).first, '1234');
    await tester.tap(find.widgetWithText(AppButton, 'Kirish'));
    await tester.pumpAndSettle();

    expect(
      container.read(authProvider).maybeWhen(authenticated: (_) => true, orElse: () => false),
      isTrue,
      reason: 'Login muvaffaqiyatli bo\'lishi kerak',
    );
    expect(find.byType(ConversationsScreen), findsOneWidget);

    // Yangi suhbat yaratish.
    await tester.tap(find.byIcon(AppIcons.edit));
    await tester.pumpAndSettle();
    expect(find.byType(ChatScreen), findsOneWidget);
    expect(conversations.createCalls, 1);

    // Xabar yuborish.
    await tester.enterText(
      find.descendant(of: find.byType(ChatInputPanel), matching: find.byType(TextField)),
      'Mehmonxona 1.5x2.5 parda hisoblash',
    );
    await tester.pump();
    await tester.tap(find.byIcon(AppIcons.send));
    await settleReal(tester);

    expect(chat.sendCalls, 1);
    expect(find.byType(QuoteCardView), findsOneWidget);
    expect(find.byType(OrderDraftCardView), findsOneWidget);

    // 7.12: "Buyurtma yaratish" → POST orders/ → /orders/:id
    await tester.tap(find.widgetWithText(AppButton, 'Buyurtma yaratish'));
    await settleReal(tester);

    expect(orders.createCalls, 1);
    final created = orders.orders.values.single;
    expect(created.customerName, isNotNull);
    expect(find.byType(OrderDetailScreen), findsOneWidget);

    // 9.14: tafsilotda "Tasdiqlash" → POST confirm/ → "Tasdiqlangan"
    await tester.tap(find.widgetWithText(AppButton, 'Tasdiqlash'));
    await settleReal(tester);
    expect(orders.confirmCalls, 1);
    expect(find.text('Buyurtma tasdiqlandi'), findsOneWidget);
  });

  testWidgets('19.3: buyurtmalar ro\'yxatida draft buyurtmani tasdiqlash → "Tasdiqlangan"', (
    tester,
  ) async {
    auth.refreshToken = 'refresh';
    auth.user = testUser(role: Role.manager);
    orders = FakeOrdersRepository(
      initial: [
        Order(
          id: 'order-1',
          number: 'ORD-000001',
          customerName: 'Ali Valiyev',
          customerPhone: '+998901234567',
          status: OrderStatus.draft,
          statusDisplay: 'Qoralama',
          total: 1870000,
          paymentStatus: PaymentStatus.unpaid,
          createdAt: DateTime(2026, 1, 15),
        ),
      ],
    );
    container = createTestContainer(
      auth: auth,
      chat: chat,
      conversations: conversations,
      orders: orders,
      catalog: catalog,
      connectivity: connectivity,
      usage: usage,
    );

    await tester.pumpWidget(wrapApp(container));
    await tester.pumpAndSettle();

    // Authenticated → to'g'ridan-to'g'ri /chat.
    expect(find.byType(ConversationsScreen), findsOneWidget);

    // Buyurtmalar tab.
    await tester.tap(
      find.descendant(of: find.byType(AppTabBar), matching: find.text('Buyurtmalar')),
    );
    await tester.pumpAndSettle();
    expect(find.byType(OrdersScreen), findsOneWidget);

    // Draft buyurtma kartasidagi "Tasdiqlash" tugmasi ishlaydi.
    final confirmButton = find.widgetWithText(AppButton, 'Tasdiqlash');
    expect(confirmButton, findsOneWidget);
    await tester.tap(confirmButton);
    await settleReal(tester);

    expect(orders.confirmCalls, 1);
    expect(find.text('Tasdiqlangan'), findsOneWidget);

    // Buyurtma tafsilotiga o'tish.
    await tester.tap(find.text('ORD-000001'));
    await tester.pumpAndSettle();

    // Tasdiqlangan buyurtma tafsilotida "Tasdiqlash" tugmasi ko'rinmaydi.
    expect(find.widgetWithText(AppButton, 'Tasdiqlash'), findsNothing);
  });
}
