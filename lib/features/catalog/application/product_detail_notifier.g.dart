// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'product_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Bitta mahsulotni boshqaruvchi notifier (family — productId bo'yicha).

@ProviderFor(ProductDetailNotifier)
final productDetailProvider = ProductDetailNotifierFamily._();

/// Bitta mahsulotni boshqaruvchi notifier (family — productId bo'yicha).
final class ProductDetailNotifierProvider
    extends $NotifierProvider<ProductDetailNotifier, ProductState> {
  /// Bitta mahsulotni boshqaruvchi notifier (family — productId bo'yicha).
  ProductDetailNotifierProvider._({
    required ProductDetailNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'productDetailProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$productDetailNotifierHash();

  @override
  String toString() {
    return r'productDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ProductDetailNotifier create() => ProductDetailNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ProductDetailNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$productDetailNotifierHash() =>
    r'fcceb5e29678f39a54e126d950680ebeb10d09dc';

/// Bitta mahsulotni boshqaruvchi notifier (family — productId bo'yicha).

final class ProductDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          ProductDetailNotifier,
          ProductState,
          ProductState,
          ProductState,
          String
        > {
  ProductDetailNotifierFamily._()
    : super(
        retry: null,
        name: r'productDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// Bitta mahsulotni boshqaruvchi notifier (family — productId bo'yicha).

  ProductDetailNotifierProvider call(String productId) =>
      ProductDetailNotifierProvider._(argument: productId, from: this);

  @override
  String toString() => r'productDetailProvider';
}

/// Bitta mahsulotni boshqaruvchi notifier (family — productId bo'yicha).

abstract class _$ProductDetailNotifier extends $Notifier<ProductState> {
  late final _$args = ref.$arg as String;
  String get productId => _$args;

  ProductState build(String productId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ProductState, ProductState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProductState, ProductState>,
              ProductState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
