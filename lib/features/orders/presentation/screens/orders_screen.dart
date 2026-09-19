import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:alora_mobile/app/router/routes.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';
import 'package:alora_mobile/shared/widgets/app_chip.dart';
import 'package:alora_mobile/features/orders/application/orders_notifiers.dart';
import 'package:alora_mobile/features/orders/application/providers.dart';
import 'package:alora_mobile/features/orders/application/statuses_notifier.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/shared/widgets/error_state.dart';
import 'package:alora_mobile/shared/widgets/empty_state.dart';
import 'package:alora_mobile/shared/widgets/skeleton.dart';
import 'package:alora_mobile/features/orders/presentation/widgets/order_card.dart';
import 'package:alora_mobile/features/orders/presentation/screens/order_detail_screen.dart';

class OrdersScreen extends ConsumerWidget {
  final String? orderId;

  const OrdersScreen({super.key, this.orderId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (orderId != null) {
      return OrderDetailScreen(orderId: orderId!);
    }

    final colors = context.colors;
    final typography = context.text;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(
        title: Text(
          context.l10n.orders,
          style: typography.titleL.copyWith(color: colors.textPrimary),
        ),
        backgroundColor: colors.surface,
        elevation: 0,
      ),
      body: const Column(
        children: [
          _OrdersSearchField(),
          _OrdersStatusChips(),
          SizedBox(height: AppSpacing.m),
          Expanded(child: _OrdersBody()),
        ],
      ),
    );
  }
}

class _OrdersSearchField extends ConsumerWidget {
  const _OrdersSearchField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.screenH),
      child: AppTextField(
        type: AppTextFieldType.search,
        hintText: 'Qidiruv (raqam, ism, telefon)',
        onChanged: (val) {
          ref.read(ordersListFilterProvider.notifier).updateSearch(val.isEmpty ? null : val);
        },
      ),
    );
  }
}

class _OrdersStatusChips extends ConsumerWidget {
  const _OrdersStatusChips();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(ordersListFilterProvider);
    final statusesState = ref.watch(orderStatusesProvider);
    final draftCount = ref
        .watch(draftOrdersCountProvider)
        .maybeWhen(data: (count) => count, orElse: () => 0);

    return SizedBox(
      height: 40,
      child: statusesState.when(
        data: (statuses) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenH),
            scrollDirection: Axis.horizontal,
            itemCount: statuses.length + 1,
            separatorBuilder: (context, index) => const SizedBox(width: AppSpacing.s),
            itemBuilder: (context, index) {
              if (index == 0) {
                final isSelected = filter.status == null;
                return AppChip(
                  label: 'Barchasi',
                  state: isSelected ? AppChipState.selected : AppChipState.unselected,
                  onTap: () => ref.read(ordersListFilterProvider.notifier).updateStatus(null),
                );
              }
              final s = statuses[index - 1];
              final isSelected = filter.status == s.code;
              if (s.code == 'draft') {
                return AppCountChip(
                  label: s.label,
                  count: draftCount,
                  isSelected: isSelected,
                  onTap: () => ref.read(ordersListFilterProvider.notifier).updateStatus(s.code),
                );
              }
              return AppChip(
                label: s.label,
                state: isSelected ? AppChipState.selected : AppChipState.unselected,
                onTap: () => ref.read(ordersListFilterProvider.notifier).updateStatus(s.code),
              );
            },
          );
        },
        loading: () => ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenH),
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          separatorBuilder: (context, index) => const SizedBox(width: AppSpacing.s),
          itemBuilder: (context, index) =>
              const SkeletonBox(width: 80, height: 40, borderRadius: AppRadius.pill),
        ),
        error: (err, _) => Center(child: Text(context.l10n.errorLoadingStatuses)),
      ),
    );
  }
}

class _OrdersBody extends ConsumerWidget {
  const _OrdersBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listState = ref.watch(ordersListProvider);

    return listState.when(
      data: (pagingState) {
        if (pagingState.items.isEmpty) {
          return EmptyState(
            title: 'Hali buyurtma yo\'q',
            message: 'Chatda hisob qilib, buyurtma yarating',
            icon: AppIcons.orders,
            actionText: 'Yangi suhbat',
            onAction: () {
              context.go(AppRoutes.chat);
            },
          );
        }

        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
              ref.read(ordersListProvider.notifier).loadMore();
            }
            return false;
          },
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.screenH,
              vertical: AppSpacing.s,
            ),
            itemCount: pagingState.items.length + (pagingState.hasMore ? 1 : 0),
            separatorBuilder: (context, index) => const SizedBox(height: AppSpacing.m),
            itemBuilder: (context, index) {
              if (index == pagingState.items.length) {
                return const Padding(
                  padding: EdgeInsets.all(AppSpacing.m),
                  child: Center(child: SkeletonBox(width: 32, height: 32, shape: BoxShape.circle)),
                );
              }
              final order = pagingState.items[index];
              return OrderCard(order: order);
            },
          ),
        );
      },
      loading: () => ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenH, vertical: AppSpacing.s),
        itemCount: 5,
        separatorBuilder: (context, index) => const SizedBox(height: AppSpacing.m),
        itemBuilder: (context, index) =>
            const SkeletonBox(width: double.infinity, height: 120, borderRadius: AppRadius.card),
      ),
      error: (err, st) => ErrorState(onRetry: () => ref.invalidate(ordersListProvider)),
    );
  }
}
