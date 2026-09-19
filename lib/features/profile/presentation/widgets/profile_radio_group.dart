import 'package:flutter/material.dart';

import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_radio.dart';

/// Profil bo'limi: sarlavha va uchta tanlov kartasi (S-25: Til, Mavzu).
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
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: colors.accentSoft,
                borderRadius: AppRadius.inputBorder,
              ),
              child: Icon(icon, size: 20, color: colors.accent),
            ),
            const SizedBox(width: AppSpacing.s),
            Text(title, style: context.text.titleS.copyWith(color: colors.textPrimary)),
          ],
        ),
        const SizedBox(height: AppSpacing.l),
        Row(
          children: [
            for (var i = 0; i < options.length; i++) ...[
              if (i > 0) const SizedBox(width: AppSpacing.s),
              Expanded(child: _ProfileOptionTile(option: options[i])),
            ],
          ],
        ),
      ],
    );
  }
}

class _ProfileOptionTile extends StatelessWidget {
  final ProfileRadioOption option;

  const _ProfileOptionTile({required this.option});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    return Semantics(
      button: true,
      selected: option.isSelected,
      label: option.label,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        decoration: BoxDecoration(
          color: option.isSelected ? colors.accentSoft : colors.surfaceMuted,
          borderRadius: AppRadius.inputBorder,
          border: Border.all(
            color: option.isSelected ? colors.accent : colors.borderSubtle,
            width: option.isSelected ? 1.5 : 1,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: option.onSelect,
            borderRadius: AppRadius.inputBorder,
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.m),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: AppRadio(isSelected: option.isSelected, onTap: option.onSelect),
                  ),
                  const SizedBox(height: AppSpacing.s),
                  Text(
                    option.label,
                    style: typography.labelM.copyWith(
                      color: option.isSelected ? colors.accent : colors.textPrimary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileRadioOption {
  final String label;
  final bool isSelected;
  final VoidCallback onSelect;

  const ProfileRadioOption({required this.label, required this.isSelected, required this.onSelect});
}
