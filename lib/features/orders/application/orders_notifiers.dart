import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:alora_mobile/core/utils/cursor_paging_controller.dart';
import 'package:alora_mobile/features/orders/application/providers.dart';
import 'package:alora_mobile/features/orders/domain/entities/order.dart';

part 'orders_notifiers.g.dart';

class OrdersListFilter {
  final String? status;
  final String? search;
  final String? user;

  const OrdersListFilter({this.status, this.search, this.user});

  OrdersListFilter copyWith({
    String? status,
    bool setStatusToNull = false,
    String? search,
    bool setSearchToNull = false,
    String? user,
    bool setUserToNull = false,
  }) {
    return OrdersListFilter(
      status: setStatusToNull ? null : (status ?? this.status),
      search: setSearchToNull ? null : (search ?? this.search),
      user: setUserToNull ? null : (user ?? this.user),
    );
  }
}

@riverpod
class OrdersListFilterNotifier extends _$OrdersListFilterNotifier {
  @override
  OrdersListFilter build() {
    return const OrdersListFilter();
  }

  void updateStatus(String? status) {
    state = state.copyWith(status: status, setStatusToNull: status == null);
  }

  void updateSearch(String? search) {
    state = state.copyWith(search: search, setSearchToNull: search == null);
  }
}

@riverpod
class OrdersListNotifier extends _$OrdersListNotifier {
  @override
  FutureOr<CursorPagingState<Order>> build() async {
    final filter = ref.watch(ordersListFilterProvider);
    final repo = ref.watch(ordersRepositoryProvider);

    final paginated = await repo.getOrders(
      status: filter.status,
      search: filter.search,
    );

    return CursorPagingState<Order>(
      items: paginated.results,
      nextUrl: paginated.next,
      isLoadingMore: false,
      hasError: false,
    );
  }

  Future<void> loadMore() async {
    if (state.value == null ||
        !state.value!.hasMore ||
        state.value!.isLoadingMore) {
      return;
    }

    final currentState = state.value!;
    state = AsyncValue.data(currentState.copyWith(isLoadingMore: true));

    try {
      final filter = ref.read(ordersListFilterProvider);
      final repo = ref.read(ordersRepositoryProvider);

      final paginated = await repo.getOrders(
        status: filter.status,
        search: filter.search,
        url: currentState.nextUrl,
      );

      state = AsyncValue.data(
        currentState.copyWith(
          items: [...currentState.items, ...paginated.results],
          nextUrl: paginated.next,
          setNextUrlToNull: paginated.next == null,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      state = AsyncValue.data(
        currentState.copyWith(isLoadingMore: false, hasError: true),
      );
      // You could optionally set state to error depending on how you want to show it.
    }
  }

  /// Ro'yxatdagi qoralamani tasdiqlash (`POST confirm/`, 9.14): server javobi
  /// bilan element almashtiriladi, tafsilot va badge yangilanadi.
  Future<void> confirmOrder(String id) async {
    final current = state.value;
    if (current == null) return;
    final repo = ref.read(ordersRepositoryProvider);
    final updated = await repo.confirmOrder(id);
    state = AsyncValue.data(
      current.copyWith(
        items: [for (final o in current.items) o.id == id ? updated : o],
      ),
    );
    ref.invalidate(orderDetailProvider(id));
    ref.invalidate(draftOrdersCountProvider);
  }
}

@riverpod
class OrderDetailNotifier extends _$OrderDetailNotifier {
  @override
  FutureOr<Order> build(String id) async {
    final repo = ref.watch(ordersRepositoryProvider);
    return repo.getOrder(id);
  }

  Future<void> confirmOrder() async {
    final repo = ref.read(ordersRepositoryProvider);
    final currentOrder = state.value;
    if (currentOrder == null) return;

    // Optimistic UI could be applied, but let's wait for backend
    state = const AsyncValue.loading();
    try {
      final updatedOrder = await repo.confirmOrder(currentOrder.id);
      state = AsyncValue.data(updatedOrder);
      ref.invalidate(draftOrdersCountProvider);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> changeStatus(
    String newStatus, {
    String? note,
    String? actionDate,
  }) async {
    final repo = ref.read(ordersRepositoryProvider);
    final currentOrder = state.value;
    if (currentOrder == null) return;

    state = const AsyncValue.loading();
    try {
      final updatedOrder = await repo.changeStatus(
        currentOrder.id,
        newStatus,
        note: note,
        actionDate: actionDate,
      );
      state = AsyncValue.data(updatedOrder);
      ref.invalidate(draftOrdersCountProvider);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
