import 'package:alora_mobile/features/conversations/domain/entities/conversation.dart';

/// Ro'yxatdagi qatorlar uchun sana guruhi
enum ConversationDateGroup { today, yesterday, thisWeek, older }

/// `date` qaysi guruhga tushishini aniqlaydi (Bugun/Kecha/Bu hafta/oldingi).
/// Sana berilmagan suhbatlar `older` guruhiga tushadi.
ConversationDateGroup classifyConversationDate(
  DateTime? date, {
  required DateTime now,
}) {
  if (date == null) return ConversationDateGroup.older;
  final today = DateTime(now.year, now.month, now.day);
  final target = DateTime(date.year, date.month, date.day);
  final diff = today.difference(target).inDays;

  if (diff <= 0) return ConversationDateGroup.today;
  if (diff == 1) return ConversationDateGroup.yesterday;
  if (diff <= 7) return ConversationDateGroup.thisWeek;
  return ConversationDateGroup.older;
}

/// Ro'yxatni sana guruhlariga bo'lib qaytaradi.
/// Guruhlar tayin uchun: Bugun, Kecha, Bu hafta, Oldingi.
/// Guruh ichidagi tartib `items` tartibi bilan bir xil qoladi.
Map<ConversationDateGroup, List<Conversation>> groupConversationsByDate(
  List<Conversation> items, {
  required DateTime now,
}) {
  final result = <ConversationDateGroup, List<Conversation>>{
    for (final group in ConversationDateGroup.values) group: <Conversation>[],
  };
  for (final conversation in items) {
    final group = classifyConversationDate(
      conversation.lastMessageAt,
      now: now,
    );
    result[group]!.add(conversation);
  }
  return result;
}
