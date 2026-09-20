import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import 'package:alora_mobile/core/storage/hive_boxes.dart';
import 'package:alora_mobile/core/utils/app_logger.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation.dart';

import '../dto/conversation_dto.dart';
import '../mappers/conversation_mapper.dart';

/// Suhbatlar keshini boshqaruvchi local data source (Hive)
class ConversationsLocalDataSource {
  static const _cacheKeyPrefix = 'cached_conversations';
  static const int _maxCachedCount = 20;

  Future<Box<dynamic>>? _boxFuture;

  Future<Box<dynamic>> _box() {
    final existing = _boxFuture;
    if (existing != null) return existing;
    final created = HiveBoxes.open<dynamic>(HiveBoxes.conversations);
    return _boxFuture = created;
  }

  /// Keshdan suhbatlarni olish
  Future<List<Conversation>> getCached({String? scope}) async {
    try {
      final box = await _box();
      final raw = box.get(_cacheKey(scope));
      if (raw is! String || raw.isEmpty) return [];
      final list = jsonDecode(raw) as List;
      return list.map((e) {
        final dto = ConversationDto.fromJson(Map<String, dynamic>.from(e as Map));
        return dto.toEntity();
      }).toList();
    } catch (error) {
      logger.w("Keshlangan suhbatlarni o'qishda xato: $error");
      return [];
    }
  }

  /// Suhbatlarni keshga saqlash (oxirgi [_maxCachedCount] ta)
  Future<void> cache(List<ConversationDto> dtos, {String? scope}) async {
    try {
      final box = await _box();
      final toCache = dtos.length > _maxCachedCount ? dtos.sublist(0, _maxCachedCount) : dtos;
      final jsonList = toCache.map((dto) => dto.toJson()).toList();
      await box.put(_cacheKey(scope), jsonEncode(jsonList));
    } catch (error) {
      logger.w("Suhbatlarni keshlashda xato: $error");
    }
  }

  /// Keshlangan suhbatlardan berilgan ID'ni o'chirish
  Future<void> remove(String id, {String? scope}) async {
    try {
      final box = await _box();
      final raw = box.get(_cacheKey(scope));
      if (raw is! String || raw.isEmpty) return;
      final list = jsonDecode(raw) as List;
      final updated = list.where((e) => Map<String, dynamic>.from(e as Map)['id'] != id).toList();
      await box.put(_cacheKey(scope), jsonEncode(updated));
    } catch (error) {
      logger.w("Keshdan suhbatni o'chirishda xato: $error");
    }
  }

  /// Keshni tozalash
  Future<void> clear({String? scope}) async {
    try {
      final box = await _box();
      await box.delete(_cacheKey(scope));
    } catch (error) {
      logger.w("Keshni tozalashda xato: $error");
    }
  }

  String _cacheKey(String? scope) =>
      scope == null || scope.isEmpty ? _cacheKeyPrefix : '$_cacheKeyPrefix:$scope';
}
