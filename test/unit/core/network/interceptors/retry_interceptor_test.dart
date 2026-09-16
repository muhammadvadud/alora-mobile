import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:alora_mobile/core/network/interceptors/retry_interceptor.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;

  setUp(() {
    dio = Dio(BaseOptions());
    dio.interceptors.add(RetryInterceptor(dio));
    dioAdapter = DioAdapter(dio: dio);
  });

  test('Faqat GET so\'rovlar qayta yuboriladi', () async {
    dioAdapter.onPost(
      '/test',
      (server) => server.throws(
        500,
        DioException(
          requestOptions: RequestOptions(path: '/test', method: 'POST'),
          type: DioExceptionType.connectionTimeout,
        ),
      ),
    );

    try {
      await dio.post('/test');
    } on DioException catch (e) {
      expect(e.requestOptions.extra['retry_count'], isNull);
    }
  });

  test('Network error holatida GET qayta yuboriladi', () async {
    dioAdapter.onGet('/test', (server) => server.reply(500, {}));

    try {
      await dio.get('/test');
    } on DioException catch (e) {
      expect(e.requestOptions.extra['retry_count'], 3);
    }
  });
}
