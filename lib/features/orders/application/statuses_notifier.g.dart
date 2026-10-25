// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'statuses_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OrderStatusesNotifier)
final orderStatusesProvider = OrderStatusesNotifierProvider._();

final class OrderStatusesNotifierProvider
    extends
        $AsyncNotifierProvider<OrderStatusesNotifier, List<StatusTransition>> {
  OrderStatusesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'orderStatusesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$orderStatusesNotifierHash();

  @$internal
  @override
  OrderStatusesNotifier create() => OrderStatusesNotifier();
}

String _$orderStatusesNotifierHash() =>
    r'1706ecc11f5b4191d6696eee43118b3c7e1347d4';

abstract class _$OrderStatusesNotifier
    extends $AsyncNotifier<List<StatusTransition>> {
  FutureOr<List<StatusTransition>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<StatusTransition>>, List<StatusTransition>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<StatusTransition>>,
                List<StatusTransition>
              >,
              AsyncValue<List<StatusTransition>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(OrderTransitionsNotifier)
final orderTransitionsProvider = OrderTransitionsNotifierProvider._();

final class OrderTransitionsNotifierProvider
    extends
        $AsyncNotifierProvider<
          OrderTransitionsNotifier,
          Map<String, List<String>>
        > {
  OrderTransitionsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'orderTransitionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$orderTransitionsNotifierHash();

  @$internal
  @override
  OrderTransitionsNotifier create() => OrderTransitionsNotifier();
}

String _$orderTransitionsNotifierHash() =>
    r'd5c5499cc0b60213a14cbf415e10eb6cc2c7db04';

abstract class _$OrderTransitionsNotifier
    extends $AsyncNotifier<Map<String, List<String>>> {
  FutureOr<Map<String, List<String>>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<Map<String, List<String>>>,
              Map<String, List<String>>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Map<String, List<String>>>,
                Map<String, List<String>>
              >,
              AsyncValue<Map<String, List<String>>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
