import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import 'package:alora_mobile/core/network/api_paths.dart';
import 'package:alora_mobile/features/management/data/datasources/usage_remote_ds.dart';
import 'package:alora_mobile/features/management/domain/entities/usage_period.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late UsageRemoteDataSource dataSource;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://api.example.com'));
    adapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
    dataSource = UsageRemoteDataSource(dio);
  });

  test('summary day davrini yuboradi', () async {
    adapter.onGet(
      ApiPaths.usageSummary,
      (server) => server.reply(200, {
        'period': 'day',
        'tokens': 120,
        'cost_uzs': '2748000.00',
        'messages': 45,
        'conversations': 12,
        'orders': 4,
      }),
      queryParameters: {'period': 'day'},
    );

    final dto = await dataSource.summary(period: UsagePeriod.day);

    expect(dto.period, 'day');
    expect(dto.cost, 2748000);
    expect(dto.conversations, 12);
  });

  test('summary userId berilsa user parametrini qo\'shadi', () async {
    adapter.onGet(
      ApiPaths.usageSummary,
      (server) =>
          server.reply(200, {'period': 'day', 'tokens': 0, 'messages': 0, 'conversations': 0}),
      queryParameters: {'period': 'day', 'user': 'employee-1'},
    );

    final dto = await dataSource.summary(period: UsagePeriod.day, userId: 'employee-1');

    expect(dto.period, 'day');
  });

  test('summary week davri query parametrini yuboradi', () async {
    adapter.onGet(
      ApiPaths.usageSummary,
      (server) =>
          server.reply(200, {'period': 'week', 'tokens': 0, 'messages': 0, 'conversations': 0}),
      queryParameters: {'period': 'week'},
    );

    final dto = await dataSource.summary(period: UsagePeriod.week);

    expect(dto.period, 'week');
  });

  test('byUser: period query parametri bilan jo\'natiladi', () async {
    adapter.onGet(
      ApiPaths.usageByUser,
      (server) => server.reply(200, [
        {
          'user_id': 'employee-1',
          'full_name': 'Akmal Karimov',
          'tokens': 500,
          'cost_uzs': '120000.00',
          'messages': 10,
          'conversations': 3,
        },
      ]),
      queryParameters: {'period': 'month'},
    );

    final dtos = await dataSource.byUser(period: UsagePeriod.month);

    expect(dtos.length, 1);
    expect(dtos.single.userId, 'employee-1');
    expect(dtos.single.cost, 120000);
  });

  test('byUser bo\'sh ro\'yxatni qaytaradi', () async {
    adapter.onGet(
      ApiPaths.usageByUser,
      (server) => server.reply(200, []),
      queryParameters: {'period': 'day'},
    );

    final dtos = await dataSource.byUser(period: UsagePeriod.day);

    expect(dtos, isEmpty);
  });

  test('conversion: analytics/conversion yo\'lidan keladi', () async {
    adapter.onGet(
      ApiPaths.analyticsConversion,
      (server) => server.reply(200, {'total_conversations': 20, 'with_order': 5}),
    );

    final dto = await dataSource.conversion();

    expect(dto.totalConversations, 20);
    expect(dto.withOrder, 5);
    expect(dto.rate, isNull);
  });

  test('conversations: eng qimmat suhbatlar ro\'yxati', () async {
    adapter.onGet(
      ApiPaths.usageConversations,
      (server) => server.reply(200, [
        {'conversation_id': 'conv-1', 'tokens': 100, 'messages': 8},
      ]),
    );

    final dtos = await dataSource.conversations();

    expect(dtos.single.conversationId, 'conv-1');
    expect(dtos.single.messages, 8);
  });
}
