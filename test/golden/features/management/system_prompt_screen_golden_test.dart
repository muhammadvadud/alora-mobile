import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';
import 'package:alora_mobile/features/auth/application/auth_notifier.dart';
import 'package:alora_mobile/features/auth/application/auth_state.dart';
import 'package:alora_mobile/features/auth/domain/entities/user.dart';
import 'package:alora_mobile/features/management/settings/application/settings_notifiers.dart';
import 'package:alora_mobile/features/management/settings/domain/entities/prompt_version.dart';
import 'package:alora_mobile/features/management/settings/presentation/screens/system_prompt_screen.dart';
import 'package:alora_mobile/shared/models/role.dart';

class _FakePromptHistoryNotifier extends PromptHistoryNotifier {
  @override
  FutureOr<PromptHistory> build() {
    return PromptHistory(
      current: PromptVersion(
        id: '1',
        version: 2,
        content: 'Sen Alora uchun aqlli yordamchisan.',
        authorName: 'Admin',
        isCurrent: true,
        createdAt: DateTime(2026, 9, 15),
      ),
      history: const [
        PromptVersion(
          id: '1',
          version: 2,
          content: 'Sen Alora uchun aqlli yordamchisan.',
          authorName: 'Admin',
          isCurrent: true,
          createdAt: null,
        ),
      ],
    );
  }
}

const _adminUser = User(
  id: '1',
  role: Role.admin,
  phone: '+998901234567',
  fullName: 'Muhammad',
  tenant: 'alora',
);

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  testGoldens('SystemPromptScreen - yorug\' va qorong\'i', (tester) async {
    Widget widgetFor(ThemeMode mode) {
      return ProviderScope(
        overrides: [
          authProvider.overrideWithValue(
            const AuthState.authenticated(user: _adminUser),
          ),
          promptHistoryProvider.overrideWith(
            () => _FakePromptHistoryNotifier(),
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
          home: const SystemPromptScreen(),
        ),
      );
    }

    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [Device.phone])
      ..addScenario(name: 'Light', widget: widgetFor(ThemeMode.light))
      ..addScenario(name: 'Dark', widget: widgetFor(ThemeMode.dark));

    await tester.pumpDeviceBuilder(builder);
    await tester.pumpAndSettle();
    await screenMatchesGolden(tester, 'system_prompt_screen');
  });
}
