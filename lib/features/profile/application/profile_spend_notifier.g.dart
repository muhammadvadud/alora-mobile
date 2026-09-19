// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'profile_spend_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Profil sarf ma'lumotlarini olib boruvchi notifier.
/// `auth/me/` limit blo'gi va (manager/admin uchun) bugungi sarf
/// har 5 daqiqada yangilanadi (10.3).

@ProviderFor(ProfileSpendNotifier)
final profileSpendProvider = ProfileSpendNotifierProvider._();

/// Profil sarf ma'lumotlarini olib boruvchi notifier.
/// `auth/me/` limit blo'gi va (manager/admin uchun) bugungi sarf
/// har 5 daqiqada yangilanadi (10.3).
final class ProfileSpendNotifierProvider
    extends $AsyncNotifierProvider<ProfileSpendNotifier, ProfileSpendData> {
  /// Profil sarf ma'lumotlarini olib boruvchi notifier.
  /// `auth/me/` limit blo'gi va (manager/admin uchun) bugungi sarf
  /// har 5 daqiqada yangilanadi (10.3).
  ProfileSpendNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileSpendProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileSpendNotifierHash();

  @$internal
  @override
  ProfileSpendNotifier create() => ProfileSpendNotifier();
}

String _$profileSpendNotifierHash() => r'769f7660b18b7faa520c177c0cedd5040e874570';

/// Profil sarf ma'lumotlarini olib boruvchi notifier.
/// `auth/me/` limit blo'gi va (manager/admin uchun) bugungi sarf
/// har 5 daqiqada yangilanadi (10.3).

abstract class _$ProfileSpendNotifier extends $AsyncNotifier<ProfileSpendData> {
  FutureOr<ProfileSpendData> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<ProfileSpendData>, ProfileSpendData>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ProfileSpendData>, ProfileSpendData>,
              AsyncValue<ProfileSpendData>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
