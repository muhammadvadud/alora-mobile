import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alora_mobile/core/network/dio_client.dart';
import 'package:alora_mobile/features/conversations/data/datasources/conversations_local_ds.dart';
import 'package:alora_mobile/features/conversations/data/datasources/conversations_remote_ds.dart';
import 'package:alora_mobile/features/conversations/data/repositories/conversations_repository_impl.dart';
import 'package:alora_mobile/features/conversations/domain/repositories/conversations_repository.dart';

part 'providers.g.dart';

/// Conversations remote data source
@Riverpod(keepAlive: true)
ConversationsRemoteDataSource conversationsRemoteDataSource(Ref ref) {
  return ConversationsRemoteDataSource(ref.watch(dioProvider));
}

/// Conversations local data source
@Riverpod(keepAlive: true)
ConversationsLocalDataSource conversationsLocalDataSource(Ref ref) {
  return ConversationsLocalDataSource();
}

/// Conversations repository (testlarda override qilinadi)
@Riverpod(keepAlive: true)
ConversationsRepository conversationsRepository(Ref ref) {
  return ConversationsRepositoryImpl(
    ref.watch(conversationsRemoteDataSourceProvider),
    ref.watch(conversationsLocalDataSourceProvider),
  );
}
