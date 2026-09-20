import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:alora_mobile/features/chat/domain/entities/order_draft.dart';
import 'package:alora_mobile/features/orders/application/order_from_draft_notifier.dart';
import 'package:alora_mobile/features/orders/application/providers.dart';
import 'package:alora_mobile/features/orders/domain/entities/order.dart';
import 'package:alora_mobile/shared/models/order_status.dart';
import 'package:alora_mobile/shared/models/payment_status.dart';

import '../../../helpers/mock_orders_repository.dart';

OrderDraft _draft() => OrderDraft(
  customerName: 'Ali Valiyev',
  phone: '+998901234567',
  address: null,
  measurements: const [
    OrderDraftMeasurement(roomName: 'Mehmonxona', cornice: 3.2, height: 2.7),
    OrderDraftMeasurement(roomName: null, cornice: null, height: null),
  ],
  total: 2140000,
  prepaymentPercent: 50,
  deadline: DateTime(2026, 9, 30),
  missingFields: const [],
);

void main() {
  group('draftToBody (API-CONTRACT 4.2)', () {
    test("to'ldirilgan maydonlar uzatiladi, bo'shlari yuborilmaydi", () {
      final body = draftToBody(_draft(), conversationId: 'conv-1');

      expect(body['customer_name'], 'Ali Valiyev');
      expect(body['customer_phone'], '+998901234567');
      expect(body.containsKey('address'), isFalse);
      expect(body['conversation_id'], 'conv-1');
      expect(body['prepayment_percent'], '50.0');
      expect(body['deadline_date'], '2026-09-30');
    });

    test("o'lchovlar snake_case va 3 kasr bilan; narx/hisob maydoni yo'q (§0.8)", () {
      final body = draftToBody(_draft());
      final measurements = body['measurements'] as List<Map<String, dynamic>>;

      expect(measurements, hasLength(2));
      expect(measurements.first, {
        'room_name': 'Mehmonxona',
        'cornice_length_m': '3.200',
        'height_m': '2.700',
      });
      expect(measurements.last, isEmpty);
      expect(body.containsKey('total'), isFalse);
    });
  });

  group('OrderFromDraftNotifier', () {
    late MockOrdersRepository repo;
    late ProviderContainer container;

    setUp(() {
      repo = MockOrdersRepository();
      container = ProviderContainer(overrides: [ordersRepositoryProvider.overrideWithValue(repo)]);
      addTearDown(container.dispose);
    });

    test('create → POST body bilan createOrder, natija Order qaytadi', () async {
      const created = Order(
        id: 'o1',
        number: 'ALR-2026-000001',
        status: OrderStatus.draft,
        paymentStatus: PaymentStatus.unpaid,
        total: 2140000,
      );
      when(() => repo.createOrder(any())).thenAnswer((_) async => created);

      final result = await container
          .read(orderFromDraftProvider.notifier)
          .create(_draft(), conversationId: 'conv-1');

      expect(result, created);
      final body =
          verify(() => repo.createOrder(captureAny())).captured.single as Map<String, dynamic>;
      expect(body['conversation_id'], 'conv-1');
      expect(container.read(orderFromDraftProvider).value, created);
    });

    test('xatoda null qaytadi va holat error bo\'ladi', () async {
      when(() => repo.createOrder(any())).thenThrow(Exception('server'));

      final result = await container.read(orderFromDraftProvider.notifier).create(_draft());

      expect(result, isNull);
      expect(container.read(orderFromDraftProvider).hasError, isTrue);
    });
  });
}
