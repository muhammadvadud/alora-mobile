// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(chatLocalDataSource)
final chatLocalDataSourceProvider = ChatLocalDataSourceProvider._();

final class ChatLocalDataSourceProvider
    extends
        $FunctionalProvider<
          ChatLocalDataSource,
          ChatLocalDataSource,
          ChatLocalDataSource
        >
    with $Provider<ChatLocalDataSource> {
  ChatLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<ChatLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ChatLocalDataSource create(Ref ref) {
    return chatLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChatLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChatLocalDataSource>(value),
    );
  }
}

String _$chatLocalDataSourceHash() =>
    r'd111eb1de5c9916910c379873cdfc5efcfa8f7f2';

@ProviderFor(chatRemoteDataSource)
final chatRemoteDataSourceProvider = ChatRemoteDataSourceProvider._();

final class ChatRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          ChatRemoteDataSource,
          ChatRemoteDataSource,
          ChatRemoteDataSource
        >
    with $Provider<ChatRemoteDataSource> {
  ChatRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<ChatRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ChatRemoteDataSource create(Ref ref) {
    return chatRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChatRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChatRemoteDataSource>(value),
    );
  }
}

String _$chatRemoteDataSourceHash() =>
    r'75eff71d259cc74d86f6a7597be402c8055a51c3';

@ProviderFor(chatRepository)
final chatRepositoryProvider = ChatRepositoryProvider._();

final class ChatRepositoryProvider
    extends $FunctionalProvider<ChatRepository, ChatRepository, ChatRepository>
    with $Provider<ChatRepository> {
  ChatRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatRepositoryHash();

  @$internal
  @override
  $ProviderElement<ChatRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ChatRepository create(Ref ref) {
    return chatRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChatRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChatRepository>(value),
    );
  }
}

String _$chatRepositoryHash() => r'aaf06897256be3a540c13ec90127a13e20fd067a';
