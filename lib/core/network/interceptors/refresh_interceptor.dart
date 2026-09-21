import 'dart:async';

import 'package:dio/dio.dart';

import '../api_paths.dart';
import '../../storage/secure_storage.dart';

class RefreshInterceptor extends Interceptor {
  final SecureStorage secureStorage;
  final Dio dio;

  bool _isRefreshing = false;
  Completer<String?>? _refreshTokenCompleter;

  RefreshInterceptor(this.secureStorage, this.dio);

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401 ||
        err.requestOptions.path == ApiPaths.login ||
        err.requestOptions.path == ApiPaths.refresh ||
        err.requestOptions.extra['is_retry'] == true) {
      return handler.next(err);
    }

    final currentRefreshToken = await secureStorage.getRefreshToken();

    if (currentRefreshToken == null) {
      await secureStorage.clearTokens();
      return handler.next(err);
    }

    if (_isRefreshing) {
      final newAccessToken = await _refreshTokenCompleter?.future;
      if (newAccessToken != null) {
        final options = err.requestOptions;
        options.headers['Authorization'] = 'Bearer $newAccessToken';
        try {
          final response = await dio.fetch(options);
          return handler.resolve(response);
        } on DioException catch (e) {
          return handler.next(e);
        }
      } else {
        return handler.next(err);
      }
    }

    _isRefreshing = true;
    _refreshTokenCompleter = Completer<String?>();

    String? fetchedAccess;
    String? fetchedRefresh;

    try {
      final refreshDio = Dio(dio.options);
      refreshDio.httpClientAdapter = dio.httpClientAdapter;
      final response = await refreshDio.post(
        ApiPaths.refresh,
        data: {'refresh': currentRefreshToken},
      );

      final responseData = response.data as Map<String, dynamic>;
      fetchedAccess = responseData['access'] as String?;
      fetchedRefresh = responseData['refresh'] as String?;
    } on DioException catch (e) {
      // Tokenlar faqat backend refresh'ni rad etganda (4xx) tozalanadi.
      // Tarmoq uzilishi/5xx da sessiya saqlanadi — foydalanuvchi bekorga
      // login'ga tushmaydi, keyingi so'rov yana refresh qiladi.
      final status = e.response?.statusCode;
      if (status != null && status >= 400 && status < 500) {
        await secureStorage.clearTokens();
      }
      _refreshTokenCompleter?.complete(null);
      _isRefreshing = false;
      _refreshTokenCompleter = null;
      return handler.next(err);
    } catch (e) {
      _refreshTokenCompleter?.complete(null);
      _isRefreshing = false;
      _refreshTokenCompleter = null;
      return handler.next(err);
    }

    if (fetchedAccess != null && fetchedRefresh != null) {
      // Sessiya o'zgargan bo'lsa (logout/akkaunt almashish) eski sessiya
      // natijasini saqlamaslik uchun qayta tekshiramiz. Refresh boshlangach
      // tokenlar tozalangan yoki almashtirilgan bo'lsa — yangilangan tokenlar
      // bekor qilinadi va so'rov qayta urinilmaydi.
      final storedRefreshToken = await secureStorage.getRefreshToken();
      if (storedRefreshToken == null || storedRefreshToken != currentRefreshToken) {
        _refreshTokenCompleter?.complete(null);
        _isRefreshing = false;
        _refreshTokenCompleter = null;
        return handler.next(err);
      }
      await secureStorage.saveTokens(access: fetchedAccess, refresh: fetchedRefresh);
      _refreshTokenCompleter?.complete(fetchedAccess);

      final options = err.requestOptions;
      options.headers['Authorization'] = 'Bearer $fetchedAccess';
      options.extra['is_retry'] = true;

      _isRefreshing = false;
      _refreshTokenCompleter = null;

      try {
        final retryResponse = await dio.fetch(options);
        return handler.resolve(retryResponse);
      } on DioException catch (e) {
        return handler.next(e);
      }
    } else {
      await secureStorage.clearTokens();
      _refreshTokenCompleter?.complete(null);
      _isRefreshing = false;
      _refreshTokenCompleter = null;
      return handler.next(err);
    }
  }
}
