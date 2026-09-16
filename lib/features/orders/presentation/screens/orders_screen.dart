import 'package:flutter/material.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/router/adaptive_shell.dart';
import 'package:alora_mobile/app/router/section_placeholder.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';

/// Buyurtmalar sahifasi (placeholder). Haqiqiy sahifa 9-bosqichda qo'shiladi.
class OrdersScreen extends StatelessWidget {
  final String? orderId;

  const OrdersScreen({super.key, this.orderId});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.tab_orders)),
      body: TabletCentered(
        child: SectionPlaceholder(
          icon: AppIcons.orders,
          title: l10n.tab_orders,
          subtitle: l10n.placeholder_comingSoon,
        ),
      ),
    );
  }
}
