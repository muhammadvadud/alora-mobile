import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:alora_mobile/core/error/failure.dart';

import '../domain/entities/conversation.dart';

part 'conversations_state.freezed.dart';

enum ConversationFilterType { all, hasOrder, inProgress }

/// Filtrni client-side qo'llaydi. Backend hozircha filtr parametrlarini
/// qabul qilmaydi, shuning uchun yuklangan ro'yxat ustida bajariladi.
List<Conversation> applyConversationFilter(List<Conversation> items, ConversationFilterType type) {
  switch (type) {
    case ConversationFilterType.all:
      return items;
    case ConversationFilterType.hasOrder:
      return items.where((c) => c.hasOrder).toList();
    case ConversationFilterType.inProgress:
      return items.where((c) => !c.hasOrder).toList();
  }
}

/// Suhbatlar holati
@Freezed(makeCollectionsUnmodifiable: false)
sealed class ConversationsState with _$ConversationsState {
  const factory ConversationsState.initial() = _Initial;

  const factory ConversationsState.loading({
    @Default('') String searchQuery,
    @Default(ConversationFilterType.all) ConversationFilterType filterType,
  }) = _Loading;

  const factory ConversationsState.loaded({
    required List<Conversation> items,
    String? nextCursor,
    @Default(false) bool isLoadingMore,
    @Default('') String searchQuery,
    @Default(ConversationFilterType.all) ConversationFilterType filterType,
  }) = _Loaded;

  const factory ConversationsState.empty({
    @Default('') String searchQuery,
    @Default(ConversationFilterType.all) ConversationFilterType filterType,
  }) = _Empty;

  const factory ConversationsState.error({
    required Failure failure,
    @Default('') String searchQuery,
    @Default(ConversationFilterType.all) ConversationFilterType filterType,
  }) = _Error;
}
