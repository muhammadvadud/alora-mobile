import 'package:alora_mobile/features/management/knowledge/data/dto/knowledge_rule_dto.dart';
import 'package:alora_mobile/features/management/knowledge/domain/entities/knowledge_rule.dart';

class KnowledgeMapper {
  static KnowledgeRule fromDto(KnowledgeRuleDto dto) {
    return KnowledgeRule(
      id: dto.id,
      kind: dto.kind,
      condition: dto.condition,
      recommendation: dto.recommendation,
      priority: dto.priority,
      isActive: dto.isActive,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
    );
  }

  static KnowledgeRuleDto toDto(KnowledgeRule entity) {
    return KnowledgeRuleDto(
      id: entity.id,
      kind: entity.kind,
      condition: entity.condition,
      recommendation: entity.recommendation,
      priority: entity.priority,
      isActive: entity.isActive,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
