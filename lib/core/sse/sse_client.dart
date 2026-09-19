import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import '../error/failure.dart';
import '../utils/app_logger.dart';
import 'sse_event.dart';

class SseClient {
  final Dio dio;

  SseClient(this.dio);

  Stream<SseEvent> connect(
    String url, {
    Map<String, dynamic>? data,
    CancelToken? cancelToken,
  }) async* {
    int retryCount = 0;

    while (true) {
      try {
        final response = await dio.post<ResponseBody>(
          url,
          data: data,
          cancelToken: cancelToken,
          options: Options(
            responseType: ResponseType.stream,
            receiveTimeout: Duration.zero,
            sendTimeout: const Duration(seconds: 15),
            headers: {'Accept': 'text/event-stream'},
          ),
        );

        final stream = response.data!.stream;
        String buffer = '';

        await for (final Uint8List chunk in stream) {
          if (cancelToken != null && cancelToken.isCancelled) {
            break;
          }
          final text = utf8.decode(chunk, allowMalformed: true);
          buffer += text;

          final parts = buffer.split('\n\n');
          buffer = parts.removeLast();

          for (final part in parts) {
            if (part.startsWith('data:')) {
              final jsonStr = part.substring(5).trim();
              if (jsonStr.isEmpty) continue;

              try {
                final json = jsonDecode(jsonStr) as Map<String, dynamic>;
                final event = SseEvent.fromJson(json);
                yield event;

                final shouldStop = event.maybeWhen(
                  error: (_) => true,
                  done: (u, p) => true,
                  orElse: () => false,
                );

                if (shouldStop) {
                  return;
                }
              } catch (e) {
                logger.e(
                  'SSE JSON parse xatosi: $jsonStr',
                  error: e,
                  stackTrace: StackTrace.current,
                );
              }
            }
          }
        }

        return;
      } catch (e) {
        if (cancelToken != null && cancelToken.isCancelled) {
          return;
        }

        // Interceptor xaritalagan `Failure` — auth/limit/ruxsat/validatsiya
        // qayta urinish bilan tuzalmaydi, darhol yuqoriga uzatiladi
        // (foydalanuvchi 7 s kutmaydi, xom matn ko'rsatilmaydi — §8.3).
        final failure = _failureOf(e);
        if (failure != null && !_isRetryable(failure)) {
          throw failure;
        }

        if (retryCount >= 3) {
          throw failure ?? const Failure.network();
        }

        final delay = (1 << retryCount) * 1000;
        await Future.delayed(Duration(milliseconds: delay));
        retryCount++;
      }
    }
  }

  /// `DioException.error` ichidagi `Failure` (ErrorMapperInterceptor) yoki
  /// to'g'ridan-to'g'ri `Failure`.
  static Failure? _failureOf(Object error) {
    if (error is Failure) return error;
    if (error is DioException && error.error is Failure) {
      return error.error! as Failure;
    }
    return null;
  }

  /// Faqat tarmoq va server tomonidagi vaqtinchalik xatolar qayta uriniladi.
  static bool _isRetryable(Failure failure) => failure.maybeWhen(
    network: () => true,
    server: () => true,
    serviceUnavailable: () => true,
    unknown: (_) => true,
    orElse: () => false,
  );
}
