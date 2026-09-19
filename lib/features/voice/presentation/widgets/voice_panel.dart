import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/shared/widgets/waveform.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';

import '../../application/voice_notifier.dart';

class VoicePanel extends ConsumerWidget {
  final VoidCallback onClose;

  const VoicePanel({super.key, required this.onClose});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(voiceProvider);
    final notifier = ref.read(voiceProvider.notifier);
    final colors = context.colors;
    final typography = context.text;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      color: colors.surface,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l, vertical: AppSpacing.xl),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          state.when(
            idle: () => _StatusView(
              statusText: 'Kutmoqda...',
              waveformAmplitudes: const [0.1],
              onStop: onClose,
            ),
            listening: (amplitude, duration) => _StatusView(
              statusText: l10n.chat_listening,
              waveformAmplitudes: [amplitude],
              onStop: () {
                notifier.stopListening();
                onClose();
              },
              isAiSpeaking: false,
            ),
            transcribing: () => _StatusView(
              statusText: 'Tahlil qilinmoqda...',
              waveformAmplitudes: const [0.5],
              onStop: onClose,
            ),
            speaking: (amplitude) => _StatusView(
              statusText: 'Gapiryapti...',
              waveformAmplitudes: [amplitude],
              onStop: () {
                notifier.stopSpeaking();
                onClose();
              },
              isAiSpeaking: true,
            ),
            error: (msg) => Text(
              context.l10n.errorOccurred(msg),
              style: typography.bodyL.copyWith(color: colors.danger),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusView extends StatelessWidget {
  final String statusText;
  final List<double> waveformAmplitudes;
  final VoidCallback onStop;
  final bool isAiSpeaking;

  const _StatusView({
    required this.statusText,
    required this.waveformAmplitudes,
    required this.onStop,
    this.isAiSpeaking = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        SizedBox(
          height: 100,
          child: Center(
            child: Waveform(amplitudes: waveformAmplitudes, isAiSpeaking: isAiSpeaking),
          ),
        ),
        const SizedBox(height: AppSpacing.m),
        Text(statusText, style: typography.bodyL.copyWith(color: colors.textSecondary)),
        const SizedBox(height: AppSpacing.xl),
        AppButton.secondary(text: l10n.common_cancel, onPressed: onStop),
      ],
    );
  }
}
