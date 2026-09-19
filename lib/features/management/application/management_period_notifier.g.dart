// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'management_period_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Boshqaruv sahifasidagi davr o'tkazgich holati (Bugun/Hafta/Oy).

@ProviderFor(ManagementPeriodNotifier)
final managementPeriodProvider = ManagementPeriodNotifierProvider._();

/// Boshqaruv sahifasidagi davr o'tkazgich holati (Bugun/Hafta/Oy).
final class ManagementPeriodNotifierProvider
    extends $NotifierProvider<ManagementPeriodNotifier, UsagePeriod> {
  /// Boshqaruv sahifasidagi davr o'tkazgich holati (Bugun/Hafta/Oy).
  ManagementPeriodNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'managementPeriodProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$managementPeriodNotifierHash();

  @$internal
  @override
  ManagementPeriodNotifier create() => ManagementPeriodNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UsagePeriod value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UsagePeriod>(value),
    );
  }
}

String _$managementPeriodNotifierHash() => r'775314beb4b03b970061bcd40d1330828c93f447';

/// Boshqaruv sahifasidagi davr o'tkazgich holati (Bugun/Hafta/Oy).

abstract class _$ManagementPeriodNotifier extends $Notifier<UsagePeriod> {
  UsagePeriod build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<UsagePeriod, UsagePeriod>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UsagePeriod, UsagePeriod>,
              UsagePeriod,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
