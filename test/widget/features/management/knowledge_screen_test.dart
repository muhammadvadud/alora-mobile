import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alora_mobile/features/management/knowledge/application/knowledge_repository.dart';
import 'package:alora_mobile/features/management/knowledge/domain/entities/knowledge_rule.dart';
import 'package:alora_mobile/features/management/knowledge/presentation/screens/knowledge_screen.dart';
import 'package:alora_mobile/shared/widgets/empty_state.dart';
import 'package:alora_mobile/shared/widgets/error_state.dart';
import 'package:alora_mobile/shared/widgets/skeleton.dart';

import '../../../helpers/pump_app.dart';

/// Repository o'rnini bosuvchi — [rulesCompleter] tugamaguncha yuklanish holati.
class _FakeKnowledgeRepository implements KnowledgeRepository {
  _FakeKnowledgeRepository({this.error});

  final Completer<List<KnowledgeRule>> rulesCompleter = Completer();
  final Object? error;

  @override
  Future<List<KnowledgeRule>> getRules() {
    if (error != null) return Future.error(error!);
    return rulesCompleter.future;
  }

  @override
  Future<KnowledgeRule> createRule(
    String kind,
    List<String> condition,
    String recommendation,
    int priority,
    bool isActive,
  ) => throw UnimplementedError();

  @override
  Future<KnowledgeRule> patchRule(String id, Map<String, dynamic> updates) =>
      throw UnimplementedError();

  @override
  Future<void> deleteRule(String id) => throw UnimplementedError();
}

KnowledgeRule _rule() => KnowledgeRule(
  id: 'r1',
  kind: 'style',
  condition: const ['mehmonxona', 'hi-tech'],
  recommendation: 'Sokin ohangdagi zig\'ir matolar',
  priority: 10,
  isActive: true,
  createdAt: DateTime.utc(2026, 9, 1),
  updatedAt: DateTime.utc(2026, 9, 1),
);

Widget _app(_FakeKnowledgeRepository repo) {
  return ProviderScope(
    overrides: [knowledgeRepositoryProvider.overrideWithValue(repo)],
    child: const KnowledgeScreen().pumpApp(),
  );
}

void main() {
  group('KnowledgeScreen (S-24)', () {
    testWidgets("yuklanayotganda skeleton ko'rsatiladi, spinner emas", (
      tester,
    ) async {
      final repo = _FakeKnowledgeRepository();
      await tester.pumpWidget(_app(repo));

      expect(find.byType(SkeletonList), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.text('Bilim qoidalari'), findsOneWidget);

      repo.rulesCompleter.complete([]);
      await tester.pumpAndSettle();
    });

    testWidgets("qoidalar kelganda kartochka shart chip'lari bilan chiqadi", (
      tester,
    ) async {
      final repo = _FakeKnowledgeRepository();
      await tester.pumpWidget(_app(repo));

      repo.rulesCompleter.complete([_rule()]);
      await tester.pumpAndSettle();

      expect(find.byType(SkeletonList), findsNothing);
      expect(find.text('mehmonxona'), findsOneWidget);
      expect(find.text('hi-tech'), findsOneWidget);
      expect(find.text('Sokin ohangdagi zig\'ir matolar'), findsOneWidget);
    });

    testWidgets("qoidalar bo'sh bo'lsa EmptyState", (tester) async {
      final repo = _FakeKnowledgeRepository();
      await tester.pumpWidget(_app(repo));

      repo.rulesCompleter.complete([]);
      await tester.pumpAndSettle();

      expect(find.byType(EmptyState), findsOneWidget);
    });

    testWidgets('xatoda ErrorState va qayta urinish', (tester) async {
      final repo = _FakeKnowledgeRepository(error: Exception('tarmoq'));
      await tester.pumpWidget(_app(repo));
      await tester.pumpAndSettle();

      expect(find.byType(ErrorState), findsOneWidget);
    });
  });
}
