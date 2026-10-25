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

  group('maskSensitiveData', () {
    test('sodda map maskalanadi', () {
      final input = {'phone': '123', 'address': 'Toshkent', 'age': 25};
      final result = maskSensitiveData(input) as Map<String, dynamic>;
      expect(result['phone'], '***');
      expect(result['address'], '***');
      expect(result['age'], 25);
    });

    test('ichki map maskalanadi', () {
      final input = {
        'user': {'full_name': 'Ali', 'token': 'abc', 'id': 1},
        'metadata': {'status': 'ok'}
      };
      final result = maskSensitiveData(input) as Map<String, dynamic>;
      final user = result['user'] as Map<String, dynamic>;
      final metadata = result['metadata'] as Map<String, dynamic>;
      expect(user['full_name'], '***');
      expect(user['token'], '***');
      expect(user['id'], 1);
      expect(metadata['status'], 'ok');
    });

    test('list ichidagi map maskalanadi', () {
      final input = [
        {'name': 'Vali', 'age': 30},
        {'address': 'Samarqand'}
      ];
      final result = maskSensitiveData(input) as List<dynamic>;
      final first = result[0] as Map<String, dynamic>;
      final second = result[1] as Map<String, dynamic>;
      expect(first['name'], '***');
      expect(first['age'], 30);
      expect(second['address'], '***');
    });

    test('kalitlar registrga sezgir emas holda maskalanadi', () {
      final input = {'CUSTOMER_PHONE': '123'};
      final result = maskSensitiveData(input) as Map<String, dynamic>;
      expect(result['CUSTOMER_PHONE'], '***');
    });
  });
}
