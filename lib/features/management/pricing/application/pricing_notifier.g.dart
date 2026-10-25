// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'pricing_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PricingNotifier)
final pricingProvider = PricingNotifierProvider._();

final class PricingNotifierProvider
    extends $NotifierProvider<PricingNotifier, PricingState> {
  PricingNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pricingProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pricingNotifierHash();

  @$internal
  @override
  PricingNotifier create() => PricingNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PricingState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PricingState>(value),
    );
  }
}

String _$pricingNotifierHash() => r'1815fd7a2230769147470ea42b784277c76f85a5';

abstract class _$PricingNotifier extends $Notifier<PricingState> {
  PricingState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<PricingState, PricingState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PricingState, PricingState>,
              PricingState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
