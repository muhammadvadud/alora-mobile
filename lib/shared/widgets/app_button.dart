import 'package:alora_mobile/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';

enum AppButtonType { primary, secondary, text, destructive }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonType type;
  final bool isLoading;
  final bool isEnabled;
  final IconData? icon;
  final bool filled;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.type = AppButtonType.primary,
    this.isLoading = false,
    this.isEnabled = true,
    this.icon,
    this.filled = false,
  });

  const AppButton.secondary({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.icon,
  }) : type = AppButtonType.secondary,
       filled = false;

  const AppButton.text({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
  }) : type = AppButtonType.text,
       icon = null,
       filled = false;

  const AppButton.destructive({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
    this.filled = false,
  }) : type = AppButtonType.destructive,
       icon = null;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;
    final effectiveEnabled = isEnabled && !isLoading;
    final style = _AppButtonStyle(type, effectiveEnabled, colors, filled);

    Widget content = Text(text, style: typography.labelL.copyWith(color: style.textColor));

    if (isLoading) {
      content = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(style.textColor),
            ),
          ),
          const SizedBox(width: 8),
          content,
        ],
      );
    } else if (icon != null) {
      content = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: style.textColor),
          const SizedBox(width: 8),
          content,
        ],
      );
    }

    return Semantics(
      button: true,
      enabled: effectiveEnabled,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: SizedBox(
          height: 44,
          width: double.infinity,
          child: TextButton(
            onPressed: effectiveEnabled ? onPressed : null,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(style.backgroundColor),
              foregroundColor: WidgetStateProperty.all(style.textColor),
              overlayColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.pressed)) return style.overlayColor;
                return Colors.transparent;
              }),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: AppRadius.pillBorder, side: style.borderSide),
              ),
              padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 16)),
            ),
            child: content,
          ),
        ),
      ),
    );
  }
}

class _AppButtonStyle {
  late Color backgroundColor;
  late Color textColor;
  late BorderSide borderSide;
  late Color overlayColor;

  _AppButtonStyle(AppButtonType type, bool enabled, AppColors colors, bool filled) {
    borderSide = BorderSide.none;
    overlayColor = Colors.transparent;

    switch (type) {
      case AppButtonType.primary:
        backgroundColor = enabled ? colors.accent : colors.surfaceDisabled;
        textColor = enabled ? colors.onAccent : colors.textDisabled;
        overlayColor = colors.accentPressed;
        break;
      case AppButtonType.secondary:
        backgroundColor = enabled ? colors.surface : colors.surfaceDisabled;
        textColor = enabled ? colors.textPrimary : colors.textDisabled;
        borderSide = BorderSide(
          color: enabled ? colors.border : colors.surfaceDisabled,
          width: 1.0,
        );
        overlayColor = colors.borderSubtle;
        break;
      case AppButtonType.text:
        backgroundColor = Colors.transparent;
        textColor = enabled ? colors.info : colors.textDisabled;
        overlayColor = colors.infoSoft;
        break;
      case AppButtonType.destructive:
        if (filled) {
          backgroundColor = enabled ? colors.danger : colors.surfaceDisabled;
          textColor = enabled ? colors.onAccent : colors.textDisabled;
          overlayColor = colors.dangerSoft;
        } else {
          backgroundColor = enabled ? colors.surface : colors.surfaceDisabled;
          textColor = enabled ? colors.danger : colors.textDisabled;
          borderSide = BorderSide(
            color: enabled ? colors.border : colors.surfaceDisabled,
            width: 1.0,
          );
          overlayColor = colors.dangerSoft;
        }
        break;
    }
  }
}
