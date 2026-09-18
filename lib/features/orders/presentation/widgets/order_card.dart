import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_colors.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/app/theme/status_colors.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/status_pill.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/money_text.dart';
import 'package:alora_mobile/features/orders/domain/entities/order.dart';
import 'package:alora_mobile/shared/models/order_status.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/features/orders/application/orders_notifiers.dart';
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
    final typography = context.text;
    final l10n = AppLocalizations.of(context)!;

    final statusColors = getOrderStatusColors(order.status, colors);

    final deadlineText = _getDeadlineText(order.deadlineDate, l10n);
    final deadlineColor = _getDeadlineColor(order.deadlineDate, colors);

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
      background: _buildSwipeBackground(
        color: colors.successSoft,
        icon: AppIcons.phone,
        iconColor: colors.success,
        alignment: Alignment.centerLeft,
      ),
      secondaryBackground: _buildSwipeBackground(
        color: colors.accentSoft,
        icon: AppIcons.edit,
        iconColor: colors.accent,
        alignment: Alignment.centerRight,
      ),
      child: GestureDetector(
        onTap: () => context.go('/orders/${order.id}'),
        child: Container(
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: AppRadius.cardBorder,
            border: Border.all(color: colors.border, width: 1),
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 3,
                  decoration: BoxDecoration(
                    color: statusColors.textAndDot,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppRadius.card),
                      bottomLeft: Radius.circular(AppRadius.card),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.m),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              order.number ?? 'Nomsiz',
                              style: typography.mono.copyWith(
                                color: colors.textPrimary,
                              ),
                            ),
                            StatusPill(status: order.status),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.s),
                        Text(
                          '${order.customerName ?? "Mijoz"} · ${order.customerPhone ?? "Raqam yo'q"}',
                          style: typography.titleM.copyWith(
                            color: colors.textPrimary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${order.measurements.length} xona · ${order.measurements.expand((m) => m.parts).length} bo\'lak',
                          style: typography.bodyS.copyWith(
                            color: colors.textSecondary,
                          ),
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
                                  style: typography.titleM.copyWith(
                                    color: colors.textPrimary,
                                  ),
                                ),
                                if (order.paymentStatusDisplay != null)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: PaymentChip(
                                      status: order.paymentStatus,
                                    ),
                                  ),
                              ],
                            ),
                            Text(
                              deadlineText,
                              style: typography.bodyS.copyWith(
                                color: deadlineColor,
                              ),
                            ),
                          ],
                        ),
                        if (order.status == OrderStatus.draft) ...[
                          const SizedBox(height: AppSpacing.m),
                          AppButton(
                            text: 'Tasdiqlash',
                            onPressed: () {
                              ref
                                  .read(orderDetailProvider(order.id).notifier)
                                  .confirmOrder();
                            },
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSwipeBackground({
    required Color color,
    required IconData icon,
    required Color iconColor,
    required Alignment alignment,
  }) {
    return Container(
      alignment: alignment,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: AppRadius.cardBorder,
      ),
      child: Icon(icon, color: iconColor),
    );
  }

  String _getDeadlineText(DateTime? date, AppLocalizations l10n) {
    if (date == null) return 'Muddat qo\'yilmagan';
    final now = DateTime.now();
    final diff = date.difference(now).inDays;
    if (diff < 0) return 'O\'tib ketgan';
    if (diff == 0) return 'Bugun';
    if (diff == 1) return 'Erta';
    return '$diff kun qoldi';
  }

  Color _getDeadlineColor(DateTime? date, AppColors colors) {
    if (date == null) return colors.textSecondary;
    final now = DateTime.now();
    final diff = date.difference(now).inDays;
    if (diff < 0) return colors.danger;
    if (diff <= 3) return colors.brass;
    return colors.textSecondary;
  }
}
