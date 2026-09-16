import 'package:hive_flutter/hive_flutter.dart';

/// Hive box nomlari va sxema versiyasi
class HiveBoxes {
  HiveBoxes._();

  /// Joriy sxema versiyasi. Model yoki adapter o'zgarsa, buni oshirish kerak.
  static const int schemaVersion = 1;

  static const String authPrefs = 'auth_prefs';
  static const String catalogProducts = 'catalog_products';
  static const String catalogCategories = 'catalog_categories';
  static const String conversations = 'conversations';
  static const String messages = 'messages';
  static const String offlineQueue = 'offline_queue';
  static const String settings = 'settings';

  static const String _schemaVersionKey = 'schema_version';

  /// Hive'ni ishga tushiradi, adapterlarni ro'yxatdan o'tkazadi
  /// va sxema versiyasi o'zgargan bo'lsa, eskilarni tozalaydi.
  static Future<void> init() async {
    await Hive.initFlutter();

    // Adapterlarni ro'yxatdan o'tkazish
    // Hive.registerAdapter(MyModelAdapter());
    // ...

    // Sxema tekshiruvi va tozalash
    final versionBox = await Hive.openBox<int>('system_version');
    final savedVersion = versionBox.get(_schemaVersionKey, defaultValue: 0);

    if (savedVersion != schemaVersion) {
      await _clearAllDataBoxes();
      await versionBox.put(_schemaVersionKey, schemaVersion);
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
