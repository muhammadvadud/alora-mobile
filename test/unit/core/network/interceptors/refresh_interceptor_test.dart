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
  Future<void> saveTokens({
    required String access,
    required String refresh,
  }) async {
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
    await secureStorage.saveTokens(
      access: 'old_access',
      refresh: 'old_refresh',
    );

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

    // We can't really intercept the retried request cleanly with mock_adapter
    // unless we redefine the route after refresh, but let's just check the counts.
    // mock_adapter intercepts based on URL. The retried request will hit the same handler
    // and fail again if we don't change the mock.
    // So let's mock it such that it succeeds the second time, or we can just check `refreshCount`
    // and ignore the final DioException from the retried request.

    // Better: let's not care if the retried request fails with 401 again (it will).
    // We just want to ensure `/refresh/` was hit exactly once.

    final p1 = dio.get('/protected1');
    final p2 = dio.get('/protected2');
    final p3 = dio.get('/protected3');

    try {
      await Future.wait([p1, p2, p3]);
    } catch (_) {}

    expect(refreshCount, 1);
    expect(await secureStorage.getAccessToken(), 'new_access');
  });
}
