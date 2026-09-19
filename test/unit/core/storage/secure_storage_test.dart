import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/core/storage/secure_storage.dart';

void main() {
  setUp(() {
    FlutterSecureStorage.setMockInitialValues({});
  });

  group('SecureStorage', () {
    test('saveTokens va getAccessToken/getRefreshToken', () async {
      const storage = SecureStorage();

      await storage.saveTokens(access: 'access_123', refresh: 'refresh_456');

      expect(await storage.getAccessToken(), 'access_123');
      expect(await storage.getRefreshToken(), 'refresh_456');
    });

    test('clearTokens tozalaydi', () async {
      const storage = SecureStorage();

      await storage.saveTokens(access: 'old_access', refresh: 'old_refresh');

      expect(await storage.getAccessToken(), 'old_access');

      await storage.clearTokens();

      expect(await storage.getAccessToken(), isNull);
      expect(await storage.getRefreshToken(), isNull);
    });

    test('savePin, getPin, clearPin', () async {
      const storage = SecureStorage();

      expect(await storage.getPin(), isNull);

      await storage.savePin('1234');
      expect(await storage.getPin(), '1234');

      await storage.clearPin();
      expect(await storage.getPin(), isNull);
    });

    test('saveTokens qayta yozish — eski qiymatlar almashtiriladi', () async {
      const storage = SecureStorage();

      await storage.saveTokens(access: 'first_access', refresh: 'first_refresh');

      await storage.saveTokens(access: 'second_access', refresh: 'second_refresh');

      expect(await storage.getAccessToken(), 'second_access');
      expect(await storage.getRefreshToken(), 'second_refresh');
    });

    test('secureStorageProvider ishlaydi va bir xil instansiyani qaytaradi', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final storage = container.read(secureStorageProvider);
      expect(storage, isA<SecureStorage>());

      // keepAlive: yana o'qilganda bir xil instansiya
      expect(container.read(secureStorageProvider), same(storage));

      await storage.saveTokens(access: 'test_access', refresh: 'test_refresh');
      expect(await storage.getAccessToken(), 'test_access');
    });

    test('PIN bo\'sh holatda null qaytaradi', () async {
      const storage = SecureStorage();
      expect(await storage.getPin(), isNull);
    });

    test('tokenlar mustaqil saqlanadi', () async {
      const storage = SecureStorage();

      await storage.saveTokens(access: 'acc', refresh: 'ref');

      // clearTokens refresh ni ham o'chiradi
      expect(await storage.getRefreshToken(), 'ref');

      await storage.clearTokens();
      expect(await storage.getAccessToken(), isNull);
      expect(await storage.getRefreshToken(), isNull);
    });
  });
}
