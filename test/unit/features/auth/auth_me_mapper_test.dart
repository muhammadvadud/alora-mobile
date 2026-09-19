import 'package:flutter_test/flutter_test.dart';

import 'package:alora_mobile/features/auth/data/dto/auth_me_dto.dart';
import 'package:alora_mobile/features/auth/data/dto/limit_dto.dart';
import 'package:alora_mobile/features/auth/data/mappers/auth_me_mapper.dart';
import 'package:alora_mobile/shared/models/role.dart';

void main() {
  final meJson = <String, dynamic>{
    'profile': <String, dynamic>{
      'id': 'user-1',
      'phone': '+998901234567',
      'full_name': 'Aziz Alimov',
      'role': 'manager',
      'tenant': 'alora-pardalar',
      'device_id': 'dev-42',
    },
    'limit': <String, dynamic>{
      'id': 'limit-1',
      'user_id': 'user-1',
      'period': '2026-09',
      'is_unlimited': false,
      'max_tokens': 100000,
      'max_cost_uzs': '5000000',
      'max_messages': 200,
      'on_exceed': 'block',
      'is_active': true,
    },
  };

  test('AuthMeDto profil maydonlarini User ga o\'tkazadi', () {
    final dto = AuthMeDto.fromJson(meJson);
    final user = dto.toUser();

    expect(user.id, 'user-1');
    expect(user.phone, '+998901234567');
    expect(user.fullName, 'Aziz Alimov');
    expect(user.role, Role.manager);
    expect(user.tenant, 'alora-pardalar');
    expect(user.deviceId, 'dev-42');
  });

  test('LimitDto null bo\'lsa LimitStatus null qaytadi', () {
    final dto = AuthMeDto.fromJson({'profile': meJson['profile'], 'limit': null});

    expect(dto.toUser().role, Role.manager);
    expect(dto.toLimitStatus(), isNull);
  });

  test('LimitDto LimitStatus ga to\'g\'ri o\'tkaziladi', () {
    final dto = AuthMeDto.fromJson(meJson);
    final limit = dto.toLimitStatus();

    expect(limit, isNotNull);
    expect(limit!.id, 'limit-1');
    expect(limit.isUnlimited, isFalse);
    expect(limit.maxTokens, 100000);
    expect(limit.maxCostUzs, '5000000');
    expect(limit.maxMessages, 200);
    expect(limit.onExceed, 'block');
    expect(limit.isActive, isTrue);
  });

  test('is_unlimited bo\'lsa LimitStatus cheklovsiz deb belgilanadi', () {
    final dto = LimitDto.fromJson({
      'id': 'limit-2',
      'user_id': 'user-1',
      'period': '2026-09',
      'is_unlimited': true,
      'on_exceed': 'block',
      'is_active': true,
    });

    final limit = dto.toLimitStatus();
    expect(limit.isUnlimited, isTrue);
    expect(limit.maxTokens, isNull);
  });

  test('noma\'lum role Role.unknown ga tushadi', () {
    final dto = AuthMeDto.fromJson({
      'profile': <String, dynamic>{
        'id': 'user-1',
        'phone': '+998901234567',
        'full_name': 'Aziz Alimov',
        'role': 'super-user',
        'tenant': 'alora-pardalar',
      },
    });

    expect(dto.toUser().role, Role.unknown);
  });

  test('roleFromName barcha tanish rollarni taniydi', () {
    expect(roleFromName('employee'), Role.employee);
    expect(roleFromName('manager'), Role.manager);
    expect(roleFromName('admin'), Role.admin);
  });
}
