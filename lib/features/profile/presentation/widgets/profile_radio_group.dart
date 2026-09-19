import 'package:flutter/material.dart';

import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_radio.dart';
import 'package:alora_mobile/shared/widgets/section_label.dart';

/// Profil bo'limi: sarlavha + `AppRadio` qatorlari (S-25: Til, Mavzu).
class ProfileRadioGroup extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<ProfileRadioOption> options;

  const ProfileRadioGroup({
    super.key,
    required this.title,
    required this.icon,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Icon(icon, size: 20, color: colors.textSecondary),
            const SizedBox(width: AppSpacing.s),
            SectionLabel(title),
          ],
        ),
        for (final o in options)
          InkWell(
            onTap: o.onSelect,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.m),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      o.label,
                      style: context.text.bodyL.copyWith(color: colors.textPrimary),
                    ),
                  ),
                  AppRadio(isSelected: o.isSelected, onTap: o.onSelect),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

class ProfileRadioOption {
  final String label;
  final bool isSelected;
  final VoidCallback onSelect;

  const ProfileRadioOption({required this.label, required this.isSelected, required this.onSelect});
}
