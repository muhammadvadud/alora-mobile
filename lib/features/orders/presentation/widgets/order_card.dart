import 'dart:async';

import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:alora_mobile/app/router/routes.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';

import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/status_pill.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/money_text.dart';
import 'package:alora_mobile/shared/widgets/app_card.dart';
import 'package:alora_mobile/features/orders/domain/entities/order.dart';
import 'package:alora_mobile/shared/models/order_status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/features/orders/application/orders_notifiers.dart';
import 'package:alora_mobile/core/utils/date_format.dart';
import 'package:go_router/go_router.dart';

import 'status_change_sheet.dart';

class OrderCard extends ConsumerWidget {
  final Order order;

  const OrderCard({super.key, required this.order});

  void _callCustomer(String phone) async {
    final uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _showStatusChangeSheet(BuildContext context) {
    StatusChangeSheet.show(context, order);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;

    return Dismissible(
      key: ValueKey(order.id),
      direction: DismissDirection.horizontal,
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          if (order.customerPhone != null) {
            _callCustomer(order.customerPhone!);
          }
        } else if (direction == DismissDirection.endToStart) {
          // Open status sheet
          _showStatusChangeSheet(context);
        }
        return false;
      },
      background: _SwipeBackground(
        color: colors.successSoft,
        icon: AppIcons.phone,
        iconColor: colors.success,
        alignment: Alignment.centerLeft,
      ),
      secondaryBackground: _SwipeBackground(
        color: colors.accentSoft,
        icon: AppIcons.edit,
        iconColor: colors.accent,
        alignment: Alignment.centerRight,
      ),
      child: AppCard(
        onTap: () => context.go(AppRoutes.order(order.id)),
        padding: const EdgeInsets.all(AppSpacing.screenH),
        child: _OrderCardContent(order: order),
      ),
    );
  }
}

class _OrderCardContent extends ConsumerWidget {
  final Order order;

  const _OrderCardContent({required this.order});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final typography = context.text;
    final l10n = AppLocalizations.of(context)!;

    final createdAt = order.createdAt;
    final createdText = createdAt != null ? formatDate(createdAt, context: context) : '—';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              order.number ?? 'Nomsiz',
              style: typography.mono.copyWith(color: colors.textPrimary),
            ),
            StatusPill(status: order.status),
          ],
        ),
        const SizedBox(height: AppSpacing.m),
        Text(
          order.customerName ?? "Mijoz",
          style: typography.titleS.copyWith(color: colors.textPrimary),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (order.customerPhone != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(order.customerPhone!, style: typography.bodyS.copyWith(color: colors.textSecondary)),
        ],
        const SizedBox(height: AppSpacing.xs),
        Text(
          '${order.measurements.length} xona · ${order.measurements.expand((m) => m.parts).length} bo\'lak',
          style: typography.bodyS.copyWith(color: colors.textSecondary),
        ),
        const SizedBox(height: AppSpacing.m),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MoneyText(
                  amount: order.total ?? 0,
                  style: typography.labelL.copyWith(color: colors.textPrimary),
                ),
                if (order.paymentStatusDisplay != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: PaymentChip(status: order.paymentStatus),
                  ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  l10n.orders_createdAt,
                  style: typography.labelS.copyWith(color: colors.textSecondary),
                ),
                const SizedBox(height: 2),
                Text(
                  createdText,
                  style: typography.bodyS.copyWith(color: colors.textSecondary),
                ),
              ],
            ),
          ],
        ),
        if (order.status == OrderStatus.draft) ...[
          const SizedBox(height: AppSpacing.m),
          AppButton(
            text: context.l10n.orders_confirm,
            onPressed: () =>
                unawaited(ref.read(ordersListProvider.notifier).confirmOrder(order.id)),
          ),
        ],
      ],
    );
  }
}

class _SwipeBackground extends StatelessWidget {
  final Color color;
  final IconData icon;
  final Color iconColor;
  final Alignment alignment;

  const _SwipeBackground({
    required this.color,
    required this.icon,
    required this.iconColor,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(color: color, borderRadius: AppRadius.cardBorder),
      child: Icon(icon, color: iconColor),
    );
  }
}
