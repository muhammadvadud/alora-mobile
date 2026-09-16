import 'package:freezed_annotation/freezed_annotation.dart';

part 'status_transition.freezed.dart';

@freezed
abstract class StatusTransition with _$StatusTransition {
  const factory StatusTransition({
    required String code,
    required String label,
  }) = _StatusTransition;
}
