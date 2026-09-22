import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alora_mobile/app/session/user_scoped_state.dart';
import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/utils/app_logger.dart';
import 'package:alora_mobile/core/error/error_reporter.dart';
import 'package:alora_mobile/core/session/session_events.dart';

import 'auth_state.dart';
import 'providers.dart';
import 'session_expired_notifier.dart';
import '../domain/entities/user.dart';

part 'auth_notifier.g.dart';

/// Auth holatini boshqaruvchi notifier.
/// Ilovada sessiyani tiklaydi, login/logout amallarini bajardi.
@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  StreamSubscription<void>? _sessionExpiredSub;
  String? _lastSeenUserId;

  @override
  AuthState build() {
    final repository = ref.read(authRepositoryProvider);
    void onExpired(_) {
      // Ikkala manba: repository.clearSession() va RefreshInterceptor (401, refresh rad).
      if (state != const AuthState.unauthenticated()) {
        _setUnauthenticated();
        ref.read(sessionExpiredProvider.notifier).trigger();
      }
    }

    _sessionExpiredSub = repository.onSessionExpired.listen(onExpired);
    final networkSub = ref.read(sessionEventsProvider).onExpired.listen(onExpired);
    ref.onDispose(() {
      _sessionExpiredSub?.cancel();
      networkSub.cancel();
    });

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
      _setAuthenticated(user);
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
      _setAuthenticated(user);
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
    _lastSeenUserId = null;
    ref.read(errorReporterProvider).clearUser();
    state = const AuthState.unauthenticated();
    resetUserScopedState(ref);
  }

  void _setAuthenticated(User user) {
    final previousWasUnauthenticated = state.maybeWhen(
      unauthenticated: () => true,
      orElse: () => false,
    );
    final userChanged = _lastSeenUserId != null && _lastSeenUserId != user.id;
    _lastSeenUserId = user.id;
    ref.read(errorReporterProvider).setUser(id: user.id, role: user.role.name);
    state = AuthState.authenticated(user: user);
    // Eski foydalanuvchining keshlarini tozalash: logout'dan keyin yangi
    // akkaunt kirganda oldingi foydalanuvchi ma'lumotlari ko'rinmasligi uchun.
    // Cold start'da (unknown -> authenticated) invalidatsiya qilinmaydi,
    // aks holda yangilanish ekran o'rnatilishidan oldin ma'lumotsiz boshlanadi.
    if (previousWasUnauthenticated || userChanged) {
      resetUserScopedState(ref);
    }
  }
}
