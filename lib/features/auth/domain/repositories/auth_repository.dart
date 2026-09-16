import 'dart:async';

import 'package:alora_mobile/core/error/failure.dart';

import '../entities/user.dart';

/// Auth xizmati bilan ishlash interfeysi (login, session holati, cache)
abstract class AuthRepository {
  /// Session tugagan hodisasi (masalan refresh muvaffaqiyatsizligi).
  Stream<void> get onSessionExpired;

  /// Login: muvaffaqiyatli bo'lsa tokenlar saqlanadi, xato bo'lsa [Failure] tashlanadi.
  Future<void> login({required String phone, required String password});

  /// Saqlangan refresh token yordamida yangi tokenlar olish; muvaffaqiyatsizlikda [Failure].
  Future<void> refresh();

  /// Tizimdan chiqish: backend + lokal tozalash.
  Future<void> logout();

  /// Joriy foydalanuvchi ma'lumotlarini olish (token talab qilinadi).
  Future<User> me();

  Future<String?> getAccessToken();

  Future<String?> getRefreshToken();

  /// Offline holat uchun keshlangan foydalanuvchi.
  Future<User?> getCachedUser();

  /// Tokenlar va foydalanuvchi keshlarini tozalash.
  Future<void> clearSession();
}
