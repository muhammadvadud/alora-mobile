// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'employee_conversations_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Bitta xodimning suhbatlari ro'yxati.

@ProviderFor(EmployeeConversationsNotifier)
final employeeConversationsProvider = EmployeeConversationsNotifierFamily._();

/// Bitta xodimning suhbatlari ro'yxati.
final class EmployeeConversationsNotifierProvider
    extends $AsyncNotifierProvider<EmployeeConversationsNotifier, List<Conversation>> {
  /// Bitta xodimning suhbatlari ro'yxati.
  EmployeeConversationsNotifierProvider._({
    required EmployeeConversationsNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'employeeConversationsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$employeeConversationsNotifierHash();

  @override
  String toString() {
    return r'employeeConversationsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  EmployeeConversationsNotifier create() => EmployeeConversationsNotifier();

  @override
  bool operator ==(Object other) {
    return other is EmployeeConversationsNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$employeeConversationsNotifierHash() => r'f3bc30540ffbe36b9eb4828cb7c0ad6610a26086';

/// Bitta xodimning suhbatlari ro'yxati.

final class EmployeeConversationsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          EmployeeConversationsNotifier,
          AsyncValue<List<Conversation>>,
          List<Conversation>,
          FutureOr<List<Conversation>>,
          String
        > {
  EmployeeConversationsNotifierFamily._()
    : super(
        retry: null,
        name: r'employeeConversationsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Bitta xodimning suhbatlari ro'yxati.

  EmployeeConversationsNotifierProvider call(String employeeId) =>
      EmployeeConversationsNotifierProvider._(argument: employeeId, from: this);

  @override
  String toString() => r'employeeConversationsProvider';
}

/// Bitta xodimning suhbatlari ro'yxati.

abstract class _$EmployeeConversationsNotifier extends $AsyncNotifier<List<Conversation>> {
  late final _$args = ref.$arg as String;
  String get employeeId => _$args;

  FutureOr<List<Conversation>> build(String employeeId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Conversation>>, List<Conversation>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Conversation>>, List<Conversation>>,
              AsyncValue<List<Conversation>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
