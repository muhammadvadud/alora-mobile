import 'package:freezed_annotation/freezed_annotation.dart';

part 'prompt_version_dto.freezed.dart';
part 'prompt_version_dto.g.dart';

@freezed
abstract class PromptVersionDto with _$PromptVersionDto {
  const factory PromptVersionDto({
    required String id,
    required int version,
    required String content,
    String? author,
    @JsonKey(name: 'author_name') String? authorName,
    @JsonKey(name: 'is_current') @Default(false) bool isCurrent,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _PromptVersionDto;

  factory PromptVersionDto.fromJson(Map<String, dynamic> json) => _$PromptVersionDtoFromJson(json);
}

@freezed
abstract class PromptHistoryDto with _$PromptHistoryDto {
  const factory PromptHistoryDto({
    required PromptVersionDto current,
    @Default([]) List<PromptVersionDto> history,
  }) = _PromptHistoryDto;

  factory PromptHistoryDto.fromJson(Map<String, dynamic> json) => _$PromptHistoryDtoFromJson(json);
}
