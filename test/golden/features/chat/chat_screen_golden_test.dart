import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/router/adaptive_shell.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';
import 'package:alora_mobile/core/connectivity/connectivity_notifier.dart';
import 'package:alora_mobile/features/chat/domain/entities/message.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/chat_input_panel.dart';
import 'package:alora_mobile/features/chat/presentation/widgets/message_bubble.dart';
import 'package:alora_mobile/features/conversations/application/providers.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation_stage.dart';
import 'package:alora_mobile/features/conversations/presentation/widgets/conversations_pane.dart';
import 'package:alora_mobile/features/customer_mode/application/providers.dart' as cm_providers;

import '../../../helpers/chat/chat_test_helpers.dart';
import '../../../helpers/golden/chat_golden_devices.dart';
import '../../../unit/features/conversations/conversations_test_helpers.dart'
    show FakeConversationsRepository, testConversation;

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  group('S-02 / S-03 chat golden', () {
    testGoldens("S-02 Chat bo'sh holat chip'lar bilan", (tester) async {
      final repo = MockChatRepository();
      stubGetMessages(repo, []);

      await tester.pumpWidgetBuilder(chatApp(repo), surfaceSize: chatPhone.size);
      await tester.pumpAndSettle();
      await screenMatchesGolden(tester, 's02_chat_empty');
    });

    testGoldens("S-03 suhbat — yorug' (390×844)", (tester) async {
      final repo = MockChatRepository();
      stubGetMessages(repo, _conversationMessages());

      await tester.pumpWidgetBuilder(chatApp(repo), surfaceSize: chatPhone.size);
      await tester.pumpAndSettle();
      await screenMatchesGolden(tester, 's03_chat_conversation_light');
    });

    testGoldens("S-03 suhbat — qorong'i (390×844)", (tester) async {
      final repo = MockChatRepository();
      stubGetMessages(repo, _conversationMessages());

      await tester.pumpWidgetBuilder(
        chatApp(repo, themeMode: ThemeMode.dark),
        surfaceSize: chatPhone.size,
      );
      await tester.pumpAndSettle();
      await screenMatchesGolden(tester, 's03_chat_conversation_dark');
    });

    testGoldens("S-09 mijoz rejimi — indikator, tab bar/menyu yo'q, katta shrift", (tester) async {
      final repo = MockChatRepository();
      stubGetMessages(repo, _conversationMessages());

      await tester.pumpWidgetBuilder(
        chatApp(repo, customerMode: true),
        surfaceSize: chatPhone.size,
      );
      await tester.pumpAndSettle();
      await screenMatchesGolden(tester, 's09_chat_customer_mode');
    });

    testGoldens('S-03 planshet AdaptiveShell + ConversationsPane (1024×768)', (tester) async {
      final convRepo = FakeConversationsRepository()
        ..listResult = (
          [
            testConversation(
              id: 'conv-1',
              title: 'Mehmonxona — klassik parda',
              stage: ConversationStage.order,
              lastMessageAt: chatGoldenClock,
              totalAmount: 4500000,
              orderId: 'order-1',
            ),
            testConversation(
              id: 'conv-2',
              title: 'Oshxona — rim parda',
              stage: ConversationStage.calc,
              lastMessageAt: chatGoldenClock.subtract(const Duration(days: 1)),
              totalAmount: 1200000,
            ),
          ],
          null,
        );

      await tester.pumpWidgetBuilder(
        _tabletShell(convRepo: convRepo, themeMode: ThemeMode.light),
        surfaceSize: chatTablet.size,
      );
      await tester.pumpAndSettle();
      await screenMatchesGolden(tester, 's03_chat_tablet');
    });
  });
}

List<Message> _conversationMessages() {
  return [
    userMessage(content: 'Mehmonxona uchun klassik parda kerak'),
    assistantMessage(
      id: 'a1',
      content:
          'Albatta. Karniz uzunligi va balandlikni ayting — '
          'keyin mato variantlarini ko‘rsataman.',
    ),
    userMessage(id: 'u2', content: 'Karniz 3.2 m, balandlik 2.7 m'),
    assistantMessage(
      id: 'a2',
      content: 'Tushundim. Endi mato tanlaymiz yoki hisob kartochkasini ochamiz.',
    ),
  ];
}

Widget _tabletShell({required FakeConversationsRepository convRepo, required ThemeMode themeMode}) {
  return ProviderScope(
    overrides: [
      cm_providers.customerModeEnabledProvider.overrideWithValue(false),
      connectivityProvider.overrideWithValue(true),
      conversationsRepositoryProvider.overrideWithValue(convRepo),
    ],
    child: MaterialApp(
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: themeMode,
      locale: testLocale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        backgroundColor: themeMode == ThemeMode.dark
            ? AppTheme.dark().scaffoldBackgroundColor
            : AppTheme.light().scaffoldBackgroundColor,
        body: AdaptiveShell(
          leading: ConversationsPane(clock: () => chatGoldenClock),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    for (final msg in _conversationMessages())
                      if (msg.role == MessageRole.user)
                        UserBubble(text: msg.content)
                      else
                        AssistantMessageView(text: msg.content),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: ChatInputPanel(onSend: (_) {}, onMicPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
