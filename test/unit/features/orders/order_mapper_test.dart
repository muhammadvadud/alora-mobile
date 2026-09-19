import 'package:flutter_test/flutter_test.dart';

import 'package:alora_mobile/features/orders/data/dto/order_dto.dart';
import 'package:alora_mobile/features/orders/data/dto/status_transition_dto.dart';
import 'package:alora_mobile/features/orders/data/mappers/order_mapper.dart';
import 'package:alora_mobile/shared/models/order_status.dart';
import 'package:alora_mobile/shared/models/payment_status.dart';

/// `GET orders/{id}/` javobi (API-CONTRACT 4.1) — to'liq ichma-ich namuna.
Map<String, dynamic> _orderJson() => {
  'id': 'o1',
  'number': 'ALR-2026-000123',
  'conversation': 'conv-1',
  'customer_name': 'Karimova Nilufar',
  'customer_phone': '+998901234567',
  'address': 'Toshkent',
  'status': 'confirmed',
  'status_display': 'Tasdiqlangan',
  'subtotal': '2645000.00',
  'discount_percent': '5.00',
  'discount_amount': '132250.00',
  'discount_source': 'tier',
  'delivery_amount': '80000.00',
  'total': '2592750.00',
  'prepayment_percent': '50.00',
  'prepayment': '1296375.00',
  'balance': '1296375.00',
  'payment_status': 'prepaid',
  'payment_status_display': 'Avans olindi',
  'deadline_date': '2026-09-30',
  'note': 'Eshik yaqiniga',
  'confirmed_by': {'id': 'u2', 'full_name': 'Manager', 'phone': null},
  'confirmed_at': '2026-09-10T08:00:00Z',
  'user': {'id': 'u1', 'full_name': 'Sotuvchi', 'phone': '+998900000001'},
  'measurements': [
    {
      'id': 'm1',
      'room_name': 'Mehmonxona',
      'cornice_length_m': '4.200',
      'height_m': '2.600',
      'layers': ['portyera', 'tul'],
      'coefficient': '2.500',
      'note': '',
      'parts': [
        {
          'id': 'p1',
          'variant': {'id': 'v1', 'color_name': 'Zumrad'},
          'role': 'portyera',
          'width_m': '10.500',
          'height_m': '2.600',
          'coefficient': '2.500',
          'area_sqm': '27.300',
          'price_per_sqm': '120000.00',
          'total': '3276000.00',
          'sort_order': 0,
        },
      ],
      'accessories': [
        {
          'id': 'a1',
          'variant': {'id': 'acc-1'},
          'qty': '2.000',
          'unit': 'dona',
          'unit_price': '45000.00',
          'total': '90000.00',
          'sort_order': 0,
        },
      ],
    },
  ],
  'items': [
    {
      'id': 'i1',
      'service_key': 'sewing',
      'name_snapshot': 'Tikuv',
      'qty': '1',
      'unit': 'xizmat',
      'unit_price': '125000.00',
      'total': '125000.00',
      'sort_order': 0,
    },
  ],
  'created_at': '2026-09-09T12:00:00Z',
  'updated_at': '2026-09-10T08:00:00Z',
};

void main() {
  group('order_mapper yordamchilari (§9.3)', () {
    test('parseMoney: "2748000.00" → 2748000; null → null; buzilgan → null', () {
      expect(parseMoney('2748000.00'), 2748000);
      expect(parseMoney('0.50'), 1);
      expect(parseMoney(null), isNull);
      expect(parseMoney('x'), isNull);
    });
    test('parseDouble / parseDate', () {
      expect(parseDouble('2.500'), 2.5);
      expect(parseDouble(null), isNull);
      expect(parseDate('2026-09-30'), DateTime(2026, 9, 30));
      expect(parseDate('bad'), isNull);
    });
  });

  group('OrderDto → Order', () {
    test('barcha pul maydonlari int, statuslar enum, ichma-ich ro\'yxatlar', () {
      final order = OrderDto.fromJson(_orderJson()).toEntity();

      expect(order.number, 'ALR-2026-000123');
      expect(order.conversationId, 'conv-1');
      expect(order.status, OrderStatus.confirmed);
      expect(order.paymentStatus, PaymentStatus.prepaid);
      expect(order.subtotal, 2645000);
      expect(order.discountPercent, 5.0);
      expect(order.discountAmount, 132250);
      expect(order.deliveryAmount, 80000);
      expect(order.total, 2592750);
      expect(order.prepayment, 1296375);
      expect(order.balance, 1296375);
      expect(order.deadlineDate, DateTime(2026, 9, 30));
      expect(order.confirmedBy?.fullName, 'Manager');
      expect(order.user?.phone, '+998900000001');

      final m = order.measurements.single;
      expect(m.roomName, 'Mehmonxona');
      expect(m.corniceLengthM, 4.2);
      expect(m.layers, ['portyera', 'tul']);
      expect(m.parts.single.pricePerSqm, 120000);
      expect(m.parts.single.total, 3276000);
      expect(m.parts.single.areaSqm, 27.3);
      expect(m.accessories.single.qty, 2.0);
      expect(m.accessories.single.total, 90000);

      expect(order.items.single.serviceKey, 'sewing');
      expect(order.items.single.total, 125000);
    });

    test('noma\'lum status/payment_status → unknown, ilova yiqilmaydi (§9.5)', () {
      final json = _orderJson()
        ..['status'] = 'brand_new_status'
        ..['payment_status'] = 'weird';
      final order = OrderDto.fromJson(json).toEntity();
      expect(order.status, OrderStatus.unknown);
      expect(order.paymentStatus, PaymentStatus.unknown);
    });

    test('minimal javob (faqat id) — null maydonlar bilan', () {
      final order = OrderDto.fromJson({'id': 'o2'}).toEntity();
      expect(order.status, OrderStatus.unknown);
      expect(order.total, isNull);
      expect(order.measurements, isEmpty);
      expect(order.items, isEmpty);
    });
  });

  test('StatusTransitionDto → StatusTransition', () {
    final t = StatusTransitionDto.fromJson({'code': 'measuring', 'label': "O'lchovda"}).toEntity();
    expect(t.code, 'measuring');
    expect(t.label, "O'lchovda");
  });
}
