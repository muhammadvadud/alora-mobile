import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/features/chat/domain/entities/message.dart';

part 'chat_state.freezed.dart';

@freezed
abstract class ChatState with _$ChatState {
  const factory ChatState({
    @Default([]) List<Message> messages,
    @Default(false) bool isStreaming,
    Failure? error,
    @Default([]) List<String> quickReplies,
    String? stage,
  }) = _ChatState;
}
