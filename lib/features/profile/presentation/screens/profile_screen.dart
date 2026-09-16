import 'package:flutter/material.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/router/adaptive_shell.dart';
import 'package:alora_mobile/app/router/section_placeholder.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';

/// Profil sahifasi (placeholder). Haqiqiy sahifa 10-bosqichda qo'shiladi.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.tab_profile)),
      body: TabletCentered(
        child: SectionPlaceholder(
          icon: AppIcons.profile,
          title: l10n.tab_profile,
          subtitle: l10n.placeholder_comingSoon,
        ),
      ),
    );
  }
}
