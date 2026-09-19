import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/features/management/settings/application/settings_notifiers.dart';
import 'package:alora_mobile/features/management/settings/application/providers.dart';
import 'package:alora_mobile/features/management/settings/domain/repositories/settings_repository.dart';
import 'package:alora_mobile/features/management/settings/domain/entities/prompt_version.dart';
import 'package:alora_mobile/features/management/settings/domain/entities/model_pricing.dart';

class MockSettingsRepository implements SettingsRepository {
  final history = const PromptHistory(
    current: PromptVersion(id: '1', version: 1, content: 'a', authorName: 'Admin', isCurrent: true),
    history: [],
  );

  @override
  Future<PromptVersion> createPrompt(String content) async {
    return PromptVersion(id: '2', version: 2, content: content);
  }

  @override
  Future<PromptHistory> getPromptHistory() async {
    return history;
  }

  @override
  Future<PromptVersion> rollbackPrompt(String versionId) async {
    return const PromptVersion(id: '3', version: 3, content: 'rollbacked');
  }

  @override
  Future<ModelPricing> createModelPricing(Map<String, dynamic> body) async {
    return const ModelPricing(
      id: '1',
      provider: 'a',
      model: 'b',
      inputPer1m: 1,
      outputPer1m: 1,
      cachedInputPer1m: 1,
      sttPerMinute: 1,
      ttsPer1kChars: 1,
      usdToUzs: 1,
    );
  }

  @override
  Future<void> deleteModelPricing(String id) async {}

  @override
  Future<List<ModelPricing>> getModelPricings() async {
    return [];
  }

  @override
  Future<ModelPricing> updateModelPricing(String id, Map<String, dynamic> body) async {
    return const ModelPricing(
      id: '1',
      provider: 'a',
      model: 'b',
      inputPer1m: 1,
      outputPer1m: 1,
      cachedInputPer1m: 1,
      sttPerMinute: 1,
      ttsPer1kChars: 1,
      usdToUzs: 1,
    );
  }
}

void main() {
  test('PromptHistoryNotifier create and rollback', () async {
    final container = ProviderContainer(
      overrides: [settingsRepositoryProvider.overrideWithValue(MockSettingsRepository())],
    );
    final notifier = container.read(promptHistoryProvider.notifier);

    // Initial load
    await container.read(promptHistoryProvider.future);
    expect(container.read(promptHistoryProvider).value?.current.content, 'a');

    // Create
    await notifier.createPrompt('new content');
    expect(
      container.read(promptHistoryProvider).value?.current.content,
      'a',
    ); // because mock getPromptHistory returns static

    // Rollback
    await notifier.rollbackPrompt('1');
    expect(container.read(promptHistoryProvider).hasError, false);
  });
}
