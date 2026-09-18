import 'package:dio/dio.dart';

import '../../error/failure.dart';

/// `Failure` kuzatuvga (breadcrumb) yuborish uchun callback.
typedef FailureListener = void Function(Failure failure);

class ErrorMapperInterceptor extends Interceptor {
  /// [onFailure] — har xaritalangan `Failure` uchun chaqiriladi (Sentry breadcrumb, 19.10).
  ErrorMapperInterceptor({this.onFailure});

  final FailureListener? onFailure;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Failure failure;

    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.connectionError) {
      failure = const Failure.network();
    } else if (err.response != null) {
      final statusCode = err.response!.statusCode;
      final data = err.response!.data;
      final detail = (data is Map && data['detail'] != null)
          ? data['detail'].toString()
          : '';

      if (statusCode == 400) {
        final errors = (data is Map && data['errors'] is Map)
            ? (data['errors'] as Map).map(
                (k, v) => MapEntry(k.toString(), v.toString()),
              )
            : <String, String>{};
        failure = Failure.validation(detail, errors);
      } else if (statusCode == 401) {
        failure = const Failure.auth();
      } else if (statusCode == 403) {
        failure = const Failure.permission();
      } else if (statusCode == 404) {
        failure = const Failure.notFound();
      } else if (statusCode == 429) {
        failure = Failure.limit(detail);
      } else if (statusCode == 503) {
        failure = const Failure.serviceUnavailable();
      } else {
        failure = const Failure.server();
      }
    } else {
      failure = Failure.unknown(err.message ?? err.error?.toString() ?? '');
    }

    onFailure?.call(failure);
    final mappedErr = err.copyWith(error: failure);
    handler.next(mappedErr);
  }
}
