import 'package:flutter/material.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/core/utils/money_format.dart';
import 'package:alora_mobile/core/utils/date_format.dart';
import 'package:alora_mobile/features/management/domain/entities/employee.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_card.dart';
import 'package:alora_mobile/shared/widgets/letter_avatar.dart';

import 'employee_role_chip.dart';

/// Xodimlar ro'yxatidagi bitta qator (S-20).
class EmployeeRow extends StatelessWidget {
  final Employee employee;
  final VoidCallback? onTap;

  const EmployeeRow({super.key, required this.employee, this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colors = context.colors;
    final typography = context.text;

    final lastActive = employee.lastLoginAt;
    final todayCost = employee.todayCost;

    return AppCard(
      onTap: onTap,
      child: Row(
        children: [
          LetterAvatar(name: employee.fullName),
          const SizedBox(width: AppSpacing.m),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        employee.fullName,
                        style: typography.titleS.copyWith(
                          color: colors.textPrimary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.s),
                    EmployeeRoleChip(
                      role: employee.role,
                      showBlocked: employee.isBlocked,
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  lastActive == null
                      ? l10n.management_employeeLastActive('—')
                      : l10n.management_employeeLastActive(
                          formatRelativeDate(
                            lastActive,
                            context: context,
                            overrideLocale: Localizations.localeOf(context)
                                .toString(),
                          ),
                        ),
                  style: typography.bodyS.copyWith(color: colors.textSecondary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.s),
          Text(
            todayCost == null
                ? '—'
                : '${formatMoneyPlain(todayCost)} ${l10n.currency_som}',
            style: typography.labelM.copyWith(
              color: colors.textPrimary,
              fontFeatures: const [FontFeature.tabularFigures()],
            ),
          ),
        ],
      ),
    );
  }
}
