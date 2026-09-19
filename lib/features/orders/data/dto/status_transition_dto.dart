// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'status_transition_dto.freezed.dart';
part 'status_transition_dto.g.dart';

@freezed
abstract class StatusTransitionDto with _$StatusTransitionDto {
  const factory StatusTransitionDto({required String code, required String label}) =
      _StatusTransitionDto;

  factory StatusTransitionDto.fromJson(Map<String, dynamic> json) =>
      _$StatusTransitionDtoFromJson(json);
}
