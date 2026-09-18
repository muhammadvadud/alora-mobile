import 'package:alora_mobile/shared/extensions/l10n_extension.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/models/order_status.dart';
import 'package:alora_mobile/shared/widgets/app_snackbar.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/core/utils/money_format.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:alora_mobile/app/theme/app_colors.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/app/theme/app_typography.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/features/orders/application/orders_notifiers.dart';
import 'package:alora_mobile/shared/widgets/status_pill.dart';
import 'package:alora_mobile/shared/widgets/error_state.dart';
import 'package:alora_mobile/features/orders/presentation/widgets/status_timeline.dart';
import 'package:alora_mobile/shared/widgets/skeleton.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/features/orders/application/order_pdf_notifier.dart';

class OrderDetailScreen extends ConsumerWidget {
  final String orderId;

  const OrderDetailScreen({super.key, required this.orderId});

  void _call(String phone) async {
    final uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _geo(String address) async {
    final uri = Uri.parse('geo:0,0?q=${Uri.encodeComponent(address)}');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(orderDetailProvider(orderId));
    final colors = context.colors;
    final typography = context.text;

    // Tasdiqlash muvaffaqiyatli bo'lsa snackbar (9.14)
    ref.listen(orderDetailProvider(orderId), (previous, next) {
      final was = previous?.value?.status;
      final now = next.value?.status;
      if (was == OrderStatus.draft && now == OrderStatus.confirmed) {
        AppSnackbar.show(context, message: context.l10n.orders_confirmedSnack);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.orderDetail),
        backgroundColor: colors.surface,
        elevation: 0,
        iconTheme: IconThemeData(color: colors.textPrimary),
        actions: [
          state.maybeWhen(
            data: (order) => PopupMenuButton<String>(
              icon: Icon(AppIcons.more, color: colors.textPrimary),
              onSelected: (value) {
                if (value == 'pdf') {
                  unawaited(
                    ref.read(orderPdfProvider(orderId).notifier).openPdf(),
                  );
                } else if (value == 'share') {
                  unawaited(
                    ref
                        .read(orderPdfProvider(orderId).notifier)
                        .shareOrderText(order),
                  );
                } else if (value == 'cancel') {
                  // implemented later
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'pdf',
                  child: Text(context.l10n.orders_pdf),
                ),
                PopupMenuItem(
                  value: 'share',
                  child: Text(context.l10n.orders_share),
                ),
                PopupMenuItem(
                  value: 'cancel',
                  child: Text(context.l10n.common_cancel),
                ),
              ],
            ),
            orElse: () => const SizedBox.shrink(),
          ),
        ],
      ),
      body: state.when(
        data: (order) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.m),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      order.number ?? '',
                      style: typography.titleL.copyWith(
                        color: colors.textPrimary,
                      ),
                    ),
                    StatusPill(status: order.status),
                  ],
                ),
                const SizedBox(height: AppSpacing.s),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (order.createdAt != null)
                      Text(
                        context.l10n.dateLabel(
                          order.createdAt!.toString().split(' ')[0],
                        ),
                        style: typography.bodyS.copyWith(
                          color: colors.textSecondary,
                        ),
                      ),
                    if (order.user != null)
                      Text(
                        context.l10n.sellerLabel(order.user!.fullName ?? ''),
                        style: typography.bodyS.copyWith(
                          color: colors.textSecondary,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: AppSpacing.l),

                // Timeline
                StatusTimeline(
                  currentStatus: order.status,
                  actionDate: order.updatedAt,
                ),
                const SizedBox(height: AppSpacing.l),

                // 9.14: qoralama → tasdiqlash (POST confirm/)
                if (order.status == OrderStatus.draft) ...[
                  AppButton(
                    text: context.l10n.orders_confirm,
                    onPressed: () => unawaited(
                      ref
                          .read(orderDetailProvider(orderId).notifier)
                          .confirmOrder(),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.l),
                ],

                // Customer info
                if (order.customerName != null) ...[
                  Text(
                    context.l10n.customer,
                    style: typography.titleM.copyWith(
                      color: colors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.s),
                  ListTile(
                    leading: Icon(
                      AppIcons.profile,
                      color: colors.textSecondary,
                    ),
                    title: Text(order.customerName!, style: typography.bodyL),
                    subtitle: Text(order.customerPhone ?? ''),
                    trailing: order.customerPhone != null
                        ? IconButton(
                            icon: Icon(AppIcons.phone, color: colors.accent),
                            onPressed: () => _call(order.customerPhone!),
                          )
                        : null,
                    contentPadding: EdgeInsets.zero,
                  ),
                ],
                if (order.address != null)
                  ListTile(
                    leading: Icon(AppIcons.mapPin, color: colors.textSecondary),
                    title: Text(order.address!, style: typography.bodyL),
                    trailing: IconButton(
                      icon: Icon(AppIcons.mapPin, color: colors.accent),
                      onPressed: () => _geo(order.address!),
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),

                // Rooms (simplified)
                const SizedBox(height: AppSpacing.l),
                Text(
                  context.l10n.rooms,
                  style: typography.titleM.copyWith(color: colors.textPrimary),
                ),
                const SizedBox(height: AppSpacing.s),
                ...order.measurements.map((m) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: AppSpacing.s),
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.m),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(m.roomName ?? 'Xona', style: typography.titleS),
                          const SizedBox(height: AppSpacing.s),
                          Text(
                            context.l10n.corniceAndHeight(
                              (m.corniceLengthM ?? 0).toString(),
                              (m.heightM ?? 0).toString(),
                            ),
                            style: typography.bodyS,
                          ),
                        ],
                      ),
                    ),
                  );
                }),

                // Finance block
                const SizedBox(height: AppSpacing.l),
                Text(
                  context.l10n.finance,
                  style: typography.titleM.copyWith(color: colors.textPrimary),
                ),
                const SizedBox(height: AppSpacing.s),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.m),
                    child: Column(
                      children: [
                        _finRow(
                          context.l10n.orders_financeTotal,
                          formatMoney(order.total ?? 0),
                          typography,
                          colors,
                        ),
                        if (order.prepayment != null)
                          _finRow(
                            context.l10n.orders_financePrepayment,
                            formatMoney(order.prepayment!),
                            typography,
                            colors,
                          ),
                        if (order.balance != null)
                          _finRow(
                            context.l10n.orders_financeBalance,
                            formatMoney(order.balance!),
                            typography,
                            colors,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Padding(
          padding: EdgeInsets.all(AppSpacing.m),
          child: Column(
            children: [
              SkeletonBox(
                width: double.infinity,
                height: 40,
                borderRadius: AppRadius.card,
              ),
              SizedBox(height: AppSpacing.l),
              SkeletonBox(
                width: double.infinity,
                height: 100,
                borderRadius: AppRadius.card,
              ),
              SizedBox(height: AppSpacing.l),
              SkeletonBox(
                width: double.infinity,
                height: 200,
                borderRadius: AppRadius.card,
              ),
            ],
          ),
        ),
        error: (err, st) => ErrorState(
          onRetry: () => ref.invalidate(orderDetailProvider(orderId)),
        ),
      ),
    );
  }

  Widget _finRow(
    String label,
    String value,
    AppTypography typography,
    AppColors colors,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: typography.bodyL.copyWith(color: colors.textSecondary),
          ),
          Text(
            value,
            style: typography.bodyL.copyWith(
              color: colors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
