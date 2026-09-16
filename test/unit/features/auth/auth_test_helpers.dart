import 'dart:async';

import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/features/auth/domain/entities/user.dart';
import 'package:alora_mobile/features/auth/domain/repositories/auth_repository.dart';
import 'package:alora_mobile/shared/models/role.dart';

/// Testlarda ishlatiladigan [User] namunasi.
User testUser({Role role = Role.manager}) {
  return User(
    id: 'user-1',
    phone: '+998901234567',
    fullName: 'Test User',
    role: role,
    tenant: 'alora-pardalar',
  );
}

/// [AuthRepository] interfeysining boshqariladigan fakesi.
/// Xatoliklar va hodisalar testda sozlanadi, chaqiruvlar hisoblanadi.
class FakeAuthRepository implements AuthRepository {
  final _sessionExpiredController = StreamController<void>.broadcast();

  String? accessToken;
  String? refreshToken;
  User? user;

  Failure? loginFailure;
  Failure? refreshFailure;
  Failure? meFailure;
  Failure? logoutFailure;

  int loginCalls = 0;
  int logoutCalls = 0;
  int clearSessionCalls = 0;

  @override
  Stream<void> get onSessionExpired => _sessionExpiredController.stream;

  @override
  Future<void> login({required String phone, required String password}) async {
    loginCalls++;
    final failure = loginFailure;
    if (failure != null) throw failure;
    accessToken = 'access-token';
    refreshToken = 'refresh-token';
  }

  @override
  Future<void> refresh() async {
    final failure = refreshFailure;
    if (failure != null) throw failure;
  }

  @override
  Future<void> logout() async {
    logoutCalls++;
    final failure = logoutFailure;
    if (failure != null) throw failure;
    accessToken = null;
    refreshToken = null;
  }

  @override
  Future<User> me() async {
    final failure = meFailure;
    if (failure != null) throw failure;
    return user ?? testUser();
  }

  @override
  Future<String?> getAccessToken() async => accessToken;

  @override
  Future<String?> getRefreshToken() async => refreshToken;

  @override
  Future<User?> getCachedUser() async => user;

  @override
  Future<void> clearSession() async {
    clearSessionCalls++;
    accessToken = null;
    refreshToken = null;
  }

  /// Sessiya tugagan hodisasini chiqaradi.
  void emitSessionExpired() => _sessionExpiredController.add(null);

  Future<void> dispose() => _sessionExpiredController.close();
}
