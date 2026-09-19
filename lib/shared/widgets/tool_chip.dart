import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';

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
          width: 14,
          height: 14,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
            valueColor: AlwaysStoppedAnimation<Color>(colors.textSecondary),
          ),
        );
        break;
      case ToolChipState.done:
        leading = Icon(LucideIcons.check, size: 16, color: colors.textSecondary);
        trailing = Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Icon(LucideIcons.chevronRight, size: 16, color: colors.textDisabled),
        );
        break;
      case ToolChipState.error:
        leading = Icon(LucideIcons.alertCircle, size: 16, color: colors.danger);
        textColor = colors.danger;
        trailing = Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Icon(LucideIcons.chevronRight, size: 16, color: colors.textDisabled),
        );
        break;
    }

    final String displayText = state == ToolChipState.running ? '$text…' : text;

    return Semantics(
      button: true,
      label: displayText,
      child: GestureDetector(
        onTap: state != ToolChipState.running ? onTap : null,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(color: colors.surfaceMuted, borderRadius: AppRadius.pillBorder),
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
      ),
    );
  }
}
