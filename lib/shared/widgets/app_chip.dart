import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';

enum AppChipState { unselected, selected, categorySelected }

class AppChip extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final AppChipState state;

  const AppChip({super.key, required this.label, this.onTap, this.state = AppChipState.unselected});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    Color bgColor;
    Color textColor;
    final BorderSide borderSide = BorderSide.none;
    BorderRadius radius = AppRadius.pillBorder;
    final TextStyle textStyle = typography.labelM;

    switch (state) {
      case AppChipState.unselected:
        bgColor = colors.surfaceMuted;
        textColor = colors.textPrimary;
        break;
      case AppChipState.selected:
        bgColor = colors.inverse;
        textColor = colors.onInverse;
        break;
      case AppChipState.categorySelected:
        bgColor = colors.info;
        textColor = Colors.white;
        radius = AppRadius.inputBorder;
        break;
    }

    return Semantics(
      button: true,
      selected: state == AppChipState.selected || state == AppChipState.categorySelected,
      label: label,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: radius,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: radius,
              border: borderSide == BorderSide.none ? null : Border.fromBorderSide(borderSide),
            ),
            child: Text(label, style: textStyle.copyWith(color: textColor)),
          ),
        ),
      ),
    );
  }
}

class AppCountChip extends StatelessWidget {
  final String label;
  final int count;
  final VoidCallback? onTap;
  final bool isSelected;

  const AppCountChip({
    super.key,
    required this.label,
    required this.count,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    final bgColor = isSelected ? colors.inverse : colors.surfaceMuted;
    final textColor = isSelected ? colors.onInverse : colors.textPrimary;
    final countColor = isSelected ? colors.onInverse : colors.textSecondary;

    return Semantics(
      button: true,
      selected: isSelected,
      label: '$label, $count',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppRadius.pillBorder,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(color: bgColor, borderRadius: AppRadius.pillBorder),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(label, style: typography.labelM.copyWith(color: textColor)),
                const SizedBox(width: 4),
                Text(count.toString(), style: typography.labelM.copyWith(color: countColor)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
