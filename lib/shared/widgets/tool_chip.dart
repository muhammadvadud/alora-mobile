import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';

enum ToolChipState { running, done, error }

class ToolChip extends StatelessWidget {
  final String text;
  final ToolChipState state;
  final VoidCallback? onTap;

  const ToolChip({super.key, required this.text, required this.state, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    Widget leading;
    Widget trailing = const SizedBox.shrink();
    Color textColor = colors.textSecondary;

    switch (state) {
      case ToolChipState.running:
        leading = SizedBox(
          width: 10,
          height: 10,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
            valueColor: AlwaysStoppedAnimation<Color>(colors.textSecondary),
          ),
        );
        break;
      case ToolChipState.done:
        leading = Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(color: colors.accent, shape: BoxShape.circle),
        );
        trailing = Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Icon(AppIcons.chevronRight, size: 14, color: colors.textSecondary),
        );
        break;
      case ToolChipState.error:
        leading = Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(color: colors.danger, shape: BoxShape.circle),
        );
        textColor = colors.danger;
        trailing = Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Icon(AppIcons.chevronRight, size: 14, color: colors.danger),
        );
        break;
    }

    final String displayText = state == ToolChipState.running ? '$text…' : text;

    return GestureDetector(
      onTap: state != ToolChipState.running ? onTap : null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: AppRadius.pillBorder,
          border: Border.all(color: colors.border, width: 1.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            leading,
            const SizedBox(width: 6),
            Text(displayText, style: typography.labelM.copyWith(color: textColor)),
            trailing,
          ],
        ),
      ),
    );
  }
}
