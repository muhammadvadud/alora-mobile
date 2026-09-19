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

  factory StatusesResponseDto.fromList(List<dynamic> json) {
    final statuses = <StatusTransitionDto>[];
    final transitions = <String, List<String>>{};
    for (final item in json) {
      if (item is! Map<String, dynamic>) continue;
      final value = item['value'];
      final label = item['label'];
      if (value is! String || label is! String) continue;
      final allowed = item['allowed'];
      statuses.add(StatusTransitionDto(code: value, label: label));
      transitions[value] = allowed is List ? allowed.whereType<String>().toList() : <String>[];
    }
    return StatusesResponseDto(statuses: statuses, transitions: transitions);
  }
}
