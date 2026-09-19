import 'package:flutter/material.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/auth/domain/entities/user.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/models/role.dart';
import 'package:alora_mobile/shared/widgets/letter_avatar.dart';

/// Profil sarlavhasi (S-25): avatar, ism, telefon va rol chip'i.
class ProfileHeader extends StatelessWidget {
  final User user;

  const ProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colors = context.colors;
    final typography = context.text;

    return Row(
      children: [
        LetterAvatar(name: user.fullName, size: 64),
        const SizedBox(width: AppSpacing.m),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.fullName,
                style: typography.titleL.copyWith(color: colors.textPrimary),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                roleLabel(l10n, user.role),
                style: typography.bodyS.copyWith(color: colors.textSecondary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Rol nomining mahalliylashtirilgan matni.
String roleLabel(AppLocalizations l10n, Role role) {
  return switch (role) {
    Role.employee => l10n.profile_roleEmployee,
    Role.manager => l10n.profile_roleManager,
    Role.admin => l10n.profile_roleAdmin,
    Role.unknown => l10n.profile_roleUnknown,
  };
}
