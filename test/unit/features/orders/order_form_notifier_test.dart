import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:alora_mobile/features/orders/application/order_form_notifier.dart';
import 'package:alora_mobile/features/orders/application/providers.dart';
import 'package:alora_mobile/features/orders/application/order_form_state.dart';
import 'package:alora_mobile/features/orders/domain/repositories/orders_repository.dart';
import 'package:alora_mobile/features/orders/domain/entities/order.dart';
import 'package:alora_mobile/shared/models/order_status.dart';
import 'package:alora_mobile/shared/models/payment_status.dart';

class MockOrdersRepository extends Mock implements OrdersRepository {}

void main() {
  group('OrderFormNotifier', () {
    late MockOrdersRepository mockRepo;
    late ProviderContainer container;

    setUp(() {
      mockRepo = MockOrdersRepository();
      container = ProviderContainer(
        overrides: [ordersRepositoryProvider.overrideWithValue(mockRepo)],
      );
    });

    test(
      'validates discount limit for employee (5%) and updates field errors',
      () async {
        final OrderFormNotifier notifier = container.read(
          orderFormProvider.notifier,
        );

        notifier.initialize({});
        notifier.updateField('discount_percent', '6');

        expect(
          () => notifier.submit(null, 'employee'),
          throwsA(isA<ValidationFailure>()),
        );

        final state = container.read(orderFormProvider);
        expect(state.fieldErrors.containsKey('discount_percent'), isTrue);
        expect(state.fieldErrors['discount_percent'], contains('5%'));
      },
    );

    test(
      'validates discount limit for manager (15%) and updates field errors',
      () async {
        final OrderFormNotifier notifier = container.read(
          orderFormProvider.notifier,
        );

        notifier.initialize({});
        notifier.updateField('discount_percent', '16');

        expect(
          () => notifier.submit(null, 'manager'),
          throwsA(isA<ValidationFailure>()),
        );

        final state = container.read(orderFormProvider);
        expect(state.fieldErrors.containsKey('discount_percent'), isTrue);
        expect(state.fieldErrors['discount_percent'], contains('15%'));
      },
    );

    test(
      'dirty tracking and sends only modified fields in PATCH request',
      () async {
        final OrderFormNotifier notifier = container.read(
          orderFormProvider.notifier,
        );

        when(() => mockRepo.patchOrder(any(), any())).thenAnswer(
          (_) async => const Order(
            id: '1',
            status: OrderStatus.draft,
            paymentStatus: PaymentStatus.unpaid,
          ),
        );

        notifier.initialize({
          'customer_name': 'Ali',
          'customer_phone': '998901234567',
          'address': 'Tashkent',
        });

        // Initially not dirty
        expect(notifier.state.isDirty, isFalse);

        notifier.updateField('address', 'Samarqand');

        // Now it's dirty
        expect(notifier.state.isDirty, isTrue);
        expect(notifier.state.changedFields, {'address': 'Samarqand'});

        await notifier.submit('1', 'manager');

        verify(() => mockRepo.patchOrder('1', {'address': 'Samarqand'}))
            .called(1);
      },
    );
  });
}
