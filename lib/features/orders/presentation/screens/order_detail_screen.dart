import 'package:alora_mobile/shared/extensions/l10n_extension.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/models/order_status.dart';
import 'package:alora_mobile/shared/widgets/app_card.dart';
import 'package:alora_mobile/shared/widgets/app_snackbar.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/status_pill.dart';
import 'package:alora_mobile/core/utils/date_format.dart';
import 'package:alora_mobile/shared/widgets/money_text.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:alora_mobile/features/orders/application/orders_notifiers.dart';
import 'package:alora_mobile/shared/widgets/error_state.dart';
import 'package:alora_mobile/features/orders/presentation/widgets/status_change_sheet.dart';

import 'package:alora_mobile/shared/widgets/skeleton.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/features/orders/application/order_pdf_notifier.dart';
import 'package:alora_mobile/features/orders/domain/entities/order.dart';

part '../widgets/order_detail_sections.dart';

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
            data: (order) => _OrderDetailMenu(
              onPdf: () => unawaited(ref.read(orderPdfProvider(orderId).notifier).openPdf()),
              onShare: () =>
                  unawaited(ref.read(orderPdfProvider(orderId).notifier).shareOrderText(order)),
              onCancel: () => unawaited(StatusChangeSheet.show(context, order)),
            ),
            orElse: () => const SizedBox.shrink(),
          ),
        ],
      ),
      body: state.when(
        data: (order) => _OrderDetailBody(
          order: order,
          onConfirm: () =>
              unawaited(ref.read(orderDetailProvider(orderId).notifier).confirmOrder()),
          onCall: order.customerPhone != null ? () => _call(order.customerPhone!) : null,
          onGeo: order.address != null ? () => _geo(order.address!) : null,
        ),
        loading: () => const Padding(
          padding: EdgeInsets.all(AppSpacing.m),
          child: Column(
            children: [
              SkeletonBox(width: double.infinity, height: 40, borderRadius: AppRadius.card),
              SizedBox(height: AppSpacing.l),
              SkeletonBox(width: double.infinity, height: 100, borderRadius: AppRadius.card),
              SizedBox(height: AppSpacing.l),
              SkeletonBox(width: double.infinity, height: 200, borderRadius: AppRadius.card),
            ],
          ),
        ),
        error: (err, st) => ErrorState(onRetry: () => ref.invalidate(orderDetailProvider(orderId))),
      ),
    );
  }
}
