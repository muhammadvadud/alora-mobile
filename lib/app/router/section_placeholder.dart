import 'package:flutter/material.dart';

import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';

/// Bo'lim tayyorlanayotganda ko'rsatiladigan markaziy mashg'ulot.
class SectionPlaceholder extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const SectionPlaceholder({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = context.text;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 40, color: colors.textSecondary),
          const SizedBox(height: AppSpacing.l),
          Text(
            title,
            style: text.titleL.copyWith(color: colors.textPrimary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.s),
          Text(
            subtitle,
            style: text.bodyS.copyWith(color: colors.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
