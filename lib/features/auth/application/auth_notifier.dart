import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/utils/app_logger.dart';
import 'package:alora_mobile/core/error/error_reporter.dart';

import 'auth_state.dart';
import 'providers.dart';
import 'session_expired_notifier.dart';

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
      ref.read(sessionExpiredProvider.notifier).trigger();
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
      _setUnauthenticated();
      return;
    }

    try {
      await repository.refresh();
      final user = await repository.me();
      ref.read(errorReporterProvider).setUser(id: user.id, role: user.role.name);
      state = AuthState.authenticated(user: user);
    } on Failure catch (error) {
      if (error.maybeWhen(auth: () => true, orElse: () => false)) {
        await repository.clearSession();
      }
      _setUnauthenticated();
    }
  }

  /// Telefon va parol bilan kirish.
  /// Muvaffaqiyatli bo'lsa null, aks holda [Failure] qaytaradi.
  Future<Failure?> login({required String phone, required String password}) async {
    final repository = ref.read(authRepositoryProvider);
    try {
      await repository.login(phone: phone, password: password);
      final user = await repository.me();
      ref.read(errorReporterProvider).setUser(id: user.id, role: user.role.name);
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
    _setUnauthenticated();
  }

  void _setUnauthenticated() {
    ref.read(errorReporterProvider).clearUser();
    state = const AuthState.unauthenticated();
  }
}
