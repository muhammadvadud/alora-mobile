import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/network/api_paths.dart';
import 'package:alora_mobile/core/network/dio_client.dart';
import 'package:alora_mobile/features/profile/application/providers.dart';
import 'package:alora_mobile/features/profile/data/datasources/profile_remote_ds.dart';
import 'package:alora_mobile/features/profile/data/repositories/profile_repository_impl.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://api.example.com'));
    adapter = DioAdapter(dio: dio, matcher: const UrlRequestMatcher());
  });

  Map<String, dynamic> limitJson({String? maxCostUzs = '45702.00'}) => {
    'id': 'limit-1',
    'user_id': 'user-1',
    'period': 'daily',
    'is_unlimited': false,
    'max_tokens': 5000,
    'max_cost_uzs': ?maxCostUzs,
    'max_messages': 120,
    'on_exceed': 'warn',
    'is_active': true,
  };

  ProfileRemoteDataSource dataSource() => ProfileRemoteDataSource(dio);

  group('ProfileRemoteDataSource.meLimit', () {
    test('limit blokini qaytaradi (toJson round-trip bilan)', () async {
      adapter.onGet(
        ApiPaths.me,
        (server) => server.reply(200, {'limit': limitJson()}),
      );

      final dto = await dataSource().meLimit();

      expect(dto!.id, 'limit-1');
      expect(dto.userId, 'user-1');
      expect(dto.period, 'daily');
      expect(dto.isUnlimited, isFalse);
      expect(dto.maxTokens, 5000);
      expect(dto.maxCostUzs, '45702.00');
      expect(dto.maxMessages, 120);
      expect(dto.onExceed, 'warn');
      expect(dto.isActive, isTrue);
      expect(dto.toJson(), containsPair('user_id', 'user-1'));
    });

    test('limit bloki yo\'q bo\'lsa null qaytaradi', () async {
      adapter.onGet(
        ApiPaths.me,
        (server) => server.reply(200, {'id': 'user-1'}),
      );

      expect(await dataSource().meLimit(), isNull);
    });

    test('HTTP xatolikda Failure throw qiladi', () async {
      adapter.onGet(
        ApiPaths.me,
        (server) => server.reply(500, {'detail': 'xatolik'}),
      );

      await expectLater(dataSource().meLimit(), throwsA(isA<Failure>()));
    });
  });

  group('ProfileRemoteDataSource.todayCost', () {
    test('string cost_uzs yaxlitlanadi', () async {
      adapter.onGet(
        ApiPaths.usageSummary,
        (server) => server.reply(200, {'cost_uzs': '45702.00'}),
        queryParameters: {'period': 'day', 'user': 'user-1'},
      );

      expect(await dataSource().todayCost('user-1'), 45702);
    });

    test('num cost_uzs yaxlitlanadi', () async {
      adapter.onGet(
        ApiPaths.usageSummary,
        (server) => server.reply(200, {'cost_uzs': 45702}),
        queryParameters: {'period': 'day', 'user': 'user-1'},
      );

      expect(await dataSource().todayCost('user-1'), 45702);
    });

    test('cost_uzs bo\'lmasa 0 qaytaradi', () async {
      adapter.onGet(
        ApiPaths.usageSummary,
        (server) => server.reply(200, {'tokens': 5}),
        queryParameters: {'period': 'day', 'user': 'user-1'},
      );

      expect(await dataSource().todayCost('user-1'), 0);
    });

    test('HTTP xatolikda Failure throw qiladi', () async {
      adapter.onGet(
        ApiPaths.usageSummary,
        (server) => server.reply(500, {'detail': 'xatolik'}),
        queryParameters: {'period': 'day', 'user': 'user-1'},
      );

      await expectLater(
        dataSource().todayCost('user-1'),
        throwsA(isA<Failure>()),
      );
    });
  });

  group('ProfileRepositoryImpl', () {
    test('getLimit dto ni entity ga o\'tkazadi', () async {
      adapter.onGet(
        ApiPaths.me,
        (server) => server.reply(200, {'limit': limitJson()}),
      );

      final limit = await ProfileRepositoryImpl(dataSource()).getLimit();

      expect(limit!.id, 'limit-1');
      expect(limit.maxCost, 45702);
      expect(limit.isUnlimited, isFalse);
      expect(limit.onExceed, 'warn');
      expect(limit.isActive, isTrue);
    });

    test('getLimit null ni o\'tkazadi', () async {
      adapter.onGet(
        ApiPaths.me,
        (server) => server.reply(200, {'id': 'user-1'}),
      );

      expect(await ProfileRepositoryImpl(dataSource()).getLimit(), isNull);
    });

    test('getTodayCost remote qatlamga uzatiladi', () async {
      adapter.onGet(
        ApiPaths.usageSummary,
        (server) => server.reply(200, {'cost_uzs': '1000.00'}),
        queryParameters: {'period': 'day', 'user': 'user-1'},
      );

      expect(
        await ProfileRepositoryImpl(dataSource()).getTodayCost('user-1'),
        1000,
      );
    });
  });

  group('application providers', () {
    test('real profileRepositoryProvider ishlaydi', () async {
      adapter.onGet(
        ApiPaths.me,
        (server) => server.reply(200, {'limit': limitJson()}),
      );
      adapter.onGet(
        ApiPaths.usageSummary,
        (server) => server.reply(200, {'cost_uzs': '5000.00'}),
        queryParameters: {'period': 'day', 'user': 'user-1'},
      );

      final container = ProviderContainer(
        overrides: [dioProvider.overrideWithValue(dio)],
      );
      addTearDown(container.dispose);

      final repo = container.read(profileRepositoryProvider);
      final limit = await repo.getLimit();
      expect(limit!.id, 'limit-1');
      expect(await repo.getTodayCost('user-1'), 5000);
    });
  });
}
