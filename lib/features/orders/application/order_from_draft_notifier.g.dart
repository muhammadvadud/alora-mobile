// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'order_from_draft_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// AI qoralamasidan (`OrderDraft`, S-07) buyurtma yaratadi — `POST orders/`.
/// Narx/hisob ilovada hisoblanmaydi: faqat backend bergan maydonlar uzatiladi (§0.8).

@ProviderFor(OrderFromDraftNotifier)
final orderFromDraftProvider = OrderFromDraftNotifierProvider._();

/// AI qoralamasidan (`OrderDraft`, S-07) buyurtma yaratadi — `POST orders/`.
/// Narx/hisob ilovada hisoblanmaydi: faqat backend bergan maydonlar uzatiladi (§0.8).
final class OrderFromDraftNotifierProvider
    extends $AsyncNotifierProvider<OrderFromDraftNotifier, Order?> {
  /// AI qoralamasidan (`OrderDraft`, S-07) buyurtma yaratadi — `POST orders/`.
  /// Narx/hisob ilovada hisoblanmaydi: faqat backend bergan maydonlar uzatiladi (§0.8).
  OrderFromDraftNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'orderFromDraftProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$orderFromDraftNotifierHash();

  @$internal
  @override
  OrderFromDraftNotifier create() => OrderFromDraftNotifier();
}

String _$orderFromDraftNotifierHash() => r'23675d4b1768d1ab3c4dafb9baa6c217f7278250';

/// AI qoralamasidan (`OrderDraft`, S-07) buyurtma yaratadi — `POST orders/`.
/// Narx/hisob ilovada hisoblanmaydi: faqat backend bergan maydonlar uzatiladi (§0.8).

abstract class _$OrderFromDraftNotifier extends $AsyncNotifier<Order?> {
  FutureOr<Order?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Order?>, Order?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Order?>, Order?>,
              AsyncValue<Order?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
