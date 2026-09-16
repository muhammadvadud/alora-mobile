import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/features/chat/data/mappers/chat_mapper.dart';

import 'dart:convert';

void main() {
  group('ChatMapper', () {
    test('QuoteCard parse test with calc cases fixture structure', () {
      final jsonStr = '''
      {
        "measurements": [
          {
            "length": "4.500",
            "height": "2.900",
            "parts": [
              {
                "role": "portyera", "width_m": "4.500", "height_m": "2.900", "coef": "2.500",
                "area_m2": "34.900", "price_unit": "per_sqm", "unit_price": "25000.00", "line_total": "872500.00"
              }
            ],
            "accessories": []
          }
        ],
        "services": [
          {
             "name": "Tikuv", "qty": "68.600", "price_unit": "per_sqm", "unit_price": "12500.00", "line_total": "857500.00"
          }
        ],
        "subtotal": "2056800.00",
        "discount_amount": "0.00",
        "delivery_amount": "0.00",
        "total": "2057000.00",
        "warnings": []
      }
      ''';

      final data = jsonDecode(jsonStr) as Map<String, dynamic>;
      final quote = ChatMapper.parseQuote(data);

      expect(quote.fabrics.length, 1);
      expect(quote.fabrics[0].role, 'portyera');
      expect(quote.fabrics[0].areaSqm, 34.9);
      expect(quote.fabrics[0].total, 872500);

      expect(quote.services.length, 1);
      expect(quote.services[0].name, 'Tikuv');
      expect(quote.services[0].total, 857500);

      expect(quote.total, 2057000);
      expect(quote.measurement?.cornice, 4.5);
      expect(quote.measurement?.coef, 2.5);
    });
  });
}
