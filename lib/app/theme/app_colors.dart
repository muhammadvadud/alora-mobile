import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  final Color background;
  final Color surface;
  final Color surfaceMuted;
  final Color surfaceDisabled;
  final Color textPrimary;
  final Color textSecondary;
  final Color textDisabled;
  final Color border;
  final Color borderSubtle;
  final Color accent;
  final Color accentPressed;
  final Color accentSoft;
  final Color warning;
  final Color warningSoft;
  final Color danger;
  final Color dangerSoft;
  final Color success;
  final Color successSoft;
  final Color info;
  final Color infoSoft;
  final Color inverse;
  final Color onInverse;
  final Color onAccent;

  const AppColors({
    required this.background,
    required this.surface,
    required this.surfaceMuted,
    required this.surfaceDisabled,
    required this.textPrimary,
    required this.textSecondary,
    required this.textDisabled,
    required this.border,
    required this.borderSubtle,
    required this.accent,
    required this.accentPressed,
    required this.accentSoft,
    required this.warning,
    required this.warningSoft,
    required this.danger,
    required this.dangerSoft,
    required this.success,
    required this.successSoft,
    required this.info,
    required this.infoSoft,
    required this.inverse,
    required this.onInverse,
    required this.onAccent,
  });

  static const AppColors light = AppColors(
    background: Color(0xFFFFFFFF),
    surface: Color(0xFFFFFFFF),
    surfaceMuted: Color(0xFFF3F3F3),
    surfaceDisabled: Color(0xFFE8E8E8),
    textPrimary: Color(0xFF0D0D0D),
    textSecondary: Color(0xFF5D5D5D),
    textDisabled: Color(0xFF8F8F8F),
    border: Color(0xFFE8E8E8),
    borderSubtle: Color(0xFFF3F3F3),
    accent: Color(0xFF0D0D0D),
    accentPressed: Color(0xFF303030),
    accentSoft: Color(0xFFF3F3F3),
    warning: Color(0xFFE25507),
    warningSoft: Color(0xFFFDEEE6),
    danger: Color(0xFFE02E2A),
    dangerSoft: Color(0xFFFCEAEA),
    success: Color(0xFF008635),
    successSoft: Color(0xFFE6F4EC),
    info: Color(0xFF0285FF),
    infoSoft: Color(0xFFE6F2FF),
    inverse: Color(0xFF0D0D0D),
    onInverse: Color(0xFFFFFFFF),
    onAccent: Color(0xFFFFFFFF),
  );

  static const AppColors dark = AppColors(
    background: Color(0xFF212121),
    surface: Color(0xFF212121),
    surfaceMuted: Color(0xFF303030),
    surfaceDisabled: Color(0xFF414141),
    textPrimary: Color(0xFFFFFFFF),
    textSecondary: Color(0xFFCDCDCD),
    textDisabled: Color(0xFFAFAFAF),
    border: Color(0xFF414141),
    borderSubtle: Color(0xFF303030),
    accent: Color(0xFFFFFFFF),
    accentPressed: Color(0xFFE8E8E8),
    accentSoft: Color(0xFF303030),
    warning: Color(0xFFFF9E6C),
    warningSoft: Color(0xFF3A2416),
    danger: Color(0xFFFF8583),
    dangerSoft: Color(0xFF3A1F1F),
    success: Color(0xFF40C977),
    successSoft: Color(0xFF14301F),
    info: Color(0xFF0285FF),
    infoSoft: Color(0xFF0B2A4A),
    inverse: Color(0xFFFFFFFF),
    onInverse: Color(0xFF0D0D0D),
    onAccent: Color(0xFF0D0D0D),
  );

  @override
  AppColors copyWith({
    Color? background,
    Color? surface,
    Color? surfaceMuted,
    Color? surfaceDisabled,
    Color? textPrimary,
    Color? textSecondary,
    Color? textDisabled,
    Color? border,
    Color? borderSubtle,
    Color? accent,
    Color? accentPressed,
    Color? accentSoft,
    Color? warning,
    Color? warningSoft,
    Color? danger,
    Color? dangerSoft,
    Color? success,
    Color? successSoft,
    Color? info,
    Color? infoSoft,
    Color? inverse,
    Color? onInverse,
    Color? onAccent,
  }) {
    return AppColors(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceMuted: surfaceMuted ?? this.surfaceMuted,
      surfaceDisabled: surfaceDisabled ?? this.surfaceDisabled,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textDisabled: textDisabled ?? this.textDisabled,
      border: border ?? this.border,
      borderSubtle: borderSubtle ?? this.borderSubtle,
      accent: accent ?? this.accent,
      accentPressed: accentPressed ?? this.accentPressed,
      accentSoft: accentSoft ?? this.accentSoft,
      warning: warning ?? this.warning,
      warningSoft: warningSoft ?? this.warningSoft,
      danger: danger ?? this.danger,
      dangerSoft: dangerSoft ?? this.dangerSoft,
      success: success ?? this.success,
      successSoft: successSoft ?? this.successSoft,
      info: info ?? this.info,
      infoSoft: infoSoft ?? this.infoSoft,
      inverse: inverse ?? this.inverse,
      onInverse: onInverse ?? this.onInverse,
      onAccent: onAccent ?? this.onAccent,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceMuted: Color.lerp(surfaceMuted, other.surfaceMuted, t)!,
      surfaceDisabled: Color.lerp(surfaceDisabled, other.surfaceDisabled, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      border: Color.lerp(border, other.border, t)!,
      borderSubtle: Color.lerp(borderSubtle, other.borderSubtle, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      accentPressed: Color.lerp(accentPressed, other.accentPressed, t)!,
      accentSoft: Color.lerp(accentSoft, other.accentSoft, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      warningSoft: Color.lerp(warningSoft, other.warningSoft, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      dangerSoft: Color.lerp(dangerSoft, other.dangerSoft, t)!,
      success: Color.lerp(success, other.success, t)!,
      successSoft: Color.lerp(successSoft, other.successSoft, t)!,
      info: Color.lerp(info, other.info, t)!,
      infoSoft: Color.lerp(infoSoft, other.infoSoft, t)!,
      inverse: Color.lerp(inverse, other.inverse, t)!,
      onInverse: Color.lerp(onInverse, other.onInverse, t)!,
      onAccent: Color.lerp(onAccent, other.onAccent, t)!,
    );
  }
}
