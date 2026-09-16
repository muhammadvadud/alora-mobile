// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

import 'status_transition_dto.dart';

part 'statuses_response_dto.freezed.dart';
part 'statuses_response_dto.g.dart';

@freezed
abstract class StatusesResponseDto with _$StatusesResponseDto {
  const factory StatusesResponseDto({
    @Default([]) List<StatusTransitionDto> statuses,
    @Default({}) Map<String, List<String>> transitions,
  }) = _StatusesResponseDto;

  factory StatusesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$StatusesResponseDtoFromJson(json);
}
