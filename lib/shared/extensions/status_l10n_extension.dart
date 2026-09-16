import 'package:flutter/material.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/shared/models/order_status.dart';
import 'package:alora_mobile/shared/models/payment_status.dart';

extension OrderStatusL10nX on OrderStatus {
  String getL10n(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (this) {
      case OrderStatus.draft:
        return l10n.order_status_draft;
      case OrderStatus.confirmed:
        return l10n.order_status_confirmed;
      case OrderStatus.measuring:
        return l10n.order_status_measuring;
      case OrderStatus.production:
        return l10n.order_status_production;
      case OrderStatus.ready:
        return l10n.order_status_ready;
      case OrderStatus.installing:
        return l10n.order_status_installing;
      case OrderStatus.completed:
        return l10n.order_status_completed;
      case OrderStatus.cancelled:
        return l10n.order_status_cancelled;
      case OrderStatus.unknown:
        return l10n.order_status_unknown;
    }
  }
}

extension PaymentStatusL10nX on PaymentStatus {
  String getL10n(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (this) {
      case PaymentStatus.advancePaid:
        return l10n.payment_status_advancePaid;
      case PaymentStatus.fullyPaid:
        return l10n.payment_status_fullyPaid;
      case PaymentStatus.debt:
        return l10n.payment_status_debt;
      case PaymentStatus.unknown:
        return l10n.payment_status_unknown;
    }
  }
}
