import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/core/utils/phone_format.dart';

void main() {
  _normalizePhoneTests();
  test('phone_format to\'g\'ri ishlashi kerak', () {
    expect(formatPhone('998901234567'), '+998 90 123 45 67');
    expect(formatPhone('+998901234567'), '+998 90 123 45 67');
    expect(formatPhone('998 90 123-45-67'), '+998 90 123 45 67');
    expect(formatPhone('123'), '123'); // qisqa raqam

    // Yomon formatlanganlarni test qilish
    expect(formatPhone('998 (90) 123-45-67'), '+998 90 123 45 67');
    expect(formatPhone('+998901234567x'), '+998 90 123 45 67'); // x ignores
    expect(formatPhone('1234567890'), '+1234567890'); // boshqa format (>9 length)
  });
}

void _normalizePhoneTests() {
  test('normalizePhone: maska bo\'shliqlari olib tashlanadi → E.164', () {
    expect(normalizePhone('+998 90 000 00 01'), '+998900000001');
    expect(normalizePhone('998901234567'), '+998901234567');
    expect(normalizePhone('90 123 45 67'), '+998901234567');
    expect(normalizePhone('+998901234567'), '+998901234567');
    expect(normalizePhone('   '), '');
  });
}
