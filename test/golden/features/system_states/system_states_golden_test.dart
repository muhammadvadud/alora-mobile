import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/shared/widgets/empty_state.dart';
import 'package:alora_mobile/shared/widgets/error_state.dart';
import 'package:alora_mobile/shared/widgets/offline_banner.dart';
import 'package:alora_mobile/shared/widgets/skeleton.dart';
import 'package:alora_mobile/shared/widgets/limit_exceeded_view.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/features/auth/application/auth_notifier.dart';
import 'package:alora_mobile/features/auth/application/auth_state.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';

class MockAuthNotifier extends AuthNotifier {
  @override
  AuthState build() => const AuthState.unauthenticated();
}

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  Widget buildScenarios(ThemeMode mode) {
    return ProviderScope(
      overrides: [authProvider.overrideWith(MockAuthNotifier.new)],
      child: MaterialApp(
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        themeMode: mode,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                const Text('1. Offline Banner', textAlign: TextAlign.center),
                const OfflineBanner(),
                const SizedBox(height: 20),
                const Text('2. Error State', textAlign: TextAlign.center),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.l),
                  child: ErrorState(message: 'Something went wrong', onRetry: () {}),
                ),
                const SizedBox(height: 20),
                const Text('3. Empty State', textAlign: TextAlign.center),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSpacing.l),
                  child: EmptyState(
                    icon: AppIcons.inbox,
                    title: 'No Data',
                    message: 'Nothing here',
                  ),
                ),
                const SizedBox(height: 20),
                const Text('4. Skeleton', textAlign: TextAlign.center),
                const Padding(
                  padding: EdgeInsets.all(AppSpacing.m),
                  child: SkeletonList(
                    itemCount: 2,
                    itemBuilder: SkeletonBox(height: 60, borderRadius: AppRadius.card),
                  ),
                ),
                const SizedBox(height: 20),
                const Text('5. Limit Exceeded', textAlign: TextAlign.center),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSpacing.l),
                  child: LimitExceededView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  testGoldens('System States (S-26) - Light & Dark', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [Device.phone])
      ..addScenario(name: 'Light Mode', widget: buildScenarios(ThemeMode.light))
      ..addScenario(name: 'Dark Mode', widget: buildScenarios(ThemeMode.dark));

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'system_states_s26', customPump: (tester) => tester.pump());
  });
}
