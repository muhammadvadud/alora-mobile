// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'prompt_version_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PromptVersionDto _$PromptVersionDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      '_PromptVersionDto',
      json,
      ($checkedConvert) {
        final val = _PromptVersionDto(
          id: $checkedConvert('id', (v) => v as String),
          version: $checkedConvert('version', (v) => (v as num).toInt()),
          content: $checkedConvert('content', (v) => v as String),
          author: $checkedConvert('author', (v) => v as String?),
          authorName: $checkedConvert('author_name', (v) => v as String?),
          isCurrent: $checkedConvert('is_current', (v) => v as bool? ?? false),
          createdAt: $checkedConvert(
            'created_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'authorName': 'author_name',
        'isCurrent': 'is_current',
        'createdAt': 'created_at',
      },
    );

Map<String, dynamic> _$PromptVersionDtoToJson(_PromptVersionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'content': instance.content,
      'author': ?instance.author,
      'author_name': ?instance.authorName,
      'is_current': instance.isCurrent,
      'created_at': ?instance.createdAt?.toIso8601String(),
    };

_PromptHistoryDto _$PromptHistoryDtoFromJson(Map<String, dynamic> json) =>
    $checkedCreate('_PromptHistoryDto', json, ($checkedConvert) {
      final val = _PromptHistoryDto(
        current: $checkedConvert(
          'current',
          (v) => v == null
              ? null
              : PromptVersionDto.fromJson(v as Map<String, dynamic>),
        ),
        history: $checkedConvert(
          'history',
          (v) =>
              (v as List<dynamic>?)
                  ?.map(
                    (e) => PromptVersionDto.fromJson(e as Map<String, dynamic>),
                  )
                  .toList() ??
              const [],
        ),
      );
      return val;
    });

Map<String, dynamic> _$PromptHistoryDtoToJson(_PromptHistoryDto instance) =>
    <String, dynamic>{
      'current': ?instance.current?.toJson(),
      'history': instance.history.map((e) => e.toJson()).toList(),
    };
