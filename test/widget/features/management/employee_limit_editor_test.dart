import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_theme.dart';
import 'package:alora_mobile/features/management/application/providers.dart';
import 'package:alora_mobile/features/management/domain/entities/usage_limit.dart';
import 'package:alora_mobile/features/management/presentation/widgets/employee_limit_editor.dart';

import '../../../helpers/fake_team_repository.dart';
import '../../../helpers/fake_usage_repository.dart';

Future<void> _pumpEditor(
  WidgetTester tester, {
  required FakeTeamRepository teamRepository,
  FakeUsageRepository? usageRepository,
  UsageLimit? initialLimit,
}) async {
  final usage = usageRepository ?? FakeUsageRepository();
  final container = ProviderContainer(
    overrides: [
      teamRepositoryProvider.overrideWithValue(teamRepository),
      usageRepositoryProvider.overrideWithValue(usage),
    ],
  );
  addTearDown(container.dispose);

  await tester.pumpWidget(
    UncontrolledProviderScope(
      container: container,
      child: MaterialApp(
        theme: AppTheme.light(),
        locale: const Locale('uz'),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: EmployeeLimitEditor(
              employeeId: 'employee-1',
              initialLimit: initialLimit,
            ),
          ),
        ),
      ),
    ),
  );
}

void main() {
  late FakeTeamRepository teamRepository;

  setUp(() {
    teamRepository = FakeTeamRepository();
    teamRepository.employeeResult = testEmployee(id: 'employee-1');
    teamRepository.setLimitResult = testUsageLimit(id: 'limit-1');
  });

  Future<void> tapSave(WidgetTester tester) async {
    await tester.ensureVisible(find.text('Limitni saqlash'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Limitni saqlash'));
    await tester.pumpAndSettle();
  }

  testWidgets('limit yo\'q bo\'lsa default Cheksiz: save faqat is_unlimited true yuboradi',
      (tester) async {
    await _pumpEditor(tester, teamRepository: teamRepository);
    await tester.pumpAndSettle();

    expect(tester.widget<Switch>(find.byType(Switch)).value, isTrue);
    expect(find.byType(TextField), findsNothing);

    await tapSave(tester);

    expect(teamRepository.setLimits, hasLength(1));
    expect(teamRepository.setLimits.single.body, {'is_unlimited': true});
  });

  testWidgets('cheksizdan chiqib faqat token to\'ldirilsa faqat uning maydoni bor', (tester) async {
    await _pumpEditor(tester, teamRepository: teamRepository);
    await tester.pumpAndSettle();

    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();
    expect(find.byType(TextField), findsNWidgets(3));

    await tester.enterText(find.byType(TextField).at(0), '300');
    await tapSave(tester);

    final body = teamRepository.setLimits.single.body;
    expect(body['is_unlimited'], isFalse);
    expect(body['max_tokens'], 300);
    expect(body.containsKey('max_cost_uzs'), isFalse);
    expect(body.containsKey('max_messages'), isFalse);
  });

  testWidgets('0 va bo\'sh maydonlar body\'ga tushmaydi (backend: 0 = cheklov yo\'q)',
      (tester) async {
    await _pumpEditor(tester, teamRepository: teamRepository);
    await tester.pumpAndSettle();

    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).at(0), '0');
    await tester.enterText(find.byType(TextField).at(2), '0');
    await tapSave(tester);

    // Hech qanday ijobiy qiymat yo'q — "cheklov yo'q" (is_unlimited: true) yuboriladi.
    expect(teamRepository.setLimits.single.body, {'is_unlimited': true});
  });

  testWidgets('barcha maydonlar to\'ldirilsa to\'liq body yuboriladi (max_cost_uzs string)',
      (tester) async {
    await _pumpEditor(tester, teamRepository: teamRepository);
    await tester.pumpAndSettle();

    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).at(0), '1000');
    await tester.enterText(find.byType(TextField).at(1), '500000');
    await tester.enterText(find.byType(TextField).at(2), '50');
    await tapSave(tester);

    final body = teamRepository.setLimits.single.body;
    expect(body['is_unlimited'], isFalse);
    expect(body['max_tokens'], 1000);
    expect(body['max_cost_uzs'], '500000.00');
    expect(body['max_messages'], 50);
    expect(body['period'], 'daily');
  });

  testWidgets('backend 0 (cheklovsiz) qaytarsa form Cheksiz holatida ochiladi', (tester) async {
    await _pumpEditor(
      tester,
      teamRepository: teamRepository,
      initialLimit: testUsageLimit(id: 'limit-1', isUnlimited: false, maxCostUzs: '0.00'),
    );
    await tester.pumpAndSettle();

    expect(tester.widget<Switch>(find.byType(Switch)).value, isTrue);
    expect(find.byType(TextField), findsNothing);

    await tapSave(tester);

    expect(teamRepository.setLimits.single.body, {'is_unlimited': true});
  });
}