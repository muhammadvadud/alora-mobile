import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';
import 'package:alora_mobile/features/profile/presentation/widgets/language_section.dart';

void main() {
  late Directory tempDir;

  setUpAll(() async {
    tempDir = await Directory.systemTemp.createTemp();
    Hive.init(tempDir.path);
    await Hive.openBox('settings');
  });

  tearDownAll(() async {
    await Hive.deleteBoxFromDisk('settings');
    await tempDir.delete(recursive: true);
  });

  Widget app() {
    return ProviderScope(
      child: MaterialApp(
        theme: AppTheme.light(),
        locale: const Locale('uz'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        home: const Scaffold(body: LanguageSection()),
      ),
    );
  }

  testWidgets('til chipi bosilganda Hive shu tilni saqlaydi', (tester) async {
    // Hive yozuvi FakeAsync zonasida tugamaydi — haqiqiy async zonada bajariladi.
    await tester.runAsync(() async {
      final box = Hive.box('settings');

      await tester.pumpWidget(app());

      await tester.tap(find.text('Кирилл'));
      await tester.pump();
      expect(box.get('locale'), 'uz_Cyrl');

      await tester.tap(find.text('Русский'));
      await tester.pump();
      expect(box.get('locale'), 'ru');

      await tester.tap(find.text("O'zbek"));
      await tester.pump();
      expect(box.get('locale'), 'uz');
    });
  });
}
