import 'package:alora_mobile/features/conversations/domain/entities/conversation.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation_mode.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation_stage.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation_status.dart';

import '../dto/conversation_dto.dart';

/// ConversationDto'ni domain Conversation modeliga o'tkazadi
extension ConversationDtoMapper on ConversationDto {
  Conversation toEntity() {
    return Conversation(
      id: id,
      title: title,
      stage: ConversationStage.fromName(stage),
      mode: ConversationMode.fromName(mode),
      status: ConversationStatus.fromName(status),
      lastMessageAt: lastMessageAt,
      orderId: order,
    );
  }
}
