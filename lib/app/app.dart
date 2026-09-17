import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/router/app_router.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';
import 'package:alora_mobile/app/theme/theme_mode_notifier.dart';
import 'package:alora_mobile/features/profile/application/locale_notifier.dart';

class AloraApp extends StatelessWidget {
  const AloraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final router = ref.watch(appRouterProvider);
        final themeMode = ref.watch(themeModeProvider);
        final locale = ref.watch(localeProvider);

        return MaterialApp.router(
          routerConfig: router,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: themeMode,
          locale: locale,
          onGenerateTitle: (context) => AppLocalizations.of(context)!.app_name,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('uz'),
            Locale('uz', 'Cyrl'),
            Locale('ru'),
          ],
        );
      },
    );
  }
}
