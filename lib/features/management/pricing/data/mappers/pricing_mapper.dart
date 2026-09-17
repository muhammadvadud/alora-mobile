import 'package:alora_mobile/features/management/pricing/data/dto/calc_rule_dto.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/calc_rule.dart';
import 'package:alora_mobile/features/management/pricing/data/dto/service_price_dto.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/service_price.dart';
import 'package:alora_mobile/features/management/pricing/data/dto/discount_tier_dto.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/discount_tier.dart';
import 'package:alora_mobile/features/management/pricing/data/dto/discount_policy_dto.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/discount_policy.dart';
import 'package:alora_mobile/features/management/pricing/data/dto/order_defaults_dto.dart';
import 'package:alora_mobile/features/management/pricing/domain/entities/order_defaults.dart';
import 'package:alora_mobile/features/management/pricing/data/dto/calc_preview_dto.dart';
import 'package:alora_mobile/features/chat/domain/entities/quote.dart';

class PricingMapper {
  static CalcRule toCalcRule(CalcRuleDto dto) {
    return CalcRule(
      id: dto.id,
      key: dto.key,
      value: double.tryParse(dto.value) ?? 0.0,
      unit: dto.unit,
      description: dto.description,
      appliesTo: dto.appliesTo,
      isActive: dto.isActive,
      createdAt: DateTime.parse(dto.createdAt).toLocal(),
      updatedAt: DateTime.parse(dto.updatedAt).toLocal(),
    );
  }

  static ServicePrice toServicePrice(ServicePriceDto dto) {
    return ServicePrice(
      id: dto.id,
      key: dto.key,
      name: dto.name,
      price: double.tryParse(dto.price)?.toInt() ?? 0,
      unit: dto.unit,
      isActive: dto.isActive,
      createdAt: DateTime.parse(dto.createdAt).toLocal(),
      updatedAt: DateTime.parse(dto.updatedAt).toLocal(),
    );
  }

  static DiscountTier toDiscountTier(DiscountTierDto dto) {
    return DiscountTier(
      id: dto.id,
      minAmount: double.tryParse(dto.minAmount)?.toInt() ?? 0,
      percent: double.tryParse(dto.percent) ?? 0.0,
      isActive: dto.isActive,
      createdAt: DateTime.parse(dto.createdAt).toLocal(),
      updatedAt: DateTime.parse(dto.updatedAt).toLocal(),
    );
  }

  static DiscountPolicy toDiscountPolicy(DiscountPolicyDto dto) {
    return DiscountPolicy(
      id: dto.id,
      manualMaxPercentEmployee:
          double.tryParse(dto.manualMaxPercentEmployee) ?? 0.0,
      manualMaxPercentManager:
          double.tryParse(dto.manualMaxPercentManager) ?? 0.0,
      isActive: dto.isActive,
      createdAt: DateTime.parse(dto.createdAt).toLocal(),
      updatedAt: DateTime.parse(dto.updatedAt).toLocal(),
    );
  }

  static OrderDefaults toOrderDefaults(OrderDefaultsDto dto) {
    return OrderDefaults(
      id: dto.id,
      defaultPrepaymentPercent:
          double.tryParse(dto.defaultPrepaymentPercent) ?? 0.0,
      defaultDeliveryAmount:
          double.tryParse(dto.defaultDeliveryAmount)?.toInt() ?? 0,
      isActive: dto.isActive,
      createdAt: DateTime.parse(dto.createdAt).toLocal(),
      updatedAt: DateTime.parse(dto.updatedAt).toLocal(),
    );
  }

  static Quote toQuote(CalcPreviewResponseDto dto) {
    final fabrics = <QuoteFabric>[];
    final accessories = <QuoteAccessory>[];

    for (final m in dto.measurements) {
      for (final p in m.parts) {
        fabrics.add(
          QuoteFabric(
            role: p.role,
            variantId: p.variantId,
            colorName: p.colorName,
            colorHex:
                '', // Color hex is not present in CalcPreviewResponsePartDto
            widthM: double.tryParse(p.widthM) ?? 0.0,
            heightM: double.tryParse(p.heightM) ?? 0.0,
            coef: double.tryParse(p.coef) ?? 0.0,
            areaSqm: double.tryParse(p.areaSqm) ?? 0.0,
            pricePerSqm: double.tryParse(p.pricePerSqm)?.toInt() ?? 0,
            total: double.tryParse(p.total)?.toInt() ?? 0,
          ),
        );
      }
      for (final a in m.accessories) {
        accessories.add(
          QuoteAccessory(
            name: a.colorName.isNotEmpty ? a.colorName : a.variantId,
            qty: double.tryParse(a.qty) ?? 0.0,
            unit: 'dona',
            unitPrice: double.tryParse(a.unitPrice)?.toInt() ?? 0,
            total: double.tryParse(a.total)?.toInt() ?? 0,
          ),
        );
      }
    }

    final services = dto.services
        .map(
          (s) => QuoteService(
            name: s.name,
            total: double.tryParse(s.total)?.toInt() ?? 0,
          ),
        )
        .toList();

    return Quote(
      fabrics: fabrics,
      accessories: accessories,
      services: services,
      wasteWarnings: dto.warnings,
      formula: '', // No formula provided in preview
      subtotal: double.tryParse(dto.subtotal)?.toInt() ?? 0,
      discount: double.tryParse(dto.discountAmount)?.toInt() ?? 0,
      delivery: double.tryParse(dto.deliveryAmount)?.toInt() ?? 0,
      total: double.tryParse(dto.total)?.toInt() ?? 0,
    );
  }
}
