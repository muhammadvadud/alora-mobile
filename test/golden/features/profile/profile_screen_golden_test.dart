import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive/hive.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';
import 'package:alora_mobile/features/auth/application/providers.dart'
    as auth_providers;
import 'package:alora_mobile/features/profile/application/providers.dart'
    as profile_providers;
import 'package:alora_mobile/features/profile/presentation/screens/profile_screen.dart';

import '../../../helpers/fake_profile_repository.dart';
import '../../../unit/features/auth/auth_test_helpers.dart';

void main() {
  late Directory tempDir;

  setUpAll(() async {
    await loadAppFonts();
    tempDir = await Directory.systemTemp.createTemp();
    Hive.init(tempDir.path);
    await Hive.openBox('settings');
  });

  tearDownAll(() async {
    await Hive.deleteBoxFromDisk('settings');
    await tempDir.delete(recursive: true);
  });

  testGoldens('S-25 Profil sahifasi - Light & Dark', (tester) async {
    final authRepository = FakeAuthRepository()
      ..refreshToken = 'refresh-token'
      ..user = testUser();
    final profileRepository = FakeProfileRepository()
      ..limit = testProfileLimit(maxCostUzs: '200000.00')
      ..todayCost = 45000;

    Widget widgetFor(ThemeMode mode) {
      return ProviderScope(
        overrides: [
          auth_providers.authRepositoryProvider.overrideWithValue(
            authRepository,
          ),
          profile_providers.profileRepositoryProvider.overrideWithValue(
            profileRepository,
          ),
        ],
        child: MaterialApp(
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: mode,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('uz'),
          home: const ProfileScreen(),
        ),
      );
    }

    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [Device.phone])
      ..addScenario(name: 'Light', widget: widgetFor(ThemeMode.light))
      ..addScenario(name: 'Dark', widget: widgetFor(ThemeMode.dark));

    await tester.pumpDeviceBuilder(builder);
    await tester.pumpAndSettle();
    await screenMatchesGolden(tester, 'profile_screen');
  });
}
