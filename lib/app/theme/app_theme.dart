import 'package:flutter/material.dart';
import 'package:alora_mobile/app/theme/app_colors.dart';
import 'package:alora_mobile/app/theme/app_typography.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';

class AppTheme {
  static ThemeData light({bool isCustomerMode = false}) {
    return _buildTheme(
      colors: AppColors.light,
      isCustomerMode: isCustomerMode,
      brightness: Brightness.light,
    );
  }

  static ThemeData dark({bool isCustomerMode = false}) {
    return _buildTheme(
      colors: AppColors.dark,
      isCustomerMode: isCustomerMode,
      brightness: Brightness.dark,
    );
  }

  static ThemeData _buildTheme({
    required AppColors colors,
    required bool isCustomerMode,
    required Brightness brightness,
  }) {
    final typography = isCustomerMode
        ? AppTypography.customer
        : AppTypography.regular;

    final colorScheme = ColorScheme(
      brightness: brightness,
      primary: colors.accent,
      onPrimary: colors.onAccent,
      secondary: colors.brass,
      onSecondary: colors.onInverse,
      error: colors.danger,
      onError: colors.onAccent,
      surface: colors.surface,
      onSurface: colors.textPrimary,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: colors.background,
      colorScheme: colorScheme,
      extensions: [colors, typography],
      fontFamily: 'IBMPlexSans',
      appBarTheme: AppBarTheme(
        backgroundColor: colors.background,
        foregroundColor: colors.textPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: typography.titleL,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.surface,
        border: OutlineInputBorder(
          borderRadius: AppRadius.inputBorder,
          borderSide: BorderSide(color: colors.border, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.inputBorder,
          borderSide: BorderSide(color: colors.border, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.inputBorder,
          borderSide: BorderSide(color: colors.accent, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppRadius.inputBorder,
          borderSide: BorderSide(color: colors.danger, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppRadius.inputBorder,
          borderSide: BorderSide(color: colors.danger, width: 1.5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.inputBorder,
          borderSide: BorderSide(color: colors.border, width: 1.0),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.l,
          vertical: 0,
        ),
        hintStyle: typography.bodyM.copyWith(color: colors.textSecondary),
        errorStyle: typography.labelS.copyWith(color: colors.danger),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: colors.surface,
        disabledColor: colors.surfaceDisabled,
        selectedColor: colors.inverse,
        secondarySelectedColor: colors.accentSoft,
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
        labelStyle: typography.bodyS.copyWith(color: colors.textPrimary),
        secondaryLabelStyle: typography.bodyS.copyWith(color: colors.accent),
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.pillBorder,
          side: BorderSide(color: colors.border, width: 1.0),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colors.surface,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.sheet),
        clipBehavior: Clip.antiAlias,
        elevation: 0,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colors.inverse,
        contentTextStyle: typography.snackbarText.copyWith(
          color: colors.onInverse,
        ),
        shape: RoundedRectangleBorder(borderRadius: AppRadius.inputBorder),
        behavior: SnackBarBehavior.floating,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: colors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.cardBorder,
          side: BorderSide(color: colors.border, width: 1.0),
        ),
        elevation: 0,
        titleTextStyle: typography.titleM.copyWith(color: colors.textPrimary),
        contentTextStyle: typography.bodyS.copyWith(
          color: colors.textSecondary,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colors.surface,
        elevation: 0,
        indicatorColor:
            colors.background, // we will customize the active tab in AppTabBar
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return typography.tabLabel.copyWith(color: colors.accent);
          }
          return typography.tabLabel.copyWith(color: colors.textSecondary);
        }),
      ),
    );
  }
}
