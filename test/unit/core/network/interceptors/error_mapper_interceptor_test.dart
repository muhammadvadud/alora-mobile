import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:alora_mobile/core/network/interceptors/error_mapper_interceptor.dart';
import 'package:alora_mobile/core/error/failure.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;

  setUp(() {
    dio = Dio(BaseOptions());
    dio.interceptors.add(ErrorMapperInterceptor());
    dioAdapter = DioAdapter(dio: dio);
  });

  test('400 Bad Request -> ValidationFailure', () async {
    dioAdapter.onGet(
      '/test',
      (server) => server.reply(400, {
        'detail': 'Ma\'lumotlar noto\'g\'ri',
        'code': 'validation_error',
        'errors': {'price': '0 dan katta bo\'lishi kerak'},
      }),
    );

    try {
      await dio.get('/test');
      fail('Exception kutilgan edi');
    } on DioException catch (e) {
      expect(e.error, isA<Failure>());
      final failure = e.error as Failure;
      failure.maybeWhen(
        validation: (detail, errors) {
          expect(detail, 'Ma\'lumotlar noto\'g\'ri');
          expect(errors['price'], '0 dan katta bo\'lishi kerak');
        },
        orElse: () => fail('Noto\'g\'ri failure turi'),
      );
    }
  });

  test('Network Error -> NetworkFailure', () async {
    dioAdapter.onGet(
      '/test',
      (server) => server.throws(
        500,
        DioException(
          requestOptions: RequestOptions(path: '/test'),
          type: DioExceptionType.connectionTimeout,
        ),
      ),
    );

    try {
      await dio.get('/test');
      fail('Exception kutilgan edi');
    } on DioException catch (e) {
      expect(e.error, isA<Failure>());
      final failure = e.error as Failure;
      failure.maybeWhen(
        network: () => expect(true, isTrue),
        orElse: () => fail('Noto\'g\'ri failure turi'),
      );
    }
  });

  test('401 -> AuthFailure', () async {
    dioAdapter.onGet('/test', (server) => server.reply(401, {}));
    try {
      await dio.get('/test');
    } on DioException catch (e) {
      expect(e.error, const Failure.auth());
    }
  });

  test('403 -> PermissionFailure', () async {
    dioAdapter.onGet('/test', (server) => server.reply(403, {}));
    try {
      await dio.get('/test');
    } on DioException catch (e) {
      expect(e.error, const Failure.permission());
    }
  });

  test('404 -> NotFoundFailure', () async {
    dioAdapter.onGet('/test', (server) => server.reply(404, {}));
    try {
      await dio.get('/test');
    } on DioException catch (e) {
      expect(e.error, const Failure.notFound());
    }
  });

  test('429 -> LimitFailure', () async {
    dioAdapter.onGet(
      '/test',
      (server) => server.reply(429, {'detail': 'Limit oshdi'}),
    );
    try {
      await dio.get('/test');
    } on DioException catch (e) {
      expect(e.error, const Failure.limit('Limit oshdi'));
    }
  });

  test('503 -> ServiceUnavailableFailure', () async {
    dioAdapter.onGet('/test', (server) => server.reply(503, {}));
    try {
      await dio.get('/test');
    } on DioException catch (e) {
      expect(e.error, const Failure.serviceUnavailable());
    }
  });

  test('500 -> ServerFailure', () async {
    dioAdapter.onGet('/test', (server) => server.reply(500, {}));
    try {
      await dio.get('/test');
    } on DioException catch (e) {
      expect(e.error, const Failure.server());
    }
  });

  test('400 Bad Request without errors -> ValidationFailure(empty)', () async {
    dioAdapter.onGet(
      '/test',
      (server) => server.reply(400, {'detail': 'xato'}),
    );
    try {
      await dio.get('/test');
    } on DioException catch (e) {
      expect(e.error, const Failure.validation('xato', {}));
    }
  });

  test('Unknown error -> UnknownFailure', () async {
    dioAdapter.onGet(
      '/test',
      (server) => server.throws(
        500,
        DioException(
          requestOptions: RequestOptions(path: '/test'),
          type: DioExceptionType.unknown,
          error: 'Nimadir',
        ),
      ),
    );
    try {
      await dio.get('/test');
    } on DioException catch (e) {
      expect(e.error, const Failure.unknown('Nimadir'));
    }
  });
}
