import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:alora_mobile/core/network/interceptors/refresh_interceptor.dart';
import 'package:alora_mobile/core/storage/secure_storage.dart';
import 'package:alora_mobile/core/network/api_paths.dart';

class FakeSecureStorage extends SecureStorage {
  String? _access;
  String? _refresh;

  @override
  Future<void> saveTokens({required String access, required String refresh}) async {
    _access = access;
    _refresh = refresh;
  }

  @override
  Future<String?> getAccessToken() async => _access;

  @override
  Future<String?> getRefreshToken() async => _refresh;

  @override
  Future<void> clearTokens() async {
    _access = null;
    _refresh = null;
  }
}

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late FakeSecureStorage secureStorage;

  setUp(() {
    secureStorage = FakeSecureStorage();

    dio = Dio(BaseOptions());
    dio.interceptors.add(RefreshInterceptor(secureStorage, dio));
    dioAdapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  });

  test('3 parallel so\'rovlar uchun faqat bitta refresh yuboriladi', () async {
    await secureStorage.saveTokens(access: 'old_access', refresh: 'old_refresh');

    dioAdapter.onGet('/protected1', (server) => server.reply(401, {}));
    dioAdapter.onGet('/protected2', (server) => server.reply(401, {}));
    dioAdapter.onGet('/protected3', (server) => server.reply(401, {}));

    int refreshCount = 0;

    dioAdapter.onPost(ApiPaths.refresh, (server) {
      refreshCount++;
      return server.reply(200, {
        'access': 'new_access',
        'refresh': 'new_refresh',
      }, delay: const Duration(milliseconds: 100));
    });

    final p1 = dio.get('/protected1');
    final p2 = dio.get('/protected2');
    final p3 = dio.get('/protected3');

    try {
      await Future.wait([p1, p2, p3]);
    } catch (_) {}

    expect(refreshCount, 1);
    expect(await secureStorage.getAccessToken(), 'new_access');
  });

  test('refresh endpoint o\'zi 401 qaytarsa tokenlar tozalanadi (logout)', () async {
    await secureStorage.saveTokens(access: 'old_access', refresh: 'bad_refresh');

    dioAdapter.onGet('/protected', (server) => server.reply(401, {}));

    // Refresh endpoint ham 401 qaytaradi → refresh xato
    dioAdapter.onPost(ApiPaths.refresh, (server) => server.reply(401, {}));

    try {
      await dio.get('/protected');
    } catch (_) {}

    expect(await secureStorage.getAccessToken(), isNull);
    expect(await secureStorage.getRefreshToken(), isNull);
  });

  test('login endpointi uchun refresh boshlanmaydi (Interceptor o\'tlaydi)', () async {
    // login endpointi RefreshInterceptor tomonidan e'tiborsiz qoldirilishi kerak
    // Lekin login 401 qaytarmaydi, shuning uchun test oddiyroq
    final handler = _FakeErrorInterceptorHandler();
    final err = DioException(
      requestOptions: RequestOptions(path: ApiPaths.login),
      response: Response(statusCode: 401, requestOptions: RequestOptions(path: ApiPaths.login)),
    );

    final interceptor = RefreshInterceptor(secureStorage, dio);
    await interceptor.onError(err, handler);

    expect(handler.isNextCalled, isTrue);
  });

  test('retry so\'rovida 401 kelsa refresh boshlanmaydi', () async {
    final handler = _FakeErrorInterceptorHandler();
    final err = DioException(
      requestOptions: RequestOptions(path: '/protected', extra: {'is_retry': true}),
      response: Response(statusCode: 401, requestOptions: RequestOptions(path: '/protected')),
    );

    final interceptor = RefreshInterceptor(secureStorage, dio);
    await interceptor.onError(err, handler);

    expect(handler.isNextCalled, isTrue);
  });

  test('token null bo\'lganda tozalanadi', () async {
    await secureStorage.clearTokens();

    final handler = _FakeErrorInterceptorHandler();
    final err = DioException(
      requestOptions: RequestOptions(path: '/protected'),
      response: Response(statusCode: 401, requestOptions: RequestOptions(path: '/protected')),
    );

    final interceptor = RefreshInterceptor(secureStorage, dio);
    await interceptor.onError(err, handler);

    expect(handler.isNextCalled, isTrue);
    expect(await secureStorage.getAccessToken(), isNull);
  });
}

class _FakeErrorInterceptorHandler extends ErrorInterceptorHandler {
  bool isNextCalled = false;
  Object? passedError;

  @override
  void next(DioException err) {
    isNextCalled = true;
    passedError = err;
  }

  @override
  void resolve(Response<Object?> response) {}
}
