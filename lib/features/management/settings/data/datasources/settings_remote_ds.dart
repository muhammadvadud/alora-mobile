import 'package:dio/dio.dart';

import '../../../../../core/network/api_paths.dart';
import '../dto/model_pricing_dto.dart';
import '../dto/prompt_version_dto.dart';

abstract class SettingsRemoteDataSource {
  Future<PromptHistoryDto> getPromptHistory();
  Future<PromptVersionDto> createPrompt(String content);
  Future<PromptVersionDto> rollbackPrompt(String versionId);

  Future<List<ModelPricingDto>> getModelPricings();
  Future<ModelPricingDto> createModelPricing(Map<String, dynamic> body);
  Future<ModelPricingDto> updateModelPricing(String id, Map<String, dynamic> body);
  Future<void> deleteModelPricing(String id);
}

class SettingsRemoteDataSourceImpl implements SettingsRemoteDataSource {
  final Dio dio;

  SettingsRemoteDataSourceImpl(this.dio);

  @override
  Future<PromptHistoryDto> getPromptHistory() async {
    final response = await dio.get<Map<String, dynamic>>(ApiPaths.settingsPrompt);
    return PromptHistoryDto.fromJson(response.data!);
  }

  @override
  Future<PromptVersionDto> createPrompt(String content) async {
    final response = await dio.post<Map<String, dynamic>>(
      ApiPaths.settingsPrompt,
      data: {'content': content},
    );
    return PromptVersionDto.fromJson(response.data!);
  }

  @override
  Future<PromptVersionDto> rollbackPrompt(String versionId) async {
    final response = await dio.post<Map<String, dynamic>>(
      ApiPaths.settingsPromptRollback(versionId),
    );
    return PromptVersionDto.fromJson(response.data!);
  }

  @override
  Future<List<ModelPricingDto>> getModelPricings() async {
    final response = await dio.get<dynamic>(ApiPaths.modelPricings);
    final data = response.data;
    final list = data is Map<String, dynamic> ? data['results'] : data;
    if (list is! List) return const [];
    return list.whereType<Map<String, dynamic>>().map(ModelPricingDto.fromJson).toList();
  }

  @override
  Future<ModelPricingDto> createModelPricing(Map<String, dynamic> body) async {
    final response = await dio.post<Map<String, dynamic>>(ApiPaths.modelPricings, data: body);
    return ModelPricingDto.fromJson(response.data!);
  }

  @override
  Future<ModelPricingDto> updateModelPricing(String id, Map<String, dynamic> body) async {
    final response = await dio.patch<Map<String, dynamic>>(
      '${ApiPaths.modelPricings}$id/',
      data: body,
    );
    return ModelPricingDto.fromJson(response.data!);
  }

  @override
  Future<void> deleteModelPricing(String id) async {
    await dio.delete<dynamic>('${ApiPaths.modelPricings}$id/');
  }
}
