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

  test(
    '400 nested fieldErrors (variants.0.price) to\'g\'ri parse qilinadi',
    () async {
      dioAdapter.onGet(
        '/test',
        (server) => server.reply(400, {
          'detail': 'Validatsiya xatosi',
          'code': 'validation_error',
          'errors': {
            'variants': {
              '0': {'price': 'Manfiy bo\'lmasligi kerak'},
            },
          },
        }),
      );

      try {
        await dio.get('/test');
        fail('Exception kutilgan edi');
      } on DioException catch (e) {
        final failure = e.error as Failure;
        failure.maybeWhen(
          validation: (detail, errors) {
            expect(detail, 'Validatsiya xatosi');
            // nested errors string formatda qaytariladi
            expect(errors.isNotEmpty, isTrue);
          },
          orElse: () => fail('Noto\'g\'ri failure turi'),
        );
      }
    },
  );

  test('timeout -> NetworkFailure', () async {
    dioAdapter.onGet(
      '/test',
      (server) => server.throws(
        500,
        DioException(
          requestOptions: RequestOptions(path: '/test'),
          type: DioExceptionType.receiveTimeout,
        ),
      ),
    );

    try {
      await dio.get('/test');
      fail('Exception kutilgan edi');
    } on DioException catch (e) {
      expect(e.error, const Failure.network());
    }
  });

  test('sendTimeout -> NetworkFailure', () async {
    dioAdapter.onGet(
      '/test',
      (server) => server.throws(
        500,
        DioException(
          requestOptions: RequestOptions(path: '/test'),
          type: DioExceptionType.sendTimeout,
        ),
      ),
    );

    try {
      await dio.get('/test');
      fail('Exception kutilgan edi');
    } on DioException catch (e) {
      expect(e.error, const Failure.network());
    }
  });

  test('connectionError -> NetworkFailure', () async {
    dioAdapter.onGet(
      '/test',
      (server) => server.throws(
        500,
        DioException(
          requestOptions: RequestOptions(path: '/test'),
          type: DioExceptionType.connectionError,
        ),
      ),
    );

    try {
      await dio.get('/test');
      fail('Exception kutilgan edi');
    } on DioException catch (e) {
      expect(e.error, const Failure.network());
    }
  });

  test('connectionTimeout -> NetworkFailure', () async {
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
      expect(e.error, const Failure.network());
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

  test('502 -> ServerFailure', () async {
    dioAdapter.onGet('/test', (server) => server.reply(502, {}));
    try {
      await dio.get('/test');
    } on DioException catch (e) {
      expect(e.error, const Failure.server());
    }
  });

  test('504 -> ServerFailure', () async {
    dioAdapter.onGet('/test', (server) => server.reply(504, {}));
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

  test('xato response null bo\'lsa UnknownFailure qaytaradi', () async {
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

  test('error xabarsiz va null bo\'lsa UnknownFailure qaytaradi', () async {
    dioAdapter.onGet(
      '/test',
      (server) => server.throws(
        500,
        DioException(
          requestOptions: RequestOptions(path: '/test'),
          type: DioExceptionType.unknown,
        ),
      ),
    );
    try {
      await dio.get('/test');
    } on DioException catch (e) {
      final failure = e.error as Failure;
      failure.maybeWhen(
        unknown: (_) => expect(true, isTrue),
        orElse: () => fail('UnknownFailure kutilgan'),
      );
    }
  });
}
