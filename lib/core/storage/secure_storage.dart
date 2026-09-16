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
}
