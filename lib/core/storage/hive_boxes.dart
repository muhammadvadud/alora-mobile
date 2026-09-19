import 'package:hive_flutter/hive_flutter.dart';

import 'offline_queue_item.dart';

/// Hive box nomlari, sxema versiyasi va shifrlangan ochish.
///
/// Prod'da barcha box'lar `HiveAesCipher` bilan ochiladi (kalit `SecureStorage`da,
/// `bootstrap` da `configureCipher` orqali beriladi). Testda cipher berilmaydi.
class HiveBoxes {
  HiveBoxes._();

  /// Joriy sxema versiyasi. Model yoki adapter o'zgarsa, buni oshirish kerak.
  static const int schemaVersion = 2;

  static const String authPrefs = 'auth_prefs';
  static const String catalogProducts = 'catalog_products';
  static const String catalogCategories = 'catalog_categories';
  static const String conversations = 'conversations';
  static const String messages = 'messages';
  static const String offlineQueue = 'offline_queue';
  static const String settings = 'settings';

  static const String _schemaVersionKey = 'schema_version';

  /// Foydalanuvchiga tegishli box'lar — logout'da tozalanadi (§8.2, §11).
  static const List<String> userScoped = [authPrefs, conversations, messages, offlineQueue];

  static HiveCipher? _cipher;

  /// Box'larni shifrlash uchun 32 baytlik kalit (`Hive.generateSecureKey()`).
  static void configureCipher(List<int> key) {
    _cipher = HiveAesCipher(key);
  }

  /// Box ochiq bo'lsa qaytaradi, aks holda (cipher bilan) ochadi.
  static Future<Box<T>> open<T>(String name) {
    if (Hive.isBoxOpen(name)) return Future.value(Hive.box<T>(name));
    return Hive.openBox<T>(name, encryptionCipher: _cipher);
  }

  /// Hive'ni ishga tushiradi va sxema versiyasi o'zgargan bo'lsa,
  /// eskilarni tozalaydi.
  static Future<void> init() async {
    await Hive.initFlutter();

    final versionBox = await Hive.openBox<int>('system_version');
    final savedVersion = versionBox.get(_schemaVersionKey, defaultValue: 0);

    if (savedVersion != schemaVersion) {
      await _clearAllDataBoxes();
      await versionBox.put(_schemaVersionKey, schemaVersion);
    }
  }

  /// Logout: joriy foydalanuvchi keshini o'chiradi (boshqa foydalanuvchi
  /// bir qurilmada kirsa, oldingi suhbat/xabarlar ko'rinmasin).
  static Future<void> clearUserData() async {
    for (final name in userScoped) {
      if (Hive.isBoxOpen(name)) {
        // Ochiq box'lar tipi bilan olinadi (Hive tipni qat'iy tekshiradi).
        final BoxBase<dynamic> box = switch (name) {
          messages => Hive.box<String>(name),
          offlineQueue => Hive.box<OfflineQueueItem>(name),
          _ => Hive.box<dynamic>(name),
        };
        await box.clear();
      } else {
        await Hive.deleteBoxFromDisk(name);
      }
    }
  }

  static Future<void> _clearAllDataBoxes() async {
    await Hive.deleteBoxFromDisk(authPrefs);
    await Hive.deleteBoxFromDisk(catalogProducts);
    await Hive.deleteBoxFromDisk(catalogCategories);
    await Hive.deleteBoxFromDisk(conversations);
    await Hive.deleteBoxFromDisk(messages);
    await Hive.deleteBoxFromDisk(offlineQueue);
    await Hive.deleteBoxFromDisk(settings);
  }
}
