// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'user_usage_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserUsageDto _$UserUsageDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UserUsageDto', json, ($checkedConvert) {
      final val = UserUsageDto(
        userId: $checkedConvert('user_id', (v) => v as String),
        fullName: $checkedConvert('full_name', (v) => v as String?),
        tokens: $checkedConvert('tokens', (v) => (v as num?)?.toInt() ?? 0),
        costUzs: $checkedConvert('cost_uzs', (v) => v as String?),
        messages: $checkedConvert('messages', (v) => (v as num?)?.toInt() ?? 0),
        conversations: $checkedConvert('conversations', (v) => (v as num?)?.toInt() ?? 0),
      );
      return val;
    }, fieldKeyMap: const {'userId': 'user_id', 'fullName': 'full_name', 'costUzs': 'cost_uzs'});

Map<String, dynamic> _$UserUsageDtoToJson(UserUsageDto instance) => <String, dynamic>{
  'user_id': instance.userId,
  'full_name': ?instance.fullName,
  'tokens': instance.tokens,
  'cost_uzs': ?instance.costUzs,
  'messages': instance.messages,
  'conversations': instance.conversations,
};
