import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/router/routes.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/shared/widgets/app_card.dart';
import 'package:alora_mobile/shared/widgets/section_label.dart';

/// Boshqaruv bo'limlariga kirish ro'yxati (S-19).
class ManagementSectionsList extends StatelessWidget {
  const ManagementSectionsList({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(l10n.management_sectionTitle),
        const SizedBox(height: AppSpacing.m),
        _SectionRow(
          icon: AppIcons.profile,
          label: l10n.management_sectionEmployees,
          onTap: () => context.go(AppRoutes.managementEmployees),
        ),
        const SizedBox(height: AppSpacing.s),
        _SectionRow(
          icon: AppIcons.catalog,
          label: l10n.management_sectionProducts,
          onTap: () => context.go(AppRoutes.managementProducts),
        ),
        const SizedBox(height: AppSpacing.s),
        _SectionRow(
          icon: AppIcons.fileText,
          label: l10n.management_sectionPricing,
          onTap: () => context.go(AppRoutes.managementPricing),
        ),
        const SizedBox(height: AppSpacing.s),
        _SectionRow(
          icon: AppIcons.inbox,
          label: l10n.management_sectionKnowledge,
          onTap: () => context.go(AppRoutes.managementKnowledge),
        ),
      ],
    );
  }
}

class _SectionRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _SectionRow({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    return AppCard(
      onTap: onTap,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l, vertical: AppSpacing.m),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: colors.accentSoft,
              borderRadius: AppRadius.avatarBorder,
            ),
            child: Icon(icon, size: 16, color: colors.accent),
          ),
          const SizedBox(width: AppSpacing.m),
          Expanded(
            child: Text(label, style: typography.bodyL.copyWith(color: colors.textPrimary)),
          ),
          Icon(AppIcons.chevronRight, size: 18, color: colors.textSecondary),
        ],
      ),
    );
  }
}
