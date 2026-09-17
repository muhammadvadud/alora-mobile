import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/features/management/catalog_admin/application/notifiers/product_form_notifier.dart';

void main() {
  test('initial state', () {
    final container = ProviderContainer();
    final state = container.read(productFormProvider);
    expect(state['name'], '');
  });
}