import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/app/theme/app_typography.dart';
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

    Color backgroundColor;
    Color textColor;
    BorderSide borderSide;
    TextStyle textStyle = typography.bodyS;

    switch (state) {
      case AppChipState.unselected:
        backgroundColor = colors.surface;
        textColor = colors.textPrimary;
        borderSide = BorderSide(color: colors.border, width: 1.0);
        break;
      case AppChipState.selected:
        backgroundColor = colors.inverse;
        textColor = colors.onInverse;
        borderSide = BorderSide.none;
        textStyle = typography.bodyS.copyWith(fontWeight: FontWeight.w600);
        break;
      case AppChipState.categorySelected:
        backgroundColor = colors.accentSoft;
        textColor = colors.accent;
        borderSide = BorderSide(color: colors.accent, width: 1.0);
        break;
    }

    return Semantics(
      button: true,
      label: label,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        // 48 dp bosish maydoni (§7.3), lekin kenglik faqat matn bo'yicha —
        // Wrap ichida chip'lar gorizontal qoladi (dizayn 1b).
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 48, minWidth: 48),
          child: Center(
            widthFactor: 1,
            heightFactor: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: AppRadius.pillBorder,
                border: state == AppChipState.selected ? null : Border.fromBorderSide(borderSide),
              ),
              child: Text(label, style: textStyle.copyWith(color: textColor)),
            ),
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

    Color backgroundColor;
    Color textColor;
    BorderSide borderSide;
    TextStyle textStyle = typography.bodyS;

    if (isSelected) {
      backgroundColor = colors.inverse;
      textColor = colors.onInverse;
      borderSide = BorderSide.none;
      textStyle = typography.bodyS.copyWith(fontWeight: FontWeight.w600);
    } else {
      backgroundColor = colors.surface;
      textColor = colors.textPrimary;
      borderSide = BorderSide(color: colors.border, width: 1.0);
    }

    return Semantics(
      button: true,
      label: '$label, $count',
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        // 48 dp bosish maydoni (§7.3), lekin kenglik faqat matn bo'yicha —
        // Wrap ichida chip'lar gorizontal qoladi (dizayn 1b).
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 48, minWidth: 48),
          child: Center(
            widthFactor: 1,
            heightFactor: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: AppRadius.pillBorder,
                border: isSelected ? null : Border.fromBorderSide(borderSide),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(label, style: textStyle.copyWith(color: textColor)),
                  const SizedBox(width: 4),
                  Text(
                    count.toString(),
                    style: typography.bodyS
                        .copyWith(
                          fontWeight: FontWeight.w600,
                          color: isSelected ? colors.onInverse : colors.brass,
                        )
                        .tabular,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
