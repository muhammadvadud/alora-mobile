import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:alora_mobile/features/orders/application/statuses_notifier.dart';
import 'package:alora_mobile/features/orders/application/providers.dart';
import 'package:alora_mobile/features/orders/domain/repositories/orders_repository.dart';
import 'package:alora_mobile/features/orders/domain/entities/statuses_response.dart';

class MockOrdersRepository extends Mock implements OrdersRepository {}

void main() {
  group('OrderTransitionsNotifier', () {
    test('isAllowed handles active/inactive transitions correctly based on mock StatusesResponse', () async {
      final mockRepo = MockOrdersRepository();

      when(() => mockRepo.getStatuses()).thenAnswer(
        (_) async => const StatusesResponse(
          transitions: {
            'draft': ['confirmed', 'cancelled'],
            'confirmed': ['measuring'],
          },
        ),
      );

      final container = ProviderContainer(
        overrides: [ordersRepositoryProvider.overrideWithValue(mockRepo)],
      );

      // Await the future
      await container.read(orderTransitionsProvider.future);

      final OrderTransitionsNotifier notifier = container.read(
        orderTransitionsProvider.notifier,
      );

      expect(notifier.isAllowed('draft', 'confirmed'), isTrue);
      expect(notifier.isAllowed('draft', 'cancelled'), isTrue);
      expect(notifier.isAllowed('draft', 'measuring'), isFalse); // not allowed
      expect(notifier.isAllowed('confirmed', 'measuring'), isTrue);
      expect(notifier.isAllowed('confirmed', 'ready'), isFalse);
    });
  });
}
