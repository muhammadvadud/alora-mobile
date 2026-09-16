import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/core/utils/phone_format.dart';

void main() {
  test('phone_format to\'g\'ri ishlashi kerak', () {
    expect(formatPhone('998901234567'), '+998 90 123 45 67');
    expect(formatPhone('+998901234567'), '+998 90 123 45 67');
    expect(formatPhone('998 90 123-45-67'), '+998 90 123 45 67');
    expect(formatPhone('123'), '123'); // qisqa raqam

    // Yomon formatlanganlarni test qilish
    expect(formatPhone('998 (90) 123-45-67'), '+998 90 123 45 67');
    expect(formatPhone('+998901234567x'), '+998 90 123 45 67'); // x ignores
    expect(
      formatPhone('1234567890'),
      '+1234567890',
    ); // boshqa format (>9 length)
  });
}
