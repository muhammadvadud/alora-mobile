import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alora_mobile/core/network/interceptors/logging_interceptor.dart';

void main() {
  group('19.7 LoggingInterceptor maskalash', () {
    test('manba Authorization, password, phone ni *** bilan almashtiradi', () {
      final source = File(
        'lib/core/network/interceptors/logging_interceptor.dart',
      ).readAsStringSync();

      expect(
        source.contains("headers['Authorization'] = 'Bearer ***'"),
        isTrue,
      );
      expect(source.contains("maskedData['password'] = '***'"), isTrue);
      expect(source.contains("maskedData['phone'] = '***'"), isTrue);
    });

    test(
      'so\'rov headers/data ni o\'zgartirmaydi (faqat log nusxasi)',
      () async {
        final dio = Dio(
          BaseOptions(
            baseUrl: 'http://127.0.0.1',
            connectTimeout: const Duration(milliseconds: 50),
            receiveTimeout: const Duration(milliseconds: 50),
          ),
        );
        dio.interceptors.add(LoggingInterceptor());

        RequestOptions? captured;
        dio.interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) {
              captured = options;
              handler.reject(
                DioException(
                  requestOptions: options,
                  type: DioExceptionType.cancel,
                  error: 'test-stop',
                ),
              );
            },
          ),
        );

        try {
          await dio.post<void>(
            '/auth/login/',
            data: <String, dynamic>{
              'password': 'secret-pass',
              'phone': '+998901234567',
            },
            options: Options(
              headers: {'Authorization': 'Bearer super-secret-token'},
            ),
          );
        } on DioException {
          // kutilgan — so'rovni to'xtatdik
        }

        expect(captured, isNotNull);
        final opts = captured!;
        expect(opts.headers['Authorization'], 'Bearer super-secret-token');
        final data = opts.data as Map<String, dynamic>;
        expect(data['password'], 'secret-pass');
        expect(data['phone'], '+998901234567');
      },
    );
  });

  group('19.7 Cleartext traffic', () {
    test('AndroidManifest usesCleartextTraffic="true" emas', () {
      final manifest = File('android/app/src/main/AndroidManifest.xml')
          .readAsStringSync();

      final cleartextTrue = RegExp(r'usesCleartextTraffic\s*=\s*"true"')
          .hasMatch(manifest);

      expect(
        cleartextTrue,
        isFalse,
        reason:
            'BUG: android/app/src/main/AndroidManifest.xml '
            'usesCleartextTraffic="true"',
      );
    });

    test('iOS Info.plist ATS ni o\'chirib qo\'ymagan (default)', () {
      final plist = File('ios/Runner/Info.plist').readAsStringSync();
      expect(plist.contains('NSAllowsArbitraryLoads'), isFalse);
    });
  });
}
