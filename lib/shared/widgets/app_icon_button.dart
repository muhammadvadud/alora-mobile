import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';

enum AppIconButtonType { muted, accent }

class AppIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final String semanticLabel;
  final AppIconButtonType type;

  const AppIconButton.muted({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.semanticLabel,
  }) : type = AppIconButtonType.muted;

  const AppIconButton.accent({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.semanticLabel,
  }) : type = AppIconButtonType.accent;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    Color bgColor;
    Color iconColor;
    double size;
    double iconSize;

    if (type == AppIconButtonType.muted) {
      bgColor = colors.surfaceMuted;
      iconColor = colors.textPrimary;
      size = 44.0;
      iconSize = 24.0;
    } else {
      bgColor = colors.accent;
      iconColor = colors.onAccent;
      size = 32.0;
      iconSize = 20.0;
    }

    final double padding = size < 48.0 ? (48.0 - size) / 2 : 0.0;

    return Semantics(
      button: true,
      label: semanticLabel,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: InkResponse(
          onTap: onPressed,
          radius: size / 2,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
            child: Icon(icon, size: iconSize, color: iconColor),
          ),
        ),
      ),
    );
  }
}
