import 'package:flutter/material.dart';

import 'package:alora_mobile/features/management/domain/entities/employee.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_list_tile.dart';
import 'package:alora_mobile/shared/widgets/letter_avatar.dart';
import 'package:alora_mobile/shared/widgets/limit_progress_bar.dart';

/// Xodimlar ro'yxatidagi bitta qator (S-20).
class EmployeeRow extends StatelessWidget {
  final Employee employee;
  final VoidCallback? onTap;

  const EmployeeRow({super.key, required this.employee, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    // TODO: limit backenddan kelsa o'zgartirish
    const maxLimit = 10000;
    final progress = ((employee.todayCost ?? 0) / maxLimit).clamp(0.0, 1.0);
    final percent = (progress * 100).round();

    return AppListTile(
      onTap: onTap,
      showDivider: false,
      leading: LetterAvatar(name: employee.fullName, size: 36),
      title: employee.fullName,
      subtitle: employee.role.name.toUpperCase(),
      trailing: SizedBox(
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            LimitProgressBar(progress: progress),
            const SizedBox(height: 4),
            Text('$percent%', style: typography.labelS.copyWith(color: colors.textSecondary)),
          ],
        ),
      ),
    );
  }
}
