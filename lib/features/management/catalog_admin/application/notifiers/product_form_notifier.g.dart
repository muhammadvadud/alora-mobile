// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'product_form_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProductFormNotifier)
final productFormProvider = ProductFormNotifierProvider._();

final class ProductFormNotifierProvider
    extends $NotifierProvider<ProductFormNotifier, ProductFormState> {
  ProductFormNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productFormProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productFormNotifierHash();

  @$internal
  @override
  ProductFormNotifier create() => ProductFormNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductFormState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductFormState>(value),
    );
  }
}

String _$productFormNotifierHash() =>
    r'ac1ad5eba824ef5f5d4002e86e9caca2017f8a4b';

abstract class _$ProductFormNotifier extends $Notifier<ProductFormState> {
  ProductFormState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ProductFormState, ProductFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProductFormState, ProductFormState>,
              ProductFormState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
