import 'package:flutter/material.dart';
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

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: backgroundColor ?? colors.inverse, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: Text(
        initial,
        style: typography.labelM.copyWith(color: foregroundColor ?? colors.onInverse),
      ),
    );
  }
}
