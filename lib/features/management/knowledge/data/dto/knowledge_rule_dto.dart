import 'package:freezed_annotation/freezed_annotation.dart';

part 'knowledge_rule_dto.freezed.dart';
part 'knowledge_rule_dto.g.dart';

@freezed
abstract class KnowledgeRuleDto with _$KnowledgeRuleDto {
  const factory KnowledgeRuleDto({
    required String id,
    required String kind,
    required List<String> condition,
    required String recommendation,
    required int priority,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _KnowledgeRuleDto;

  factory KnowledgeRuleDto.fromJson(Map<String, dynamic> json) => _$KnowledgeRuleDtoFromJson(json);
}
