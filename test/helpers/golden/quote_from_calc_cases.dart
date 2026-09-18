import 'dart:convert';
import 'dart:io';

import 'package:alora_mobile/features/chat/domain/entities/quote.dart';

/// Backend `calc_cases.json` dan Quote fixture (S-05 golden).
Quote quoteFromCalcCasesMaxParts() {
  final file = File(
    '/home/muhammadvadud/it/alora/projects/backend/tests/fixtures/calc_cases.json',
  );
  final root = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
  final cases = root['cases'] as List<dynamic>;
  final caseMap = cases.cast<Map<String, dynamic>>().firstWhere(
    (c) => c['name'] == "Maksimal holat: 10 ta bo'lak",
  );
  final expected = caseMap['expected'] as Map<String, dynamic>;
  final measurement =
      (expected['measurements'] as List<dynamic>).first as Map<String, dynamic>;
  final parts = (measurement['parts'] as List<dynamic>)
      .cast<Map<String, dynamic>>();

  final fabrics = <QuoteFabric>[];
  for (var i = 0; i < parts.length; i++) {
    final p = parts[i];
    fabrics.add(
      QuoteFabric(
        role: p['role'] as String,
        variantId: p['variant_id'] as String,
        colorName: p['sku'] as String? ?? 'Rang $i',
        colorHex: i.isEven ? '#0E5751' : '#8A6620',
        widthM: double.parse(p['width_m'] as String),
        heightM: double.parse(p['height_m'] as String),
        coef: double.parse(p['coef'] as String),
        areaSqm: double.parse(p['area_m2'] as String),
        pricePerSqm: _soom(p['unit_price'] as String),
        total: _soom(p['line_total'] as String),
      ),
    );
  }

  final warnings = (expected['warnings'] as List<dynamic>)
      .map((e) => e as String)
      .toList();

  return Quote(
    fabrics: fabrics,
    accessories: const [
      QuoteAccessory(
        name: 'Karniz',
        qty: 6,
        unit: 'm',
        unitPrice: 80000,
        total: 480000,
      ),
      QuoteAccessory(
        name: 'Gul',
        qty: 2,
        unit: 'dona',
        unitPrice: 45000,
        total: 90000,
      ),
    ],
    services: const [
      QuoteService(name: 'Tikuv', qty: 1, total: 125000),
      QuoteService(name: "O'rnatish", total: 200000),
    ],
    wasteWarnings: warnings,
    formula: '6.0 m × 2.8 m · 10 bo\'lak · chiqindi ogohlantirilgan',
    subtotal: _soom(expected['subtotal'] as String),
    discount: _soom(expected['discount_amount'] as String),
    delivery: _soom(expected['delivery_amount'] as String),
    total: _soom(expected['total'] as String),
    measurement: QuoteMeasurement(
      room: 'Mehmonxona',
      cornice: double.parse(measurement['length'] as String),
      height: double.parse(measurement['height'] as String),
      coef: 2.5,
    ),
  );
}

int _soom(String value) => double.parse(value).round();
