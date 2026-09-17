// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'usage_daily_point_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsageDailyPointDto _$UsageDailyPointDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UsageDailyPointDto', json, ($checkedConvert) {
      final val = UsageDailyPointDto(
        date: $checkedConvert('date', (v) => v as String?),
        costUzs: $checkedConvert('cost_uzs', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'costUzs': 'cost_uzs'});

Map<String, dynamic> _$UsageDailyPointDtoToJson(UsageDailyPointDto instance) =>
    <String, dynamic>{'date': ?instance.date, 'cost_uzs': ?instance.costUzs};
