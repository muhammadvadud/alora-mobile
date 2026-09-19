// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'employee_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Bitta xodim tafsiloti (S-21): profilni yangilash, bloklash, limit o'rnatish.

@ProviderFor(EmployeeDetailNotifier)
final employeeDetailProvider = EmployeeDetailNotifierFamily._();

/// Bitta xodim tafsiloti (S-21): profilni yangilash, bloklash, limit o'rnatish.
final class EmployeeDetailNotifierProvider
    extends $NotifierProvider<EmployeeDetailNotifier, EmployeeDetailState> {
  /// Bitta xodim tafsiloti (S-21): profilni yangilash, bloklash, limit o'rnatish.
  EmployeeDetailNotifierProvider._({
    required EmployeeDetailNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'employeeDetailProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$employeeDetailNotifierHash();

  @override
  String toString() {
    return r'employeeDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  EmployeeDetailNotifier create() => EmployeeDetailNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EmployeeDetailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EmployeeDetailState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is EmployeeDetailNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$employeeDetailNotifierHash() => r'd55b1f9d525d02a94ef21927c1207c10c1a11df4';

/// Bitta xodim tafsiloti (S-21): profilni yangilash, bloklash, limit o'rnatish.

final class EmployeeDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          EmployeeDetailNotifier,
          EmployeeDetailState,
          EmployeeDetailState,
          EmployeeDetailState,
          String
        > {
  EmployeeDetailNotifierFamily._()
    : super(
        retry: null,
        name: r'employeeDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// Bitta xodim tafsiloti (S-21): profilni yangilash, bloklash, limit o'rnatish.

  EmployeeDetailNotifierProvider call(String employeeId) =>
      EmployeeDetailNotifierProvider._(argument: employeeId, from: this);

  @override
  String toString() => r'employeeDetailProvider';
}

/// Bitta xodim tafsiloti (S-21): profilni yangilash, bloklash, limit o'rnatish.

abstract class _$EmployeeDetailNotifier extends $Notifier<EmployeeDetailState> {
  late final _$args = ref.$arg as String;
  String get employeeId => _$args;

  EmployeeDetailState build(String employeeId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<EmployeeDetailState, EmployeeDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EmployeeDetailState, EmployeeDetailState>,
              EmployeeDetailState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
