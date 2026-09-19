import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/features/voice/presentation/widgets/voice_panel.dart';
import 'package:alora_mobile/features/voice/application/voice_notifier.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';

class FakeVoiceNotifier extends VoiceNotifier {
  final VoiceState _fakeState;
  FakeVoiceNotifier(this._fakeState);
  @override
  VoiceState build() => _fakeState;
}

void main() {
  testWidgets('VoicePanel shows initial idle state', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [voiceProvider.overrideWith(() => FakeVoiceNotifier(const VoiceState.idle()))],
        child: MaterialApp(
          theme: AppTheme.light(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('uz'),
          home: Scaffold(body: VoicePanel(onClose: () {})),
        ),
      ),
    );

    expect(find.text("Kutmoqda..."), findsOneWidget);
    expect(find.byType(AppButton), findsOneWidget); 
  });
}
