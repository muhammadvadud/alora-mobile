import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:alora_mobile/app/router/app_router.dart';
import 'package:alora_mobile/app/router/forbidden_screen.dart';
import 'package:alora_mobile/app/router/routes.dart';
import 'package:alora_mobile/features/chat/presentation/screens/chat_screen.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/chat_input_panel.dart';
import 'package:alora_mobile/features/conversations/presentation/screens/conversations_screen.dart';
import 'package:alora_mobile/features/management/presentation/screens/management_screen.dart';
import 'package:alora_mobile/features/management/presentation/widgets/management_stat_cards.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/shared/models/role.dart';
import 'package:alora_mobile/shared/widgets/app_tab_bar.dart';
import 'package:alora_mobile/shared/widgets/limit_exceeded_view.dart';

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
    auth = FakeAuthRepository(refreshToken: 'refresh', user: testUser());
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

  testWidgets('19.4: employee → /management va sub-route\'lari forbidden, boshqaruv tab yo\'q', (
    tester,
  ) async {
    auth.user = testUser(role: Role.employee);

    await tester.pumpWidget(wrapApp(container));
    await tester.pumpAndSettle();

    expect(find.byType(ConversationsScreen), findsOneWidget);

    // Employee uchun boshqaruv tab (AppTabBar) ko'rsatilmaydi.
    expect(
      find.descendant(of: find.byType(AppTabBar), matching: find.text('Boshqaruv')),
      findsNothing,
    );

    // /management ga to'g'ridan-to'g'ri kirish → forbidden (403).
    container.read(appRouterProvider).go(AppRoutes.management);
    await tester.pumpAndSettle();
    expect(find.byType(ForbiddenScreen), findsOneWidget);
    expect(find.text('Ruxsat yo\'q'), findsWidgets);

    // Sub-route ham xuddi shunday qaytariladi.
    container.read(appRouterProvider).go(AppRoutes.managementEmployees);
    await tester.pumpAndSettle();
    expect(find.byType(ForbiddenScreen), findsOneWidget);
  });

  testWidgets('19.4: manager boshqaruv sahifasiga kira oladi', (tester) async {
    auth.user = testUser(role: Role.manager);

    await tester.pumpWidget(wrapApp(container));
    await tester.pumpAndSettle();

    expect(find.byType(ConversationsScreen), findsOneWidget);

    await tester.tap(find.descendant(of: find.byType(AppTabBar), matching: find.text('Boshqaruv')));
    await tester.pumpAndSettle();

    expect(find.byType(ManagementScreen), findsOneWidget);
    expect(find.byType(ManagementStatCards), findsOneWidget);
    expect(usage.summaryCalls, greaterThanOrEqualTo(1));
  });

  testWidgets('19.4: chatda 429 limit xatosi → LimitExceededView va input yo\'qoladi', (
    tester,
  ) async {
    await tester.pumpWidget(wrapApp(container));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Yangi suhbat'));
    await tester.pumpAndSettle();
    expect(find.byType(ChatScreen), findsOneWidget);

    chat.sendHandler = (content, locale, customerMode, stage) =>
        Stream.fromIterable(limitErrorSseEvents());

    await tester.enterText(
      find.descendant(of: find.byType(ChatInputPanel), matching: find.byType(TextField)),
      'Mehmonxona hisoblash',
    );
    await tester.pump();
    await tester.tap(find.byIcon(AppIcons.send));
    await settleReal(tester);

    expect(chat.sendCalls, 1);
    expect(find.byType(LimitExceededView), findsOneWidget);
    expect(find.byType(ChatInputPanel), findsNothing);
  });
}
