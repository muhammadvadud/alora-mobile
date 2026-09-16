import 'package:flutter_test/flutter_test.dart';

import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/features/auth/application/auth_state.dart';
import 'package:alora_mobile/shared/models/role.dart';

import 'auth_test_helpers.dart';

void main() {
  test('auth holatlari bir-biridan farqlanadi', () {
    const unknown = AuthState.unknown();
    const unauthenticated = AuthState.unauthenticated();
    final authenticated = AuthState.authenticated(user: testUser());

    expect(unknown, isNot(unauthenticated));
    expect(unauthenticated, isNot(authenticated));
    expect(const AuthState.unknown(), equals(const AuthState.unknown()));
  });

  test('when() barcha holatlarni yoritadi', () {
    String describe(AuthState state) => state.when(
      unknown: () => 'unknown',
      unauthenticated: () => 'unauthenticated',
      authenticated: (_) => 'authenticated',
    );

    expect(describe(const AuthState.unknown()), 'unknown');
    expect(describe(const AuthState.unauthenticated()), 'unauthenticated');
    expect(
      describe(AuthState.authenticated(user: testUser())),
      'authenticated',
    );
  });

  test('authenticated holati foydalanuvchini saqlaydi', () {
    final user = testUser(role: Role.employee);
    final state = AuthState.authenticated(user: user);

    final carried = state.maybeWhen(
      authenticated: (value) => value,
      orElse: () => user,
    );
    expect(identical(carried, user), isTrue);
    expect(carried.role, Role.employee);

    final notUnknown = state.maybeWhen(
      unknown: () => true,
      orElse: () => false,
    );
    expect(notUnknown, isFalse);
  });

  test('maybeWhen() berilmagan holat uchun orElse qaytaradi', () {
    const unknown = AuthState.unknown();
    expect(
      unknown.maybeWhen(authenticated: (_) => true, orElse: () => false),
      isFalse,
    );
  });

  test('Failure.auth 401 tozalashga olib keladigan belgisi mavjud', () {
    const failure = Failure.auth();
    expect(failure.maybeWhen(auth: () => true, orElse: () => false), isTrue);
  });
}
