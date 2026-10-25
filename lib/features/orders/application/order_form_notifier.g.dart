// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'order_form_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OrderFormNotifier)
final orderFormProvider = OrderFormNotifierProvider._();

final class OrderFormNotifierProvider
    extends $NotifierProvider<OrderFormNotifier, OrderFormState> {
  OrderFormNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'orderFormProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$orderFormNotifierHash();

  @$internal
  @override
  OrderFormNotifier create() => OrderFormNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OrderFormState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OrderFormState>(value),
    );
  }
}

String _$orderFormNotifierHash() => r'0f6e14473156b16f7c4c33fe52392cd18ab511c3';

abstract class _$OrderFormNotifier extends $Notifier<OrderFormState> {
  OrderFormState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<OrderFormState, OrderFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<OrderFormState, OrderFormState>,
              OrderFormState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
