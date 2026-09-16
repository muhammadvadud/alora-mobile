import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';

class Waveform extends StatelessWidget {
  final List<double> amplitudes; // 0.0 to 1.0, length up to 24
  final bool isAiSpeaking;

  const Waveform({
    super.key,
    required this.amplitudes,
    this.isAiSpeaking = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    // Waveform colors based on who is speaking
    final activeColor = isAiSpeaking ? colors.brass : colors.accent;
    final inactiveColor = colors.borderSubtle;

    // Pad or trim to exactly 24 bars
    final bars = List<double>.filled(24, 0.0);
    for (int i = 0; i < amplitudes.length && i < 24; i++) {
      bars[i] = amplitudes[i].clamp(0.0, 1.0);
    }

    return SizedBox(
      height: 48,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(24, (index) {
          final amplitude = bars[index];
          // Min height 4, max height 48
          final height = 4.0 + (amplitude * 44.0);

          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 2.0),
            width: 4,
            height: height,
            decoration: BoxDecoration(
              color: amplitude > 0 ? activeColor : inactiveColor,
              borderRadius: AppRadius.waveBorder,
            ),
          );
        }),
      ),
    );
  }
}
