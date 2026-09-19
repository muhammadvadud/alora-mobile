import 'dart:async';
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/storage/hive_boxes.dart';
import 'package:alora_mobile/core/storage/secure_storage.dart';
import 'package:alora_mobile/core/utils/app_logger.dart';

import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_ds.dart';
import '../dto/auth_me_dto.dart';
import '../mappers/auth_me_mapper.dart';

/// AuthRepository'ning haqiqiy amalga oshirishi.
/// Tokenlar secure storage'da, foydalanuvchi keshi Hive 'auth_prefs' da saqlanadi.
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._remote, this._secureStorage);

  final AuthRemoteDataSource _remote;
  final SecureStorage _secureStorage;

  static const _cachedUserKey = 'cached_user';

  final StreamController<void> _sessionExpiredController =
      StreamController<void>.broadcast();

  Future<Box<dynamic>>? _boxFuture;

  @override
  Stream<void> get onSessionExpired => _sessionExpiredController.stream;

  Future<Box<dynamic>> _box() {
    final existing = _boxFuture;
    if (existing != null) return existing;
    final created = HiveBoxes.open<dynamic>(HiveBoxes.authPrefs);
    return _boxFuture = created;
  }

  @override
  Future<void> login({required String phone, required String password}) async {
    final tokens = await _remote.login(phone: phone, password: password);
    await _secureStorage.saveTokens(
      access: tokens.access,
      refresh: tokens.refresh,
    );
  }

  @override
  Future<void> refresh() async {
    final refreshToken = await _secureStorage.getRefreshToken();
    if (refreshToken == null) {
      throw const Failure.auth();
    }
    final tokens = await _remote.refresh(refreshToken);
    await _secureStorage.saveTokens(
      access: tokens.access,
      refresh: tokens.refresh,
    );
  }

  @override
  Future<void> logout() async {
    final refreshToken = await _secureStorage.getRefreshToken();
    if (refreshToken != null) {
      try {
        await _remote.logout(refreshToken);
      } on Failure catch (error) {
        logger.w('Logout API xatosi (lokal tozalanadi): $error');
      }
    }
    await clearSession();
  }

  @override
  Future<User> me() async {
    final AuthMeDto dto;
    try {
      dto = await _remote.me();
    } on Failure catch (error) {
      final isNetwork = error.maybeWhen(
        network: () => true,
        orElse: () => false,
      );
      if (isNetwork) {
        final cached = await getCachedUser();
        if (cached != null) return cached;
      }
      rethrow;
    }
    await _cacheUser(dto);
    return dto.toUser();
  }

  @override
  Future<String?> getAccessToken() => _secureStorage.getAccessToken();

  @override
  Future<String?> getRefreshToken() => _secureStorage.getRefreshToken();

  @override
  Future<User?> getCachedUser() async {
    final box = await _box();
    final raw = box.get(_cachedUserKey);
    if (raw is! String || raw.isEmpty) return null;
    try {
      final dto = AuthMeDto.fromJson(
        Map<String, dynamic>.from(jsonDecode(raw) as Map),
      );
      return dto.toUser();
    } catch (error) {
      logger.w("Keshlangan foydalanuvchini o'qishda xato: $error");
      return null;
    }
  }

  @override
  Future<void> clearSession() async {
    await _secureStorage.clearTokens();
    // Suhbat/xabar/navbat keshi ham o'chadi — boshqa foydalanuvchiga ko'rinmasin.
    await HiveBoxes.clearUserData();
    _sessionExpiredController.add(null);
  }

  Future<void> _cacheUser(AuthMeDto dto) async {
    final box = await _box();
    await box.put(_cachedUserKey, jsonEncode(dto.toJson()));
  }
}
