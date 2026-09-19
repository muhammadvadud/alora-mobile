import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';

class AppDialog extends StatelessWidget {
  final String title;
  final String content;
  final String primaryActionText;
  final VoidCallback onPrimaryAction;
  final String secondaryActionText;
  final VoidCallback onSecondaryAction;
  final bool isDestructive;

  const AppDialog({
    super.key,
    required this.title,
    required this.content,
    required this.primaryActionText,
    required this.onPrimaryAction,
    required this.secondaryActionText,
    required this.onSecondaryAction,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl, vertical: AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: context.text.titleM),
            const SizedBox(height: AppSpacing.s),
            Text(content, style: context.text.bodyL.copyWith(color: context.colors.textSecondary)),
            const SizedBox(height: AppSpacing.xl),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 44,
                    child: AppButton.secondary(
                      text: secondaryActionText,
                      onPressed: onSecondaryAction,
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.m),
                Expanded(
                  child: SizedBox(
                    height: 44,
                    child: isDestructive
                        ? AppButton.destructive(
                            filled: true,
                            text: primaryActionText,
                            onPressed: onPrimaryAction,
                          )
                        : AppButton(text: primaryActionText, onPressed: onPrimaryAction),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
