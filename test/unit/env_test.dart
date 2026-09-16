import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/core/env.dart';

void main() {
  test('Env variables should be available', () {
    expect(Env.env, isA<String>());
  });
}
