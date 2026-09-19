import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:alora_mobile/features/orders/data/repositories/orders_repository_impl.dart';
import 'package:alora_mobile/features/orders/data/datasources/orders_remote_ds.dart';
import 'package:alora_mobile/features/orders/data/dto/order_dto.dart';
import 'package:alora_mobile/features/orders/data/dto/orders_response_dto.dart';
import 'package:alora_mobile/features/orders/data/dto/statuses_response_dto.dart';
import 'package:alora_mobile/shared/models/order_status.dart';
import 'package:alora_mobile/shared/models/payment_status.dart';

class MockRemoteDs extends Mock implements OrdersRemoteDataSource {}

void main() {
  late MockRemoteDs mockDs;
  late OrdersRepositoryImpl repository;

  setUp(() {
    mockDs = MockRemoteDs();
    repository = OrdersRepositoryImpl(mockDs);
  });

  const orderDto = OrderDto(
    id: '1',
    number: 'ORD-1',
    status: OrderStatus.draft,
    paymentStatus: PaymentStatus.unpaid,
  );

  test('getOrders', () async {
    when(
      () => mockDs.getOrders(
        status: any(named: 'status'),
        search: any(named: 'search'),
        url: any(named: 'url'),
      ),
    ).thenAnswer((_) async => const OrdersResponseDto(results: [orderDto]));

    final result = await repository.getOrders(status: 'draft');
    expect(result.results.length, 1);
    expect(result.results.first.id, '1');
  });

  test('getOrder', () async {
    when(() => mockDs.getOrder(any())).thenAnswer((_) async => orderDto);

    final result = await repository.getOrder('1');
    expect(result.id, '1');
  });

  test('createOrder', () async {
    when(() => mockDs.createOrder(any())).thenAnswer((_) async => orderDto);

    final result = await repository.createOrder({});
    expect(result.id, '1');
  });

  test('patchOrder', () async {
    when(() => mockDs.patchOrder(any(), any())).thenAnswer((_) async => orderDto);

    final result = await repository.patchOrder('1', {});
    expect(result.id, '1');
  });

  test('confirmOrder', () async {
    when(() => mockDs.confirmOrder(any())).thenAnswer((_) async => orderDto);

    final result = await repository.confirmOrder('1');
    expect(result.id, '1');
  });

  test('changeStatus', () async {
    when(() => mockDs.changeStatus(any(), any(), any(), any())).thenAnswer((_) async => orderDto);

    final result = await repository.changeStatus('1', 'confirmed');
    expect(result.id, '1');
  });

  test('getStatuses', () async {
    when(() => mockDs.getStatuses())
        .thenAnswer((_) async => const StatusesResponseDto(transitions: {}));

    final result = await repository.getStatuses();
    expect(result.transitions, isNotNull);
  });

  test('getPdf', () async {
    when(() => mockDs.getPdf(any())).thenAnswer((_) async => Uint8List.fromList([1, 2, 3]));

    final result = await repository.getPdf('1');
    expect(result.length, 3);
  });
}
