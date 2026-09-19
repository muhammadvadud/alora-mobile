import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/models/order_status.dart';
import 'package:alora_mobile/app/theme/app_colors.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';

extension OrderStatusExtension on OrderStatus {
  String text(BuildContext context) {
    switch (this) {
      case OrderStatus.draft:
        return context.l10n.order_status_draft;
      case OrderStatus.confirmed:
        return context.l10n.order_status_confirmed;
      case OrderStatus.measuring:
        return context.l10n.order_status_measuring;
      case OrderStatus.production:
        return context.l10n.order_status_production;
      case OrderStatus.ready:
        return context.l10n.order_status_ready;
      case OrderStatus.installing:
        return context.l10n.order_status_installing;
      case OrderStatus.completed:
        return context.l10n.order_status_completed;
      case OrderStatus.cancelled:
        return context.l10n.order_status_cancelled;
      case OrderStatus.unknown:
        return context.l10n.order_status_unknown;
    }
  }

  Color color(AppColors colors) {
    switch (this) {
      case OrderStatus.draft:
        return colors.textSecondary;
      case OrderStatus.confirmed:
        return colors.info;
      case OrderStatus.measuring:
        return colors.warning;
      case OrderStatus.production:
        return colors.accent;
      case OrderStatus.ready:
        return colors.success;
      case OrderStatus.installing:
        return colors.warning; // or another color
      case OrderStatus.completed:
        return colors.success;
      case OrderStatus.cancelled:
        return colors.danger;
      case OrderStatus.unknown:
        return colors.textDisabled;
    }
  }
}
