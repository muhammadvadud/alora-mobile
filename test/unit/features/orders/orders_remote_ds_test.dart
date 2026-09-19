import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:alora_mobile/features/orders/data/datasources/orders_remote_ds.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MockDio mockDio;
  late OrdersRemoteDataSourceImpl dataSource;

  setUp(() {
    mockDio = MockDio();
    dataSource = OrdersRemoteDataSourceImpl(mockDio);
  });

  final orderJson = {'id': '1', 'number': 'ORD-1', 'status': 'draft', 'payment_status': 'debt'};

  test('getOrders without url', () async {
    when(
      () =>
          mockDio.get<Map<String, dynamic>>(any(), queryParameters: any(named: 'queryParameters')),
    ).thenAnswer(
      (_) async => Response<Map<String, dynamic>>(
        data: {
          'results': [orderJson],
        },
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      ),
    );

    final result = await dataSource.getOrders(status: 'draft');
    expect(result.results.length, 1);
    expect(result.results.first.id, '1');
  });

  test('getOrders with url', () async {
    when(() => mockDio.get<Map<String, dynamic>>('http://test.com/next')).thenAnswer(
      (_) async => Response<Map<String, dynamic>>(
        data: {
          'results': [orderJson],
        },
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      ),
    );

    final result = await dataSource.getOrders(url: 'http://test.com/next');
    expect(result.results.length, 1);
  });

  test('getOrder', () async {
    when(() => mockDio.get<Map<String, dynamic>>(any())).thenAnswer(
      (_) async => Response<Map<String, dynamic>>(
        data: orderJson,
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      ),
    );

    final result = await dataSource.getOrder('1');
    expect(result.id, '1');
  });

  test('createOrder', () async {
    when(() => mockDio.post<Map<String, dynamic>>(any(), data: any(named: 'data'))).thenAnswer(
      (_) async => Response<Map<String, dynamic>>(
        data: orderJson,
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      ),
    );

    final result = await dataSource.createOrder({'customer_name': 'Test'});
    expect(result.id, '1');
  });

  test('patchOrder', () async {
    when(() => mockDio.patch<Map<String, dynamic>>(any(), data: any(named: 'data'))).thenAnswer(
      (_) async => Response<Map<String, dynamic>>(
        data: orderJson,
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      ),
    );

    final result = await dataSource.patchOrder('1', {'customer_name': 'Test'});
    expect(result.id, '1');
  });

  test('confirmOrder', () async {
    when(() => mockDio.post<Map<String, dynamic>>(any())).thenAnswer(
      (_) async => Response<Map<String, dynamic>>(
        data: orderJson,
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      ),
    );

    final result = await dataSource.confirmOrder('1');
    expect(result.id, '1');
  });

  test('changeStatus', () async {
    when(() => mockDio.post<Map<String, dynamic>>(any(), data: any(named: 'data'))).thenAnswer(
      (_) async => Response<Map<String, dynamic>>(
        data: orderJson,
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      ),
    );

    final result = await dataSource.changeStatus('1', 'confirmed', 'note', '2023-01-01');
    expect(result.id, '1');
  });

  test('getStatuses', () async {
    when(() => mockDio.get<dynamic>(any())).thenAnswer(
      (_) async => Response<dynamic>(
        data: [
          {
            'value': 'draft',
            'label': 'Qoralama',
            'allowed': ['confirmed'],
          },
        ],
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      ),
    );

    final result = await dataSource.getStatuses();
    expect(result.transitions, isNotNull);
  });

  test('getPdf', () async {
    when(() => mockDio.get<List<int>>(any(), options: any(named: 'options'))).thenAnswer(
      (_) async => Response<List<int>>(
        data: [1, 2, 3],
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      ),
    );

    final result = await dataSource.getPdf('1');
    expect(result.length, 3);
  });
}
