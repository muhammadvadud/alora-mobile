import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'providers.dart';
import '../domain/entities/prompt_version.dart';
import '../domain/entities/model_pricing.dart';

part 'settings_notifiers.g.dart';

@riverpod
class PromptHistoryNotifier extends _$PromptHistoryNotifier {
  @override
  FutureOr<PromptHistory> build() async {
    final repo = ref.watch(settingsRepositoryProvider);
    return repo.getPromptHistory();
  }

  Future<void> createPrompt(String content) async {
    state = const AsyncValue.loading();
    try {
      final repo = ref.read(settingsRepositoryProvider);
      await repo.createPrompt(content);
      // Reload history
      final history = await repo.getPromptHistory();
      state = AsyncValue.data(history);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> rollbackPrompt(String versionId) async {
    state = const AsyncValue.loading();
    try {
      final repo = ref.read(settingsRepositoryProvider);
      await repo.rollbackPrompt(versionId);
      // Reload history
      final history = await repo.getPromptHistory();
      state = AsyncValue.data(history);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

@riverpod
class ModelPricingsNotifier extends _$ModelPricingsNotifier {
  @override
  FutureOr<List<ModelPricing>> build() async {
    final repo = ref.watch(settingsRepositoryProvider);
    return repo.getModelPricings();
  }

  Future<void> create(Map<String, dynamic> body) async {
    state = const AsyncValue.loading();
    try {
      final repo = ref.read(settingsRepositoryProvider);
      await repo.createModelPricing(body);
      final list = await repo.getModelPricings();
      state = AsyncValue.data(list);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updatePricing(String id, Map<String, dynamic> body) async {
    state = const AsyncValue.loading();
    try {
      final repo = ref.read(settingsRepositoryProvider);
      await repo.updateModelPricing(id, body);
      final list = await repo.getModelPricings();
      state = AsyncValue.data(list);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> deletePricing(String id) async {
    state = const AsyncValue.loading();
    try {
      final repo = ref.read(settingsRepositoryProvider);
      await repo.deleteModelPricing(id);
      final list = await repo.getModelPricings();
      state = AsyncValue.data(list);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
