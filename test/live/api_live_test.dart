// Haqiqiy backend'ga qarshi «live» tekshiruv — ilovaning O'Z kodi bilan
// (Dio + AuthInterceptor/RefreshInterceptor/ErrorMapper, datasource'lar, SSE).
// CI'da ISHLAMAYDI (test/live CI ro'yxatida yo'q). Qo'lda:
//
//   flutter test test/live/api_live_test.dart \
//     --dart-define=API_BASE_URL=http://192.168.1.4/api/v1/ \
//     --dart-define=LIVE_PHONE=+998900000001 --dart-define=LIVE_PASSWORD=Test1234!
//
// Har endpoint alohida test — qaysi biri yiqilgani darhol ko'rinadi.
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alora_mobile/core/env.dart';
import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/network/dio_client.dart';
import 'package:alora_mobile/core/sse/sse_client.dart';
import 'package:alora_mobile/core/sse/sse_event.dart';
import 'package:alora_mobile/core/storage/secure_storage.dart';
import 'package:alora_mobile/features/auth/data/datasources/auth_remote_ds.dart';
import 'package:alora_mobile/features/catalog/data/datasources/catalog_remote_ds.dart';
import 'package:alora_mobile/features/chat/data/datasources/chat_remote_ds.dart';
import 'package:alora_mobile/features/chat/data/dto/chat_dto.dart';
import 'package:alora_mobile/features/conversations/data/datasources/conversations_remote_ds.dart';
import 'package:alora_mobile/features/management/data/datasources/team_remote_ds.dart';
import 'package:alora_mobile/features/management/data/datasources/usage_remote_ds.dart';
import 'package:alora_mobile/features/management/domain/entities/usage_period.dart';
import 'package:alora_mobile/features/management/knowledge/data/datasources/knowledge_remote_ds.dart';
import 'package:alora_mobile/features/management/pricing/data/datasources/pricing_remote_ds.dart';
import 'package:alora_mobile/features/management/pricing/data/dto/calc_preview_dto.dart';
import 'package:alora_mobile/features/management/settings/data/datasources/settings_remote_ds.dart';
import 'package:alora_mobile/features/orders/data/datasources/orders_remote_ds.dart';
import 'package:alora_mobile/features/profile/data/datasources/profile_remote_ds.dart';

import '../helpers/integration/fakes.dart';

const _phone = String.fromEnvironment('LIVE_PHONE');
const _password = String.fromEnvironment('LIVE_PASSWORD');

void main() {
  if (Env.apiBaseUrl.isEmpty || _phone.isEmpty) {
    test('live: API_BASE_URL / LIVE_PHONE berilmagan — o\'tkazib yuborildi', () {});
    return;
  }

  late ProviderContainer container;
  late Dio dio;
  late FakeSecureStorage storage;
  late String userId;
  String? conversationId;
  String? variantId;
  String? orderId;

  setUpAll(() async {
    // flutter_test HTTP'ni bloklaydi — haqiqiy tarmoqqa ruxsat.
    HttpOverrides.global = null;
    storage = FakeSecureStorage();
    container = ProviderContainer(overrides: [secureStorageProvider.overrideWithValue(storage)]);
    dio = container.read(dioProvider);
  });

  tearDownAll(() => container.dispose());

  group('auth', () {
    test('POST auth/login/ → access+refresh', () async {
      final ds = AuthRemoteDataSource(dio);
      final pair = await ds.login(phone: _phone, password: _password);
      expect(pair.access, isNotEmpty);
      expect(pair.refresh, isNotEmpty);
      await storage.saveTokens(access: pair.access, refresh: pair.refresh);
    });

    test('GET auth/me/ → profile.role, tenant', () async {
      final me = await AuthRemoteDataSource(dio).me();
      expect(me.profile.phone, _phone);
      expect(me.profile.role, isNotEmpty);
      userId = me.profile.id;
    });

    test('POST auth/refresh/ → rotation (yangi juftlik)', () async {
      final old = (await storage.getRefreshToken())!;
      final pair = await AuthRemoteDataSource(dio).refresh(old);
      expect(pair.access, isNotEmpty);
      expect(pair.refresh, isNot(old));
      await storage.saveTokens(access: pair.access, refresh: pair.refresh);
    });

    test('401 → RefreshInterceptor jimgina yangilaydi (buzilgan access bilan)', () async {
      final refresh = (await storage.getRefreshToken())!;
      await storage.saveTokens(access: 'buzilgan.token.qiymati', refresh: refresh);
      final me = await AuthRemoteDataSource(dio).me();
      expect(me.profile.phone, _phone);
      expect(await storage.getAccessToken(), isNot('buzilgan.token.qiymati'));
    });

    test('yaroqsiz parol → Failure.auth (xom DioException emas)', () async {
      await expectLater(
        AuthRemoteDataSource(dio).login(phone: _phone, password: 'notogri'),
        throwsA(isA<Failure>()),
      );
    });
  });

  group('catalog', () {
    test('GET catalog/categories/', () async {
      final page = await CatalogRemoteDataSource(dio).getCategories();
      expect(page.results, isNotEmpty);
    });

    test('GET catalog/products/ + detail', () async {
      final ds = CatalogRemoteDataSource(dio);
      final page = await ds.getProducts();
      expect(page.results, isNotEmpty);
      final detail = await ds.getProductDetail(page.results.first.id);
      expect(detail.id, page.results.first.id);
      if (detail.variants.isNotEmpty) variantId = detail.variants.first.id;
    });

    test('GET catalog/products/?search= filtr', () async {
      final page = await CatalogRemoteDataSource(dio).getProducts(search: 'tul');
      expect(page.results, isA<List<Object?>>());
    });
  });

  group('conversations + chat (SSE)', () {
    test('POST conversations/ → id', () async {
      final c = await ConversationsRemoteDataSource(dio).create();
      expect(c.id, isNotEmpty);
      conversationId = c.id;
    });

    test('GET conversations/ ro\'yxat (cursor)', () async {
      final page = await ConversationsRemoteDataSource(dio).list();
      expect(page.results.map((c) => c.id), contains(conversationId));
    });

    test('POST conversations/{id}/messages/ SSE → start … done', () async {
      final ds = ChatRemoteDataSource(dio, SseClient(dio));
      final events = await ds
          .sendMessage(
            conversationId!,
            const SendMessageRequestDto(
              content: 'Salom! Yotoqxona uchun parda kerak, 3 m karniz, 2.5 m balandlik.',
              locale: 'uz',
              context: SendMessageContextDto(customerMode: false),
            ),
          )
          .timeout(const Duration(seconds: 120))
          .toList();
      final kinds = events.map((e) => e.runtimeType.toString()).toList();
      expect(events.first, isA<SseEvent>());
      expect(
        events.any((e) => e.maybeWhen(content: (_) => true, orElse: () => false)),
        isTrue,
        reason: 'content eventi kelmadi: $kinds',
      );
      expect(
        events.last.maybeWhen(done: (_, _) => true, orElse: () => false),
        isTrue,
        reason: 'oxirgi event done emas: ${kinds.last}',
      );
    });

    test('GET conversations/{id}/messages/ tarix (user + assistant)', () async {
      final page = await ChatRemoteDataSource(dio, SseClient(dio)).getMessages(conversationId!);
      expect(page.results.length, greaterThanOrEqualTo(2));
    });

    test('GET conversations/{id}/transcript/', () async {
      final t = await ConversationsRemoteDataSource(dio).transcript(conversationId!);
      expect(t, isNotEmpty);
    });

    test('POST conversations/{id}/reset/', () async {
      await ChatRemoteDataSource(dio, SseClient(dio)).resetConversation(conversationId!);
    });
  });

  group('orders', () {
    test('GET orders/statuses/', () async {
      final s = await OrdersRemoteDataSourceImpl(dio).getStatuses();
      expect(s.statuses, isNotEmpty);
    });

    test('GET orders/ ro\'yxat', () async {
      final page = await OrdersRemoteDataSourceImpl(dio).getOrders();
      expect(page.results, isA<List<Object?>>());
      if (page.results.isNotEmpty) orderId = page.results.first.id;
    });

    test('GET orders/{id}/ + PDF', () async {
      if (orderId == null) return;
      final ds = OrdersRemoteDataSourceImpl(dio);
      final o = await ds.getOrder(orderId!);
      expect(o.id, orderId);
      final pdf = await ds.getPdf(orderId!);
      expect(pdf.length, greaterThan(100));
      expect(String.fromCharCodes(pdf.take(4)), '%PDF');
    });
  });

  group('profile', () {
    test('GET auth/me/ limit + usage/summary/?period=day&user=', () async {
      final ds = ProfileRemoteDataSource(dio);
      await ds.meLimit();
      final cost = await ds.todayCost(userId);
      expect(cost, greaterThanOrEqualTo(0));
    });
  });

  group('management (admin/manager)', () {
    test('GET usage/summary|by-user|conversations, analytics/conversion', () async {
      final ds = UsageRemoteDataSource(dio);
      await ds.summary(period: UsagePeriod.day);
      await ds.byUser(period: UsagePeriod.week);
      await ds.conversion();
      await ds.conversations();
    });

    test('GET team/employees/ + {id} + conversations', () async {
      final ds = TeamRemoteDataSource(dio);
      final list = await ds.employees();
      expect(list, isNotEmpty);
      final e = await ds.employee(list.first.id);
      expect(e.id, list.first.id);
      await ds.employeeConversations(list.first.id);
    });

    test('pricing: calc-rules, services, discount-tiers, policy, order-defaults', () async {
      final ds = PricingRemoteDataSourceImpl(dio);
      expect(await ds.getCalcRules(), isNotEmpty);
      await ds.getServices();
      await ds.getDiscountTiers();
      await ds.getDiscountPolicy();
      await ds.getOrderDefaults();
    });

    test('POST pricing/calc/preview/ (haqiqiy variant bilan)', () async {
      if (variantId == null) return;
      final r = await PricingRemoteDataSourceImpl(dio).calcPreview(
        CalcPreviewRequestDto(
          measurements: [
            CalcPreviewMeasurementDto(
              length: '3.0',
              height: '2.5',
              parts: [
                CalcPreviewPartDto(
                  variantId: variantId!,
                  role: 'portyera',
                  widthM: '3.0',
                  heightM: '2.5',
                  coef: '2.0',
                ),
              ],
              accessories: const [],
            ),
          ],
          services: const [],
        ),
      );
      expect(r, isNotNull);
    });

    test('knowledge/rules/ CRUD (yaratish → tahrir → o\'chirish)', () async {
      final ds = KnowledgeRemoteDataSourceImpl(dio);
      await ds.getRules();
      final created = await ds.createRule({
        'kind': 'objection',
        'condition': {'objection': 'expensive'},
        'recommendation': 'Avtomatik test — o\'chiriladi',
        'priority': 15,
        'is_active': true,
      });
      final patched = await ds.patchRule(created.id, {'recommendation': 'LIVE TEST qoida (2)'});
      expect(patched.id, created.id);
      await ds.deleteRule(created.id);
    });

    test('settings/prompt/ tarix, pricing/model-pricings/ (admin)', () async {
      final ds = SettingsRemoteDataSourceImpl(dio);
      await ds.getPromptHistory();
      await ds.getModelPricings();
    });
  });

  group('logout', () {
    test('POST auth/logout/ → keyin refresh 401', () async {
      final refresh = (await storage.getRefreshToken())!;
      await AuthRemoteDataSource(dio).logout(refresh);
      await expectLater(AuthRemoteDataSource(dio).refresh(refresh), throwsA(isA<Failure>()));
    });
  });
}
