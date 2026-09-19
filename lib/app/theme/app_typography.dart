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

  // New tokens for specific cases
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

  static const _ibmPlexSans = 'IBMPlexSans';
  static const _spectral = 'Spectral';
  static const _ibmPlexMono = 'IBMPlexMono';

  static const regular = AppTypography(
    displayL: TextStyle(
      fontFamily: _spectral,
      fontSize: 28,
      height: 1.2,
      fontWeight: FontWeight.w500,
    ),
    displayM: TextStyle(
      fontFamily: _spectral,
      fontSize: 22,
      height: 1.25,
      fontWeight: FontWeight.w500,
    ),
    titleL: TextStyle(
      fontFamily: _ibmPlexSans,
      fontSize: 18,
      height: 1.3,
      fontWeight: FontWeight.w600,
    ),
    titleM: TextStyle(
      fontFamily: _ibmPlexSans,
      fontSize: 16,
      height: 1.3,
      fontWeight: FontWeight.w600,
    ),
    titleS: TextStyle(
      fontFamily: _ibmPlexSans,
      fontSize: 14,
      height: 1.3,
      fontWeight: FontWeight.w600,
    ),
    bodyL: TextStyle(
      fontFamily: _ibmPlexSans,
      fontSize: 15,
      height: 1.5,
      fontWeight: FontWeight.w400,
    ),
    bodyM: TextStyle(
      fontFamily: _ibmPlexSans,
      fontSize: 14.5,
      height: 1.55,
      fontWeight: FontWeight.w400,
    ),
    bodyS: TextStyle(
      fontFamily: _ibmPlexSans,
      fontSize: 13,
      height: 1.45,
      fontWeight: FontWeight.w400,
    ),
    labelL: TextStyle(
      fontFamily: _ibmPlexSans,
      fontSize: 14.5,
      height: 1.2,
      fontWeight: FontWeight.w600,
    ),
    labelM: TextStyle(
      fontFamily: _ibmPlexSans,
      fontSize: 12,
      height: 1.2,
      fontWeight: FontWeight.w600,
    ),
    labelS: TextStyle(
      fontFamily: _ibmPlexSans,
      fontSize: 11.5,
      height: 1.2,
      fontWeight: FontWeight.w600,
    ),
    overline: TextStyle(
      fontFamily: _ibmPlexSans,
      fontSize: 11,
      height: 1.2,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.8,
    ),
    mono: TextStyle(fontFamily: _ibmPlexMono, fontSize: 12, fontWeight: FontWeight.w500),
    priceM: TextStyle(
      fontFamily: _ibmPlexSans,
      fontSize: 15,
      height: 1.3,
      fontWeight: FontWeight.w600,
    ),
    tabLabel: TextStyle(
      fontFamily: _ibmPlexSans,
      fontSize: 10,
      height: 1.2,
      fontWeight: FontWeight.w600,
    ),
    badgeLabel: TextStyle(
      fontFamily: _ibmPlexSans,
      fontSize: 8,
      height: 1.2,
      fontWeight: FontWeight.w600,
    ),
    snackbarText: TextStyle(
      fontFamily: _ibmPlexSans,
      fontSize: 13.5,
      height: 1.45,
      fontWeight: FontWeight.w400,
    ),
    snackbarAction: TextStyle(
      fontFamily: _ibmPlexSans,
      fontSize: 13,
      height: 1.2,
      fontWeight: FontWeight.w600,
    ),
  );

  static const customer = AppTypography(
    displayL: TextStyle(
      fontFamily: _spectral,
      fontSize: 28,
      height: 1.2,
      fontWeight: FontWeight.w500,
    ),
    displayM: TextStyle(
      fontFamily: _spectral,
      fontSize: 22,
      height: 1.25,
      fontWeight: FontWeight.w500,
    ),
    titleL: TextStyle(
      fontFamily: _ibmPlexSans,
      fontSize: 20,
      height: 1.3,
      fontWeight: FontWeight.w600,
    ),
    titleM: TextStyle(
      fontFamily: _ibmPlexSans,
      fontSize: 18,
      height: 1.3,
      fontWeight: FontWeight.w600,
    ),
    titleS: TextStyle(
      fontFamily: _ibmPlexSans,
      fontSize: 16,
      height: 1.3,
      fontWeight: FontWeight.w600,
    ),
    bodyL: TextStyle(
      fontFamily: _ibmPlexSans,
      fontSize: 17,
      height: 1.5,
      fontWeight: FontWeight.w400,
    ),
    bodyM: TextStyle(
      fontFamily: _ibmPlexSans,
      fontSize: 16.5,
      height: 1.55,
      fontWeight: FontWeight.w400,
    ),
    bodyS: TextStyle(
      fontFamily: _ibmPlexSans,
      fontSize: 15,
      height: 1.45,
      fontWeight: FontWeight.w400,
    ),
    labelL: TextStyle(
      fontFamily: _ibmPlexSans,
      fontSize: 14.5,
      height: 1.2,
      fontWeight: FontWeight.w600,
    ),
    labelM: TextStyle(
      fontFamily: _ibmPlexSans,
      fontSize: 12,
      height: 1.2,
      fontWeight: FontWeight.w600,
    ),
    labelS: TextStyle(
      fontFamily: _ibmPlexSans,
      fontSize: 11.5,
      height: 1.2,
      fontWeight: FontWeight.w600,
    ),
    overline: TextStyle(
      fontFamily: _ibmPlexSans,
      fontSize: 11,
      height: 1.2,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.8,
    ),
    mono: TextStyle(fontFamily: _ibmPlexMono, fontSize: 12, fontWeight: FontWeight.w500),
    priceM: TextStyle(
      fontFamily: _ibmPlexSans,
      fontSize: 17, // customer mode increases size by ~2
      height: 1.3,
      fontWeight: FontWeight.w600,
    ),
    tabLabel: TextStyle(
      fontFamily: _ibmPlexSans,
      fontSize: 12, // customer mode size + 2
      height: 1.2,
      fontWeight: FontWeight.w600,
    ),
    badgeLabel: TextStyle(
      fontFamily: _ibmPlexSans,
      fontSize: 10,
      height: 1.2,
      fontWeight: FontWeight.w600,
    ),
    snackbarText: TextStyle(
      fontFamily: _ibmPlexSans,
      fontSize: 15.5,
      height: 1.45,
      fontWeight: FontWeight.w400,
    ),
    snackbarAction: TextStyle(
      fontFamily: _ibmPlexSans,
      fontSize: 15,
      height: 1.2,
      fontWeight: FontWeight.w600,
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
