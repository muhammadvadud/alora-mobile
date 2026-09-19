import '../../domain/entities/model_pricing.dart';
import '../../domain/entities/prompt_version.dart';
import '../dto/model_pricing_dto.dart';
import '../dto/prompt_version_dto.dart';

extension PromptVersionDtoMapper on PromptVersionDto {
  PromptVersion toEntity() {
    return PromptVersion(
      id: id,
      version: version,
      content: content,
      authorId: author,
      authorName: authorName,
      isCurrent: isCurrent,
      createdAt: createdAt,
    );
  }
}

extension PromptHistoryDtoMapper on PromptHistoryDto {
  PromptHistory toEntity() {
    return PromptHistory(
      current: current?.toEntity(),
      history: history.map((e) => e.toEntity()).toList(),
    );
  }
}

extension ModelPricingDtoMapper on ModelPricingDto {
  ModelPricing toEntity() {
    return ModelPricing(
      id: id,
      provider: provider,
      model: model,
      inputPer1m: inputPer1m,
      outputPer1m: outputPer1m,
      cachedInputPer1m: cachedInputPer1m,
      sttPerMinute: sttPerMinute,
      ttsPer1kChars: ttsPer1kChars,
      usdToUzs: usdToUzs,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
