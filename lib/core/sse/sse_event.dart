import 'package:freezed_annotation/freezed_annotation.dart';

part 'sse_event.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
sealed class SseEvent with _$SseEvent {
  const factory SseEvent.start() = _SseEventStart;
  const factory SseEvent.thinking() = _SseEventThinking;
  const factory SseEvent.content(String content) = _SseEventContent;
  const factory SseEvent.toolCall(String tool) = _SseEventToolCall;
  const factory SseEvent.toolArgs(String tool, String args) = _SseEventToolArgs;
  const factory SseEvent.toolResult(String tool, String result) =
      _SseEventToolResult;
  const factory SseEvent.done({Map<String, dynamic>? usage, List? products}) =
      _SseEventDone;
  const factory SseEvent.error(String detail) = _SseEventError;
  const factory SseEvent.unknown() = _SseEventUnknown;

  factory SseEvent.fromJson(Map<String, dynamic> json) {
    final kind = json['kind'] as String?;
    switch (kind) {
      case 'start':
        return const SseEvent.start();
      case 'thinking':
        return const SseEvent.thinking();
      case 'content':
        return SseEvent.content(json['content'] as String? ?? '');
      case 'tool_call':
        return SseEvent.toolCall(json['tool'] as String? ?? '');
      case 'tool_args':
        return SseEvent.toolArgs(
          json['tool'] as String? ?? '',
          json['args'] as String? ?? '',
        );
      case 'tool_result':
        return SseEvent.toolResult(
          json['tool'] as String? ?? '',
          json['result'] as String? ?? '',
        );
      case 'done':
        return SseEvent.done(
          usage: json['usage'] as Map<String, dynamic>?,
          products: json['products'] as List?,
        );
      case 'error':
        return SseEvent.error(json['detail'] as String? ?? 'Noma\'lum xatolik');
      default:
        return const SseEvent.unknown();
    }
  }
}
