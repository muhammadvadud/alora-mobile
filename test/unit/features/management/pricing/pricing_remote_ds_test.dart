import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import 'package:alora_mobile/core/network/api_paths.dart';
import 'package:alora_mobile/features/management/pricing/application/pricing_repository.dart';
import 'package:alora_mobile/features/management/pricing/data/datasources/pricing_remote_ds.dart';
import 'package:alora_mobile/features/management/pricing/data/dto/calc_preview_dto.dart';

const _ts = '2026-09-01T10:00:00Z';
Map<String, dynamic> _base(String id) => {
  'id': id,
  'is_active': true,
  'created_at': _ts,
  'updated_at': _ts,
};
Map<String, dynamic> _rule(String key, String value) => {
  ..._base('r-$key'),
  'key': key,
  'value': value,
  'unit': 'x',
  'description': '',
  'applies_to': 'fabric',
};
Map<String, dynamic> _tier(String id, String min, String pct) => {
  ..._base(id),
  'min_amount': min,
  'percent': pct,
};
Map<String, dynamic> _preview() => {
  'measurements': <Map<String, dynamic>>[],
  'services': <Map<String, dynamic>>[],
  'subtotal': '100.00',
  'tier_discount_percent': '0',
  'manual_discount_percent': '0',
  'discount_percent': '0',
  'discount_amount': '0',
  'delivery_amount': '0',
  'total': '100.00',
  'warnings': <String>[],
};

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late PricingRepository repo;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://api.example.com/api/v1/'));
    adapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    repo = PricingRepository(PricingRemoteDataSourceImpl(dio));
  });

  group('PricingRemoteDataSource + PricingRepository (ApiPaths §8.1)', () {
    test('GET calc-rules → CalcRule ro\'yxati', () async {
      adapter.onGet(
        ApiPaths.calcRules,
        (s) => s.reply(200, [_rule('default_coef', '2.5'), _rule('waste', '0.1')]),
      );
      final rules = await repo.getCalcRules();
      expect(rules.map((r) => r.key), ['default_coef', 'waste']);
      expect(rules.first.value, 2.5);
    });

    test('PATCH calc-rules/{key}/ body {value} (13.3 inline tahrir)', () async {
      adapter.onPatch(
        ApiPaths.calcRule('default_coef'),
        (s) => s.reply(200, _rule('default_coef', '3.0')),
        data: {'value': '3.0'},
      );
      final rule = await repo.patchCalcRule('default_coef', '3.0');
      expect(rule.value, 3.0);
    });

    test('GET discount-tiers — paginated ({results}) va oddiy ro\'yxat', () async {
      adapter.onGet(
        ApiPaths.discountTiers,
        (s) => s.reply(200, {
          'next': null,
          'previous': null,
          'results': [_tier('t1', '5000000.00', '3.00')],
        }),
      );
      final tiers = await repo.getDiscountTiers();
      expect(tiers.single.minAmount, 5000000);
      expect(tiers.single.percent, 3.0);
    });

    test('POST discount-tiers — min_amount/percent string sifatida', () async {
      adapter.onPost(
        ApiPaths.discountTiers,
        (s) => s.reply(201, _tier('t2', '10000000', '5.0')),
        data: {'min_amount': '10000000', 'percent': '5.0'},
      );
      final tier = await repo.createDiscountTier(10000000, 5.0);
      expect(tier.id, 't2');
    });

    test('DELETE discount-tiers/{id}/', () async {
      adapter.onDelete(ApiPaths.discountTier('t1'), (s) => s.reply(204, null));
      await expectLater(repo.deleteDiscountTier('t1'), completes);
    });

    test('GET/PATCH discount-policy', () async {
      final policy = {
        ..._base('p'),
        'manual_max_percent_employee': '5.00',
        'manual_max_percent_manager': '15.00',
        'stack_with_tier': true,
      };
      adapter.onGet(ApiPaths.discountPolicy, (s) => s.reply(200, policy));
      expect((await repo.getDiscountPolicy()).manualMaxPercentEmployee, 5.0);

      adapter.onPatch(
        ApiPaths.discountPolicy,
        (s) => s.reply(200, {...policy, 'manual_max_percent_employee': '7.0'}),
        data: {'manual_max_percent_employee': '7.0', 'manual_max_percent_manager': '15.0'},
      );
      final updated = await repo.patchDiscountPolicy(7.0, 15.0);
      expect(updated.manualMaxPercentEmployee, 7.0);
    });

    test('GET/PATCH order-defaults', () async {
      final defaults = {
        ..._base('d'),
        'prepayment_percent': '50.00',
        'delivery_amount': '80000.00',
        'deadline_days': 14,
      };
      adapter.onGet(ApiPaths.orderDefaults, (s) => s.reply(200, defaults));
      expect((await repo.getOrderDefaults()).deadlineDays, 14);

      adapter.onPatch(
        ApiPaths.orderDefaults,
        (s) => s.reply(200, {...defaults, 'deadline_days': 21}),
        data: {'prepayment_percent': '50.0', 'delivery_amount': '80000', 'deadline_days': '21'},
      );
      expect((await repo.patchOrderDefaults(50.0, 80000, 21)).deadlineDays, 21);
    });

    test('POST pricing/calc/preview/ → Quote (rules §19.2 yo\'li)', () async {
      adapter.onPost(ApiPaths.calcPreview, (s) => s.reply(200, _preview()));
      final quote = await repo.calcPreview(
        const CalcPreviewRequestDto(measurements: [], services: []),
      );
      expect(quote.total, 100);
    });

    test('GET services', () async {
      adapter.onGet(
        ApiPaths.services,
        (s) => s.reply(200, [
          {
            ..._base('s1'),
            'key': 'sewing',
            'name': 'Tikuv',
            'price': '150000.00',
            'unit': 'per_meter',
          },
        ]),
      );
      final services = await repo.getServices();
      expect(services.single.price, 150000);
    });
  });
}
