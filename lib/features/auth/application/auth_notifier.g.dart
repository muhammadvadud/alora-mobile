// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'auth_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Auth holatini boshqaruvchi notifier.
/// Ilovada sessiyani tiklaydi, login/logout amallarini bajardi.

@ProviderFor(AuthNotifier)
final authProvider = AuthNotifierProvider._();

/// Auth holatini boshqaruvchi notifier.
/// Ilovada sessiyani tiklaydi, login/logout amallarini bajardi.
final class AuthNotifierProvider extends $NotifierProvider<AuthNotifier, AuthState> {
  /// Auth holatini boshqaruvchi notifier.
  /// Ilovada sessiyani tiklaydi, login/logout amallarini bajardi.
  AuthNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authNotifierHash();

  @$internal
  @override
  AuthNotifier create() => AuthNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthState value) {
    return $ProviderOverride(origin: this, providerOverride: $SyncValueProvider<AuthState>(value));
  }
}

String _$authNotifierHash() => r'5ed8aa10eb3c45dc459ce291b29c9b8d4a0d3daa';

/// Auth holatini boshqaruvchi notifier.
/// Ilovada sessiyani tiklaydi, login/logout amallarini bajardi.

abstract class _$AuthNotifier extends $Notifier<AuthState> {
  AuthState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AuthState, AuthState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AuthState, AuthState>,
              AuthState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
