// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'conversion_stats_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversionStatsDto _$ConversionStatsDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ConversionStatsDto',
      json,
      ($checkedConvert) {
        final val = ConversionStatsDto(
          totalConversations: $checkedConvert(
            'total_conversations',
            (v) => (v as num?)?.toInt() ?? 0,
          ),
          withOrder: $checkedConvert(
            'with_order',
            (v) => (v as num?)?.toInt() ?? 0,
          ),
          conversionRate: $checkedConvert(
            'conversion_rate',
            (v) => v as String?,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'totalConversations': 'total_conversations',
        'withOrder': 'with_order',
        'conversionRate': 'conversion_rate',
      },
    );

Map<String, dynamic> _$ConversionStatsDtoToJson(ConversionStatsDto instance) =>
    <String, dynamic>{
      'total_conversations': instance.totalConversations,
      'with_order': instance.withOrder,
      'conversion_rate': ?instance.conversionRate,
    };
