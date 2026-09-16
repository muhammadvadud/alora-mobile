import 'package:freezed_annotation/freezed_annotation.dart';

import 'status_transition.dart';

part 'statuses_response.freezed.dart';

@freezed
abstract class StatusesResponse with _$StatusesResponse {
  const factory StatusesResponse({
    @Default([]) List<StatusTransition> statuses,
    @Default({}) Map<String, List<String>> transitions,
  }) = _StatusesResponse;
}
