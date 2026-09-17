// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'management_home_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Boshqaruv bosh sahifasi (S-19) ma'lumotlarini parallel yuklaydi.
/// Davr o'zgarsa [managementPeriodProvider] orqali qayta yuklanadi.

@ProviderFor(ManagementHomeNotifier)
final managementHomeProvider = ManagementHomeNotifierProvider._();

/// Boshqaruv bosh sahifasi (S-19) ma'lumotlarini parallel yuklaydi.
/// Davr o'zgarsa [managementPeriodProvider] orqali qayta yuklanadi.
final class ManagementHomeNotifierProvider
    extends $AsyncNotifierProvider<ManagementHomeNotifier, ManagementHomeData> {
  /// Boshqaruv bosh sahifasi (S-19) ma'lumotlarini parallel yuklaydi.
  /// Davr o'zgarsa [managementPeriodProvider] orqali qayta yuklanadi.
  ManagementHomeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'managementHomeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$managementHomeNotifierHash();

  @$internal
  @override
  ManagementHomeNotifier create() => ManagementHomeNotifier();
}

String _$managementHomeNotifierHash() =>
    r'7ceddf173da6ab9f892baa6f0f2ccb1b554705c6';

/// Boshqaruv bosh sahifasi (S-19) ma'lumotlarini parallel yuklaydi.
/// Davr o'zgarsa [managementPeriodProvider] orqali qayta yuklanadi.

abstract class _$ManagementHomeNotifier
    extends $AsyncNotifier<ManagementHomeData> {
  FutureOr<ManagementHomeData> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<ManagementHomeData>, ManagementHomeData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ManagementHomeData>, ManagementHomeData>,
              AsyncValue<ManagementHomeData>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
