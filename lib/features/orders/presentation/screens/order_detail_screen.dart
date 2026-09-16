import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:flutter/material.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.orderDetail),
        backgroundColor: colors.surface,
        elevation: 0,
        iconTheme: IconThemeData(color: colors.textPrimary),
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
                    leading: Icon(Icons.person, color: colors.textSecondary),
                    title: Text(order.customerName!, style: typography.bodyL),
                    subtitle: Text(order.customerPhone ?? ''),
                    trailing: order.customerPhone != null
                        ? IconButton(
                            icon: Icon(Icons.phone, color: colors.accent),
                            onPressed: () => _call(order.customerPhone!),
                          )
                        : null,
                    contentPadding: EdgeInsets.zero,
                  ),
                ],
                if (order.address != null)
                  ListTile(
                    leading: Icon(
                      Icons.location_on,
                      color: colors.textSecondary,
                    ),
                    title: Text(order.address!, style: typography.bodyL),
                    trailing: IconButton(
                      icon: Icon(Icons.map, color: colors.accent),
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
                          'Jami',
                          '${order.total} so\'m',
                          typography,
                          colors,
                        ),
                        if (order.prepayment != null)
                          _finRow(
                            'Avans',
                            '${order.prepayment} so\'m',
                            typography,
                            colors,
                          ),
                        if (order.balance != null)
                          _finRow(
                            'Qoldiq',
                            '${order.balance} so\'m',
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
        loading: () => const Center(child: CircularProgressIndicator()),
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
