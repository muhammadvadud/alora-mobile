import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/extensions/status_l10n_extension.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/app/theme/status_colors.dart';
import 'package:alora_mobile/shared/models/order_status.dart';
import 'package:alora_mobile/shared/models/payment_status.dart';

class StatusPill extends StatelessWidget {
  final OrderStatus status;

  const StatusPill({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;
    final colorPair = StatusColors.getOrderStatusColors(status, colors);

    return Container(
      padding: AppSpacing.statusPillPadding,
      decoration: BoxDecoration(
        color: colorPair.background,
        borderRadius: AppRadius.pillBorder,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: colorPair.textAndDot,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            status.getL10n(context),
            style: typography.labelS.copyWith(color: colorPair.textAndDot),
          ),
        ],
      ),
    );
  }
}

class PaymentChip extends StatelessWidget {
  final PaymentStatus status;

  const PaymentChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;
    final colorPair = StatusColors.getPaymentStatusColors(status, colors);

    return Container(
      padding: AppSpacing.statusPillPadding,
      decoration: BoxDecoration(
        color: colorPair.background,
        borderRadius: AppRadius.pillBorder,
      ),
      child: Text(
        status.getL10n(context),
        style: typography.labelS.copyWith(color: colorPair.textAndDot),
      ),
    );
  }
}
