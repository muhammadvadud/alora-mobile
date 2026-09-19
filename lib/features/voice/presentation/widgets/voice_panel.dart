import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/shared/widgets/waveform.dart';

import 'package:alora_mobile/shared/widgets/typing_line.dart';

import 'transcript_block.dart';

import '../../application/voice_notifier.dart';

class VoicePanel extends ConsumerWidget {
  final VoidCallback onClose;

  const VoicePanel({super.key, required this.onClose});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(voiceProvider);
    final notifier = ref.read(voiceProvider.notifier);
    final colors = context.colors;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.l,
        vertical: AppSpacing.m,
      ),
      decoration: BoxDecoration(
        color: colors.background,
        border: Border(top: BorderSide(color: colors.borderSubtle)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          state.when(
            idle: () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: onClose,
                  icon: const Icon(AppIcons.keyboard),
                  label: Text(l10n.chat_textMode),
                ),
                IconButton(
                  icon: const Icon(AppIcons.mic),
                  onPressed: () => notifier.startListening(),
                ),
              ],
            ),
            listening: (amplitude, duration) => _ListeningView(
              notifier: notifier,
              amplitude: amplitude,
              duration: duration,
            ),
            transcribing: () => const Padding(
              padding: EdgeInsets.all(AppSpacing.l),
              child: TypingLine(),
            ),
            speaking: (amplitude) =>
                _SpeakingView(notifier: notifier, amplitude: amplitude),
            error: (msg) => Text(
              context.l10n.errorOccurred(msg),
              style: TextStyle(color: colors.danger),
            ),
          ),
        ],
      ),
    );
  }
}

class _ListeningView extends StatelessWidget {
  final VoiceNotifier notifier;
  final double amplitude;
  final Duration duration;

  const _ListeningView({
    required this.notifier,
    required this.amplitude,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final minutes = duration.inMinutes.toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');

    return Column(
      children: [
        Text(
          'Eshityapman… $minutes:$seconds',
          style: context.text.bodyS.copyWith(color: colors.textSecondary),
        ),
        const SizedBox(height: 12),
        const TranscriptBlock(text: '...', isFinal: false),
        const SizedBox(height: 12),
        Waveform(amplitudes: [amplitude], isAiSpeaking: false),
        const SizedBox(height: 16),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: colors.danger,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppRadius.pill)),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xxl,
              vertical: AppSpacing.m,
            ),
          ),
          onPressed: () => notifier.stopListening(),
          child: Text("To'xtatish", style: TextStyle(color: colors.surface)),
        ),
      ],
    );
  }
}

class _SpeakingView extends StatelessWidget {
  final VoiceNotifier notifier;
  final double amplitude;

  const _SpeakingView({required this.notifier, required this.amplitude});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Column(
      children: [
        Waveform(amplitudes: [amplitude], isAiSpeaking: true),
        const SizedBox(height: 16),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: colors.borderSubtle,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppRadius.pill)),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xxl,
              vertical: AppSpacing.m,
            ),
          ),
          onPressed: () => notifier.stopSpeaking(),
          child: Text(
            "To'xtatish",
            style: TextStyle(color: colors.textPrimary),
          ),
        ),
      ],
    );
  }
}
