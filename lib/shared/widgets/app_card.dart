import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';

class AppCard extends StatelessWidget {
  final Widget? child;
  final List<Widget>? sections;
  final bool isSelected;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  const AppCard({
    super.key,
    required this.child,
    this.isSelected = false,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  }) : sections = null;

  const AppCard.sections({super.key, required this.sections, this.isSelected = false, this.onTap})
    : child = null,
      padding = EdgeInsets.zero;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    BoxDecoration decoration;
    if (isSelected) {
      decoration = BoxDecoration(
        color: colors.surface,
        borderRadius: AppRadius.cardBorder,
        border: Border.all(color: colors.accent, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: colors.accent.withValues(alpha: 0.09),
            spreadRadius: 3,
            blurRadius: 0,
            offset: Offset.zero,
          ),
        ],
      );
    } else {
      decoration = BoxDecoration(
        color: colors.surface,
        borderRadius: AppRadius.cardBorder,
        border: Border.all(color: colors.border, width: 1.0),
      );
    }

    Widget content;

    if (sections != null) {
      final List<Widget> children = [];
      for (int i = 0; i < sections!.length; i++) {
        children.add(Padding(padding: const EdgeInsets.all(16.0), child: sections![i]));
        if (i < sections!.length - 1) {
          children.add(Divider(height: 1, thickness: 1, color: colors.border));
        }
      }
      content = Container(
        decoration: decoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      );
    } else {
      content = Container(padding: padding, decoration: decoration, child: child);
    }

    if (onTap != null) {
      content = GestureDetector(onTap: onTap, behavior: HitTestBehavior.opaque, child: content);
    }

    return content;
  }
}
