import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alora_mobile/app/global_listeners.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/router/app_router.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';
import 'package:alora_mobile/app/theme/theme_mode_notifier.dart';
import 'package:alora_mobile/features/profile/application/locale_notifier.dart';
import 'package:alora_mobile/features/customer_mode/application/providers.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class AloraApp extends StatelessWidget {
  const AloraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final router = ref.watch(appRouterProvider);
        final themeMode = ref.watch(themeModeProvider);
        final locale = ref.watch(localeProvider);
        final customerMode = ref.watch(customerModeEnabledProvider);

        return MaterialApp.router(
          scaffoldMessengerKey: scaffoldMessengerKey,
          routerConfig: router,
          theme: AppTheme.light(isCustomerMode: customerMode),
          darkTheme: AppTheme.dark(isCustomerMode: customerMode),
          themeMode: themeMode,
          locale: locale,
          onGenerateTitle: (context) => AppLocalizations.of(context)!.app_name,
          builder: (context, child) => GlobalListeners(child: child ?? const SizedBox.shrink()),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('uz'), Locale('uz', 'Cyrl'), Locale('ru')],
        );
      },
    );
  }
}
