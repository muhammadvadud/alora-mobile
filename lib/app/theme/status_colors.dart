import 'package:flutter/material.dart';
import 'package:alora_mobile/app/theme/app_colors.dart';
import 'package:alora_mobile/shared/models/order_status.dart';
import 'package:alora_mobile/shared/models/payment_status.dart';

class StatusColorPair {
  final Color background;
  final Color textAndDot;

  const StatusColorPair({required this.background, required this.textAndDot});
}

StatusColorPair getOrderStatusColors(OrderStatus status, AppColors colors) {
  return StatusColors.getOrderStatusColors(status, colors);
}

class StatusColors {
  static StatusColorPair getOrderStatusColors(
    OrderStatus status,
    AppColors colors,
  ) {
    switch (status) {
      case OrderStatus.draft:
        return StatusColorPair(
          background: colors.surfaceMuted,
          textAndDot: colors.textSecondary,
        );
      case OrderStatus.confirmed:
        return StatusColorPair(
          background: colors.infoSoft,
          textAndDot: colors.info,
        );
      case OrderStatus.measuring:
      case OrderStatus.production:
        return StatusColorPair(
          background: colors.brassSoft,
          textAndDot: colors.brass,
        );
      case OrderStatus.ready:
      case OrderStatus.installing:
        return StatusColorPair(
          background: colors.accentSoft,
          textAndDot: colors.accent,
        );
      case OrderStatus.completed:
        return StatusColorPair(
          background: colors.successSoft,
          textAndDot: colors.success,
        );
      case OrderStatus.cancelled:
        return StatusColorPair(
          background: colors.dangerSoft,
          textAndDot: colors.danger,
        );
      case OrderStatus.unknown:
        return StatusColorPair(
          background: colors.surfaceMuted,
          textAndDot: colors.textSecondary,
        );
    }
  }

  static StatusColorPair getPaymentStatusColors(
    PaymentStatus status,
    AppColors colors,
  ) {
    switch (status) {
      case PaymentStatus.prepaid:
        return StatusColorPair(
          background: colors.accentSoft,
          textAndDot: colors.accent,
        );
      case PaymentStatus.paid:
        return StatusColorPair(
          background: colors.successSoft,
          textAndDot: colors.success,
        );
      case PaymentStatus.unpaid:
        return StatusColorPair(
          background: colors.dangerSoft,
          textAndDot: colors.danger,
        );
      case PaymentStatus.unknown:
        return StatusColorPair(
          background: colors.surfaceMuted,
          textAndDot: colors.textSecondary,
        );
    }
  }
}
