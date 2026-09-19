// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Conversations remote data source

@ProviderFor(conversationsRemoteDataSource)
final conversationsRemoteDataSourceProvider = ConversationsRemoteDataSourceProvider._();

/// Conversations remote data source

final class ConversationsRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          ConversationsRemoteDataSource,
          ConversationsRemoteDataSource,
          ConversationsRemoteDataSource
        >
    with $Provider<ConversationsRemoteDataSource> {
  /// Conversations remote data source
  ConversationsRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'conversationsRemoteDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$conversationsRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<ConversationsRemoteDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ConversationsRemoteDataSource create(Ref ref) {
    return conversationsRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConversationsRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConversationsRemoteDataSource>(value),
    );
  }
}

String _$conversationsRemoteDataSourceHash() => r'5aeb5758d4dbe46eebdab0783a8308a515f963fe';

/// Conversations local data source

@ProviderFor(conversationsLocalDataSource)
final conversationsLocalDataSourceProvider = ConversationsLocalDataSourceProvider._();

/// Conversations local data source

final class ConversationsLocalDataSourceProvider
    extends
        $FunctionalProvider<
          ConversationsLocalDataSource,
          ConversationsLocalDataSource,
          ConversationsLocalDataSource
        >
    with $Provider<ConversationsLocalDataSource> {
  /// Conversations local data source
  ConversationsLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'conversationsLocalDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$conversationsLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<ConversationsLocalDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ConversationsLocalDataSource create(Ref ref) {
    return conversationsLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConversationsLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConversationsLocalDataSource>(value),
    );
  }
}

String _$conversationsLocalDataSourceHash() => r'69d0e255f236232b3c73d7555299463cb166fb5c';

/// Conversations repository (testlarda override qilinadi)

@ProviderFor(conversationsRepository)
final conversationsRepositoryProvider = ConversationsRepositoryProvider._();

/// Conversations repository (testlarda override qilinadi)

final class ConversationsRepositoryProvider
    extends
        $FunctionalProvider<
          ConversationsRepository,
          ConversationsRepository,
          ConversationsRepository
        >
    with $Provider<ConversationsRepository> {
  /// Conversations repository (testlarda override qilinadi)
  ConversationsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'conversationsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$conversationsRepositoryHash();

  @$internal
  @override
  $ProviderElement<ConversationsRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ConversationsRepository create(Ref ref) {
    return conversationsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConversationsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConversationsRepository>(value),
    );
  }
}

String _$conversationsRepositoryHash() => r'95c7dc3430d5ea9ae11894e3a00bdfe4bfa9a275';
