import 'package:flutter/material.dart';

class AppTypography extends ThemeExtension<AppTypography> {
  final TextStyle displayL;
  final TextStyle displayM;
  final TextStyle titleL;
  final TextStyle titleM;
  final TextStyle titleS;
  final TextStyle bodyL;
  final TextStyle bodyM;
  final TextStyle bodyS;
  final TextStyle labelL;
  final TextStyle labelM;
  final TextStyle labelS;
  final TextStyle overline;
  final TextStyle mono;
  final TextStyle priceM;
  final TextStyle tabLabel;
  final TextStyle badgeLabel;
  final TextStyle snackbarText;
  final TextStyle snackbarAction;

  const AppTypography({
    required this.displayL,
    required this.displayM,
    required this.titleL,
    required this.titleM,
    required this.titleS,
    required this.bodyL,
    required this.bodyM,
    required this.bodyS,
    required this.labelL,
    required this.labelM,
    required this.labelS,
    required this.overline,
    required this.mono,
    required this.priceM,
    required this.tabLabel,
    required this.badgeLabel,
    required this.snackbarText,
    required this.snackbarAction,
  });

  static const _inter = 'Inter';

  static const regular = AppTypography(
    displayL: TextStyle(
      fontFamily: _inter,
      fontSize: 30,
      height: 38 / 30,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
    ),
    displayM: TextStyle(
      fontFamily: _inter,
      fontSize: 24,
      height: 32 / 24,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
    ),
    titleL: TextStyle(
      fontFamily: _inter,
      fontSize: 18,
      height: 24 / 18,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    ),
    titleM: TextStyle(
      fontFamily: _inter,
      fontSize: 16,
      height: 22 / 16,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
    ),
    titleS: TextStyle(
      fontFamily: _inter,
      fontSize: 14,
      height: 18 / 14,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
    ),
    bodyL: TextStyle(
      fontFamily: _inter,
      fontSize: 16,
      height: 22 / 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
    bodyM: TextStyle(
      fontFamily: _inter,
      fontSize: 16,
      height: 22 / 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
    bodyS: TextStyle(
      fontFamily: _inter,
      fontSize: 14,
      height: 18 / 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
    labelL: TextStyle(
      fontFamily: _inter,
      fontSize: 16,
      height: 22 / 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    ),
    labelM: TextStyle(
      fontFamily: _inter,
      fontSize: 14,
      height: 18 / 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    ),
    labelS: TextStyle(
      fontFamily: _inter,
      fontSize: 12,
      height: 16 / 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    ),
    overline: TextStyle(
      fontFamily: _inter,
      fontSize: 14,
      height: 18 / 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    ),
    mono: TextStyle(
      fontFamily: _inter,
      fontSize: 14,
      height: 18 / 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      fontFeatures: [FontFeature.tabularFigures()],
    ),
    priceM: TextStyle(
      fontFamily: _inter,
      fontSize: 16,
      height: 22 / 16,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
    ),
    tabLabel: TextStyle(
      fontFamily: _inter,
      fontSize: 12,
      height: 16 / 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    ),
    badgeLabel: TextStyle(
      fontFamily: _inter,
      fontSize: 10,
      height: 14 / 10,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
    ),
    snackbarText: TextStyle(
      fontFamily: _inter,
      fontSize: 14,
      height: 18 / 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
    snackbarAction: TextStyle(
      fontFamily: _inter,
      fontSize: 14,
      height: 18 / 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    ),
  );

  static const customer = AppTypography(
    displayL: TextStyle(
      fontFamily: _inter,
      fontSize: 32,
      height: 38 / 32,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
    ),
    displayM: TextStyle(
      fontFamily: _inter,
      fontSize: 26,
      height: 32 / 26,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
    ),
    titleL: TextStyle(
      fontFamily: _inter,
      fontSize: 20,
      height: 24 / 20,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    ),
    titleM: TextStyle(
      fontFamily: _inter,
      fontSize: 18,
      height: 22 / 18,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
    ),
    titleS: TextStyle(
      fontFamily: _inter,
      fontSize: 16,
      height: 18 / 16,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
    ),
    bodyL: TextStyle(
      fontFamily: _inter,
      fontSize: 18,
      height: 22 / 18,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
    bodyM: TextStyle(
      fontFamily: _inter,
      fontSize: 18,
      height: 22 / 18,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
    bodyS: TextStyle(
      fontFamily: _inter,
      fontSize: 16,
      height: 18 / 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
    labelL: TextStyle(
      fontFamily: _inter,
      fontSize: 16,
      height: 22 / 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    ),
    labelM: TextStyle(
      fontFamily: _inter,
      fontSize: 14,
      height: 18 / 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    ),
    labelS: TextStyle(
      fontFamily: _inter,
      fontSize: 12,
      height: 16 / 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    ),
    overline: TextStyle(
      fontFamily: _inter,
      fontSize: 16,
      height: 18 / 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    ),
    mono: TextStyle(
      fontFamily: _inter,
      fontSize: 16,
      height: 18 / 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      fontFeatures: [FontFeature.tabularFigures()],
    ),
    priceM: TextStyle(
      fontFamily: _inter,
      fontSize: 18,
      height: 22 / 18,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
    ),
    tabLabel: TextStyle(
      fontFamily: _inter,
      fontSize: 14,
      height: 18 / 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    ),
    badgeLabel: TextStyle(
      fontFamily: _inter,
      fontSize: 12,
      height: 16 / 12,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
    ),
    snackbarText: TextStyle(
      fontFamily: _inter,
      fontSize: 16,
      height: 18 / 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
    snackbarAction: TextStyle(
      fontFamily: _inter,
      fontSize: 16,
      height: 18 / 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
    ),
  );

  @override
  AppTypography copyWith({
    TextStyle? displayL,
    TextStyle? displayM,
    TextStyle? titleL,
    TextStyle? titleM,
    TextStyle? titleS,
    TextStyle? bodyL,
    TextStyle? bodyM,
    TextStyle? bodyS,
    TextStyle? labelL,
    TextStyle? labelM,
    TextStyle? labelS,
    TextStyle? overline,
    TextStyle? mono,
    TextStyle? priceM,
    TextStyle? tabLabel,
    TextStyle? badgeLabel,
    TextStyle? snackbarText,
    TextStyle? snackbarAction,
  }) {
    return AppTypography(
      displayL: displayL ?? this.displayL,
      displayM: displayM ?? this.displayM,
      titleL: titleL ?? this.titleL,
      titleM: titleM ?? this.titleM,
      titleS: titleS ?? this.titleS,
      bodyL: bodyL ?? this.bodyL,
      bodyM: bodyM ?? this.bodyM,
      bodyS: bodyS ?? this.bodyS,
      labelL: labelL ?? this.labelL,
      labelM: labelM ?? this.labelM,
      labelS: labelS ?? this.labelS,
      overline: overline ?? this.overline,
      mono: mono ?? this.mono,
      priceM: priceM ?? this.priceM,
      tabLabel: tabLabel ?? this.tabLabel,
      badgeLabel: badgeLabel ?? this.badgeLabel,
      snackbarText: snackbarText ?? this.snackbarText,
      snackbarAction: snackbarAction ?? this.snackbarAction,
    );
  }

  @override
  AppTypography lerp(ThemeExtension<AppTypography>? other, double t) {
    if (other is! AppTypography) {
      return this;
    }
    return AppTypography(
      displayL: TextStyle.lerp(displayL, other.displayL, t)!,
      displayM: TextStyle.lerp(displayM, other.displayM, t)!,
      titleL: TextStyle.lerp(titleL, other.titleL, t)!,
      titleM: TextStyle.lerp(titleM, other.titleM, t)!,
      titleS: TextStyle.lerp(titleS, other.titleS, t)!,
      bodyL: TextStyle.lerp(bodyL, other.bodyL, t)!,
      bodyM: TextStyle.lerp(bodyM, other.bodyM, t)!,
      bodyS: TextStyle.lerp(bodyS, other.bodyS, t)!,
      labelL: TextStyle.lerp(labelL, other.labelL, t)!,
      labelM: TextStyle.lerp(labelM, other.labelM, t)!,
      labelS: TextStyle.lerp(labelS, other.labelS, t)!,
      overline: TextStyle.lerp(overline, other.overline, t)!,
      mono: TextStyle.lerp(mono, other.mono, t)!,
      priceM: TextStyle.lerp(priceM, other.priceM, t)!,
      tabLabel: TextStyle.lerp(tabLabel, other.tabLabel, t)!,
      badgeLabel: TextStyle.lerp(badgeLabel, other.badgeLabel, t)!,
      snackbarText: TextStyle.lerp(snackbarText, other.snackbarText, t)!,
      snackbarAction: TextStyle.lerp(snackbarAction, other.snackbarAction, t)!,
    );
  }
}

extension TextStyleTabular on TextStyle {
  TextStyle get tabular => copyWith(fontFeatures: const [FontFeature.tabularFigures()]);
}
