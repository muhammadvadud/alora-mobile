// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Usage statistika backend data source

@ProviderFor(usageRemoteDataSource)
final usageRemoteDataSourceProvider = UsageRemoteDataSourceProvider._();

/// Usage statistika backend data source

final class UsageRemoteDataSourceProvider
    extends $FunctionalProvider<UsageRemoteDataSource, UsageRemoteDataSource, UsageRemoteDataSource>
    with $Provider<UsageRemoteDataSource> {
  /// Usage statistika backend data source
  UsageRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'usageRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$usageRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<UsageRemoteDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UsageRemoteDataSource create(Ref ref) {
    return usageRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UsageRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UsageRemoteDataSource>(value),
    );
  }
}

String _$usageRemoteDataSourceHash() => r'cd76c108ed11d11581457bf15f6dd76ca06892fb';

/// Usage statistika repository

@ProviderFor(usageRepository)
final usageRepositoryProvider = UsageRepositoryProvider._();

/// Usage statistika repository

final class UsageRepositoryProvider
    extends $FunctionalProvider<UsageRepository, UsageRepository, UsageRepository>
    with $Provider<UsageRepository> {
  /// Usage statistika repository
  UsageRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'usageRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$usageRepositoryHash();

  @$internal
  @override
  $ProviderElement<UsageRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UsageRepository create(Ref ref) {
    return usageRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UsageRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UsageRepository>(value),
    );
  }
}

String _$usageRepositoryHash() => r'92b61433a1f5d5a3c3af536fdc87c56976677a65';

/// Jamoa backend data source

@ProviderFor(teamRemoteDataSource)
final teamRemoteDataSourceProvider = TeamRemoteDataSourceProvider._();

/// Jamoa backend data source

final class TeamRemoteDataSourceProvider
    extends $FunctionalProvider<TeamRemoteDataSource, TeamRemoteDataSource, TeamRemoteDataSource>
    with $Provider<TeamRemoteDataSource> {
  /// Jamoa backend data source
  TeamRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'teamRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$teamRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<TeamRemoteDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TeamRemoteDataSource create(Ref ref) {
    return teamRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TeamRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TeamRemoteDataSource>(value),
    );
  }
}

String _$teamRemoteDataSourceHash() => r'b3ce06eedad4eaa9c6d6308cd20e3e2dca1f4457';

/// Jamoa repository

@ProviderFor(teamRepository)
final teamRepositoryProvider = TeamRepositoryProvider._();

/// Jamoa repository

final class TeamRepositoryProvider
    extends $FunctionalProvider<TeamRepository, TeamRepository, TeamRepository>
    with $Provider<TeamRepository> {
  /// Jamoa repository
  TeamRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'teamRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$teamRepositoryHash();

  @$internal
  @override
  $ProviderElement<TeamRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TeamRepository create(Ref ref) {
    return teamRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TeamRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TeamRepository>(value),
    );
  }
}

String _$teamRepositoryHash() => r'45d36b122eb5d41d8eb649e0ba98871d8800c748';
