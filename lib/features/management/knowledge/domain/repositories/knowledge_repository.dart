import 'package:alora_mobile/features/management/knowledge/domain/entities/knowledge_rule.dart';

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
