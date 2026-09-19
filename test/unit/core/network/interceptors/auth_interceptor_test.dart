import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:alora_mobile/core/network/interceptors/auth_interceptor.dart';
import 'package:alora_mobile/core/network/api_paths.dart';
import 'package:alora_mobile/core/storage/secure_storage.dart';

class MockSecureStorage extends Mock implements SecureStorage {}

void main() {
  late AuthInterceptor interceptor;
  late MockSecureStorage secureStorage;

  setUp(() {
    secureStorage = MockSecureStorage();
    interceptor = AuthInterceptor(secureStorage);
  });

  test('login yo\'liga Bearer qo\'shilmaydi', () async {
    when(() => secureStorage.getAccessToken()).thenAnswer((_) async => 'tok');

    final options = RequestOptions(path: ApiPaths.login);
    final handler = _FakeHandler();

    await interceptor.onRequest(options, handler);

    expect(options.headers['Authorization'], isNull);
  });

  test('refresh yo\'liga Bearer qo\'shilmaydi', () async {
    when(() => secureStorage.getAccessToken()).thenAnswer((_) async => 'tok');

    final options = RequestOptions(path: ApiPaths.refresh);
    final handler = _FakeHandler();

    await interceptor.onRequest(options, handler);

    expect(options.headers['Authorization'], isNull);
  });

  test('oddiy so\'rovga Bearer token qo\'shiladi', () async {
    when(() => secureStorage.getAccessToken()).thenAnswer((_) async => 'my_token');

    final options = RequestOptions(path: 'orders/');
    final handler = _FakeHandler();

    await interceptor.onRequest(options, handler);

    expect(options.headers['Authorization'], 'Bearer my_token');
  });

  test('token null bo\'lsa Authorization header qo\'shilmaydi', () async {
    when(() => secureStorage.getAccessToken()).thenAnswer((_) async => null);

    final options = RequestOptions(path: 'orders/');
    final handler = _FakeHandler();

    await interceptor.onRequest(options, handler);

    expect(options.headers['Authorization'], isNull);
  });
}

class _FakeHandler extends RequestInterceptorHandler {
  Object? error;
  Response<Object?>? response;

  @override
  void next(RequestOptions options) {}

  @override
  void reject(DioException err, [bool callFollowingErrorInterceptor = false]) {
    error = err;
  }

  @override
  void resolve(Response<Object?> response, [bool callFollowingResponseInterceptor = false]) {
    this.response = response;
  }
}
