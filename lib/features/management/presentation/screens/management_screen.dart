import 'package:flutter/material.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/router/adaptive_shell.dart';
import 'package:alora_mobile/app/router/section_placeholder.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';

/// Boshqaruv sahifasi (placeholder). Haqiqiy sahifa 7-bosqichda qo'shiladi.
class ManagementScreen extends StatelessWidget {
  const ManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.tab_management)),
      body: TabletCentered(
        child: SectionPlaceholder(
          icon: AppIcons.management,
          title: l10n.tab_management,
          subtitle: l10n.placeholder_comingSoon,
        ),
      ),
    );
  }
}
