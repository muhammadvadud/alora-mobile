import 'package:flutter/material.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';

class LimitExceededView extends StatelessWidget {
  const LimitExceededView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.xxl,
          vertical: AppSpacing.xxl,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(AppIcons.ban, size: 64, color: colors.danger),
            const SizedBox(height: AppSpacing.l),
            Text(
              l10n.error_limit,
              style: typography.displayM,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
