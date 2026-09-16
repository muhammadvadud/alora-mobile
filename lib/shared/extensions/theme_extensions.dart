import 'package:flutter/material.dart';
import 'package:alora_mobile/app/theme/app_colors.dart';
import 'package:alora_mobile/app/theme/app_typography.dart';

extension ThemeBuildContextX on BuildContext {
  AppColors get colors => Theme.of(this).extension<AppColors>()!;
  AppTypography get text => Theme.of(this).extension<AppTypography>()!;
}
