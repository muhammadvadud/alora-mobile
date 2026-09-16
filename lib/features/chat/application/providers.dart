import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:alora_mobile/core/network/dio_client.dart'; // Ensure dioProvider is exported here or change import to actual
import 'package:alora_mobile/core/sse/sse_client.dart';
import 'package:alora_mobile/features/chat/data/datasources/chat_local_ds.dart';
import 'package:alora_mobile/features/chat/data/datasources/chat_remote_ds.dart';
import 'package:alora_mobile/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:alora_mobile/features/chat/domain/repositories/chat_repository.dart';

part 'providers.g.dart';

@riverpod
ChatLocalDataSource chatLocalDataSource(Ref ref) {
  return ChatLocalDataSource();
}

@riverpod
ChatRemoteDataSource chatRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioProvider);
  final sseClient = SseClient(dio);
  return ChatRemoteDataSource(dio, sseClient);
}

@riverpod
ChatRepository chatRepository(Ref ref) {
  return ChatRepositoryImpl(
    ref.watch(chatRemoteDataSourceProvider),
    ref.watch(chatLocalDataSourceProvider),
  );
}
