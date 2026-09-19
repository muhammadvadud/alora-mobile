import 'package:flutter_test/flutter_test.dart';

import 'package:alora_mobile/features/management/pricing/data/dto/calc_preview_dto.dart';
import 'package:alora_mobile/features/management/pricing/data/dto/calc_rule_dto.dart';
import 'package:alora_mobile/features/management/pricing/data/dto/discount_policy_dto.dart';
import 'package:alora_mobile/features/management/pricing/data/dto/discount_tier_dto.dart';
import 'package:alora_mobile/features/management/pricing/data/dto/order_defaults_dto.dart';
import 'package:alora_mobile/features/management/pricing/data/dto/service_price_dto.dart';
import 'package:alora_mobile/features/management/pricing/data/mappers/pricing_mapper.dart';

const _ts = '2026-09-01T10:00:00Z';

Map<String, dynamic> _base() => {
  'id': 'x1',
  'is_active': true,
  'created_at': _ts,
  'updated_at': _ts,
};

void main() {
  group('PricingMapper — DTO → entity (§9.3: pul int, koeffitsient double)', () {
    test('CalcRule: value string → double, sana lokal', () {
      final dto = CalcRuleDto.fromJson({
        ..._base(),
        'key': 'default_coef',
        'value': '2.500',
        'unit': 'x',
        'description': 'Standart burma koeffitsienti',
        'applies_to': 'fabric',
      });
      final rule = PricingMapper.toCalcRule(dto);
      expect(rule.key, 'default_coef');
      expect(rule.value, 2.5);
      expect(rule.description, 'Standart burma koeffitsienti');
      expect(rule.createdAt, DateTime.parse(_ts).toLocal());
    });

    test('ServicePrice: "150000.00" → 150000 (int)', () {
      final dto = ServicePriceDto.fromJson({
        ..._base(),
        'key': 'sewing',
        'name': 'Tikuv',
        'price': '150000.00',
        'unit': 'per_meter',
      });
      expect(PricingMapper.toServicePrice(dto).price, 150000);
    });

    test('DiscountTier: min_amount int, percent double', () {
      final dto = DiscountTierDto.fromJson({
        ..._base(),
        'min_amount': '5000000.00',
        'percent': '3.00',
      });
      final tier = PricingMapper.toDiscountTier(dto);
      expect(tier.minAmount, 5000000);
      expect(tier.percent, 3.0);
    });

    test('DiscountPolicy: employee/manager chegaralari API\'dan (§5)', () {
      final dto = DiscountPolicyDto.fromJson({
        ..._base(),
        'manual_max_percent_employee': '5.00',
        'manual_max_percent_manager': '15.00',
        'stack_with_tier': false,
      });
      final p = PricingMapper.toDiscountPolicy(dto);
      expect(p.manualMaxPercentEmployee, 5.0);
      expect(p.manualMaxPercentManager, 15.0);
      expect(p.stackWithTier, isFalse);
    });

    test('OrderDefaults: avans %, yetkazish summasi, muddat kun', () {
      final dto = OrderDefaultsDto.fromJson({
        ..._base(),
        'prepayment_percent': '50.00',
        'delivery_amount': '80000.00',
        'deadline_days': 14,
      });
      final d = PricingMapper.toOrderDefaults(dto);
      expect(d.defaultPrepaymentPercent, 50.0);
      expect(d.defaultDeliveryAmount, 80000);
      expect(d.deadlineDays, 14);
    });

    test('buzilgan raqam string → 0 (ilova yiqilmaydi)', () {
      final dto = ServicePriceDto.fromJson({
        ..._base(),
        'key': 'k',
        'name': 'n',
        'price': 'abc',
        'unit': 'u',
      });
      expect(PricingMapper.toServicePrice(dto).price, 0);
    });
  });

  group('PricingMapper.toQuote (calc/preview → Quote, 3 guruh)', () {
    test('fabrics/accessories/services taqsimlanadi; jami backend total', () {
      final dto = CalcPreviewResponseDto.fromJson({
        'measurements': [
          {
            'room_name': 'Mehmonxona',
            'parts': [
              {
                'role': 'portyera',
                'variant_id': 'v1',
                'color_name': 'Zumrad',
                'width_m': '7.500',
                'height_m': '2.700',
                'coef': '2.500',
                'area_sqm': '20.250',
                'price_per_sqm': '120000.00',
                'total': '2430000.00',
              },
            ],
            'accessories': [
              {
                'variant_id': 'acc-1',
                'color_name': 'Gul',
                'qty': '2.0',
                'unit_price': '45000.00',
                'total': '90000.00',
              },
            ],
          },
        ],
        'services': [
          {'key': 'sewing', 'name': 'Tikuv', 'total': '125000.00'},
        ],
        'subtotal': '2645000.00',
        'tier_discount_percent': '0.00',
        'manual_discount_percent': '0.00',
        'discount_percent': '0.00',
        'discount_amount': '0.00',
        'delivery_amount': '80000.00',
        'total': '2725000.00',
        'warnings': ['REF-KANT uchun chiqindi 33% dan oshdi'],
      });

      final quote = PricingMapper.toQuote(dto);

      expect(quote.fabrics, hasLength(1));
      expect(quote.fabrics.single.total, 2430000);
      expect(quote.fabrics.single.pricePerSqm, 120000);
      expect(quote.fabrics.single.areaSqm, 20.25);
      expect(quote.accessories.single.name, 'Gul');
      expect(quote.accessories.single.qty, 2.0);
      expect(quote.accessories.single.total, 90000);
      expect(quote.services.single.name, 'Tikuv');
      expect(quote.services.single.total, 125000);
      expect(quote.wasteWarnings, hasLength(1));
      expect(quote.subtotal, 2645000);
      expect(quote.delivery, 80000);
      expect(quote.total, 2725000);
      // §0.8: ilova hisoblamaydi — faqat ko'rsatish yig'indisi backend bilan mos
      final shown =
          quote.fabrics.fold<int>(0, (s, f) => s + f.total) +
          quote.accessories.fold<int>(0, (s, a) => s + a.total) +
          quote.services.fold<int>(0, (s, x) => s + x.total);
      expect(shown, quote.subtotal);
    });

    test('rang nomi bo\'sh aksessuar uchun variant_id ishlatiladi', () {
      final dto = CalcPreviewResponseDto.fromJson({
        'measurements': [
          {
            'room_name': 'X',
            'parts': <Map<String, dynamic>>[],
            'accessories': [
              {
                'variant_id': 'acc-9',
                'color_name': '',
                'qty': '1',
                'unit_price': '1',
                'total': '1',
              },
            ],
          },
        ],
        'services': <Map<String, dynamic>>[],
        'subtotal': '1',
        'tier_discount_percent': '0',
        'manual_discount_percent': '0',
        'discount_percent': '0',
        'discount_amount': '0',
        'delivery_amount': '0',
        'total': '1',
        'warnings': <String>[],
      });
      expect(PricingMapper.toQuote(dto).accessories.single.name, 'acc-9');
    });
  });
}
