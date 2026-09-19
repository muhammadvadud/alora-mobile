// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'order_pdf_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(OrderPdfNotifier)
final orderPdfProvider = OrderPdfNotifierFamily._();

final class OrderPdfNotifierProvider extends $AsyncNotifierProvider<OrderPdfNotifier, void> {
  OrderPdfNotifierProvider._({
    required OrderPdfNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'orderPdfProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$orderPdfNotifierHash();

  @override
  String toString() {
    return r'orderPdfProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  OrderPdfNotifier create() => OrderPdfNotifier();

  @override
  bool operator ==(Object other) {
    return other is OrderPdfNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$orderPdfNotifierHash() => r'5def62d6902380a7cdc5245c69f6422df66cfa17';

final class OrderPdfNotifierFamily extends $Family
    with $ClassFamilyOverride<OrderPdfNotifier, AsyncValue<void>, void, FutureOr<void>, String> {
  OrderPdfNotifierFamily._()
    : super(
        retry: null,
        name: r'orderPdfProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  OrderPdfNotifierProvider call(String id) => OrderPdfNotifierProvider._(argument: id, from: this);

  @override
  String toString() => r'orderPdfProvider';
}

abstract class _$OrderPdfNotifier extends $AsyncNotifier<void> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  FutureOr<void> build(String id);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
