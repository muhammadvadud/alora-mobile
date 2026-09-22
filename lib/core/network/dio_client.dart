import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../env.dart';
import '../error/error_reporter.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/error_mapper_interceptor.dart';
import 'interceptors/logging_interceptor.dart';
import 'interceptors/refresh_interceptor.dart';
import 'interceptors/retry_interceptor.dart';
import '../session/session_events.dart';
import '../storage/secure_storage.dart';

part 'dio_client.g.dart';

@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: Env.apiBaseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 30),
      contentType: 'application/json',
    ),
  );

  final secureStorage = ref.read(secureStorageProvider);

  dio.interceptors.addAll([
    AuthInterceptor(secureStorage),
    RefreshInterceptor(
      secureStorage,
      dio,
      onSessionExpired: () => ref.read(sessionEventsProvider).expire(),
    ),
    RetryInterceptor(dio),
    ErrorMapperInterceptor(
      onFailure: (failure) => ref.read(errorReporterProvider).breadcrumb(failure),
    ),
    if (Env.isDev) LoggingInterceptor(),
  ]);

  return dio;
}
