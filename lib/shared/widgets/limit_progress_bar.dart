import 'package:flutter/material.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';

class LimitProgressBar extends StatelessWidget {
  final double progress; // 0.0 to 1.0

  const LimitProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final clamped = progress.clamp(0.0, 1.0);

    Color progressColor;
    if (clamped < 0.8) {
      progressColor = colors.accent;
    } else if (clamped < 1.0) {
      progressColor = colors.warning;
    } else {
      progressColor = colors.danger;
    }

    final radius = AppRadius.progressBorder;

    return Container(
      height: 4,
      width: double.infinity,
      decoration: BoxDecoration(color: colors.borderSubtle, borderRadius: radius),
      alignment: Alignment.centerLeft,
      child: FractionallySizedBox(
        widthFactor: clamped,
        child: Container(
          decoration: BoxDecoration(color: progressColor, borderRadius: radius),
        ),
      ),
    );
  }
}
