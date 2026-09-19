import 'package:flutter/material.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import "package:alora_mobile/app/theme/app_radius.dart";
import 'package:alora_mobile/app/theme/app_spacing.dart';

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
            style: typography.bodyS.copyWith(color: colors.textSecondary),
          ),
          const SizedBox(width: AppSpacing.xs),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s, vertical: 2),
            decoration: BoxDecoration(
              color: colors.surfaceMuted,
              borderRadius: AppRadius.inputBorder,
            ),
            child: Icon(AppIcons.lock, size: 16, color: colors.textSecondary),
          ),
        ],
      );
    }

    return Text(
      l10n.chat_defaultTitle, // 'Alora'
      style: typography.titleL.copyWith(color: colors.textPrimary),
    );
  }
}
