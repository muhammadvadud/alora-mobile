import 'dart:convert';
import 'dart:math';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'secure_storage.g.dart';

/// SecureStorage uchun Riverpod provayderi
@Riverpod(keepAlive: true)
SecureStorage secureStorage(Ref ref) {
  return const SecureStorage();
}

/// Tokenlar va PIN-kodni xavfsiz saqlash xizmati
class SecureStorage {
  const SecureStorage();

  static const _storage = FlutterSecureStorage(aOptions: AndroidOptions());

  static const _keyAccess = 'access_token';
  static const _keyRefresh = 'refresh_token';
  static const _keyPin = 'customer_mode_pin';
  static const _keyCacheKey = 'cache_cipher_key';
  static const _keyPinLockUntil = 'customer_mode_pin_lock_until';
  static const _keyPinErrors = 'customer_mode_pin_errors';

  Future<void> saveTokens({
    required String access,
    required String refresh,
  }) async {
    await Future.wait([
      _storage.write(key: _keyAccess, value: access),
      _storage.write(key: _keyRefresh, value: refresh),
    ]);
  }

  Future<String?> getAccessToken() => _storage.read(key: _keyAccess);

  Future<String?> getRefreshToken() => _storage.read(key: _keyRefresh);

  Future<void> clearTokens() async {
    await Future.wait([
      _storage.delete(key: _keyAccess),
      _storage.delete(key: _keyRefresh),
    ]);
  }

  Future<void> savePin(String pin) => _storage.write(key: _keyPin, value: pin);

  Future<String?> getPin() => _storage.read(key: _keyPin);

  Future<void> clearPin() => _storage.delete(key: _keyPin);

  /// PIN brute-force holati (xato soni va qulf muddati) — ilova qayta
  /// ochilganda ham saqlanib qoladi (§12).
  Future<void> savePinLock({
    required int errorCount,
    DateTime? lockUntil,
  }) async {
    await Future.wait([
      _storage.write(key: _keyPinErrors, value: errorCount.toString()),
      lockUntil == null
          ? _storage.delete(key: _keyPinLockUntil)
          : _storage.write(
              key: _keyPinLockUntil,
              value: lockUntil.millisecondsSinceEpoch.toString(),
            ),
    ]);
  }

  Future<int> getPinErrorCount() async =>
      int.tryParse(await _storage.read(key: _keyPinErrors) ?? '') ?? 0;

  Future<DateTime?> getPinLockUntil() async {
    final raw = await _storage.read(key: _keyPinLockUntil);
    final ms = int.tryParse(raw ?? '');
    return ms == null ? null : DateTime.fromMillisecondsSinceEpoch(ms);
  }

  Future<void> clearPinLock() async {
    await Future.wait([
      _storage.delete(key: _keyPinErrors),
      _storage.delete(key: _keyPinLockUntil),
    ]);
  }

  /// Lokal kesh (box'lar) uchun AES-256 kaliti (32 bayt). Yo'q bo'lsa
  /// `Random.secure()` bilan yaratiladi — kalit faqat Keystore/Keychain'da.
  Future<List<int>> getOrCreateCacheKey() async {
    final existing = await _storage.read(key: _keyCacheKey);
    if (existing != null && existing.isNotEmpty) {
      return base64Url.decode(existing);
    }
    final random = Random.secure();
    final key = List<int>.generate(32, (_) => random.nextInt(256));
    await _storage.write(key: _keyCacheKey, value: base64Url.encode(key));
    return key;
  }
}
