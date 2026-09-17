import 'package:alora_mobile/features/auth/data/mappers/auth_me_mapper.dart'
    show roleFromName;
import 'package:alora_mobile/features/conversations/domain/entities/conversation.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation_mode.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation_stage.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation_status.dart';
import 'package:alora_mobile/features/management/domain/entities/employee.dart';
import 'package:alora_mobile/features/management/domain/entities/on_exceed.dart';
import 'package:alora_mobile/features/management/domain/entities/transcript_message.dart';
import 'package:alora_mobile/features/management/domain/entities/usage_limit.dart';

import '../dto/employee_conversation_dto.dart';
import '../dto/employee_dto.dart';
import '../dto/transcript_message_dto.dart';
import '../dto/usage_limit_dto.dart';

extension EmployeeDtoMapper on EmployeeDto {
  Employee toEntity({int? todayCost}) {
    return Employee(
      id: id,
      phone: phone,
      fullName: fullName,
      role: roleFromName(role),
      isActive: isActive,
      lastLoginAt: DateTime.tryParse(lastLogin ?? ''),
      createdAt: DateTime.tryParse(createdAt ?? ''),
      todayTokens: todayTokens,
      todayMessages: todayMessages,
      todayConversations: todayConversations,
      todayCost: todayCost,
    );
  }
}

extension UsageLimitDtoMapper on UsageLimitDto {
  UsageLimit toEntity() {
    return UsageLimit(
      id: id,
      userId: userId,
      period: period,
      isUnlimited: isUnlimited,
      maxTokens: maxTokens,
      maxCostUzs: maxCostUzs,
      maxMessages: maxMessages,
      onExceed: OnExceed.fromName(onExceed),
      isActive: isActive,
    );
  }
}

extension EmployeeConversationDtoMapper on EmployeeConversationDto {
  Conversation toEntity() {
    return Conversation(
      id: id,
      title: title.isNotEmpty ? title : sessionId ?? id,
      stage: ConversationStage.fromName(stage),
      mode: ConversationMode.fromName(mode),
      status: ConversationStatus.fromName(status),
      lastMessageAt: DateTime.tryParse(lastMessageAt ?? ''),
    );
  }
}

extension TranscriptMessageDtoMapper on TranscriptMessageDto {
  TranscriptMessage toEntity() {
    return TranscriptMessage(
      role: role,
      content: content,
      toolCalls: toolCalls ?? const [],
      toolResult: toolResult,
      createdAt: DateTime.tryParse(createdAt ?? ''),
    );
  }
}
