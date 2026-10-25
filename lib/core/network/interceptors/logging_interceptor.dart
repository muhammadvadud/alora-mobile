import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';

import '../../utils/app_logger.dart';

final _maskKeys = {
  'password',
  'password_confirmation',
  'old_password',
  'new_password',
  'phone',
  'customer_phone',
  'full_name',
  'customer_name',
  'name',
  'address',
  'delivery_address',
  'content',
  'message',
  'note',
  'notes',
  'token',
  'access',
  'refresh',
};

@visibleForTesting
dynamic maskSensitiveData(dynamic data) {
  if (data is Map) {
    final result = <String, dynamic>{};
    for (final entry in data.entries) {
      final key = entry.key.toString();
      if (_maskKeys.contains(key.toLowerCase())) {
        result[key] = '***';
      } else {
        result[key] = maskSensitiveData(entry.value);
      }
    }
    return result;
  } else if (data is List) {
    return data.map((e) => maskSensitiveData(e)).toList();
  }
  return data;
}

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.i('--> ${options.method} ${options.path}');

    final headers = Map<String, dynamic>.from(options.headers);
    if (headers.containsKey('Authorization')) {
      headers['Authorization'] = 'Bearer ***';
    }

    final data = options.data;
    final maskedData = maskSensitiveData(data);
    logger.i('Headers: $headers, Data: $maskedData');

    handler.next(options);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    logger.i('<-- ${response.statusCode} ${response.requestOptions.path}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.e('<-- Error ${err.response?.statusCode} ${err.requestOptions.path}', error: err.error);
    handler.next(err);
  }
}
