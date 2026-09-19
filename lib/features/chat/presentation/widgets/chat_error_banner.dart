import 'package:flutter/material.dart';
import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/error/failure_l10n.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';

/// Chat maydonining yuqorisida ko'rsatiladigan xatolik banneri.
class ChatErrorBanner extends StatelessWidget {
  const ChatErrorBanner({
    super.key,
    required this.error,
    required this.retryLabel,
    required this.onRetry,
  });

  final Failure error;
  final String retryLabel;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l, vertical: AppSpacing.s),
      color: colors.dangerSoft,
      child: Row(
        children: [
          Icon(AppIcons.alertTriangle, color: colors.danger, size: AppSpacing.l),
          const SizedBox(width: AppSpacing.s),
          Expanded(
            child: Text(
              error.localizedMessage(context),
              style: typography.bodyS.copyWith(color: colors.danger),
            ),
          ),
          TextButton(onPressed: onRetry, child: Text(retryLabel)),
        ],
      ),
    );
  }
}
