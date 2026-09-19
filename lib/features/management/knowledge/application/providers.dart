import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alora_mobile/core/network/dio_client.dart';

import '../data/datasources/knowledge_remote_ds.dart';
import '../data/repositories/knowledge_repository_impl.dart';
import '../domain/repositories/knowledge_repository.dart';

part 'providers.g.dart';

@riverpod
KnowledgeRepository knowledgeRepository(Ref ref) {
  final dio = ref.watch(dioProvider);
  return KnowledgeRepositoryImpl(KnowledgeRemoteDataSourceImpl(dio));
}
