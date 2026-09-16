import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alora_mobile/features/conversations/application/providers.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation_stage.dart';
import 'package:alora_mobile/features/conversations/presentation/widgets/conversations_pane.dart';
import 'package:alora_mobile/shared/widgets/skeleton.dart';

import '../../../helpers/pump_app.dart' show PumpApp;
import '../../../unit/features/conversations/conversations_test_helpers.dart'
    show FakeConversationsRepository, testConversation;

void main() {
  Widget buildPane(FakeConversationsRepository repository) {
    return ProviderScope(
      overrides: [
        conversationsRepositoryProvider.overrideWithValue(repository),
      ],
      child: const ConversationsPane().pumpApp(),
    );
  }

  testWidgets('yuklanish holatida skeleton ko\'rsatiladi', (tester) async {
    final repository = FakeConversationsRepository();
    repository.listCompleter = Completer();

    await tester.pumpWidget(buildPane(repository));
    // yuklash davom etayotganda birinchi frame — skeleton ko'rinadi
    await tester.pump();

    expect(find.byType(SkeletonBox), findsWidgets);

    repository.listCompleter!.complete(([testConversation()], null));
    await tester.pumpAndSettle();
  });

  testWidgets('bo\'sh ro\'yxat bo\'sh holat matnini ko\'rsatadi', (
    tester,
  ) async {
    final repository = FakeConversationsRepository();

    await tester.pumpWidget(buildPane(repository));
    await tester.pumpAndSettle();

    expect(find.text('Hali suhbat yo\'q'), findsOneWidget);
  });

  testWidgets('yuklangan ro\'yxatda sana guruhlari va qatorlar ko\'rinadi', (
    tester,
  ) async {
    final repository = FakeConversationsRepository();
    final now = DateTime.now();
    repository.listResult = (
      [
        testConversation(
          id: 'c1',
          title: 'Oshxona tayyor',
          stage: ConversationStage.calc,
          lastMessageAt: now,
          totalAmount: 1500000,
          orderId: 'order-1',
        ),
        testConversation(
          id: 'c2',
          title: 'Yotoqxona pardasi',
          stage: ConversationStage.need,
          lastMessageAt: now.subtract(const Duration(days: 1)),
        ),
      ],
      null,
    );

    await tester.pumpWidget(buildPane(repository));
    await tester.pumpAndSettle();

    // SectionLabel matnni uppercase qiladi — case-insensitive qidiramiz
    expect(
      find.textContaining(RegExp('bugun', caseSensitive: false)),
      findsOneWidget,
    );
    expect(
      find.textContaining(RegExp('kecha', caseSensitive: false)),
      findsOneWidget,
    );
    expect(find.text('Oshxona tayyor'), findsOneWidget);
    expect(find.text('Yotoqxona pardasi'), findsOneWidget);
    expect(find.textContaining("so'm"), findsOneWidget);
  });

  testWidgets('filtr chipslari mavjud va bosilganda ro\'yxatni filtrlaydi', (
    tester,
  ) async {
    final repository = FakeConversationsRepository();
    repository.listResult = (
      [
        testConversation(id: 'a', title: 'Buyurtmali', orderId: 'o1'),
        testConversation(
          id: 'b',
          title: 'Boshlangich',
          stage: ConversationStage.need,
        ),
      ],
      null,
    );

    await tester.pumpWidget(buildPane(repository));
    await tester.pumpAndSettle();

    expect(find.text('Hammasi'), findsOneWidget);
    expect(find.text('Hisob chiqarilgan'), findsOneWidget);
    expect(find.text('Yakunlanmagan'), findsOneWidget);

    await tester.tap(find.text('Hisob chiqarilgan'));
    await tester.pumpAndSettle();

    expect(find.text('Buyurtmali'), findsOneWidget);
    expect(find.text('Boshlangich'), findsNothing);

    await tester.tap(find.text('Yakunlanmagan'));
    await tester.pumpAndSettle();

    expect(find.text('Buyurtmali'), findsNothing);
    expect(find.text('Boshlangich'), findsOneWidget);
  });
}
