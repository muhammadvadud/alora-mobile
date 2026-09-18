import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:alora_mobile/core/connectivity/connectivity_notifier.dart';
import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/sse/sse_event.dart';
import 'package:alora_mobile/core/storage/secure_storage.dart';
import 'package:alora_mobile/core/utils/paginated.dart';
import 'package:alora_mobile/features/auth/domain/entities/user.dart';
import 'package:alora_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:alora_mobile/features/catalog/domain/entities/category.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product.dart';
import 'package:alora_mobile/features/catalog/domain/repositories/catalog_repository.dart';
import 'package:alora_mobile/features/chat/data/mappers/chat_mapper.dart';
import 'package:alora_mobile/features/chat/domain/entities/message.dart';
import 'package:alora_mobile/features/chat/domain/repositories/chat_repository.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation_mode.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation_stage.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation_status.dart';
import 'package:alora_mobile/features/conversations/domain/repositories/conversations_repository.dart';
import 'package:alora_mobile/features/management/domain/entities/conversion_stats.dart';
import 'package:alora_mobile/features/management/domain/entities/usage_conversation.dart';
import 'package:alora_mobile/features/management/domain/entities/usage_period.dart';
import 'package:alora_mobile/features/management/domain/entities/usage_summary.dart';
import 'package:alora_mobile/features/management/domain/entities/user_usage.dart';
import 'package:alora_mobile/features/management/domain/repositories/usage_repository.dart';
import 'package:alora_mobile/features/orders/domain/entities/order.dart';
import 'package:alora_mobile/features/orders/domain/entities/statuses_response.dart';
import 'package:alora_mobile/features/orders/domain/repositories/orders_repository.dart';
import 'package:alora_mobile/shared/models/order_status.dart';
import 'package:alora_mobile/shared/models/payment_status.dart';
import 'package:alora_mobile/shared/models/role.dart';

/// Integration testlarda connectivity'ni boshqariladigan holatda ushlaydi.
/// Haqiqiy [ConnectivityNotifier] `Connectivity()` (connectivity_plus) va
/// `Env.apiBaseUrl` ga ping yuboradi — bu headless testda ishlamaydi.
class FakeConnectivityNotifier extends ConnectivityNotifier {
  bool _initial = true;
  bool _built = false;

  @override
  bool build() {
    _built = true;
    return _initial;
  }

  /// build()'dan oldin chaqirilsa boshlang'ich qiymat sifatida saqlanadi.
  void setOnline(bool online) {
    if (!_built) {
      _initial = online;
      return;
    }
    if (state != online) state = online;
  }
}

/// [SecureStorage] o'rniga in-memory fake (plugin chaqirmaydi).
class FakeSecureStorage extends SecureStorage {
  String? accessToken;
  String? refreshToken;
  String? pin;

  @override
  Future<void> saveTokens({
    required String access,
    required String refresh,
  }) async {
    accessToken = access;
    refreshToken = refresh;
  }

  @override
  Future<String?> getAccessToken() async => accessToken;

  @override
  Future<String?> getRefreshToken() async => refreshToken;

  @override
  Future<void> clearTokens() async {
    accessToken = null;
    refreshToken = null;
  }

  @override
  Future<void> savePin(String value) async => pin = value;

  @override
  Future<String?> getPin() async => pin;

  @override
  Future<void> clearPin() async => pin = null;
}

/// [AuthRepository] fakesi. Chaqiruvlar hisoblanadi, xatoliklar testda
/// ko'rsatilganda tashlanadi.
class FakeAuthRepository implements AuthRepository {
  final _sessionExpiredController = StreamController<void>.broadcast();

  String? accessToken;
  String? refreshToken;
  User? user;

  Failure? loginFailure;
  Failure? refreshFailure;
  Failure? meFailure;

  int loginCalls = 0;
  int logoutCalls = 0;
  int clearSessionCalls = 0;

  FakeAuthRepository({this.refreshToken, this.user});

  @override
  Stream<void> get onSessionExpired => _sessionExpiredController.stream;

  @override
  Future<void> login({required String phone, required String password}) async {
    loginCalls++;
    final failure = loginFailure;
    if (failure != null) throw failure;
    accessToken = 'access-token';
    refreshToken = 'refresh-token';
  }

  @override
  Future<void> refresh() async {
    final failure = refreshFailure;
    if (failure != null) throw failure;
  }

  @override
  Future<void> logout() async {
    logoutCalls++;
    accessToken = null;
    refreshToken = null;
  }

  @override
  Future<User> me() async {
    final failure = meFailure;
    if (failure != null) throw failure;
    return user ?? testUser();
  }

  @override
  Future<String?> getAccessToken() async => accessToken;

  @override
  Future<String?> getRefreshToken() async => refreshToken;

  @override
  Future<User?> getCachedUser() async => user;

  @override
  Future<void> clearSession() async {
    clearSessionCalls++;
    accessToken = null;
    refreshToken = null;
  }

  void emitSessionExpired() => _sessionExpiredController.add(null);

  Future<void> dispose() => _sessionExpiredController.close();
}

User testUser({Role role = Role.manager}) {
  return User(
    id: 'user-1',
    phone: '+998901234567',
    fullName: 'Test User',
    role: role,
    tenant: 'alora-pardalar',
  );
}

/// [ConversationsRepository] fakesi — in-memory ro'yxat.
class FakeConversationsRepository implements ConversationsRepository {
  final List<Conversation> conversations;
  int createCalls = 0;
  int loadCalls = 0;
  int _counter = 0;

  FakeConversationsRepository({List<Conversation>? initial})
    : conversations = List.of(initial ?? const []);

  @override
  Future<(List<Conversation>, String?)> list({
    String? cursor,
    String? search,
  }) async {
    loadCalls++;
    final query = search?.trim().toLowerCase() ?? '';
    final items = query.isEmpty
        ? List<Conversation>.from(conversations)
        : conversations
              .where(
                (c) =>
                    c.title.toLowerCase().contains(query) ||
                    (c.lastMessagePreview?.toLowerCase().contains(query) ??
                        false),
              )
              .toList();
    return (items, null);
  }

  @override
  Future<Conversation> create() async {
    createCalls++;
    _counter++;
    final conversation = Conversation(
      id: 'conv-$_counter',
      title: 'Suhbat $_counter',
      stage: ConversationStage.need,
      mode: ConversationMode.seller,
      status: ConversationStatus.active,
      lastMessageAt: DateTime.now(),
    );
    conversations.insert(0, conversation);
    return conversation;
  }

  @override
  Future<void> archive(String id) async {
    conversations.removeWhere((c) => c.id == id);
  }

  @override
  Future<String> transcript(String id) async => '';

  @override
  Future<List<Conversation>> getCached() async =>
      List<Conversation>.from(conversations);
}

/// [ChatRepository] fakesi — SSE oqimini test boshqaradi.
typedef SendMessageHandler = Stream<SseEvent> Function(
  String content,
  String locale,
  bool customerMode,
  String? stage,
);

class FakeChatRepository implements ChatRepository {
  Paginated<Message>? initialMessages;
  SendMessageHandler? sendHandler;

  int sendCalls = 0;
  int resetCalls = 0;
  String? lastContent;
  String? lastLocale;
  bool? lastCustomerMode;
  String? lastStage;

  @override
  Future<Paginated<Message>> getMessages(
    String conversationId, {
    String? cursor,
  }) async {
    return initialMessages ??
        const Paginated(next: null, previous: null, results: []);
  }

  @override
  Stream<SseEvent> sendMessage(
    String conversationId,
    String content,
    String locale,
    bool customerMode,
    String? stage, {
    CancelToken? cancelToken,
  }) {
    sendCalls++;
    lastContent = content;
    lastLocale = locale;
    lastCustomerMode = customerMode;
    lastStage = stage;
    final handler = sendHandler;
    if (handler != null) {
      return handler(content, locale, customerMode, stage);
    }
    return const Stream.empty();
  }

  @override
  Future<void> resetConversation(String conversationId) async {
    resetCalls++;
  }

  @override
  RichBlock parseToolResult(String tool, String resultStr) =>
      ChatMapper.parseToolResult(tool, resultStr);
}

/// [OrdersRepository] fakesi — in-memory buyurtmalar.
class FakeOrdersRepository implements OrdersRepository {
  final Map<String, Order> orders;
  int createCalls = 0;
  int patchCalls = 0;
  int confirmCalls = 0;
  int changeStatusCalls = 0;
  int _counter = 0;

  FakeOrdersRepository({List<Order>? initial})
    : orders = {
        for (final order in initial ?? const <Order>[]) order.id: order,
      };

  @override
  Future<Paginated<Order>> getOrders({
    String? status,
    String? search,
    String? url,
  }) async {
    final items = orders.values.where((order) {
      if (status != null && order.status.name != status) return false;
      if (search != null && search.isNotEmpty) {
        final q = search.toLowerCase();
        final number = order.number?.toLowerCase() ?? '';
        final customer = order.customerName?.toLowerCase() ?? '';
        if (!number.contains(q) && !customer.contains(q)) return false;
      }
      return true;
    }).toList();
    return Paginated(next: null, previous: null, results: items);
  }

  @override
  Future<Order> getOrder(String id) async {
    final order = orders[id];
    if (order == null) {
      throw const Failure.notFound();
    }
    return order;
  }

  @override
  Future<Order> createOrder(Map<String, dynamic> body) async {
    createCalls++;
    _counter++;
    final order = Order(
      id: body['id']?.toString() ?? 'order-$_counter',
      number: _numberFor(_counter),
      customerName: body['customer_name']?.toString(),
      customerPhone:
          body['customer_phone']?.toString() ?? body['phone']?.toString(),
      address: body['address']?.toString(),
      status: OrderStatus.draft,
      statusDisplay: 'Qoralama',
      total: (body['total'] as num?)?.toInt(),
      paymentStatus: PaymentStatus.unpaid,
      createdAt: DateTime.now(),
    );
    orders[order.id] = order;
    return order;
  }

  @override
  Future<Order> patchOrder(String id, Map<String, dynamic> body) async {
    patchCalls++;
    final current = orders[id];
    if (current == null) throw const Failure.notFound();
    final updated = current.copyWith(
      customerName: body['customer_name']?.toString() ?? current.customerName,
    );
    orders[id] = updated;
    return updated;
  }

  @override
  Future<Order> confirmOrder(String id) async {
    confirmCalls++;
    final current = orders[id];
    if (current == null) throw const Failure.notFound();
    final confirmed = current.copyWith(
      status: OrderStatus.confirmed,
      statusDisplay: 'Tasdiqlangan',
    );
    orders[id] = confirmed;
    return confirmed;
  }

  @override
  Future<Order> changeStatus(
    String id,
    String status, {
    String? note,
    String? actionDate,
  }) async {
    changeStatusCalls++;
    final current = orders[id];
    if (current == null) throw const Failure.notFound();
    final updated = current.copyWith(
      status: OrderStatus.values.asNameMap()[status] ?? OrderStatus.unknown,
    );
    orders[id] = updated;
    return updated;
  }

  @override
  Future<StatusesResponse> getStatuses() async => const StatusesResponse();

  @override
  Future<Uint8List> getPdf(String id) async =>
      throw UnimplementedError('getPdf testda kutilmagan');

  static String _numberFor(int counter) =>
      'ORD-${counter.toString().padLeft(6, '0')}';
}

/// [CatalogRepository] fakesi — bo'sh katalog (offline rejimda bo'sh holat).
class FakeCatalogRepository implements CatalogRepository {
  bool failCategories = false;
  int loadCalls = 0;

  @override
  Future<Paginated<Category>> getCategories() async {
    loadCalls++;
    if (failCategories) throw const Failure.network();
    return const Paginated(next: null, previous: null, results: []);
  }

  @override
  Future<Paginated<Product>> getProducts({
    String? category,
    String? style,
    String? room,
    String? segment,
    String? priceUnit,
    String? search,
    int? minPrice,
    int? maxPrice,
    String? cursor,
  }) async {
    return const Paginated(next: null, previous: null, results: []);
  }

  @override
  Future<Product> getProductDetail(String id) async =>
      throw UnimplementedError('getProductDetail testda kutilmagan');
}

/// [UsageRepository] fakesi — management bosh sahifa statistikasi.
class FakeUsageRepository implements UsageRepository {
  int summaryCalls = 0;

  @override
  Future<UsageSummary> summary({
    required UsagePeriod period,
    String? userId,
  }) async {
    summaryCalls++;
    return UsageSummary(
      period: period.name,
      tokens: 12000,
      costUzs: 150000,
      messages: 24,
      conversations: 6,
      orders: 2,
    );
  }

  @override
  Future<List<UserUsage>> byUser({required UsagePeriod period}) async => const [
    UserUsage(userId: 'employee-1', fullName: 'Akmal Karimov', tokens: 8000),
    UserUsage(userId: 'employee-2', fullName: 'Dilnoza Rahimova', tokens: 4000),
  ];

  @override
  Future<ConversionStats> conversion() async =>
      const ConversionStats(totalConversations: 6, withOrder: 2);

  @override
  Future<List<UsageConversation>> conversations() async => const [];
}

/// `curtain_calculate` tool_result JSON — [ChatMapper.parseQuote] ga mos.
String quoteToolResultJson() => jsonEncode({
  'measurements': [
    {
      'room': 'Mehmonxona',
      'length': 1.5,
      'height': 2.5,
      'parts': [
        {
          'role': 'tul',
          'variant_id': 'v1',
          'color_name': 'Zumrad',
          'color_hex': '#0E5751',
          'width_m': 3.0,
          'height_m': 2.5,
          'coef': 2.0,
          'area_m2': 7.5,
          'unit_price': 100000,
          'line_total': 750000,
        },
        {
          'role': 'portyera',
          'variant_id': 'v2',
          'color_name': 'Bronza',
          'color_hex': '#8A6620',
          'width_m': 3.0,
          'height_m': 2.5,
          'coef': 2.0,
          'area_m2': 7.5,
          'unit_price': 120000,
          'line_total': 900000,
        },
      ],
      'accessories': [
        {
          'sku': 'Karniz',
          'qty': 1.5,
          'unit_price': 80000,
          'line_total': 120000,
        },
      ],
    },
  ],
  'services': [
    {'name': "O'rnatish", 'qty': 1, 'line_total': 150000},
  ],
  'warnings': ['Kesim ortigcha chiqadi'],
  'formula': '1.5 x 2.5 x 2',
  'subtotal': 1920000,
  'discount_amount': 100000,
  'delivery_amount': 50000,
  'total': 1870000,
});

/// `order_draft` tool_result JSON — [ChatMapper] dagi parse'ga mos.
String orderDraftToolResultJson() => jsonEncode({
  'customer_name': 'Ali Valiyev',
  'phone': '+998901234567',
  'address': 'Toshkent sh., Chilonzor 1',
  'measurements': [
    {'room_name': 'Mehmonxona', 'cornice': 1.5, 'height': 2.5},
  ],
  'total': 1870000,
  'prepayment': 600000,
  'missing_fields': <String>[],
});

/// 19.3 uchun: hisob kalkulyatsiyasi + buyurtma qoralamasi SSE oqimi.
List<SseEvent> quoteAndDraftSseEvents() => [
  const SseEvent.start(),
  const SseEvent.thinking(),
  const SseEvent.content('Endilikda hisoblab beraman.'),
  const SseEvent.toolCall('curtain_calculate'),
  const SseEvent.toolArgs(
    'curtain_calculate',
    '{"width_m": 1.5, "height_m": 2.5}',
  ),
  SseEvent.toolResult('curtain_calculate', quoteToolResultJson()),
  const SseEvent.content(
    "Qo'shimcha ravishda buyurtma qoralamasini tayyorlayapman.",
  ),
  const SseEvent.toolCall('order_draft'),
  const SseEvent.toolArgs('order_draft', '{}'),
  SseEvent.toolResult('order_draft', orderDraftToolResultJson()),
  const SseEvent.done(),
];

/// 19.4 uchun: 429 limit xatosi SSE oqimi.
List<SseEvent> limitErrorSseEvents() => [
  const SseEvent.error('429: Kunlik limit tugadi'),
];
