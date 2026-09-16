import 'package:dio/dio.dart';

import '../../utils/app_logger.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.i('--> ${options.method} ${options.path}');

    final headers = Map<String, dynamic>.from(options.headers);
    if (headers.containsKey('Authorization')) {
      headers['Authorization'] = 'Bearer ***';
    }

    final data = options.data;
    if (data is Map) {
      final maskedData = Map<String, dynamic>.from(data);
      if (maskedData.containsKey('password')) {
        maskedData['password'] = '***';
      }
      if (maskedData.containsKey('phone')) {
        maskedData['phone'] = '***';
      }
      logger.i('Headers: $headers, Data: $maskedData');
    } else {
      logger.i('Headers: $headers, Data: $data');
    }

    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    logger.i('<-- ${response.statusCode} ${response.requestOptions.path}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.e(
      '<-- Error ${err.response?.statusCode} ${err.requestOptions.path}',
      error: err.error,
    );
    handler.next(err);
  }
}
