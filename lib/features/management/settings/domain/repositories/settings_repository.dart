import '../entities/model_pricing.dart';
import '../entities/prompt_version.dart';

abstract class SettingsRepository {
  Future<PromptHistory> getPromptHistory();
  Future<PromptVersion> createPrompt(String content);
  Future<PromptVersion> rollbackPrompt(String versionId);

  Future<List<ModelPricing>> getModelPricings();
  Future<ModelPricing> createModelPricing(Map<String, dynamic> body);
  Future<ModelPricing> updateModelPricing(String id, Map<String, dynamic> body);
  Future<void> deleteModelPricing(String id);
}
