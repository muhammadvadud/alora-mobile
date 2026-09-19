import 'package:flutter/material.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/core/env.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_card.dart';

/// "Ilova haqida" (20.9): versiya, build raqami, muhit — `Env` dan.
class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AppCard(
      child: Column(
        children: [
          _AboutRow(label: l10n.profile_aboutVersion, value: Env.appVersion),
          const SizedBox(height: AppSpacing.s),
          _AboutRow(label: l10n.profile_aboutBuild, value: Env.buildNumber),
          const SizedBox(height: AppSpacing.s),
          _AboutRow(label: l10n.profile_aboutEnv, value: Env.env),
        ],
      ),
    );
  }
}

class _AboutRow extends StatelessWidget {
  const _AboutRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: typography.bodyS.copyWith(color: colors.textSecondary),
        ),
        Text(
          value,
          style: typography.bodyS.copyWith(
            color: colors.textPrimary,
            fontFeatures: const [FontFeature.tabularFigures()],
          ),
        ),
      ],
    );
  }
}
