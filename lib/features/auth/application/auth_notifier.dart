import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/utils/app_logger.dart';

import 'auth_state.dart';
import 'providers.dart';

part 'auth_notifier.g.dart';

/// Auth holatini boshqaruvchi notifier.
/// Ilovada sessiyani tiklaydi, login/logout amallarini bajardi.
@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  StreamSubscription<void>? _sessionExpiredSub;

  @override
  AuthState build() {
    final repository = ref.read(authRepositoryProvider);
    _sessionExpiredSub = repository.onSessionExpired.listen((_) {
      _setUnauthenticated();
    });
    ref.onDispose(() => _sessionExpiredSub?.cancel());

    unawaited(_initialize());
    return const AuthState.unknown();
  }

  /// Saqlangan refresh token bo'lsa sessiyani tiklaydi.
  Future<void> _initialize() async {
    final repository = ref.read(authRepositoryProvider);

    final refreshToken = await repository.getRefreshToken();
    if (refreshToken == null) {
      state = const AuthState.unauthenticated();
      return;
    }

    try {
      await repository.refresh();
      final user = await repository.me();
      state = AuthState.authenticated(user: user);
    } on Failure catch (error) {
      if (error.maybeWhen(auth: () => true, orElse: () => false)) {
        await repository.clearSession();
      }
      state = const AuthState.unauthenticated();
    }
  }

  /// Telefon va parol bilan kirish.
  /// Muvaffaqiyatli bo'lsa null, aks holda [Failure] qaytaradi.
  Future<Failure?> login({
    required String phone,
    required String password,
  }) async {
    final repository = ref.read(authRepositoryProvider);
    try {
      await repository.login(phone: phone, password: password);
      final user = await repository.me();
      state = AuthState.authenticated(user: user);
      return null;
    } on Failure catch (error) {
      return error;
    } catch (error) {
      logger.e('Login kutilmagan xato', error: error);
      return Failure.unknown(error.toString());
    }
  }

  /// Tizimdan chiqish.
  Future<void> logout() async {
    final repository = ref.read(authRepositoryProvider);
    try {
      await repository.logout();
    } on Failure catch (error) {
      logger.w('Logout xatosi: $error');
    }
    state = const AuthState.unauthenticated();
  }

  void _setUnauthenticated() {
    state = const AuthState.unauthenticated();
  }
}
