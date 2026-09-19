import 'package:flutter/material.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';

class LetterAvatar extends StatelessWidget {
  final String text;
  final String? name;
  final double size;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const LetterAvatar({
    super.key,
    this.text = '',
    this.name,
    this.size = 40,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    final effectiveText = name ?? text;

    final String initial = effectiveText.trim().isNotEmpty
        ? effectiveText.trim()[0].toUpperCase()
        : '?';

    // SPEC §5: `avatar` radius (8), `surfaceMuted` fon, `titleS` matn; 64 da `titleL`.
    final textStyle = size >= 56 ? typography.titleL : typography.titleS;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? colors.surfaceMuted,
        borderRadius: AppRadius.avatarBorder,
      ),
      alignment: Alignment.center,
      child: Text(initial, style: textStyle.copyWith(color: foregroundColor ?? colors.textPrimary)),
    );
  }
}
