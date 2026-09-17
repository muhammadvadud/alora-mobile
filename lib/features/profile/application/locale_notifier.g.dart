// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'locale_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Ilova tilini boshqaruvchi notifier.
/// Tanlov darhol qo'llanadi va Hive 'settings' boxida saqlanadi.
/// `null` holat — qurilma tili (uz/ru, aks holda uz).

@ProviderFor(LocaleNotifier)
final localeProvider = LocaleNotifierProvider._();

/// Ilova tilini boshqaruvchi notifier.
/// Tanlov darhol qo'llanadi va Hive 'settings' boxida saqlanadi.
/// `null` holat — qurilma tili (uz/ru, aks holda uz).
final class LocaleNotifierProvider
    extends $NotifierProvider<LocaleNotifier, Locale?> {
  /// Ilova tilini boshqaruvchi notifier.
  /// Tanlov darhol qo'llanadi va Hive 'settings' boxida saqlanadi.
  /// `null` holat — qurilma tili (uz/ru, aks holda uz).
  LocaleNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localeNotifierHash();

  @$internal
  @override
  LocaleNotifier create() => LocaleNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Locale? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Locale?>(value),
    );
  }
}

String _$localeNotifierHash() => r'e0e589e982afd94ba84ab6efcb551d9164c4dda6';

/// Ilova tilini boshqaruvchi notifier.
/// Tanlov darhol qo'llanadi va Hive 'settings' boxida saqlanadi.
/// `null` holat — qurilma tili (uz/ru, aks holda uz).

abstract class _$LocaleNotifier extends $Notifier<Locale?> {
  Locale? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Locale?, Locale?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Locale?, Locale?>,
              Locale?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
