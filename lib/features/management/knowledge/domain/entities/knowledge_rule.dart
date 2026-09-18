import 'package:freezed_annotation/freezed_annotation.dart';

part 'knowledge_rule.freezed.dart';

@freezed
abstract class KnowledgeRule with _$KnowledgeRule {
  const factory KnowledgeRule({
    required String id,
    required String kind,
    required List<String> condition,
    required String recommendation,
    required int priority,
    required bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _KnowledgeRule;
}
