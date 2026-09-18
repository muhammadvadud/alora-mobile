import 'package:alora_mobile/features/management/knowledge/data/datasources/knowledge_remote_ds.dart';
import 'package:alora_mobile/features/management/knowledge/data/mappers/knowledge_mapper.dart';
import 'package:alora_mobile/features/management/knowledge/domain/entities/knowledge_rule.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:alora_mobile/core/network/dio_client.dart';

part 'knowledge_repository.g.dart';

@riverpod
KnowledgeRepository knowledgeRepository(Ref ref) {
  final dio = ref.watch(dioProvider);
  return KnowledgeRepositoryImpl(KnowledgeRemoteDataSourceImpl(dio));
}

abstract class KnowledgeRepository {
  Future<List<KnowledgeRule>> getRules();
  Future<KnowledgeRule> createRule(
    String kind,
    List<String> condition,
    String recommendation,
    int priority,
    bool isActive,
  );
  Future<KnowledgeRule> patchRule(String id, Map<String, dynamic> updates);
  Future<void> deleteRule(String id);
}

class KnowledgeRepositoryImpl implements KnowledgeRepository {
  final KnowledgeRemoteDataSource _remoteDs;

  KnowledgeRepositoryImpl(this._remoteDs);

  @override
  Future<List<KnowledgeRule>> getRules() async {
    final dtos = await _remoteDs.getRules();
    return dtos.map(KnowledgeMapper.fromDto).toList();
  }

  @override
  Future<KnowledgeRule> createRule(
    String kind,
    List<String> condition,
    String recommendation,
    int priority,
    bool isActive,
  ) async {
    final data = {
      'kind': kind,
      'condition': condition,
      'recommendation': recommendation,
      'priority': priority,
      'is_active': isActive,
    };
    final dto = await _remoteDs.createRule(data);
    return KnowledgeMapper.fromDto(dto);
  }

  @override
  Future<KnowledgeRule> patchRule(
    String id,
    Map<String, dynamic> updates,
  ) async {
    final dto = await _remoteDs.patchRule(id, updates);
    return KnowledgeMapper.fromDto(dto);
  }

  @override
  Future<void> deleteRule(String id) async {
    await _remoteDs.deleteRule(id);
  }
}
