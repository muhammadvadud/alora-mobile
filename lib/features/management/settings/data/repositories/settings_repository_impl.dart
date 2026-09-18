import '../../domain/entities/model_pricing.dart';
import '../../domain/entities/prompt_version.dart';
import '../../domain/repositories/settings_repository.dart';
import '../datasources/settings_remote_ds.dart';
import '../mappers/settings_mapper.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsRemoteDataSource remoteDataSource;

  SettingsRepositoryImpl(this.remoteDataSource);

  @override
  Future<PromptHistory> getPromptHistory() async {
    final dto = await remoteDataSource.getPromptHistory();
    return dto.toEntity();
  }

  @override
  Future<PromptVersion> createPrompt(String content) async {
    final dto = await remoteDataSource.createPrompt(content);
    return dto.toEntity();
  }

  @override
  Future<PromptVersion> rollbackPrompt(String versionId) async {
    final dto = await remoteDataSource.rollbackPrompt(versionId);
    return dto.toEntity();
  }

  @override
  Future<List<ModelPricing>> getModelPricings() async {
    final dtos = await remoteDataSource.getModelPricings();
    return dtos.map((e) => e.toEntity()).toList();
  }

  @override
  Future<ModelPricing> createModelPricing(Map<String, dynamic> body) async {
    final dto = await remoteDataSource.createModelPricing(body);
    return dto.toEntity();
  }

  @override
  Future<ModelPricing> updateModelPricing(
    String id,
    Map<String, dynamic> body,
  ) async {
    final dto = await remoteDataSource.updateModelPricing(id, body);
    return dto.toEntity();
  }

  @override
  Future<void> deleteModelPricing(String id) async {
    await remoteDataSource.deleteModelPricing(id);
  }
}
