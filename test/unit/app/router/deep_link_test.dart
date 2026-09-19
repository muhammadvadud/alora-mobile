import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:alora_mobile/app/router/app_router.dart';
import 'package:alora_mobile/app/router/routes.dart';
import 'package:alora_mobile/features/auth/application/providers.dart';

import '../../features/auth/auth_test_helpers.dart';

void main() {
  late ProviderContainer container;
  late FakeAuthRepository repository;

  setUp(() {
    repository = FakeAuthRepository();
    container = ProviderContainer(
      overrides: [authRepositoryProvider.overrideWithValue(repository)],
    );
    addTearDown(() async {
      await repository.dispose();
      container.dispose();
    });
  });

  GoRouter router() => container.read(appRouterProvider);

  RouteMatchList matchFor(String location) => router().configuration.findMatch(Uri.parse(location));

  test('/chat/conv-1 conversationId ni parsi qiladi', () {
    final match = matchFor(AppRoutes.chatConversation('conv-1'));

    expect(match.pathParameters['conversationId'], 'conv-1');
  });

  test('/orders/ord-2 orderId ni parsi qiladi', () {
    final match = matchFor(AppRoutes.order('ord-2'));

    expect(match.pathParameters['orderId'], 'ord-2');
  });

  test('/catalog/products/prod-3 productId ni parsi qiladi', () {
    final match = matchFor(AppRoutes.catalogProduct('prod-3'));

    expect(match.pathParameters['productId'], 'prod-3');
  });

  test('/chat asosiy location ga mos keladi', () {
    final match = matchFor(AppRoutes.chat);

    expect(match.matches, isNotEmpty);
    expect(match.last.matchedLocation, AppRoutes.chat);
  });

  test('mavjud bo\'lmagan havola uchun match topilmaydi', () {
    expect(matchFor('/no/such/page').isEmpty, isTrue);
  });
}
