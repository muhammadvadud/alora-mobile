import 'dart:async';

import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation_mode.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation_stage.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation_status.dart';
import 'package:alora_mobile/features/conversations/domain/repositories/conversations_repository.dart';

/// Test uchun namuna suhbat
Conversation testConversation({
  String id = 'conv-1',
  String title = 'Test suhbat',
  ConversationStage stage = ConversationStage.need,
  ConversationMode mode = ConversationMode.seller,
  ConversationStatus status = ConversationStatus.active,
  DateTime? lastMessageAt,
  int? totalAmount,
  String? lastMessagePreview,
  String? orderId,
}) {
  return Conversation(
    id: id,
    title: title,
    stage: stage,
    mode: mode,
    status: status,
    lastMessageAt: lastMessageAt,
    totalAmount: totalAmount,
    lastMessagePreview: lastMessagePreview,
    orderId: orderId,
  );
}

/// `ConversationsRepository` interfeysining boshqariladigan fakesi.
class FakeConversationsRepository implements ConversationsRepository {
  /// [list] chaqirilganda qaytariladigan natija.
  (List<Conversation>, String?) listResult = ([], null);

  /// [list] chaqirilsa xato chiqarish uchun.
  Failure? listFailure;

  /// Agar berilsa, [list] shu completer natijasini kutadi (yuklanish holatini
  /// testlarda ushlab turish uchun).
  Completer<(List<Conversation>, String?)>? listCompleter;

  /// [list] parametrlarini saqlash
  int listCalls = 0;
  String? lastSearch;
  String? lastCursor;

  /// [create] chaqirilganda qaytariladigan suhbat.
  Conversation createResult = testConversation(id: 'new-conv');

  /// [create] xatosi.
  Failure? createFailure;
  int createCalls = 0;

  /// [archive] xatosi.
  Failure? archiveFailure;
  int archiveCalls = 0;
  String? lastArchivedId;

  @override
  Future<(List<Conversation>, String?)> list({
    String? cursor,
    String? search,
  }) async {
    listCalls++;
    lastCursor = cursor;
    lastSearch = search;
    final failure = listFailure;
    if (failure != null) throw failure;
    final completer = listCompleter;
    if (completer != null) return completer.future;
    return listResult;
  }

  @override
  Future<Conversation> create() async {
    createCalls++;
    final failure = createFailure;
    if (failure != null) throw failure;
    return createResult;
  }

  @override
  Future<void> archive(String id) async {
    archiveCalls++;
    lastArchivedId = id;
    final failure = archiveFailure;
    if (failure != null) throw failure;
  }

  @override
  Future<String> transcript(String id) async => '';

  @override
  Future<List<Conversation>> getCached() async => [];
}
