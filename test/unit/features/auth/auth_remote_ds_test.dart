import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/network/api_paths.dart';
import 'package:alora_mobile/features/auth/data/datasources/auth_remote_ds.dart';
import 'package:alora_mobile/features/auth/data/mappers/auth_me_mapper.dart';
import 'package:alora_mobile/shared/models/role.dart';

/// ErrorMapper interceptor'ini taqlid qiluvchi: 401 -> Failure.auth,
/// 429 -> Failure.limit(detail), 4xx/5xx -> Failure.server.
class _FakeErrorMapperInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final status = err.response?.statusCode;
    Failure? mapped;
    if (status == 401) {
      mapped = const Failure.auth();
    } else if (status == 429) {
      mapped = Failure.limit(_detailOf(err) ?? 'Limit yetdi');
    } else if (status != null && status >= 500) {
      mapped = const Failure.server();
    }
    handler.next(
      mapped == null
          ? err
          : DioException(
              requestOptions: err.requestOptions,
              response: err.response,
              error: mapped,
              type: err.type,
            ),
    );
  }

  String? _detailOf(DioException err) {
    final data = err.response?.data;
    if (data is Map<String, dynamic> && data['detail'] != null) {
      final detail = data['detail'].toString();
      if (detail.isNotEmpty) return detail;
    }
    return null;
  }
}

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late AuthRemoteDataSource dataSource;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://api.example.com'));
    adapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    dataSource = AuthRemoteDataSource(dio);
  });

  Future<Failure> loginAndCapture({required String password}) async {
    try {
      await dataSource.login(phone: '+998901234567', password: password);
      fail('login xato qaytarishi kerak edi');
    } on Failure catch (failure) {
      return failure;
    }
  }

  Future<Failure> refreshAndCapture(String token) async {
    try {
      await dataSource.refresh(token);
      fail('refresh xato qaytarishi kerak edi');
    } on Failure catch (failure) {
      return failure;
    }
  }

  test('login muvaffaqiyatli bo\'lsa tokenlar juftligini qaytaradi', () async {
    adapter.onPost(
      ApiPaths.login,
      (server) => server.reply(200, {'access': 'a1', 'refresh': 'r1'}),
    );

    final pair = await dataSource.login(phone: '+998901234567', password: 'secret');

    expect(pair.access, 'a1');
    expect(pair.refresh, 'r1');
  });

  test('login 401 + detail bo\'lsa matn Failure.unknown da saqlanadi', () async {
    adapter.onPost(
      ApiPaths.login,
      (server) => server.reply(401, {'detail': "Parol yoki telefon noto'g'ri"}),
    );

    final failure = await loginAndCapture(password: 'xato');

    final detail = failure.maybeWhen(unknown: (detail) => detail, orElse: () => '');
    expect(detail, "Parol yoki telefon noto'g'ri");
  });

  test('login 401 + detail ErrorMapper tartibidan ustun keladi (unknown detail)', () async {
    dio.interceptors.add(_FakeErrorMapperInterceptor());
    adapter.onPost(
      ApiPaths.login,
      (server) => server.reply(401, {'detail': "Parol yoki telefon noto'g'ri"}),
    );

    final failure = await loginAndCapture(password: 'xato');

    final detail = failure.maybeWhen(unknown: (detail) => detail, orElse: () => '');
    expect(detail, "Parol yoki telefon noto'g'ri");
  });

  test('login 401 detailsiz Failure.auth ni saqlaydi', () async {
    dio.interceptors.add(_FakeErrorMapperInterceptor());
    adapter.onPost(ApiPaths.login, (server) => server.reply(401, {}));

    final failure = await loginAndCapture(password: 'xato');

    expect(failure.maybeWhen(auth: () => true, orElse: () => false), isTrue);
  });

  test('login 429 limit xatosiga aylantiriladi', () async {
    dio.interceptors.add(_FakeErrorMapperInterceptor());
    adapter.onPost(ApiPaths.login, (server) => server.reply(429, {'detail': 'Limit yetdi'}));

    final failure = await loginAndCapture(password: 'xato');

    final detail = failure.maybeWhen(limit: (detail) => detail, orElse: () => '');
    expect(detail, 'Limit yetdi');
  });

  test('login belgisiz server xatosi Failure.unknown qaytaradi', () async {
    dio.interceptors.add(_FakeErrorMapperInterceptor());
    adapter.onPost(ApiPaths.login, (server) => server.reply(502, {}));

    final failure = await loginAndCapture(password: 'xato');

    expect(failure.maybeWhen(server: () => true, orElse: () => false), isTrue);
  });

  test('refresh muvaffaqiyatli bo\'lsa yangi tokenlar qaytadi', () async {
    adapter.onPost(
      ApiPaths.refresh,
      (server) => server.reply(200, {'access': 'a2', 'refresh': 'r2'}),
    );

    final pair = await dataSource.refresh('old-refresh');

    expect(pair.access, 'a2');
    expect(pair.refresh, 'r2');
  });

  test('refresh 401 Failure.auth ga aylantiriladi', () async {
    dio.interceptors.add(_FakeErrorMapperInterceptor());
    adapter.onPost(ApiPaths.refresh, (server) => server.reply(401, {}));

    final failure = await refreshAndCapture('bad-refresh');

    expect(failure.maybeWhen(auth: () => true, orElse: () => false), isTrue);
  });

  test('me muvaffaqiyatli bo\'lsa profil ma\'lumotlarini qaytaradi', () async {
    adapter.onGet(
      ApiPaths.me,
      (server) => server.reply(200, {
        'profile': {
          'id': 'user-1',
          'phone': '+998901234567',
          'full_name': 'Aziz Alimov',
          'role': 'manager',
          'tenant': 'alora-pardalar',
        },
        'limit': null,
      }),
    );

    final dto = await dataSource.me();

    expect(dto.toUser().role, Role.manager);
    expect(dto.toLimitStatus(), isNull);
  });

  test('logout so\'rovi yuboriladi', () async {
    adapter.onPost(ApiPaths.logout, (server) => server.reply(204, null));

    await dataSource.logout('refresh-token');
  });
}
