import 'package:flutter/material.dart';

class AppRadius {
  static const double pill = 999.0;
  static const double card = 16.0;
  static const double input = 12.0;
  static const double avatar = 11.0;
  static const BorderRadius bubble = BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
    bottomLeft: Radius.circular(8),
    bottomRight: Radius.circular(20),
  );
  static const BorderRadius sheet = BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
  );
  static const double small = 4.0;

  static final BorderRadius pillBorder = BorderRadius.circular(pill);
  static final BorderRadius cardBorder = BorderRadius.circular(card);
  static final BorderRadius inputBorder = BorderRadius.circular(input);
  static final BorderRadius avatarBorder = BorderRadius.circular(avatar);
  static final BorderRadius smallBorder = BorderRadius.circular(small);
  static final BorderRadius progressBorder = BorderRadius.circular(2.5);
  static final BorderRadius waveBorder = BorderRadius.circular(2.0);
  static final BorderRadius lineBorder = BorderRadius.circular(1.0);
  static final BorderRadius badgeBorder = BorderRadius.circular(99.0);
  static final Radius cardTopRadius = const Radius.circular(card);

  const AppRadius._();
}
