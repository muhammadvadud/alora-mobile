import 'package:alora_mobile/features/management/domain/entities/conversion_stats.dart';
import 'package:alora_mobile/features/management/domain/entities/usage_conversation.dart';
import 'package:alora_mobile/features/management/domain/entities/usage_daily_point.dart';
import 'package:alora_mobile/features/management/domain/entities/usage_summary.dart';
import 'package:alora_mobile/features/management/domain/entities/user_usage.dart';

import '../dto/conversion_stats_dto.dart';
import '../dto/usage_conversation_dto.dart';
import '../dto/usage_daily_point_dto.dart';
import '../dto/usage_summary_dto.dart';
import '../dto/user_usage_dto.dart';

extension UsageSummaryDtoMapper on UsageSummaryDto {
  UsageSummary toEntity() {
    return UsageSummary(
      period: period,
      dateFrom: DateTime.tryParse(dateFrom ?? ''),
      dateTo: DateTime.tryParse(dateTo ?? ''),
      tokens: tokens,
      costUzs: cost,
      messages: messages,
      conversations: conversations,
      orders: orders,
      conversion: conversion != null
          ? double.tryParse(conversion!)
          : null,
      daily: daily.map((dto) => dto.toEntity()).toList(),
    );
  }
}

extension UsageDailyPointDtoMapper on UsageDailyPointDto {
  UsageDailyPoint toEntity() {
    return UsageDailyPoint(
      date: DateTime.tryParse(date ?? '') ?? DateTime.now(),
      costUzs: cost,
    );
  }
}

extension UserUsageDtoMapper on UserUsageDto {
  UserUsage toEntity() {
    return UserUsage(
      userId: userId,
      fullName: fullName,
      tokens: tokens,
      costUzs: cost,
      messages: messages,
      conversations: conversations,
    );
  }
}

extension ConversionStatsDtoMapper on ConversionStatsDto {
  ConversionStats toEntity() {
    return ConversionStats(
      totalConversations: totalConversations,
      withOrder: withOrder,
      conversionRate: rate,
    );
  }
}

extension UsageConversationDtoMapper on UsageConversationDto {
  UsageConversation toEntity() {
    return UsageConversation(
      conversationId: conversationId,
      costUzs: cost,
      tokens: tokens,
      messages: messages,
    );
  }
}