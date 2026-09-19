import 'package:flutter/material.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';

/// Chat AppBar sarlavhasi: mijoz rejimida indikator, aks holda "Alora" pillasi.
class ChatTitleBar extends StatelessWidget {
  const ChatTitleBar({super.key, required this.isCustomerMode});

  final bool isCustomerMode;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colors = context.colors;
    final typography = context.text;

    if (isCustomerMode) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            l10n.chat_customerModeTitle,
            style: typography.labelS.copyWith(color: colors.textSecondary),
          ),
          const SizedBox(width: AppSpacing.xs),
          Icon(AppIcons.lock, size: AppSpacing.m, color: colors.textSecondary),
        ],
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.m,
            vertical: AppSpacing.xs,
          ),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: AppRadius.pillBorder,
            border: Border.all(color: colors.border),
          ),
          child: Text(
            l10n.chat_defaultTitle,
            style: typography.titleL.copyWith(color: colors.textPrimary),
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          l10n.conversations_stageNeed,
          style: typography.labelS.copyWith(color: colors.textSecondary),
        ),
      ],
    );
  }
}
