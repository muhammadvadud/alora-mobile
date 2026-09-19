// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'usage_summary_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsageSummaryDto _$UsageSummaryDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UsageSummaryDto', json, ($checkedConvert) {
      final val = UsageSummaryDto(
        period: $checkedConvert('period', (v) => v as String),
        dateFrom: $checkedConvert('date_from', (v) => v as String?),
        dateTo: $checkedConvert('date_to', (v) => v as String?),
        tokens: $checkedConvert('tokens', (v) => (v as num?)?.toInt() ?? 0),
        costUzs: $checkedConvert('cost_uzs', (v) => v as String?),
        messages: $checkedConvert('messages', (v) => (v as num?)?.toInt() ?? 0),
        conversations: $checkedConvert('conversations', (v) => (v as num?)?.toInt() ?? 0),
        orders: $checkedConvert('orders', (v) => (v as num?)?.toInt() ?? 0),
        conversion: $checkedConvert('conversion', (v) => v as String?),
        daily: $checkedConvert(
          'daily',
          (v) =>
              (v as List<dynamic>?)
                  ?.map((e) => UsageDailyPointDto.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              [],
        ),
      );
      return val;
    }, fieldKeyMap: const {'dateFrom': 'date_from', 'dateTo': 'date_to', 'costUzs': 'cost_uzs'});

Map<String, dynamic> _$UsageSummaryDtoToJson(UsageSummaryDto instance) => <String, dynamic>{
  'period': instance.period,
  'date_from': ?instance.dateFrom,
  'date_to': ?instance.dateTo,
  'tokens': instance.tokens,
  'cost_uzs': ?instance.costUzs,
  'messages': instance.messages,
  'conversations': instance.conversations,
  'orders': instance.orders,
  'conversion': ?instance.conversion,
  'daily': instance.daily.map((e) => e.toJson()).toList(),
};
