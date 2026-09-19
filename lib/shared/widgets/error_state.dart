import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';

class ErrorState extends StatelessWidget {
  final String title;
  final String? message;
  final String? actionText;
  final VoidCallback? onAction;

  // Backward compatibility
  final VoidCallback? onRetry;

  const ErrorState({
    super.key,
    this.title = 'Xatolik yuz berdi',
    this.message,
    this.actionText,
    this.onAction,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;
    final l10n = AppLocalizations.of(context)!;

    final effectiveAction = onAction ?? onRetry;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(LucideIcons.alertTriangle, size: 48, color: colors.textDisabled),
            const SizedBox(height: AppSpacing.l),
            Text(
              title,
              style: typography.titleM.copyWith(color: colors.textPrimary),
              textAlign: TextAlign.center,
            ),
            if (message != null) ...[
              const SizedBox(height: AppSpacing.s),
              Text(
                message!,
                style: typography.bodyS.copyWith(color: colors.textSecondary),
                textAlign: TextAlign.center,
              ),
            ],
            if (effectiveAction != null) ...[
              const SizedBox(height: AppSpacing.xl),
              SizedBox(
                width: double.infinity,
                child: AppButton.secondary(
                  text: actionText ?? l10n.common_retry,
                  onPressed: effectiveAction,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
