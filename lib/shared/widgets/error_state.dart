import 'package:flutter/material.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';

class ErrorState extends StatelessWidget {
  final String? title;
  final String? message;
  final VoidCallback onRetry;

  const ErrorState({
    super.key,
    this.title,
    this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colors = context.colors;
    final typography = context.text;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xxl,
        vertical: AppSpacing.xxl,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(AppIcons.alertTriangle, size: 64, color: colors.danger),
          const SizedBox(height: AppSpacing.l),
          Text(
            title ?? l10n.common_error,
            style: typography.displayM,
            textAlign: TextAlign.center,
          ),
          if (message != null) ...[
            const SizedBox(height: AppSpacing.s),
            Text(
              message!,
              style: typography.bodyM.copyWith(color: colors.textSecondary),
              textAlign: TextAlign.center,
            ),
          ],
          const SizedBox(height: AppSpacing.xl),
          SizedBox(
            width: 200,
            child: AppButton(text: l10n.common_retry, onPressed: onRetry),
          ),
        ],
      ),
    );
  }
}
