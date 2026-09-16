// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'offline_queue_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OfflineQueueItem _$OfflineQueueItemFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_OfflineQueueItem', json, ($checkedConvert) {
      final val = _OfflineQueueItem(
        id: $checkedConvert('id', (v) => v as String),
        method: $checkedConvert('method', (v) => v as String),
        path: $checkedConvert('path', (v) => v as String),
        body: $checkedConvert('body', (v) => v as Map<String, dynamic>?),
        createdAt: $checkedConvert(
          'created_at',
          (v) => DateTime.parse(v as String),
        ),
        attempts: $checkedConvert('attempts', (v) => (v as num?)?.toInt() ?? 0),
      );
      return val;
    }, fieldKeyMap: const {'createdAt': 'created_at'});

Map<String, dynamic> _$OfflineQueueItemToJson(_OfflineQueueItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'method': instance.method,
      'path': instance.path,
      'body': ?instance.body,
      'created_at': instance.createdAt.toIso8601String(),
      'attempts': instance.attempts,
    };
