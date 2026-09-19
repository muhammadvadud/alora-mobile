// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'connectivity_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ConnectivityNotifier)
final connectivityProvider = ConnectivityNotifierProvider._();

final class ConnectivityNotifierProvider extends $NotifierProvider<ConnectivityNotifier, bool> {
  ConnectivityNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'connectivityProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$connectivityNotifierHash();

  @$internal
  @override
  ConnectivityNotifier create() => ConnectivityNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<bool>(value));
  }
}

String _$connectivityNotifierHash() => r'f8faa4c7542dfdfc37da02384c2801975f73d0f6';

abstract class _$ConnectivityNotifier extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element as $ClassProviderElement<AnyNotifier<bool, bool>, bool, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}
