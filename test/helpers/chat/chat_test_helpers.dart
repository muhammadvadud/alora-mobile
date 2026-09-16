import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mocktail/mocktail.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';
import 'package:alora_mobile/core/connectivity/connectivity_notifier.dart';
import 'package:alora_mobile/core/utils/paginated.dart';
import 'package:alora_mobile/features/chat/application/providers.dart'
    as chat_providers;
import 'package:alora_mobile/features/customer_mode/application/providers.dart'
    as cm_providers;
import 'package:alora_mobile/features/chat/domain/entities/message.dart';
import 'package:alora_mobile/features/chat/domain/entities/order_draft.dart';
import 'package:alora_mobile/features/chat/domain/entities/pricing_option.dart';
import 'package:alora_mobile/features/chat/domain/entities/product_ref.dart';
import 'package:alora_mobile/features/chat/domain/entities/quote.dart';
import 'package:alora_mobile/features/chat/domain/repositories/chat_repository.dart';
import 'package:alora_mobile/features/chat/presentation/screens/chat_screen.dart';

class MockChatRepository extends Mock implements ChatRepository {}

void stubGetMessages(
  MockChatRepository repo,
  List<Message> messages, {
  Object? error,
}) {
  if (error != null) {
    when(() => repo.getMessages(any(), cursor: any(named: 'cursor')))
        .thenAnswer((_) async => throw error);
    return;
  }
  when(() => repo.getMessages(any(), cursor: any(named: 'cursor'))).thenAnswer(
    (_) async => Paginated(next: null, previous: null, results: messages),
  );
}

/// ChatScreen uchun ProviderScope + MaterialApp qurilishi.
Widget chatApp(
  MockChatRepository repo, {
  bool online = true,
  ThemeMode themeMode = ThemeMode.light,
  String conversationId = 'conv-1',
}) {
  return ProviderScope(
    overrides: [
      chat_providers.chatRepositoryProvider.overrideWithValue(repo),
      cm_providers.customerModeEnabledProvider.overrideWithValue(false),
      connectivityProvider.overrideWithValue(online),
    ],
    child: MaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      locale: testLocale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: ChatScreen(conversationId: conversationId),
    ),
  );
}

const testLocale = Locale('uz');

Message userMessage({
  String id = 'u1',
  String content = 'Mehmonxona',
  MessageStatus status = MessageStatus.done,
}) {
  return Message(
    id: id,
    role: MessageRole.user,
    content: content,
    createdAt: DateTime(2026, 1, 1),
    status: status,
  );
}

Message assistantMessage({
  String id = 'a1',
  String content = '',
  List<RichBlock> richBlocks = const [],
  MessageStatus status = MessageStatus.done,
}) {
  return Message(
    id: id,
    role: MessageRole.assistant,
    content: content,
    createdAt: DateTime(2026, 1, 1),
    status: status,
    richBlocks: richBlocks,
  );
}

QuoteFabric quoteFabric(int index) {
  return QuoteFabric(
    role: index.isEven ? 'portyera' : 'tul',
    variantId: 'v$index',
    colorName: 'Mato rangi $index',
    colorHex: '#0E5751',
    widthM: 1.5,
    heightM: 2.5,
    coef: 2,
    areaSqm: 4.0,
    pricePerSqm: 120000,
    total: 960000,
  );
}

Quote quoteFixture({
  int fabricCount = 8,
  bool withAccessories = true,
  bool withServices = true,
  List<String> wasteWarnings = const ['Kesim ortigcha chiqadi'],
}) {
  return Quote(
    fabrics: List.generate(fabricCount, quoteFabric),
    accessories: withAccessories
        ? const [
            QuoteAccessory(
              name: 'Karniz',
              qty: 1.5,
              unit: 'm',
              unitPrice: 80000,
              total: 120000,
            ),
          ]
        : const [],
    services: withServices
        ? const [QuoteService(name: 'O\'rnatish', total: 150000)]
        : const [],
    wasteWarnings: wasteWarnings,
    formula: '2.5 m × 1.5 m × 2 × 120 000 = 900 000',
    subtotal: 2190000,
    discount: 100000,
    delivery: 50000,
    total: 2140000,
    measurement: const QuoteMeasurement(
      room: 'Mehmonxona',
      cornice: 1.5,
      height: 2.5,
      coef: 2,
    ),
  );
}

PricingOptions optionsFixture() {
  return const PricingOptions(
    options: [
      PricingOption(
        tier: PricingTier.cheap,
        title: 'Arzon',
        total: 900000,
        difference: -100000,
        lines: [
          PricingOptionLine(title: 'Mato', value: 'Polietilen'),
          PricingOptionLine(title: 'Muddat', value: '5 kun'),
        ],
      ),
      PricingOption(
        tier: PricingTier.mid,
        title: 'O\'rta',
        total: 1000000,
        difference: 0,
        lines: [
          PricingOptionLine(title: 'Mato', value: 'Parda (belgiya)'),
          PricingOptionLine(title: 'Muddat', value: '7 kun'),
        ],
      ),
      PricingOption(
        tier: PricingTier.premium,
        title: 'Premium',
        total: 1200000,
        difference: 200000,
        lines: [
          PricingOptionLine(title: 'Mato', value: 'Ipak'),
          PricingOptionLine(title: 'Muddat', value: '10 kun'),
        ],
      ),
    ],
  );
}

OrderDraft orderDraftFixture({
  List<String> missingFields = const ['Telefon raqam', 'Manzil'],
}) {
  return OrderDraft(
    customerName: 'Ali Valiyev',
    phone: '+998 90 123 45 67',
    address: null,
    measurements: const [
      OrderDraftMeasurement(roomName: 'Mehmonxona', cornice: 1.5, height: 2.5),
    ],
    total: 2140000,
    missingFields: missingFields,
  );
}

List<ProductRef> productsFixture() {
  return const [
    ProductRef(
      id: 'p1',
      name: 'Belgiya parda',
      category: 'tul',
      price: 120000,
      priceUnit: 'per_piece',
      imageUrl: '',
      colorHex: '#0E5751',
      colorName: 'Zumrad',
    ),
    ProductRef(
      id: 'p2',
      name: 'Fransuz pardasi',
      category: 'portyera',
      price: 250000,
      priceUnit: 'per_piece',
      imageUrl: '',
      colorHex: '#8A6620',
      colorName: 'Bronza',
    ),
  ];
}
