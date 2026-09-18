import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/app/router/app_router.dart';
import 'package:alora_mobile/app/router/routes.dart';
import 'package:alora_mobile/shared/models/role.dart';
import 'package:alora_mobile/features/auth/domain/entities/user.dart';
import 'package:alora_mobile/features/auth/application/auth_state.dart';

void main() {
  test('Manager cannot access settings route', () {
    const user = User(
      id: '1',
      role: Role.manager,
      phone: '123',
      fullName: 'Manager',
      tenant: 'a',
    );
    const auth = AuthState.authenticated(user: user);

    final redirect = resolveRedirect(
      auth: auth,
      customerModeEnabled: false,
      location: '/management/settings/prompt',
    );

    expect(redirect, AppRoutes.forbidden);
  });

  test('Admin can access settings route', () {
    const user = User(
      id: '2',
      role: Role.admin,
      phone: '123',
      fullName: 'Admin',
      tenant: 'a',
    );
    const auth = AuthState.authenticated(user: user);

    final redirect = resolveRedirect(
      auth: auth,
      customerModeEnabled: false,
      location: '/management/settings/prompt',
    );

    expect(redirect, isNull);
  });
}
