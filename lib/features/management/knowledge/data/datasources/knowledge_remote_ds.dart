import 'package:alora_mobile/features/management/knowledge/data/dto/knowledge_rule_dto.dart';
import 'package:dio/dio.dart';
import 'package:alora_mobile/core/network/api_paths.dart';

abstract class KnowledgeRemoteDataSource {
  Future<List<KnowledgeRuleDto>> getRules();
  Future<KnowledgeRuleDto> createRule(Map<String, dynamic> data);
  Future<KnowledgeRuleDto> patchRule(String id, Map<String, dynamic> data);
  Future<void> deleteRule(String id);
}

class KnowledgeRemoteDataSourceImpl implements KnowledgeRemoteDataSource {
  final Dio _dio;

  KnowledgeRemoteDataSourceImpl(this._dio);

  @override
  Future<List<KnowledgeRuleDto>> getRules() async {
    final res = await _dio.get(ApiPaths.knowledgeRules);
    if (res.data is Map<String, dynamic> && (res.data as Map<String, dynamic>)['results'] != null) {
      return ((res.data as Map<String, dynamic>)['results'] as List)
          .map((e) => KnowledgeRuleDto.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return (res.data as List)
        .map((e) => KnowledgeRuleDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<KnowledgeRuleDto> createRule(Map<String, dynamic> data) async {
    final res = await _dio.post(ApiPaths.knowledgeRules, data: data);
    final response = res.data as Map<String, dynamic>;
    if (response['id'] is String) return KnowledgeRuleDto.fromJson(response);
    final rules = await getRules();
    return rules.firstWhere(
      (rule) =>
          rule.kind == data['kind'] &&
          rule.recommendation == data['recommendation'] &&
          rule.priority == data['priority'],
    );
  }

  @override
  Future<KnowledgeRuleDto> patchRule(String id, Map<String, dynamic> data) async {
    final res = await _dio.patch('${ApiPaths.knowledgeRules}$id/', data: data);
    final response = res.data as Map<String, dynamic>;
    if (response['id'] is String) return KnowledgeRuleDto.fromJson(response);
    final rules = await getRules();
    return rules.firstWhere((rule) => rule.id == id);
  }

  @override
  Future<void> deleteRule(String id) async {
    await _dio.delete('${ApiPaths.knowledgeRules}$id/');
  }
}
