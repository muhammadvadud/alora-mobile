import 'package:flutter/material.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/models/role.dart';

/// Rol nomi chiqarilgan chip (boshqaruv ekranlarida ishlatiladi).
class EmployeeRoleChip extends StatelessWidget {
  final Role role;
  final bool showBlocked;

  const EmployeeRoleChip({
    super.key,
    required this.role,
    this.showBlocked = false,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colors = context.colors;

    return Container(
      padding: AppSpacing.statusPillPadding,
      decoration: BoxDecoration(
        color: showBlocked ? colors.dangerSoft : colors.accentSoft,
        borderRadius: AppRadius.pillBorder,
      ),
      child: Text(
        _roleLabel(l10n, role),
        style: context.text.labelS.copyWith(
          color: showBlocked ? colors.danger : colors.accent,
        ),
      ),
    );
  }

  String _roleLabel(AppLocalizations l10n, Role role) {
    return switch (role) {
      Role.employee => l10n.profile_roleEmployee,
      Role.manager => l10n.profile_roleManager,
      Role.admin => l10n.profile_roleAdmin,
      Role.unknown => l10n.profile_roleUnknown,
    };
  }
}