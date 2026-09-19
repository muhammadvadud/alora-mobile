import 'package:flutter_test/flutter_test.dart';

import 'package:alora_mobile/core/utils/date_format.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation.dart';
import 'package:alora_mobile/features/conversations/presentation/conversation_date_groups.dart';

import 'conversations_test_helpers.dart';

void main() {
  group('classifyConversationDate', () {
    // Bugun: sana bugungi kunga teng bo'lsa yoki kelajakka ishora qilsa
    test('bugungi sana -> today', () {
      final now = DateTime(2026, 9, 16, 12, 0);
      final today = DateTime(2026, 9, 16, 8, 30);
      expect(classifyConversationDate(today, now: now), ConversationDateGroup.today);
    });

    test('ertangi sana (kelajak) -> today', () {
      final now = DateTime(2026, 9, 16, 12, 0);
      final tomorrow = DateTime(2026, 9, 17, 9, 0);
      expect(classifyConversationDate(tomorrow, now: now), ConversationDateGroup.today);
    });

    test('kecha sanasi -> yesterday', () {
      final now = DateTime(2026, 9, 16, 12, 0);
      final yesterday = DateTime(2026, 9, 15, 23, 59);
      expect(classifyConversationDate(yesterday, now: now), ConversationDateGroup.yesterday);
    });

    test('2-7 kun orasi -> thisWeek', () {
      final now = DateTime(2026, 9, 16, 12, 0);
      expect(
        classifyConversationDate(DateTime(2026, 9, 14), now: now),
        ConversationDateGroup.thisWeek,
      );
      // 7 kundan oldingi kun hali "bu hafta"
      expect(
        classifyConversationDate(DateTime(2026, 9, 9), now: now),
        ConversationDateGroup.thisWeek,
      );
    });

    test('8+ kun oldingi sana -> older', () {
      final now = DateTime(2026, 9, 16, 12, 0);
      expect(classifyConversationDate(DateTime(2026, 9, 8), now: now), ConversationDateGroup.older);
    });

    test('null sana -> older', () {
      final now = DateTime(2026, 9, 16, 12, 0);
      expect(classifyConversationDate(null, now: now), ConversationDateGroup.older);
    });

    test("oy chegarasi (31-oktabr / 1-noyabr) xato bermaydi", () {
      final now = DateTime(2026, 11, 1, 8, 0);
      final monthBoundary = DateTime(2026, 10, 31, 22, 0);
      expect(classifyConversationDate(monthBoundary, now: now), ConversationDateGroup.yesterday);
    });

    test("yil chegarasi (31-dekabr / 1-yanvar) xato bermaydi", () {
      final now = DateTime(2027, 1, 1, 8, 0);
      final yearBoundary = DateTime(2026, 12, 31, 23, 0);
      expect(classifyConversationDate(yearBoundary, now: now), ConversationDateGroup.yesterday);
    });
  });

  group('groupConversationsByDate', () {
    test('aralash ro\'yxat guruhlarga to\'g\'ri taqsimlanadi', () {
      final now = DateTime(2026, 9, 16, 12, 0);
      final items = <Conversation>[
        testConversation(id: 'older1', lastMessageAt: DateTime(2026, 9, 5, 10, 0)),
        testConversation(id: 'week1', lastMessageAt: DateTime(2026, 9, 12, 10, 0)),
        testConversation(id: 'today1', lastMessageAt: DateTime(2026, 9, 16, 9, 0)),
        testConversation(id: 'yesterday1', lastMessageAt: DateTime(2026, 9, 15, 18, 0)),
        testConversation(id: 'nullDate'),
      ];

      final grouped = groupConversationsByDate(items, now: now);

      expect(grouped[ConversationDateGroup.today]!.map((c) => c.id), ['today1']);
      expect(grouped[ConversationDateGroup.yesterday]!.map((c) => c.id), ['yesterday1']);
      expect(grouped[ConversationDateGroup.thisWeek]!.map((c) => c.id), ['week1']);
      expect(
        grouped[ConversationDateGroup.older]!.map((c) => c.id),
        containsAll(['older1', 'nullDate']),
      );
    });

    test('barcha guruhlar har doim ro\'yxatda mavjud', () {
      final now = DateTime(2026, 9, 16, 12, 0);
      final grouped = groupConversationsByDate([], now: now);
      for (final group in ConversationDateGroup.values) {
        expect(grouped[group], isEmpty);
      }
    });
  });

  group('formatDate (kirill oylari)', () {
    test("eski sana 'short' formatda chiqadi", () {
      final date = DateTime(2026, 8, 27, 14, 0);
      expect(formatDate(date, overrideLocale: 'uz', short: true), '27-avg');
    });

    test("kirill oy nomi 'short' formatda ishlatiladi", () {
      final date = DateTime(2026, 8, 27, 14, 0);
      expect(formatDate(date, overrideLocale: 'uz_Cyrl', short: true), '27-авг');
    });
  });
}
