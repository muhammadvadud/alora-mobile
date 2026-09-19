import 'package:freezed_annotation/freezed_annotation.dart';

part 'pricing_option.freezed.dart';

enum PricingTier { cheap, mid, premium, unknown }

@freezed
abstract class PricingOptionLine with _$PricingOptionLine {
  const factory PricingOptionLine({required String title, required String value}) =
      _PricingOptionLine;
}

@freezed
abstract class PricingOption with _$PricingOption {
  const factory PricingOption({
    required PricingTier tier,
    required String title,
    required int total,
    required List<PricingOptionLine> lines,
    int? difference,
  }) = _PricingOption;
}

@freezed
abstract class PricingOptions with _$PricingOptions {
  const factory PricingOptions({required List<PricingOption> options}) = _PricingOptions;
}
