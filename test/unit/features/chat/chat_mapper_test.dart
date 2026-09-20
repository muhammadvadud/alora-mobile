import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/features/chat/data/dto/chat_dto.dart';
import 'package:alora_mobile/features/chat/data/mappers/chat_mapper.dart';
import 'package:alora_mobile/features/chat/domain/entities/message.dart';
import 'package:alora_mobile/features/chat/domain/entities/order_draft.dart';
import 'package:alora_mobile/features/chat/domain/entities/pricing_option.dart';
import 'package:alora_mobile/features/chat/domain/entities/product_ref.dart';
import 'package:alora_mobile/features/chat/domain/entities/quote.dart';

Map<String, dynamic> _fixtureCase(int index) {
  final file = File('test/helpers/fixtures/chat/calc_cases.json');
  final json = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
  final cases = json['cases'] as List;
  final expected = (cases[index] as Map<String, dynamic>)['expected'];
  return (expected as Map).cast<String, dynamic>();
}

void main() {
  group('ChatMapper.parseToolResult — product_search', () {
    test('produktlar ro\'yxati → RichBlock.products', () {
      const result = '''{"products": [
        {"id": "p1", "name": "Velvet Milano", "category": "Matolar",
         "price": "180000.00", "price_unit": "per_sqm",
         "image_url": "http://x/1.jpg", "color_hex": "#4A4A4A", "color_name": "Grafit"},
        {"id": "p2", "name": "Chiffon", "category": "Matolar",
         "price": "8000", "price_unit": "per_meter",
         "image_url": "", "color_hex": "#FFF", "color_name": "Oq"}
      ]}''';

      final block = ChatMapper.parseToolResult('product_search', result);

      expect(block, isA<RichBlock>());
      block.maybeWhen(
        products: (products) {
          expect(products, hasLength(2));
          expect(products[0], isA<ProductRef>());
          expect(products[0].name, 'Velvet Milano');
          expect(products[0].price, 180000);
          expect(products[0].priceUnit, 'per_sqm');
          expect(products[0].colorHex, '#4A4A4A');
          expect(products[1].price, 8000);
        },
        orElse: () => fail('product_search → products block bo\'lishi kerak'),
      );
    });

    test('`products` kaliti yo\'q — chip "Natija" holatida', () {
      const result = '{"items": []}';
      final block = ChatMapper.parseToolResult('product_search', result);
      block.maybeWhen(
        toolChip: (tool, state, _, _, _) {
          expect(tool, 'product_search');
          expect(state, ToolChipState.done);
        },
        orElse: () => fail('Xato holat → toolChip bo\'lishi kerak'),
      );
    });
  });

  group('ChatMapper.parseToolResult — curtain_calculate (Quote)', () {
    test('3 guruh to\'g\'ri taqsimlanadi: mato, bezak, xizmat', () {
      const result = '''
      {
        "measurements": [
          {
            "length": "4.500", "height": "2.900",
            "parts": [
              {"role": "portyera", "variant_id": "v1", "color_name": "Grafit",
               "color_hex": "#4A4A4A", "width_m": "4.500", "height_m": "2.900",
               "coef": "2.500", "area_m2": "34.900", "price_unit": "per_sqm",
               "unit_price": "25000.00", "line_total": "872500.00"}
            ],
            "accessories": [
              {"sku": "REF-GUL", "qty": "2", "price_unit": "per_piece",
               "unit_price": "15000.00", "line_total": "30000.00"}
            ]
          }
        ],
        "services": [
          {"key": "sewing", "name": "Tikuv", "qty": "68.600",
           "price_unit": "per_sqm", "unit_price": "12500.00", "line_total": "857500.00"}
        ],
        "subtotal": "1760000.00",
        "discount_amount": "0.00", "delivery_amount": "0.00",
        "total": "1760000.00",
        "warnings": ["Kant bo'lagida chiqindi 22%"]
      }''';

      final block = ChatMapper.parseToolResult('curtain_calculate', result);

      block.maybeWhen(
        quote: (Quote quote) {
          expect(quote.fabrics, hasLength(1));
          expect(quote.fabrics[0].role, 'portyera');
          expect(quote.fabrics[0].colorName, 'Grafit');
          expect(quote.fabrics[0].areaSqm, 34.9);
          expect(quote.fabrics[0].pricePerSqm, 25000);
          expect(quote.fabrics[0].total, 872500);

          expect(quote.accessories, hasLength(1));
          expect(quote.accessories[0].name, 'REF-GUL');
          expect(quote.accessories[0].qty, 2.0);
          expect(quote.accessories[0].total, 30000);

          expect(quote.services, hasLength(1));
          expect(quote.services[0].name, 'Tikuv');
          expect(quote.services[0].total, 857500);

          expect(quote.wasteWarnings, ['Kant bo\'lagida chiqindi 22%']);
          expect(quote.subtotal, 1760000);
          expect(quote.total, 1760000);
          expect(quote.formula, isNotEmpty);
          expect(quote.measurement?.cornice, 4.5);
          expect(quote.measurement?.height, 2.9);
          expect(quote.measurement?.coef, 2.5);
        },
        orElse: () => fail('curtain_calculate → QuoteBlock bo\'lishi kerak'),
      );
    });

    test('wasteWarnings bo\'sh bo\'lsa ham Quote qaytadi', () {
      const result = '''
      {"measurements": [{"length": "3.000", "height": "2.500",
          "parts": [{"role": "portyera", "variant_id": "v1", "width_m": "3.0",
            "height_m": "2.5", "coef": "2.5", "area_m2": "20.3",
            "unit_price": "25000.00", "line_total": "507500.00"}],
          "accessories": []}],
       "services": [], "subtotal": "507500.00",
       "discount_amount": "0.00", "delivery_amount": "0.00",
       "total": "508000.00", "warnings": []}''';

      final block = ChatMapper.parseToolResult('curtain_calculate', result);
      block.maybeWhen(
        quote: (q) {
          expect(q.wasteWarnings, isEmpty);
          expect(q.fabrics, hasLength(1));
        },
        orElse: () => fail('Kutilgan: QuoteBlock'),
      );
    });
  });

  group('ChatMapper.parseToolResult — price_quote (Quote yoki Options)', () {
    test('options kaliti bo\'lmasa → Quote parse qilinadi', () {
      const result = '''
      {"measurements": [{"length": "3.000", "height": "2.500",
          "parts": [{"role": "portyera", "variant_id": "v1", "width_m": "3.0",
            "height_m": "2.5", "coef": "2.5", "area_m2": "20.3",
            "unit_price": "25000.00", "line_total": "507500.00"}],
          "accessories": []}],
       "services": [], "subtotal": "507500.00",
       "discount_amount": "0.00", "delivery_amount": "0.00",
       "total": "508000.00", "warnings": []}''';

      final block = ChatMapper.parseToolResult('price_quote', result);
      expect(block.maybeMap(quote: (_) => true, orElse: () => false), isTrue);
    });

    test('options kaliti bo\'lsa → OptionsCard (3 tier)', () {
      const result = '''
      {"options": [
        {"tier": "cheap", "title": "Econom", "total": "1500000",
         "difference": "-300000",
         "lines": [{"title": "Mato", "value": "Velvet"}]},
        {"tier": "mid", "title": "Optimal", "total": "1800000",
         "difference": 0,
         "lines": [{"title": "Mato", "value": "Velvet"}, {"title": "Tikuv", "value": "Bor"}]},
        {"tier": "premium", "title": "Premium", "total": "2500000",
         "difference": "700000",
         "lines": [{"title": "Mato", "value": "Premium"}]}
      ]}''';

      final block = ChatMapper.parseToolResult('price_quote', result);

      block.maybeWhen(
        options: (PricingOptions options) {
          expect(options.options, hasLength(3));
          expect(options.options[0].tier, PricingTier.cheap);
          expect(options.options[1].tier, PricingTier.mid);
          expect(options.options[2].tier, PricingTier.premium);
          expect(options.options[1].lines, hasLength(2));
          expect(options.options[1].total, 1800000);
          expect(options.options[0].difference, -300000);
        },
        orElse: () => fail('price_quote options → OptionsBlock bo\'lishi kerak'),
      );
    });
  });

  group('ChatMapper.parseToolResult — variants (OptionsCard)', () {
    test('uchta tier to\'g\'ri parse qilinadi', () {
      const result = '''
      {"options": [
        {"tier": "cheap", "title": "Tejamkor", "total": "1000000",
         "lines": [{"title": "Tul", "value": "2.5 m"}]},
        {"tier": "premium", "title": "Premium", "total": "2200000",
         "lines": [{"title": "Tul", "value": "4 m"}]}
      ]}''';

      final block = ChatMapper.parseToolResult('variants', result);

      block.maybeWhen(
        options: (opts) {
          expect(opts.options, hasLength(2));
          expect(opts.options[0].tier, PricingTier.cheap);
          expect(opts.options[1].tier, PricingTier.premium);
          expect(opts.options[0].title, 'Tejamkor');
        },
        orElse: () => fail('variants → OptionsBlock bo\'lishi kerak'),
      );
    });

    test('options bo\'lmasa → chip "Natija"', () {
      const result = '{"variants": []}';
      final block = ChatMapper.parseToolResult('variants', result);
      block.maybeWhen(
        toolChip: (tool, state, _, _, _) {
          expect(tool, 'variants');
          expect(state, ToolChipState.done);
        },
        orElse: () => fail('Kutilgan: toolChip'),
      );
    });
  });

  group('ChatMapper.parseToolResult — build_options (backend)', () {
    test('backend formatidagi variantlar OptionsCard ga parse qilinadi', () {
      const result = '''
      {"options": [
        {"tier": "economy", "total": "995 000 so'm",
         "why": "asosiy portyera",
         "lines": ["portyera: Tul Oq Oddiy", "xizmatlar: sewing,tape,hook"]},
        {"tier": "premium", "total": "1 310 000 so'm", "lines": []}
      ], "comparison": [], "stale": false, "warnings": []}''';

      final block = ChatMapper.parseToolResult('build_options', result);

      block.maybeWhen(
        options: (options) {
          expect(options.options, hasLength(2));
          expect(options.options.first.tier, PricingTier.cheap);
          expect(options.options.first.total, 995000);
          expect(options.options.first.title, 'Tejamkor');
          expect(options.options.first.lines[0].title, 'portyera');
          expect(options.options.first.lines[0].value, 'Tul Oq Oddiy');
          expect(options.options.first.lines.last.title, 'Sabab');
        },
        orElse: () => fail('build_options → OptionsBlock bo\'lishi kerak'),
      );
    });
  });

  group('ChatMapper.parseToolResult — ixcham hisob natijasi', () {
    test('agent totals/lines/services formatini Quote kartasiga parse qiladi', () {
      const result = '''
      {"totals": {"subtotal": "420000", "discount_amount": "0",
        "delivery_amount": "30000", "total": "450000"},
       "lines": [{"role": "portyera", "name": "Blackout Duo",
         "area_m2": "5.0", "coef": "2.5", "line_total": "350000"}],
       "services": [{"key": "sewing", "name": "Tikuv", "line_total": "70000"}],
       "warnings": [], "explanation": ["Hisob tayyor"]}''';

      final block = ChatMapper.parseToolResult('curtain_calculate', result);

      block.maybeWhen(
        quote: (quote) {
          expect(quote.fabrics.single.colorName, 'Blackout Duo');
          expect(quote.fabrics.single.areaSqm, 5.0);
          expect(quote.fabrics.single.total, 350000);
          expect(quote.services.single.name, 'Tikuv');
          expect(quote.total, 450000);
        },
        orElse: () => fail('Ixcham natija QuoteBlock bo\'lishi kerak'),
      );
    });
  });

  group('ChatMapper.parseToolResult — order_draft', () {
    test('missingFields bilan OrderDraft qaytadi', () {
      const result = '''
      {
        "customer_name": "Karimova Nilufar",
        "phone": "+998901234567",
        "address": "Toshkent, Beruniy 45",
        "measurements": [
          {"room_name": "Mehmonxona", "cornice": "4.200", "height": "2.600"}
        ],
        "total": "2660600",
        "prepayment": "1330300",
        "deadline": "2026-09-30",
        "missing_fields": ["Telefon raqami kerak", "Manzil kerak"]
      }''';

      final block = ChatMapper.parseToolResult('order_draft', result);

      block.maybeWhen(
        orderDraft: (OrderDraft draft) {
          expect(draft.customerName, 'Karimova Nilufar');
          expect(draft.phone, '+998901234567');
          expect(draft.address, 'Toshkent, Beruniy 45');
          expect(draft.measurements, hasLength(1));
          expect(draft.measurements[0].roomName, 'Mehmonxona');
          expect(draft.measurements[0].cornice, 4.2);
          expect(draft.total, 2660600);
          expect(draft.prepayment, 1330300);
          expect(draft.deadline, DateTime(2026, 9, 30));
          expect(draft.missingFields, contains('Telefon raqami kerak'));
        },
        orElse: () => fail('order_draft → OrderDraftBlock bo\'lishi kerak'),
      );
    });

    test('missing_fields yo\'q — bo\'sh ro\'yxat', () {
      const result = '{"total": "100000"}';
      final block = ChatMapper.parseToolResult('order_draft', result);
      block.maybeWhen(
        orderDraft: (d) => expect(d.missingFields, isEmpty),
        orElse: () => fail('Kutilgan: OrderDraftBlock'),
      );
    });
  });

  group('ChatMapper.parseToolResult — xato va noma\'lum tool', () {
    test('buzilgan JSON → chip "Natija" (oqim davom etadi)', () {
      const result = '{invalid json!!!';
      final block = ChatMapper.parseToolResult('curtain_calculate', result);

      block.maybeWhen(
        toolChip: (tool, state, _, _, rawResult) {
          expect(tool, 'curtain_calculate');
          expect(state, ToolChipState.done);
          expect(rawResult, result);
        },
        orElse: () => fail('Buzilgan JSON → toolChip bo\'lishi kerak'),
      );
    });

    test('noma\'lum tool → chip "Natija"', () {
      const result = '{"foo": "bar"}';
      final block = ChatMapper.parseToolResult('mystery_tool', result);
      block.maybeWhen(
        toolChip: (tool, state, _, _, _) {
          expect(tool, 'mystery_tool');
          expect(state, ToolChipState.done);
        },
        orElse: () => fail('Noma\'lum tool → toolChip bo\'lishi kerak'),
      );
    });

    test('tool bo\'sh string → chip', () {
      final block = ChatMapper.parseToolResult('', '{}');
      block.maybeWhen(
        toolChip: (tool, _, _, _, _) => expect(tool, ''),
        orElse: () => fail('Kutilgan: toolChip'),
      );
    });
  });

  group('Quote — backend calc_cases.json', () {
    test('1-misol: Oddiy portyera — backend total bilan mos', () {
      final data = _fixtureCase(0);
      final quote = ChatMapper.parseQuote(data);

      expect(quote.fabrics, hasLength(1));
      final f = quote.fabrics[0];
      expect(f.role, 'portyera');
      expect(f.areaSqm, closeTo(20.3, 1e-9));
      expect(f.pricePerSqm, 25000);
      expect(f.total, 507500);

      expect(quote.measurement?.cornice, 3.0);
      expect(quote.measurement?.coef, 2.5);

      // Kartochka ichidagi yig'indi backend totalga teng
      final sumFabrics = quote.fabrics.fold<int>(0, (acc, x) => acc + x.total);
      final sumAcc = quote.accessories.fold<int>(0, (acc, x) => acc + x.total);
      final sumSrv = quote.services.fold<int>(0, (acc, x) => acc + x.total);
      expect(sumFabrics + sumAcc + sumSrv, quote.subtotal);
      expect(quote.subtotal, 507500);
      expect(quote.total, 508000);
    });

    test('2-misol: Oddiy tul — backend total bilan mos', () {
      final data = _fixtureCase(1);
      final quote = ChatMapper.parseQuote(data);

      expect(quote.fabrics, hasLength(1));
      expect(quote.fabrics[0].role, 'tul');
      expect(quote.fabrics[0].total, 96000);
      expect(quote.subtotal, 96000);
      expect(quote.total, 96000);
      expect(quote.accessories, isEmpty);
      expect(quote.wasteWarnings, isEmpty);
    });

    test('3-misol: Baland deraza — backend total bilan mos', () {
      final data = _fixtureCase(2);
      final quote = ChatMapper.parseQuote(data);

      expect(quote.fabrics[0].total, 850000);
      expect(quote.fabrics[0].areaSqm, closeTo(34.0, 1e-9));
      expect(quote.subtotal, 850000);
      expect(quote.total, 850000);
    });

    test('10 bo\'lakli parda — 10 ta fabric, warnings, total', () {
      final data = _fixtureCase(3);
      final quote = ChatMapper.parseQuote(data);

      expect(quote.fabrics, hasLength(10));
      expect(quote.wasteWarnings, hasLength(2));
      expect(quote.wasteWarnings.first, contains('44.44'));

      final sumFabrics = quote.fabrics.fold<int>(0, (acc, x) => acc + x.total);
      expect(sumFabrics, quote.subtotal);
      expect(sumFabrics, 1446600);
      expect(quote.total, 1447000);

      // Bamboo roles to'g'ri
      final roles = quote.fabrics.map((f) => f.role).toList();
      expect(roles, contains('portyera'));
      expect(roles, contains('kant'));
      expect(roles, contains('lambrekan'));
      expect(roles, contains('dekor'));
      expect(roles, contains('astar'));
    });
  });

  group('ChatMapper.fromDto — tarix xabarlari', () {
    MessageDto dto({
      String id = 'm1',
      String role = 'user',
      String content = '',
      List<Map<String, dynamic>>? toolCalls,
      Map<String, dynamic>? toolResult,
    }) {
      return MessageDto(
        id: id,
        role: role,
        content: content,
        toolCalls: toolCalls,
        toolResult: toolResult,
        createdAt: DateTime(2026, 9, 16),
      );
    }

    test('oddiy user xabari', () {
      final msg = ChatMapper.fromDto(dto(content: 'Salom'));
      expect(msg.role, MessageRole.user);
      expect(msg.content, 'Salom');
      expect(msg.status, MessageStatus.done);
      expect(msg.richBlocks, isEmpty);
    });

    test('assistant vs tool role', () {
      final assistant = ChatMapper.fromDto(dto(role: 'assistant', content: 'Javob', id: 'a1'));
      expect(assistant.role, MessageRole.assistant);

      final tool = ChatMapper.fromDto(dto(role: 'tool', content: '', id: 't1'));
      expect(tool.role, MessageRole.system);

      final unknown = ChatMapper.fromDto(dto(role: 'robot', content: '', id: 'u1'));
      expect(unknown.role, MessageRole.unknown);
    });

    test('tool_calls → toolChip blocklar', () {
      final calls = [
        {
          'function': {'name': 'product_search', 'arguments': '{"query":"velvet"}'},
        },
        {
          'function': {'name': 'curtain_calculate', 'arguments': '{}'},
        },
      ];
      final msg = ChatMapper.fromDto(
        dto(role: 'assistant', content: 'natija', id: 'a-tool', toolCalls: calls),
      );
      expect(msg.richBlocks, hasLength(2));
      msg.richBlocks[0].maybeWhen(
        toolChip: (tool, state, _, rawArgs, _) {
          expect(tool, 'product_search');
          expect(state, ToolChipState.done);
          expect(rawArgs, '{"query":"velvet"}');
        },
        orElse: () => fail('Kutilgan: toolChip'),
      );
    });

    test('tool_result name/content → parsed block', () {
      final msgDto = dto(
        id: 'a-result',
        role: 'assistant',
        content: 'mana',
        toolResult: {
          'name': 'product_search',
          'content': '{"products": [{"id": "p1", "name": "A", "price": "1"}]}',
        },
      );
      final msg = ChatMapper.fromDto(msgDto);
      expect(msg.richBlocks, hasLength(1));
      expect(msg.richBlocks.single.maybeMap(products: (_) => true, orElse: () => false), isTrue);
    });

    test('tarixdagi tool content JSON mahsulot kartasiga aylanadi', () {
      final msg = ChatMapper.fromDto(
        dto(
          id: 'tool-product',
          role: 'tool',
          content:
              '{"products":[{"variant_id":"v-1","name":"Atlas","price":"45000","unit":"per_sqm"}]}',
        ),
      );

      expect(msg.richBlocks.single.maybeMap(products: (_) => true, orElse: () => false), isTrue);
      msg.richBlocks.single.maybeWhen(
        products: (products) => expect(products.single.id, 'v-1'),
        orElse: () => fail('Mahsulot bloki kutilgan'),
      );
    });

    test('tarixdagi state JSON xom matn sifatida qaytmaydi', () {
      final msg = ChatMapper.fromDto(
        dto(
          id: 'tool-state',
          role: 'tool',
          content: '{"state":{"room":"wedding"},"next_question":"yorug\'lik"}',
        ),
      );

      expect(msg.richBlocks, isEmpty);
    });
  });

  group('ChatMapper.parseQuote — formula va measurement', () {
    test('formula berilgan bo\'lsa — olinadi', () {
      final quote = ChatMapper.parseQuote({
        'subtotal': '0',
        'discount_amount': '0',
        'delivery_amount': '0',
        'total': '0',
        'formula': 'Eni * K * Balandlik',
      });
      expect(quote.formula, 'Eni * K * Balandlik');
    });

    test('measurement bo\'lmasa — default 0', () {
      final quote = ChatMapper.parseQuote({
        'subtotal': '0',
        'discount_amount': '0',
        'delivery_amount': '0',
        'total': '0',
      });
      expect(quote.measurement?.cornice, 0);
      expect(quote.measurement?.height, 0);
      expect(quote.measurement?.coef, 0);
    });

    test('chegirma va yetkazish maydonlari int ga o\'giriladi', () {
      final quote = ChatMapper.parseQuote({
        'subtotal': '537500',
        'discount_amount': '26875.00',
        'delivery_amount': '30000.00',
        'total': '541000',
      });
      expect(quote.discount, 26875);
      expect(quote.delivery, 30000);
      expect(quote.total, 541000);
    });
  });
}
