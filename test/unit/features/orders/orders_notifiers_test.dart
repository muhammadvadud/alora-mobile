import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:alora_mobile/features/orders/application/orders_notifiers.dart';
import 'package:alora_mobile/features/orders/application/providers.dart';
import 'package:alora_mobile/features/orders/domain/repositories/orders_repository.dart';
import 'package:alora_mobile/features/orders/domain/entities/order.dart';
import 'package:alora_mobile/core/utils/paginated.dart';
import 'package:alora_mobile/shared/models/order_status.dart';
import 'package:alora_mobile/shared/models/payment_status.dart';

class MockOrdersRepository extends Mock implements OrdersRepository {}

Order _mockOrder({String id = '1'}) {
  return Order(
    id: id,
    number: 'ORD-$id',
    status: OrderStatus.draft,
    paymentStatus: PaymentStatus.unpaid,
    total: 1000,
  );
}

void main() {
  group('Orders Notifiers', () {
    late MockOrdersRepository mockRepo;
    late ProviderContainer container;

    setUp(() {
      mockRepo = MockOrdersRepository();
      container = ProviderContainer(
        overrides: [ordersRepositoryProvider.overrideWithValue(mockRepo)],
      );
    });

    test('draftOrdersCountProvider returns correct count (mock 3)', () async {
      when(() => mockRepo.getOrders(status: 'draft')).thenAnswer(
        (_) async => Paginated<Order>(
          next: null,
          previous: null,
          results: [
            _mockOrder(id: '1'),
            _mockOrder(id: '2'),
            _mockOrder(id: '3'),
          ],
        ),
      );

      final count = await container.read(draftOrdersCountProvider.future);
      expect(count, 3);
    });

    test('OrdersListNotifier fetches initial data and supports pagination, search, filter', () async {
      when(
        () => mockRepo.getOrders(
          status: any(named: 'status'),
          search: any(named: 'search'),
          url: any(named: 'url'),
        ),
      ).thenAnswer(
        (_) async => Paginated<Order>(
          next: 'nextUrl',
          previous: null,
          results: [_mockOrder(id: '1')],
        ),
      );

      var state = await container.read(ordersListProvider.future);
      expect(state.items.length, 1);
      expect(state.nextUrl, 'nextUrl');

      // Test load more (pagination)
      when(
        () => mockRepo.getOrders(
          status: any(named: 'status'),
          search: any(named: 'search'),
          url: 'nextUrl',
        ),
      ).thenAnswer(
        (_) async => Paginated<Order>(
          next: null,
          previous: null,
          results: [_mockOrder(id: '2')],
        ),
      );

      await container.read(ordersListProvider.notifier).loadMore();
      state = await container.read(ordersListProvider.future);

      expect(state.items.length, 2);
      expect(state.items[1].id, '2');
      expect(state.nextUrl, null);

      // Test filter by status
      container
          .read(ordersListFilterProvider.notifier)
          .updateStatus('confirmed');
      // updating filter invalidates provider, wait we just call build again manually or read future.
      // Actually OrdersListNotifier depends on filter so reading future should trigger a new fetch.
      when(
        () => mockRepo.getOrders(
          status: 'confirmed',
          search: any(named: 'search'),
        ),
      ).thenAnswer(
        (_) async => Paginated<Order>(
          next: null,
          previous: null,
          results: [_mockOrder(id: '3')],
        ),
      );

      state = await container.read(ordersListProvider.future);
      expect(state.items.first.id, '3');

      // Test search
      container.read(ordersListFilterProvider.notifier).updateSearch('John');
      when(() => mockRepo.getOrders(status: 'confirmed', search: 'John'))
          .thenAnswer(
            (_) async => Paginated<Order>(
              next: null,
              previous: null,
              results: [_mockOrder(id: '4')],
            ),
          );

      state = await container.read(ordersListProvider.future);
      expect(state.items.first.id, '4');
    });

    test('OrderDetailNotifier confirm updates detail', () async {
      when(() => mockRepo.getOrder('1')).thenAnswer(
        (_) async => _mockOrder(id: '1').copyWith(status: OrderStatus.draft),
      );

      var detail = await container.read(orderDetailProvider('1').future);
      expect(detail.status, OrderStatus.draft);

      when(() => mockRepo.confirmOrder('1')).thenAnswer(
        (_) async =>
            _mockOrder(id: '1').copyWith(status: OrderStatus.confirmed),
      );

      await container.read(orderDetailProvider('1').notifier).confirmOrder();

      detail = await container.read(orderDetailProvider('1').future);
      expect(detail.status, OrderStatus.confirmed);
    });
  });
}
