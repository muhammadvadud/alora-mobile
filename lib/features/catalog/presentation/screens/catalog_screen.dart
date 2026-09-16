import 'package:flutter/material.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/router/adaptive_shell.dart';
import 'package:alora_mobile/app/router/section_placeholder.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';

/// Katalog sahifasi (placeholder). Haqiqiy sahifa 8-bosqichda qo'shiladi.
class CatalogScreen extends StatelessWidget {
  final String? productId;

  const CatalogScreen({super.key, this.productId});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.tab_catalog)),
      body: TabletCentered(
        child: SectionPlaceholder(
          icon: AppIcons.catalog,
          title: l10n.tab_catalog,
          subtitle: l10n.placeholder_comingSoon,
        ),
      ),
    );
  }
}
