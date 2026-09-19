import 'package:flutter/material.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/router/adaptive_shell.dart';
import 'package:alora_mobile/app/router/../../shared/widgets/empty_state.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';

/// 403 — Ruxsat yo'q ekrani (employee → /management kirishga urinib qolsa)
class ForbiddenScreen extends StatelessWidget {
  const ForbiddenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.forbidden_title)),
      body: TabletCentered(
        child: EmptyState(
          icon: AppIcons.ban,
          title: l10n.forbidden_title,
          message: l10n.forbidden_text,
        ),
      ),
    );
  }
}
