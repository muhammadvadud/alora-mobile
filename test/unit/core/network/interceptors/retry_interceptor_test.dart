import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/core/network/interceptors/retry_interceptor.dart';

typedef _FailFactory = DioException Function(RequestOptions options);

class _FakeAdapter implements HttpClientAdapter {
  final List<_FailFactory> failFactories;
  int callCount = 0;
  int statusCode = 200;

  _FakeAdapter(this.failFactories);

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    callCount++;
    if (callCount <= failFactories.length) {
      throw failFactories[callCount - 1](options);
    }
    return ResponseBody.fromString('{}', statusCode);
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  late Dio dio;

  _FailFactory makeError(DioExceptionType type, [String msg = '']) =>
      (RequestOptions options) =>
          DioException(requestOptions: options, type: type, error: msg);

  setUp(() {
    dio = Dio(BaseOptions());
    dio.interceptors.add(RetryInterceptor(dio));
  });

  test('POST so\'rovi qayta yuborilmaydi', () async {
    dio.httpClientAdapter = _FakeAdapter([
      makeError(DioExceptionType.connectionError, 'connection failed'),
    ]);

    try {
      await dio.post('/test');
      fail('Exception kutilgan edi');
    } on DioException catch (e) {
      expect(e.requestOptions.extra['retry_count'], isNull);
    }
  });

  test('4xx xatosi GET uchun qayta yuborilmaydi', () async {
    final adapter = _FakeAdapter([]);
    adapter.statusCode = 400;
    dio.httpClientAdapter = adapter;

    try {
      await dio.get('/test');
      fail('Exception kutilgan edi');
    } on DioException catch (e) {
      expect(e.response?.statusCode, 400);
      expect(e.requestOptions.extra['retry_count'], isNull);
    }
    expect(adapter.callCount, 1);
  });

  test('5xx xatosi GET uchun qayta yuboriladi', () async {
    final adapter = _FakeAdapter([]);
    adapter.statusCode = 500;
    dio.httpClientAdapter = adapter;

    try {
      await dio.get('/test');
      fail('Exception kutilgan edi');
    } on DioException catch (e) {
      expect(e.requestOptions.extra['retry_count'], 3);
    }
    expect(adapter.callCount, 4);
  });

  test(
    'connectionError GET uchun qayta yuboriladi, keyin muvaffaqiyat',
    () async {
      final adapter = _FakeAdapter([
        makeError(DioExceptionType.connectionError, 'connection failed'),
        makeError(DioExceptionType.connectionError, 'connection failed'),
        makeError(DioExceptionType.connectionError, 'connection failed'),
      ]);
      dio.httpClientAdapter = adapter;

      final response = await dio.get('/test');
      expect(response.statusCode, 200);
      expect(adapter.callCount, 4);
    },
  );

  test('3 urinishdan keyin xato qaytadi (exceeded)', () async {
    final adapter = _FakeAdapter([
      makeError(DioExceptionType.connectionError, 'connection failed'),
      makeError(DioExceptionType.connectionError, 'connection failed'),
      makeError(DioExceptionType.connectionError, 'connection failed'),
      // 4-so'rov ham fail bo'ladi — 3 urinish tugadi
      makeError(DioExceptionType.connectionError, 'connection failed'),
    ]);
    dio.httpClientAdapter = adapter;

    try {
      await dio.get('/test');
      fail('Exception kutilgan edi');
    } on DioException catch (e) {
      expect(adapter.callCount, 4);
      expect(e.requestOptions.extra['retry_count'], 3);
    }
  });

  test('receiveTimeout GET uchun qayta yuboriladi', () async {
    final adapter = _FakeAdapter([
      makeError(DioExceptionType.receiveTimeout, 'receive timeout'),
      makeError(DioExceptionType.receiveTimeout, 'receive timeout'),
    ]);
    dio.httpClientAdapter = adapter;

    final response = await dio.get('/test');
    expect(response.statusCode, 200);
    expect(adapter.callCount, 3);
  });

  test('sendTimeout GET uchun qayta yuboriladi', () async {
    final adapter = _FakeAdapter([
      makeError(DioExceptionType.sendTimeout, 'send timeout'),
    ]);
    dio.httpClientAdapter = adapter;

    final response = await dio.get('/test');
    expect(response.statusCode, 200);
    expect(adapter.callCount, 2);
  });

  test('connectionTimeout GET uchun qayta yuboriladi', () async {
    final adapter = _FakeAdapter([
      makeError(DioExceptionType.connectionTimeout, 'conn timeout'),
      makeError(DioExceptionType.connectionTimeout, 'conn timeout'),
      makeError(DioExceptionType.connectionTimeout, 'conn timeout'),
      makeError(DioExceptionType.connectionTimeout, 'conn timeout'),
    ]);
    dio.httpClientAdapter = adapter;

    try {
      await dio.get('/test');
      fail('Exception kutilgan edi');
    } on DioException catch (e) {
      expect(adapter.callCount, 4);
      expect(e.requestOptions.extra['retry_count'], 3);
    }
  });

  test('receiveTimeout keyin 5xx qaytmaydi (limit yetdi)', () async {
    final adapter = _FakeAdapter([
      makeError(DioExceptionType.receiveTimeout, 'receive timeout'),
      makeError(DioExceptionType.receiveTimeout, 'receive timeout'),
      makeError(DioExceptionType.receiveTimeout, 'receive timeout'),
      makeError(DioExceptionType.receiveTimeout, 'receive timeout'),
    ]);
    dio.httpClientAdapter = adapter;

    try {
      await dio.get('/test');
      fail('Exception kutilgan edi');
    } on DioException catch (e) {
      expect(adapter.callCount, 4);
      expect(e.requestOptions.extra['retry_count'], 3);
    }
  });
}
