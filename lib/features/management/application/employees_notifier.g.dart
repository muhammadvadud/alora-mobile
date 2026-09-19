// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'employees_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Xodimlar ro'yxati notifier'i (qidiruv 300ms debounce bilan, S-20).

@ProviderFor(EmployeesNotifier)
final employeesProvider = EmployeesNotifierProvider._();

/// Xodimlar ro'yxati notifier'i (qidiruv 300ms debounce bilan, S-20).
final class EmployeesNotifierProvider extends $NotifierProvider<EmployeesNotifier, EmployeesState> {
  /// Xodimlar ro'yxati notifier'i (qidiruv 300ms debounce bilan, S-20).
  EmployeesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'employeesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$employeesNotifierHash();

  @$internal
  @override
  EmployeesNotifier create() => EmployeesNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EmployeesState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EmployeesState>(value),
    );
  }
}

String _$employeesNotifierHash() => r'ee08b9088dbb2030c029f767bb77900177d0eccb';

/// Xodimlar ro'yxati notifier'i (qidiruv 300ms debounce bilan, S-20).

abstract class _$EmployeesNotifier extends $Notifier<EmployeesState> {
  EmployeesState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<EmployeesState, EmployeesState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EmployeesState, EmployeesState>,
              EmployeesState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
