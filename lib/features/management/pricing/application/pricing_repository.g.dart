// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'pricing_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pricingRepository)
final pricingRepositoryProvider = PricingRepositoryProvider._();

final class PricingRepositoryProvider
    extends
        $FunctionalProvider<
          PricingRepository,
          PricingRepository,
          PricingRepository
        >
    with $Provider<PricingRepository> {
  PricingRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pricingRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pricingRepositoryHash();

  @$internal
  @override
  $ProviderElement<PricingRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PricingRepository create(Ref ref) {
    return pricingRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PricingRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PricingRepository>(value),
    );
  }
}

String _$pricingRepositoryHash() => r'354a7e66ef16893bdb6015fdd43a404f91af6823';
