// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'catalog_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Katalog holatini boshqaruvchi notifier: kategoriyalar, qidiruv (300 ms debounce),
/// filtrlar, sahifalash.

@ProviderFor(CatalogNotifier)
final catalogProvider = CatalogNotifierProvider._();

/// Katalog holatini boshqaruvchi notifier: kategoriyalar, qidiruv (300 ms debounce),
/// filtrlar, sahifalash.
final class CatalogNotifierProvider extends $NotifierProvider<CatalogNotifier, CatalogState> {
  /// Katalog holatini boshqaruvchi notifier: kategoriyalar, qidiruv (300 ms debounce),
  /// filtrlar, sahifalash.
  CatalogNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'catalogProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$catalogNotifierHash();

  @$internal
  @override
  CatalogNotifier create() => CatalogNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CatalogState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CatalogState>(value),
    );
  }
}

String _$catalogNotifierHash() => r'c2e3670a4cc42dddaca6164097a8bc2cc07b49c1';

/// Katalog holatini boshqaruvchi notifier: kategoriyalar, qidiruv (300 ms debounce),
/// filtrlar, sahifalash.

abstract class _$CatalogNotifier extends $Notifier<CatalogState> {
  CatalogState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CatalogState, CatalogState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CatalogState, CatalogState>,
              CatalogState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
