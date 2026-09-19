import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mocktail/mocktail.dart';

import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/storage/hive_boxes.dart';
import 'package:alora_mobile/core/storage/secure_storage.dart';
import 'package:alora_mobile/features/auth/data/datasources/auth_remote_ds.dart';
import 'package:alora_mobile/features/auth/data/dto/auth_me_dto.dart';
import 'package:alora_mobile/features/auth/data/dto/auth_profile_dto.dart';
import 'package:alora_mobile/features/auth/data/dto/token_pair_dto.dart';
import 'package:alora_mobile/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:alora_mobile/shared/models/role.dart';

class _MockRemote extends Mock implements AuthRemoteDataSource {}

class _MockSecureStorage extends Mock implements SecureStorage {}

const _me = AuthMeDto(
  profile: AuthProfileDto(
    id: 'u1',
    phone: '+998901234567',
    fullName: 'Ali Valiyev',
    role: 'manager',
    tenant: 't1',
  ),
);

void main() {
  late Directory tempDir;
  late _MockRemote remote;
  late _MockSecureStorage storage;
  late AuthRepositoryImpl repo;

  setUpAll(() async {
    tempDir = await Directory.systemTemp.createTemp('auth_repo_');
    Hive.init(tempDir.path);
    await Hive.openBox<dynamic>(HiveBoxes.authPrefs);
  });

  setUp(() async {
    remote = _MockRemote();
    storage = _MockSecureStorage();
    repo = AuthRepositoryImpl(remote, storage);
    await Hive.box<dynamic>(HiveBoxes.authPrefs).clear();
    when(
      () => storage.saveTokens(
        access: any(named: 'access'),
        refresh: any(named: 'refresh'),
      ),
    ).thenAnswer((_) async {});
    when(() => storage.clearTokens()).thenAnswer((_) async {});
  });

  tearDownAll(() async {
    await Hive.close();
    await tempDir.delete(recursive: true);
  });

  group('AuthRepositoryImpl (§8.2 — tokenlar faqat secure storage)', () {
    test('login → tokenlar secure storage\'ga yoziladi', () async {
      when(
        () => remote.login(phone: '+998901234567', password: 'pw'),
      ).thenAnswer((_) async => const TokenPairDto(access: 'a', refresh: 'r'));

      await repo.login(phone: '+998901234567', password: 'pw');

      verify(() => storage.saveTokens(access: 'a', refresh: 'r')).called(1);
    });

    test('refresh: token yo\'q → AuthFailure', () async {
      when(() => storage.getRefreshToken()).thenAnswer((_) async => null);
      expect(repo.refresh(), throwsA(const Failure.auth()));
    });

    test('refresh: rotation — yangi juftlik saqlanadi', () async {
      when(() => storage.getRefreshToken()).thenAnswer((_) async => 'r1');
      when(() => remote.refresh('r1')).thenAnswer(
        (_) async => const TokenPairDto(access: 'a2', refresh: 'r2'),
      );

      await repo.refresh();

      verify(() => storage.saveTokens(access: 'a2', refresh: 'r2')).called(1);
    });

    test(
      'me → foydalanuvchi Hive\'da keshlanadi (telefon emas, token yo\'q)',
      () async {
        when(() => remote.me()).thenAnswer((_) async => _me);

        final user = await repo.me();
        expect(user.role, Role.manager);

        final cached = await repo.getCachedUser();
        expect(cached?.id, 'u1');
        final raw =
            Hive.box<dynamic>(HiveBoxes.authPrefs).get('cached_user') as String;
        expect(raw.contains('token'), isFalse);
      },
    );

    test('me: tarmoq yo\'q → keshlangan foydalanuvchi qaytadi (§11)', () async {
      when(() => remote.me()).thenAnswer((_) async => _me);
      await repo.me();
      when(() => remote.me()).thenThrow(const Failure.network());

      final user = await repo.me();
      expect(user.fullName, 'Ali Valiyev');
    });

    test('me: tarmoq yo\'q va kesh yo\'q → xato uzatiladi', () async {
      when(() => remote.me()).thenThrow(const Failure.network());
      expect(repo.me(), throwsA(const Failure.network()));
    });

    test('me: 401 → kesh ishlatilmaydi, AuthFailure', () async {
      when(() => remote.me()).thenAnswer((_) async => _me);
      await repo.me();
      when(() => remote.me()).thenThrow(const Failure.auth());
      expect(repo.me(), throwsA(const Failure.auth()));
    });

    test(
      'logout: API xatosi bo\'lsa ham sessiya tozalanadi, signal chiqadi',
      () async {
        when(() => storage.getRefreshToken()).thenAnswer((_) async => 'r1');
        when(() => remote.logout('r1')).thenThrow(const Failure.server());
        when(() => remote.me()).thenAnswer((_) async => _me);
        await repo.me();

        final expired = expectLater(repo.onSessionExpired, emits(anything));
        await repo.logout();
        await expired;

        verify(() => storage.clearTokens()).called(1);
        expect(await repo.getCachedUser(), isNull);
      },
    );

    test('getCachedUser: buzilgan JSON → null', () async {
      await Hive.box<dynamic>(HiveBoxes.authPrefs).put('cached_user', '{bad');
      expect(await repo.getCachedUser(), isNull);
    });
  });
}
