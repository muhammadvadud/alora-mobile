import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/features/management/knowledge/data/dto/knowledge_rule_dto.dart';
import 'package:alora_mobile/features/management/knowledge/data/mappers/knowledge_mapper.dart';
import 'package:alora_mobile/features/management/knowledge/domain/entities/knowledge_rule.dart';

void main() {
  group('KnowledgeMapper', () {
    test('should map from DTO to Entity', () {
      final dto = KnowledgeRuleDto(
        id: '1',
        kind: 'general',
        condition: {'objection': 'a'},
        recommendation: 'b',
        priority: 1,
        isActive: true,
        createdAt: DateTime(2023),
        updatedAt: DateTime(2023),
      );

      final entity = KnowledgeMapper.fromDto(dto);

      expect(entity.id, '1');
      expect(entity.kind, 'general');
      expect(entity.condition, ['a']);
      expect(entity.recommendation, 'b');
      expect(entity.priority, 1);
      expect(entity.isActive, true);
    });

    test('should map from Entity to DTO', () {
      final entity = KnowledgeRule(
        id: '1',
        kind: 'general',
        condition: ['a'],
        recommendation: 'b',
        priority: 1,
        isActive: true,
        createdAt: DateTime(2023),
        updatedAt: DateTime(2023),
      );

      final dto = KnowledgeMapper.toDto(entity);

      expect(dto.id, '1');
      expect(dto.kind, 'general');
      expect(dto.condition, {
        'values': ['a'],
      });
      expect(dto.recommendation, 'b');
      expect(dto.priority, 1);
      expect(dto.isActive, true);
    });

    test('knowledge shart -> JSON converts List<String> correctly', () {
      final json = {
        'id': '1',
        'kind': 'style',
        'condition': {'style': 'hi-tech'},
        'recommendation': 'use gray',
        'priority': 2,
        'is_active': true,
        'created_at': '2023-01-01T00:00:00.000Z',
        'updated_at': '2023-01-01T00:00:00.000Z',
      };
      final dto = KnowledgeRuleDto.fromJson(json);
      expect(dto.condition, {'style': 'hi-tech'});
    });
  });
}
