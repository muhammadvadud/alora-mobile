import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/app/theme/app_typography.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';

class AppTabBarItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final int? badgeCount;

  const AppTabBarItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    this.badgeCount,
  });
}

class AppTabBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<AppTabBarItem> items;

  const AppTabBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;
    final bottomPadding = MediaQuery.paddingOf(context).bottom;

    return Container(
      height: 62 + bottomPadding,
      padding: EdgeInsets.only(bottom: bottomPadding),
      decoration: BoxDecoration(
        color: colors.surface,
        border: Border(top: BorderSide(color: colors.border, width: 1.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isSelected = index == currentIndex;

          final iconColor = isSelected ? colors.accent : colors.textSecondary;
          final icon = isSelected ? item.activeIcon : item.icon;
          final textStyle = typography.tabLabel.copyWith(
            color: iconColor,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          );

          Widget iconWidget = Icon(icon, color: iconColor, size: 24);

          if (item.badgeCount != null && item.badgeCount! > 0) {
            iconWidget = Stack(
              clipBehavior: Clip.none,
              children: [
                iconWidget,
                Positioned(
                  top: -2,
                  right: -4,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.xs,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: colors.brass,
                      borderRadius: AppRadius.badgeBorder,
                    ),
                    child: Text(
                      item.badgeCount.toString(),
                      style: typography.badgeLabel
                          .copyWith(color: colors.onInverse)
                          .tabular,
                    ),
                  ),
                ),
              ],
            );
          }

          return Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => onTap(index),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconWidget,
                  const SizedBox(height: 4),
                  Text(item.label, style: textStyle),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
