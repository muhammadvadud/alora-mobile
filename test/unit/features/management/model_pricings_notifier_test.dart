import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/features/management/settings/application/settings_notifiers.dart';
import 'package:alora_mobile/features/management/settings/application/providers.dart';
import 'package:alora_mobile/features/management/settings/domain/repositories/settings_repository.dart';
import 'package:alora_mobile/features/management/settings/domain/entities/prompt_version.dart';
import 'package:alora_mobile/features/management/settings/domain/entities/model_pricing.dart';

class MockSettingsRepository implements SettingsRepository {
  List<ModelPricing> models = [];

  @override
  Future<PromptVersion> createPrompt(String content) async =>
      throw UnimplementedError();

  @override
  Future<PromptHistory> getPromptHistory() async => throw UnimplementedError();

  @override
  Future<PromptVersion> rollbackPrompt(String versionId) async =>
      throw UnimplementedError();

  @override
  Future<ModelPricing> createModelPricing(Map<String, dynamic> body) async {
    final m = ModelPricing(
      id: '1',
      provider: body['provider'] as String,
      model: body['model'] as String,
      inputPer1m: 1,
      outputPer1m: 1,
      cachedInputPer1m: 1,
      sttPerMinute: 1,
      ttsPer1kChars: 1,
      usdToUzs: 1,
    );
    models.add(m);
    return m;
  }

  @override
  Future<void> deleteModelPricing(String id) async {
    models.removeWhere((e) => e.id == id);
  }

  @override
  Future<List<ModelPricing>> getModelPricings() async {
    return models;
  }

  @override
  Future<ModelPricing> updateModelPricing(
    String id,
    Map<String, dynamic> body,
  ) async {
    final idx = models.indexWhere((e) => e.id == id);
    if (idx >= 0) {
      models[idx] = ModelPricing(
        id: id,
        provider: body['provider'] as String? ?? models[idx].provider,
        model: body['model'] as String? ?? models[idx].model,
        inputPer1m: 1,
        outputPer1m: 1,
        cachedInputPer1m: 1,
        sttPerMinute: 1,
        ttsPer1kChars: 1,
        usdToUzs: 1,
      );
    }
    return models[idx];
  }
}

void main() {
  test('ModelPricingsNotifier CRUD', () async {
    final container = ProviderContainer(
      overrides: [
        settingsRepositoryProvider.overrideWithValue(MockSettingsRepository()),
      ],
    );
    final notifier = container.read(modelPricingsProvider.notifier);

    await container.read(modelPricingsProvider.future);
    expect(container.read(modelPricingsProvider).value?.length, 0);

    await notifier.create({'provider': 'OpenAI', 'model': 'gpt-4'});
    expect(container.read(modelPricingsProvider).value?.length, 1);

    await notifier.updatePricing('1', {'model': 'gpt-4-turbo'});
    expect(
      container.read(modelPricingsProvider).value?.first.model,
      'gpt-4-turbo',
    );

    await notifier.deletePricing('1');
    expect(container.read(modelPricingsProvider).value?.length, 0);
  });
}
