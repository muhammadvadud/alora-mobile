import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';

class AppTabBarItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool hasBadge;

  const AppTabBarItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    this.hasBadge = false,
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
      height: 56 + bottomPadding,
      padding: EdgeInsets.only(bottom: bottomPadding),
      decoration: BoxDecoration(
        color: colors.background,
        border: Border(top: BorderSide(color: colors.border, width: 1.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isSelected = index == currentIndex;

          final iconColor = isSelected ? colors.accent : colors.textSecondary;
          final icon = isSelected ? item.activeIcon : item.icon;
          final textStyle = typography.labelS.copyWith(color: iconColor);

          Widget iconWidget = Icon(icon, color: iconColor, size: 24);

          if (item.hasBadge) {
            iconWidget = Stack(
              clipBehavior: Clip.none,
              children: [
                iconWidget,
                Positioned(
                  top: 0,
                  right: -2,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(color: colors.danger, shape: BoxShape.circle),
                  ),
                ),
              ],
            );
          }

          return Expanded(
            child: Semantics(
              button: true,
              selected: isSelected,
              label: item.label,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => onTap(index),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconWidget,
                    const SizedBox(height: 2),
                    Text(item.label, style: textStyle),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
