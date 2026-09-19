import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:alora_mobile/core/network/interceptors/logging_interceptor.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late LoggingInterceptor interceptor;

  setUp(() {
    dio = Dio(BaseOptions());
    interceptor = LoggingInterceptor();
    dio.interceptors.add(interceptor);
    dioAdapter = DioAdapter(dio: dio);
  });

  test('Authorization header maskalanadi', () async {
    dioAdapter.onGet('/test', (server) => server.reply(200, {}));

    final response = await dio.get(
      '/test',
      options: Options(headers: {'Authorization': 'Bearer secret_token_123'}),
    );

    expect(response.statusCode, 200);
  });

  test('request header orqali ishlaydi', () async {
    dioAdapter.onGet('/test', (server) => server.reply(200, {}));

    final response = await dio.get('/test');

    expect(response.statusCode, 200);
  });

  test('response xatosi xabarsiz ishlaydi', () async {
    dioAdapter.onGet('/test', (server) => server.reply(500, {}));

    try {
      await dio.get('/test');
    } on DioException catch (e) {
      expect(e.response?.statusCode, 500);
    }
  });

  test('data ichida password va phone maskalanadi', () async {
    final data = {'phone': '+998901234567', 'password': 'supersecret'};

    dioAdapter.onPost('/auth/login/', (server) => server.reply(200, {}), data: data);

    final response = await dio.post('/auth/login/', data: data);

    expect(response.statusCode, 200);
  });

  test('data null bo\'lsa qo\'shimcha xatolik yo\'q', () async {
    dioAdapter.onGet('/test', (server) => server.reply(200, {}));

    final response = await dio.get('/test');

    expect(response.statusCode, 200);
  });
}
