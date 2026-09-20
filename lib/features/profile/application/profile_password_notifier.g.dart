// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'profile_password_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Joriy foydalanuvchining parolini almashtirish oqimi.

@ProviderFor(ProfilePasswordNotifier)
final profilePasswordProvider = ProfilePasswordNotifierProvider._();

/// Joriy foydalanuvchining parolini almashtirish oqimi.
final class ProfilePasswordNotifierProvider
    extends $AsyncNotifierProvider<ProfilePasswordNotifier, void> {
  /// Joriy foydalanuvchining parolini almashtirish oqimi.
  ProfilePasswordNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profilePasswordProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profilePasswordNotifierHash();

  @$internal
  @override
  ProfilePasswordNotifier create() => ProfilePasswordNotifier();
}

String _$profilePasswordNotifierHash() => r'103d94686e6545ca205d90232c68648ea3b1498d';

/// Joriy foydalanuvchining parolini almashtirish oqimi.

abstract class _$ProfilePasswordNotifier extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
