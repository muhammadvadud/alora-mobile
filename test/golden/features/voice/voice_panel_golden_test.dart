import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/features/voice/presentation/widgets/voice_panel.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';
import 'package:alora_mobile/features/voice/application/voice_notifier.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

// We override the notifier to simulate states
class FakeVoiceNotifier extends VoiceNotifier {
  final VoiceState _fakeState;

  FakeVoiceNotifier(this._fakeState);

  @override
  VoiceState build() => _fakeState;
}

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  testGoldens('VoicePanel golden (S-08) - idle state', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [Device.phone])
      ..addScenario(
        widget: ProviderScope(
          overrides: [voiceProvider.overrideWith(() => FakeVoiceNotifier(const VoiceState.idle()))],
          child: MaterialApp(
            theme: AppTheme.light(),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: const Locale('uz'),
            home: Scaffold(
              body: Align(
                alignment: Alignment.bottomCenter,
                child: VoicePanel(onClose: () {}),
              ),
            ),
          ),
        ),
        name: 'idle',
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'voice_panel_idle');
  });

  testGoldens('VoicePanel golden (S-08) - listening state', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [Device.phone])
      ..addScenario(
        widget: ProviderScope(
          overrides: [
            voiceProvider.overrideWith(
              () => FakeVoiceNotifier(
                const VoiceState.listening(
                  amplitude: 0.5,
                  duration: Duration(minutes: 1, seconds: 5),
                ),
              ),
            ),
          ],
          child: MaterialApp(
            theme: AppTheme.light(),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: const Locale('uz'),
            home: Scaffold(
              body: Align(
                alignment: Alignment.bottomCenter,
                child: VoicePanel(onClose: () {}),
              ),
            ),
          ),
        ),
        name: 'listening',
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'voice_panel_listening');
  });
}
