import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/core/utils/money_format.dart';

void main() {
  _formatPercentTests();
  test('money_format to\'g\'ri ishlashi kerak', () {
    expect(formatMoneyPlain(2748000), '2\u202F748\u202F000');
    expect(formatMoney(2748000), '2\u202F748\u202F000 so\'m');

    expect(formatMoneyPlain(0), '0');
    expect(formatMoney(0), '0 so\'m');
  });
}

void _formatPercentTests() {
  group('formatPercent', () {
    test("butun foiz '.0'siz", () => expect(formatPercent(3.0), '3'));
    test('kasr foiz saqlanadi', () => expect(formatPercent(2.5), '2.5'));
  });
}
