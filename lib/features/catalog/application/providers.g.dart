// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(catalogRemoteDataSource)
final catalogRemoteDataSourceProvider = CatalogRemoteDataSourceProvider._();

final class CatalogRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          CatalogRemoteDataSource,
          CatalogRemoteDataSource,
          CatalogRemoteDataSource
        >
    with $Provider<CatalogRemoteDataSource> {
  CatalogRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'catalogRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$catalogRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<CatalogRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CatalogRemoteDataSource create(Ref ref) {
    return catalogRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CatalogRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CatalogRemoteDataSource>(value),
    );
  }
}

String _$catalogRemoteDataSourceHash() =>
    r'8a95b0d8c4eab9f2bdafee0a6da3371e80b828ea';

@ProviderFor(catalogLocalDataSource)
final catalogLocalDataSourceProvider = CatalogLocalDataSourceProvider._();

final class CatalogLocalDataSourceProvider
    extends
        $FunctionalProvider<
          CatalogLocalDataSource,
          CatalogLocalDataSource,
          CatalogLocalDataSource
        >
    with $Provider<CatalogLocalDataSource> {
  CatalogLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'catalogLocalDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$catalogLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<CatalogLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CatalogLocalDataSource create(Ref ref) {
    return catalogLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CatalogLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CatalogLocalDataSource>(value),
    );
  }
}

String _$catalogLocalDataSourceHash() =>
    r'3f8cf40fed1346e9f43cbbc9941743c6e8c87fd2';

@ProviderFor(catalogRepository)
final catalogRepositoryProvider = CatalogRepositoryProvider._();

final class CatalogRepositoryProvider
    extends
        $FunctionalProvider<
          CatalogRepository,
          CatalogRepository,
          CatalogRepository
        >
    with $Provider<CatalogRepository> {
  CatalogRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'catalogRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$catalogRepositoryHash();

  @$internal
  @override
  $ProviderElement<CatalogRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CatalogRepository create(Ref ref) {
    return catalogRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CatalogRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CatalogRepository>(value),
    );
  }
}

String _$catalogRepositoryHash() => r'fd2752c94494b4bffe46008a170bb7673514d95a';
