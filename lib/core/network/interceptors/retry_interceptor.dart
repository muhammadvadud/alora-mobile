import 'package:dio/dio.dart';

import 'dart:math';

class RetryInterceptor extends Interceptor {
  final Dio dio;

  RetryInterceptor(this.dio);

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final method = err.requestOptions.method.toUpperCase();
    if (method != 'GET') {
      return handler.next(err);
    }

    final isNetworkError =
        err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.connectionError ||
        (err.response != null && err.response!.statusCode! >= 500);

    if (!isNetworkError) {
      return handler.next(err);
    }

    int retryCount = (err.requestOptions.extra['retry_count'] as int?) ?? 0;
    if (retryCount >= 3) {
      return handler.next(err);
    }

    retryCount++;
    err.requestOptions.extra['retry_count'] = retryCount;

    final delay = pow(2, retryCount).toInt() * 500; // 1s, 2s, 4s for backoff

    await Future.delayed(Duration(milliseconds: delay));

    try {
      final response = await dio.fetch(err.requestOptions);
      return handler.resolve(response);
    } on DioException catch (e) {
      return handler.next(e);
    }
  }
}
