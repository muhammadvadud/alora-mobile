import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart' show Override;

import 'package:alora_mobile/app/app.dart';
import 'package:alora_mobile/app/theme/theme_mode_notifier.dart';
import 'package:alora_mobile/core/connectivity/connectivity_notifier.dart';
import 'package:alora_mobile/core/storage/offline_queue_item.dart';
import 'package:alora_mobile/core/storage/secure_storage.dart';
import 'package:alora_mobile/features/auth/application/providers.dart';
import 'package:alora_mobile/features/catalog/application/providers.dart' as catalog_providers;
import 'package:alora_mobile/features/chat/application/providers.dart' as chat_providers;
import 'package:alora_mobile/features/conversations/application/providers.dart';
import 'package:alora_mobile/features/management/application/providers.dart'
    as management_providers;
import 'package:alora_mobile/features/orders/application/providers.dart';
import 'package:alora_mobile/features/profile/application/locale_notifier.dart';

import 'fakes.dart';

bool _storageInitialized = false;

/// Hive'ni vaqtinchalik katalogda ishga tushiradi (offline_queue adapteri bilan).
/// Har bir integration test fayli alohida jarayonda ishlaydi, shuning uchun
/// bir marta boshlash yetarli.
Future<void> initTestStorage() async {
  if (_storageInitialized) return;
  final dir = Directory.systemTemp.createTempSync('alora_it_hive_');
  Hive.init(dir.path);
  Hive.registerAdapter(OfflineQueueItemAdapter());
  _storageInitialized = true;
}

/// Barcha repozitoriylar fake'lar bilan override qilingan [ProviderContainer].
ProviderContainer createTestContainer({
  required FakeAuthRepository auth,
  required FakeChatRepository chat,
  required FakeConversationsRepository conversations,
  required FakeOrdersRepository orders,
  required FakeCatalogRepository catalog,
  required FakeConnectivityNotifier connectivity,
  FakeSecureStorage? secureStorage,
  FakeUsageRepository? usage,
  List<Override> extraOverrides = const [],
}) {
  return ProviderContainer(
    overrides: [
      authRepositoryProvider.overrideWithValue(auth),
      secureStorageProvider.overrideWithValue(secureStorage ?? FakeSecureStorage()),
      connectivityProvider.overrideWith(() => connectivity),
      chat_providers.chatRepositoryProvider.overrideWithValue(chat),
      conversationsRepositoryProvider.overrideWithValue(conversations),
      ordersRepositoryProvider.overrideWithValue(orders),
      catalog_providers.catalogRepositoryProvider.overrideWithValue(catalog),
      if (usage != null) management_providers.usageRepositoryProvider.overrideWithValue(usage),
      themeModeProvider.overrideWithValue(ThemeMode.light),
      localeProvider.overrideWithValue(const Locale('uz')),
      ...extraOverrides,
    ],
  );
}

/// Testda ishlatiladigan to'liq ilova (real router + shell + l10n).
Widget wrapApp(ProviderContainer container) {
  return UncontrolledProviderScope(container: container, child: const AloraApp());
}

/// SSE throttle (50 ms) va Hive I/O kabi haqiqiy timerlar tugashini kutib,
/// keyin freymlarni settle qiladi (fake vaqt `pumpAndSettle(duration)` bularni kutmaydi).
Future<void> settleReal(WidgetTester tester) async {
  await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 250)));
  await tester.pumpAndSettle();
}
