// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'orders_notifiers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OrdersListFilterNotifier)
final ordersListFilterProvider = OrdersListFilterNotifierProvider._();

final class OrdersListFilterNotifierProvider
    extends $NotifierProvider<OrdersListFilterNotifier, OrdersListFilter> {
  OrdersListFilterNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ordersListFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ordersListFilterNotifierHash();

  @$internal
  @override
  OrdersListFilterNotifier create() => OrdersListFilterNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OrdersListFilter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OrdersListFilter>(value),
    );
  }
}

String _$ordersListFilterNotifierHash() => r'4f8783c929912cf03d9b1df0fd4384e3b39492cc';

abstract class _$OrdersListFilterNotifier extends $Notifier<OrdersListFilter> {
  OrdersListFilter build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<OrdersListFilter, OrdersListFilter>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<OrdersListFilter, OrdersListFilter>,
              OrdersListFilter,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(OrdersListNotifier)
final ordersListProvider = OrdersListNotifierProvider._();

final class OrdersListNotifierProvider
    extends $AsyncNotifierProvider<OrdersListNotifier, CursorPagingState<Order>> {
  OrdersListNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ordersListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ordersListNotifierHash();

  @$internal
  @override
  OrdersListNotifier create() => OrdersListNotifier();
}

String _$ordersListNotifierHash() => r'd14b5fdaef6cfa66f7f505488463b49c52770312';

abstract class _$OrdersListNotifier extends $AsyncNotifier<CursorPagingState<Order>> {
  FutureOr<CursorPagingState<Order>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<CursorPagingState<Order>>, CursorPagingState<Order>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<CursorPagingState<Order>>, CursorPagingState<Order>>,
              AsyncValue<CursorPagingState<Order>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(OrderDetailNotifier)
final orderDetailProvider = OrderDetailNotifierFamily._();

final class OrderDetailNotifierProvider extends $AsyncNotifierProvider<OrderDetailNotifier, Order> {
  OrderDetailNotifierProvider._({
    required OrderDetailNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'orderDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$orderDetailNotifierHash();

  @override
  String toString() {
    return r'orderDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  OrderDetailNotifier create() => OrderDetailNotifier();

  @override
  bool operator ==(Object other) {
    return other is OrderDetailNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$orderDetailNotifierHash() => r'f194a5e0142436346f1b6c08419d90dd7c26993a';

final class OrderDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          OrderDetailNotifier,
          AsyncValue<Order>,
          Order,
          FutureOr<Order>,
          String
        > {
  OrderDetailNotifierFamily._()
    : super(
        retry: null,
        name: r'orderDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  OrderDetailNotifierProvider call(String id) =>
      OrderDetailNotifierProvider._(argument: id, from: this);

  @override
  String toString() => r'orderDetailProvider';
}

abstract class _$OrderDetailNotifier extends $AsyncNotifier<Order> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  FutureOr<Order> build(String id);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Order>, Order>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Order>, Order>,
              AsyncValue<Order>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
