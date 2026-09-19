import 'package:alora_mobile/features/management/knowledge/application/providers.dart';
import 'package:alora_mobile/features/management/knowledge/domain/entities/knowledge_rule.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'knowledge_notifier.freezed.dart';
part 'knowledge_notifier.g.dart';

@freezed
abstract class KnowledgeState with _$KnowledgeState {
  const factory KnowledgeState({
    @Default([]) List<KnowledgeRule> rules,
    @Default(false) bool isLoading,
    String? error,
  }) = _KnowledgeState;
}

@riverpod
class KnowledgeNotifier extends _$KnowledgeNotifier {
  @override
  KnowledgeState build() {
    // build() ichida state'ga yozish mumkin emas — yuklash keyingi microtask'da.
    Future.microtask(loadData);
    return const KnowledgeState(isLoading: true);
  }

  Future<void> loadData() async {
    if (!ref.mounted) return;
    state = state.copyWith(isLoading: true, error: null);
    try {
      final repo = ref.read(knowledgeRepositoryProvider);
      final rules = await repo.getRules();
      if (!ref.mounted) return;
      state = state.copyWith(isLoading: false, rules: rules);
    } catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> createRule(
    String kind,
    List<String> condition,
    String recommendation,
    int priority,
    bool isActive,
  ) async {
    try {
      final repo = ref.read(knowledgeRepositoryProvider);
      final newRule = await repo.createRule(
        kind,
        condition,
        recommendation,
        priority,
        isActive,
      );
      state = state.copyWith(rules: [...state.rules, newRule]);
    } catch (e) {
      state = state.copyWith(error: e.toString());
      rethrow;
    }
  }

  Future<void> updateRule(String id, Map<String, dynamic> updates) async {
    try {
      final repo = ref.read(knowledgeRepositoryProvider);
      final updatedRule = await repo.patchRule(id, updates);
      state = state.copyWith(
        rules: state.rules.map((r) => r.id == id ? updatedRule : r).toList(),
      );
    } catch (e) {
      state = state.copyWith(error: e.toString());
      rethrow;
    }
  }

  Future<void> deleteRule(String id) async {
    try {
      final repo = ref.read(knowledgeRepositoryProvider);
      await repo.deleteRule(id);
      state = state.copyWith(
        rules: state.rules.where((r) => r.id != id).toList(),
      );
    } catch (e) {
      state = state.copyWith(error: e.toString());
      rethrow;
    }
  }
}
