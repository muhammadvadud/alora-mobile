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
  final Color brass;
  final Color brassSoft;
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
    required this.brass,
    required this.brassSoft,
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
    background: Color(0xFFF2F3F0),
    surface: Color(0xFFFBFBF9),
    surfaceMuted: Color(0xFFEEF0EC),
    surfaceDisabled: Color(0xFFEFF0EC),
    textPrimary: Color(0xFF151E1C),
    textSecondary: Color(0xFF5C6663),
    textDisabled: Color(0xFF96A09D),
    border: Color(0xFFDCDFD9),
    borderSubtle: Color(0xFFEAEBE6),
    accent: Color(0xFF0E5751),
    accentPressed: Color(0xFF0A423E),
    accentSoft: Color(0xFFE4EFED),
    brass: Color(0xFF8A6620),
    brassSoft: Color(0xFFF5EFE1),
    danger: Color(0xFFA6483C),
    dangerSoft: Color(0xFFF7ECEA),
    success: Color(0xFF2E7D4F),
    successSoft: Color(0xFFE5F0E9),
    info: Color(0xFF4A6B7C),
    infoSoft: Color(0xFFE7EDF0),
    inverse: Color(0xFF151E1C),
    onInverse: Color(0xFFF2F3F0),
    onAccent: Color(0xFFF2F3F0),
  );

  static const AppColors dark = AppColors(
    background: Color(0xFF101514),
    surface: Color(0xFF181E1D),
    surfaceMuted: Color(0xFF1C2523),
    surfaceDisabled: Color(0xFF151B1A),
    textPrimary: Color(0xFFE7EAE6),
    textSecondary: Color(0xFF96A09D),
    textDisabled: Color(0xFF5C6663),
    border: Color(0xFF293230),
    borderSubtle: Color(0xFF232B29),
    accent: Color(0xFF5CB8AB),
    accentPressed: Color(0xFF4AA396),
    accentSoft: Color(0xFF1A2E2C),
    brass: Color(0xFFC9A257),
    brassSoft: Color(0xFF2A2416),
    danger: Color(0xFFD98A7C),
    dangerSoft: Color(0xFF3A1F1B),
    success: Color(0xFF5CB88A),
    successSoft: Color(0xFF1B2E22),
    info: Color(0xFF8FB0C2),
    infoSoft: Color(0xFF1E2A30),
    inverse: Color(0xFFE7EAE6),
    onInverse: Color(0xFF101514),
    onAccent: Color(0xFF101514),
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
    Color? brass,
    Color? brassSoft,
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
      brass: brass ?? this.brass,
      brassSoft: brassSoft ?? this.brassSoft,
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
      brass: Color.lerp(brass, other.brass, t)!,
      brassSoft: Color.lerp(brassSoft, other.brassSoft, t)!,
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
