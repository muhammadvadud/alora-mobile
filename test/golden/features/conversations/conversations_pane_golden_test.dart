import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';
import 'package:alora_mobile/features/conversations/application/providers.dart';
import 'package:alora_mobile/features/conversations/domain/entities/conversation_stage.dart';
import 'package:alora_mobile/features/conversations/presentation/widgets/conversations_pane.dart';

import '../../../unit/features/conversations/conversations_test_helpers.dart'
    show FakeConversationsRepository, testConversation;

void main() {
  setUpAll(() async {
    await loadAppFonts();
  });

  Widget widgetFor(ThemeMode mode) {
    final repository = FakeConversationsRepository();
    // Golden barqarorligi: vaqt kun ichida qotirilgan (09:41), sana guruhlari saqlanadi
    final now = DateTime(2026, 9, 16, 9, 41);
    repository.listResult = (
      [
        testConversation(
          id: 'c1',
          title: 'Mehmonxona — klassik parda',
          stage: ConversationStage.order,
          lastMessageAt: now,
          totalAmount: 4500000,
          orderId: 'order-1',
        ),
        testConversation(
          id: 'c2',
          title: 'Oshxona — rim parda',
          stage: ConversationStage.calc,
          lastMessageAt: now.subtract(const Duration(days: 1)),
          totalAmount: 1200000,
        ),
        testConversation(
          id: 'c3',
          title: 'Yotoqxona — fransuz parda',
          stage: ConversationStage.measure,
          lastMessageAt: now.subtract(const Duration(days: 3)),
        ),
        testConversation(
          id: 'c4',
          title: 'Bolalar xonasi — to\'q qizil',
          stage: ConversationStage.need,
          lastMessageAt: now.subtract(const Duration(days: 21)),
        ),
      ],
      null,
    );

    return ProviderScope(
      overrides: [conversationsRepositoryProvider.overrideWithValue(repository)],
      child: MaterialApp(
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        themeMode: mode,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(body: ConversationsPane(clock: () => now)),
      ),
    );
  }

  testGoldens('S-10 ConversationsPane — Light & Dark', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [Device.phone])
      ..addScenario(name: 'Light', widget: widgetFor(ThemeMode.light))
      ..addScenario(name: 'Dark', widget: widgetFor(ThemeMode.dark));

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'conversations_pane');
  });
}
