import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';
import 'package:alora_mobile/features/auth/application/auth_notifier.dart';
import 'package:alora_mobile/features/auth/application/auth_state.dart';
import 'package:alora_mobile/features/auth/domain/entities/user.dart';
import 'package:alora_mobile/features/management/settings/application/settings_notifiers.dart';
import 'package:alora_mobile/features/management/settings/application/providers.dart';
import 'package:alora_mobile/features/management/settings/domain/entities/model_pricing.dart';
import 'package:alora_mobile/features/management/settings/domain/entities/prompt_version.dart';
import 'package:alora_mobile/features/management/settings/domain/repositories/settings_repository.dart';
import 'package:alora_mobile/features/management/settings/presentation/screens/system_prompt_screen.dart';
import 'package:alora_mobile/shared/models/role.dart';
import 'package:alora_mobile/shared/widgets/app_dialog.dart';

const _admin = User(id: '1', role: Role.admin, phone: '123', fullName: 'Admin', tenant: 'a');

const _history = PromptHistory(
  current: PromptVersion(
    id: 'c1',
    version: 5,
    content: 'hozirgi',
    authorName: 'Admin',
    isCurrent: true,
  ),
  history: [
    PromptVersion(
      id: 'h1',
      version: 4,
      content: 'oldingi',
      authorName: 'Admin',
      isCurrent: false,
      createdAt: null,
    ),
  ],
);

class _FakeSettingsRepository implements SettingsRepository {
  final List<String> rollbacks = [];

  @override
  Future<PromptHistory> getPromptHistory() async => _history;

  @override
  Future<PromptVersion> createPrompt(String content) async {
    return PromptVersion(id: 'c2', version: 6, content: content);
  }

  @override
  Future<PromptVersion> rollbackPrompt(String versionId) async {
    rollbacks.add(versionId);
    return const PromptVersion(id: 'h1', version: 4, content: 'oldingi');
  }

  @override
  Future<List<ModelPricing>> getModelPricings() async => [];

  @override
  Future<ModelPricing> createModelPricing(Map<String, dynamic> body) async {
    throw UnimplementedError();
  }

  @override
  Future<ModelPricing> updateModelPricing(String id, Map<String, dynamic> body) async {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteModelPricing(String id) async {}
}

class _FakePromptHistoryNotifier extends PromptHistoryNotifier {
  @override
  FutureOr<PromptHistory> build() async => _history;
}

void main() {
  late AppLocalizations l10n;
  late _FakeSettingsRepository repo;

  setUpAll(() async {
    l10n = await AppLocalizations.delegate.load(const Locale('uz'));
  });

  setUp(() {
    repo = _FakeSettingsRepository();
  });

  Future<void> pumpScreen(WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authProvider.overrideWithValue(const AuthState.authenticated(user: _admin)),
          promptHistoryProvider.overrideWith(() => _FakePromptHistoryNotifier()),
          settingsRepositoryProvider.overrideWithValue(repo),
        ],
        child: MaterialApp(
          locale: const Locale('uz'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: AppTheme.light(),
          home: const SystemPromptScreen(),
        ),
      ),
    );
    await tester.pump();
    await tester.pump();
  }

  testWidgets('Rollback tugmasi tasdiq dialogini ochadi', (tester) async {
    await pumpScreen(tester);

    expect(find.text(l10n.settings_rollback), findsOneWidget);

    await tester.tap(find.text(l10n.settings_rollback));
    await tester.pumpAndSettle();

    expect(find.byType(AppDialog), findsOneWidget);
    expect(find.text(l10n.settings_rollbackConfirmTitle), findsOneWidget);
    expect(find.text(l10n.settings_rollbackConfirmMessage), findsOneWidget);
  });

  testWidgets('Rollback tasdiqlansa rollbackPrompt chaqiriladi', (tester) async {
    await pumpScreen(tester);

    await tester.tap(find.text(l10n.settings_rollback));
    await tester.pumpAndSettle();

    final dialogPrimary = find.descendant(
      of: find.byType(AppDialog),
      matching: find.text(l10n.settings_rollback),
    );
    await tester.tap(dialogPrimary);
    await tester.pumpAndSettle();

    expect(repo.rollbacks, ['h1']);
    expect(find.byType(AppDialog), findsNothing);
  });

  testWidgets('Rollback bekor qilinsa rollbackPrompt chaqirilmaydi', (tester) async {
    await pumpScreen(tester);

    await tester.tap(find.text(l10n.settings_rollback));
    await tester.pumpAndSettle();

    final dialogSecondary = find.descendant(
      of: find.byType(AppDialog),
      matching: find.text(l10n.common_cancel),
    );
    await tester.tap(dialogSecondary);
    await tester.pumpAndSettle();

    expect(repo.rollbacks, isEmpty);
    expect(find.byType(AppDialog), findsNothing);
  });
}
