// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'session_expired_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Sessiya muddati tugaganligi haqidagi signal (sanoq).
/// UI qatlami (GlobalListeners) shu o'zgarishni tinglab snackbar ko'rsatadi.

@ProviderFor(SessionExpiredNotifier)
final sessionExpiredProvider = SessionExpiredNotifierProvider._();

/// Sessiya muddati tugaganligi haqidagi signal (sanoq).
/// UI qatlami (GlobalListeners) shu o'zgarishni tinglab snackbar ko'rsatadi.
final class SessionExpiredNotifierProvider extends $NotifierProvider<SessionExpiredNotifier, int> {
  /// Sessiya muddati tugaganligi haqidagi signal (sanoq).
  /// UI qatlami (GlobalListeners) shu o'zgarishni tinglab snackbar ko'rsatadi.
  SessionExpiredNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionExpiredProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionExpiredNotifierHash();

  @$internal
  @override
  SessionExpiredNotifier create() => SessionExpiredNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<int>(value));
  }
}

String _$sessionExpiredNotifierHash() => r'894e426ebad90e5f30af01d9798d3c1c562ba81f';

/// Sessiya muddati tugaganligi haqidagi signal (sanoq).
/// UI qatlami (GlobalListeners) shu o'zgarishni tinglab snackbar ko'rsatadi.

abstract class _$SessionExpiredNotifier extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element as $ClassProviderElement<AnyNotifier<int, int>, int, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}
