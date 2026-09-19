import 'package:freezed_annotation/freezed_annotation.dart';

part 'prompt_version.freezed.dart';

@freezed
abstract class PromptVersion with _$PromptVersion {
  const factory PromptVersion({
    required String id,
    required int version,
    required String content,
    String? authorId,
    String? authorName,
    @Default(false) bool isCurrent,
    DateTime? createdAt,
  }) = _PromptVersion;
}

@freezed
abstract class PromptHistory with _$PromptHistory {
  const factory PromptHistory({PromptVersion? current, @Default([]) List<PromptVersion> history}) =
      _PromptHistory;
}
