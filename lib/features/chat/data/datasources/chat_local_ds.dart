import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:alora_mobile/core/storage/hive_boxes.dart';

import '../dto/chat_dto.dart';

class ChatLocalDataSource {
  Future<Box<String>> _getBox() async {
    return await Hive.openBox<String>(HiveBoxes.messages);
  }

  Future<void> saveMessages(
    String conversationId,
    List<MessageDto> messages,
  ) async {
    final box = await _getBox();
    // Oxirgi 50 tasini saqlaymiz
    final toSave = messages.take(50).toList();
    final jsonString = jsonEncode(toSave.map((e) => e.toJson()).toList());
    await box.put(conversationId, jsonString);
  }

  Future<List<MessageDto>> getMessages(String conversationId) async {
    final box = await _getBox();
    final jsonString = box.get(conversationId);
    if (jsonString == null) return [];

    try {
      final List<dynamic> list = jsonDecode(jsonString) as List<dynamic>;
      return list
          .map((e) => MessageDto.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return [];
    }
  }

  Future<void> clearMessages(String conversationId) async {
    final box = await _getBox();
    await box.delete(conversationId);
  }
}
