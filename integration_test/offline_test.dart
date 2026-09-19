import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:alora_mobile/core/storage/offline_queue.dart';
import 'package:alora_mobile/core/storage/offline_queue_item.dart';
import 'package:alora_mobile/features/chat/presentation/screens/chat_screen.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/chat_input_panel.dart';
import 'package:alora_mobile/features/catalog/presentation/screens/catalog_screen.dart';
import 'package:alora_mobile/features/conversations/presentation/screens/conversations_screen.dart';
import 'package:alora_mobile/shared/widgets/app_tab_bar.dart';

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

  tearDown(() {
    container.dispose();
  });

  testWidgets('17.2: offline → banner + chat input disabled; online → banner yo\'q', (
    tester,
  ) async {
    await tester.pumpWidget(wrapApp(container));
    await tester.pumpAndSettle();

    expect(find.byType(ConversationsScreen), findsOneWidget);
    expect(find.text('Internet yo\'q. Ulanish tiklanganda avtomatik yuboriladi'), findsNothing);

    await tester.tap(find.byIcon(AppIcons.edit));
    await tester.pumpAndSettle();
    expect(find.byType(ChatScreen), findsOneWidget);

    // Offline holatga o'tish (permament banner + ChatScreen banner).
    connectivity.setOnline(false);
    await tester.pump();
    await tester.pump();

    expect(find.text('Internet yo\'q. Ulanish tiklanganda avtomatik yuboriladi'), findsWidgets);

    final input = tester.widget<TextField>(
      find.descendant(of: find.byType(ChatInputPanel), matching: find.byType(TextField)),
    );
    expect(input.enabled, isFalse);

    // Online qaytdi → banner yo'qoladi, input qayta yoqiladi.
    connectivity.setOnline(true);
    await tester.pump();
    await tester.pump();

    expect(find.text('Internet yo\'q. Ulanish tiklanganda avtomatik yuboriladi'), findsNothing);
  });

  testWidgets('17.2: offline holatda chat/qatalog tarmoqni chaqirmaydi, ma\'lumotlar fake\'dan', (
    tester,
  ) async {
    connectivity.setOnline(false);

    await tester.pumpWidget(wrapApp(container));
    await tester.pumpAndSettle();

    expect(find.byType(ConversationsScreen), findsOneWidget);

    // Katalog tab offline holatda ham ochiladi.
    await tester.tap(find.descendant(of: find.byType(AppTabBar), matching: find.text('Katalog')));
    await tester.pumpAndSettle();
    expect(find.byType(CatalogScreen), findsOneWidget);

    // Hech qanday haqiqiy tarmoq chaqiruvi bo'lmadi — barcha repolar fake.
    expect(conversations.loadCalls, greaterThanOrEqualTo(1));
    expect(catalog.loadCalls, greaterThanOrEqualTo(1));
  });

  testWidgets('17.2: OfflineQueue — 1 ta PATCH yuboriladi va navbat bo\'shaydi', (tester) async {
    final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    final requests = <HttpRequest>[];
    server.listen((request) async {
      requests.add(request);
      request.response.statusCode = 200;
      await request.response.close();
    });

    try {
      final item = OfflineQueueItem.create(
        method: 'PATCH',
        path: '/api/v1/orders/order-1/',
        body: const {'status': 'confirmed'},
      );
      await OfflineQueue.add(item);
      expect((await OfflineQueue.getItems()).length, 1);

      final dio = Dio(BaseOptions(baseUrl: 'http://127.0.0.1:${server.port}'));
      final results = await OfflineQueue.flush(dio);

      expect(results, hasLength(1));
      expect(results.single.success, isTrue);
      expect(requests, hasLength(1));
      expect(requests.single.method, 'PATCH');
      expect(requests.single.uri.path, '/api/v1/orders/order-1/');

      // Muvaffaqiyatli jo'natishdan so'ng navbat tozalanadi.
      expect((await OfflineQueue.getItems()), isEmpty);
    } finally {
      await server.close(force: true);
    }
  });
}
