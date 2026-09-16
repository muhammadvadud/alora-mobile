import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:alora_mobile/core/dev/component_gallery.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  Widget buildGallery(ThemeMode mode) {
    return MaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: mode,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const ComponentGallery(showAnimations: false),
    );
  }

  testGoldens('Component Gallery - Light & Dark', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [Device.phone])
      ..addScenario(name: 'Light Mode', widget: buildGallery(ThemeMode.light))
      ..addScenario(name: 'Dark Mode', widget: buildGallery(ThemeMode.dark));

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'component_gallery');
  });
}
