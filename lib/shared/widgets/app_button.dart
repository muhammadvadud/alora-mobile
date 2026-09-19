import 'package:alora_mobile/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';

enum AppButtonType { primary, secondary, text, destructive, dialogDestructive }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonType type;
  final bool isLoading;
  final bool isEnabled;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.type = AppButtonType.primary,
    this.isLoading = false,
    this.isEnabled = true,
  });

  const AppButton.secondary({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
  }) : type = AppButtonType.secondary;

  const AppButton.text({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
  }) : type = AppButtonType.text;

  const AppButton.destructive({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
  }) : type = AppButtonType.destructive;

  const AppButton.dialogDestructive({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
  }) : type = AppButtonType.dialogDestructive;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    final effectiveEnabled = isEnabled && !isLoading;
    final style = _AppButtonStyle(type, effectiveEnabled, colors);

    Widget content = Text(text, style: typography.labelL.copyWith(color: style.textColor));

    if (isLoading) {
      content = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 14,
            height: 14,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(style.textColor),
            ),
          ),
          const SizedBox(width: 8),
          content,
        ],
      );
    }

    return SizedBox(
      height: 48,
      width: double.infinity,
      child: Center(
        child: SizedBox(
          height: 46,
          width: double.infinity,
          child: TextButton(
            onPressed: effectiveEnabled ? onPressed : null,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(style.backgroundColor),
              foregroundColor: WidgetStateProperty.all(style.textColor),
              overlayColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.pressed)) {
                  return style.overlayColor;
                }
                return const Color.fromARGB(0, 0, 0, 0);
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

  _AppButtonStyle(AppButtonType type, bool enabled, AppColors colors) {
    borderSide = BorderSide.none;
    overlayColor = const Color.fromARGB(0, 0, 0, 0);

    switch (type) {
      case AppButtonType.primary:
        backgroundColor = enabled ? colors.accent : colors.border;
        textColor = enabled ? colors.onAccent : colors.textDisabled;
        overlayColor = colors.accentPressed;
        break;
      case AppButtonType.secondary:
        backgroundColor = enabled ? colors.surface : colors.surfaceDisabled;
        textColor = enabled ? colors.textPrimary : colors.textDisabled;
        borderSide = BorderSide(color: enabled ? colors.border : colors.borderSubtle, width: 1.0);
        overlayColor = colors.borderSubtle;
        break;
      case AppButtonType.text:
        backgroundColor = const Color.fromARGB(0, 0, 0, 0);
        textColor = enabled ? colors.accent : colors.textDisabled;
        overlayColor = colors.accentSoft;
        break;
      case AppButtonType.destructive:
        backgroundColor = enabled ? colors.surface : colors.surfaceDisabled;
        textColor = enabled ? colors.danger : colors.textDisabled;
        borderSide = BorderSide(
          color: enabled ? colors.dangerSoft : colors.borderSubtle,
          width: 1.0,
        );
        overlayColor = colors.dangerSoft;
        break;
      case AppButtonType.dialogDestructive:
        backgroundColor = enabled ? colors.danger : colors.border;
        textColor = enabled ? colors.onAccent : colors.textDisabled;
        overlayColor = colors.dangerSoft;
        break;
    }
  }
}
