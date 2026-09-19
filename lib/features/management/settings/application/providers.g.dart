// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Sozlamalar backend data source

@ProviderFor(settingsRemoteDataSource)
final settingsRemoteDataSourceProvider = SettingsRemoteDataSourceProvider._();

/// Sozlamalar backend data source

final class SettingsRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          SettingsRemoteDataSource,
          SettingsRemoteDataSource,
          SettingsRemoteDataSource
        >
    with $Provider<SettingsRemoteDataSource> {
  /// Sozlamalar backend data source
  SettingsRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<SettingsRemoteDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SettingsRemoteDataSource create(Ref ref) {
    return settingsRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingsRemoteDataSource>(value),
    );
  }
}

String _$settingsRemoteDataSourceHash() => r'1dbb31e86f8b17eb9c4a00ad13de27eaeef7317e';

/// Sozlamalar repository

@ProviderFor(settingsRepository)
final settingsRepositoryProvider = SettingsRepositoryProvider._();

/// Sozlamalar repository

final class SettingsRepositoryProvider
    extends $FunctionalProvider<SettingsRepository, SettingsRepository, SettingsRepository>
    with $Provider<SettingsRepository> {
  /// Sozlamalar repository
  SettingsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsRepositoryHash();

  @$internal
  @override
  $ProviderElement<SettingsRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SettingsRepository create(Ref ref) {
    return settingsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingsRepository>(value),
    );
  }
}

String _$settingsRepositoryHash() => r'65fa5deaf7438cc6ed86b2b3c45e433fb0841408';
