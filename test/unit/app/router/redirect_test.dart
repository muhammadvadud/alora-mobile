import 'package:flutter_test/flutter_test.dart';

import 'package:alora_mobile/app/router/app_router.dart';
import 'package:alora_mobile/app/router/routes.dart';
import 'package:alora_mobile/features/auth/application/auth_state.dart';
import 'package:alora_mobile/shared/models/role.dart';

import '../../features/auth/auth_test_helpers.dart';

void main() {
  AuthState unknown() => const AuthState.unknown();
  AuthState unauthenticated() => const AuthState.unauthenticated();
  AuthState authenticated(Role role) =>
      AuthState.authenticated(user: testUser(role: role));

  test('unknown holatda hech qanday qayta yo\'naltirish bo\'lmaydi', () {
    expect(
      resolveRedirect(
        auth: unknown(),
        customerModeEnabled: false,
        location: AppRoutes.chat,
      ),
      isNull,
    );
    expect(
      resolveRedirect(
        auth: unknown(),
        customerModeEnabled: false,
        location: AppRoutes.management,
      ),
      isNull,
    );
  });

  test('kirilmagan holatda login va chatdan tashqari login ga qaytadi', () {
    expect(
      resolveRedirect(
        auth: unauthenticated(),
        customerModeEnabled: false,
        location: AppRoutes.login,
      ),
      isNull,
    );
    expect(
      resolveRedirect(
        auth: unauthenticated(),
        customerModeEnabled: false,
        location: AppRoutes.chat,
      ),
      AppRoutes.login,
    );
    expect(
      resolveRedirect(
        auth: unauthenticated(),
        customerModeEnabled: false,
        location: AppRoutes.orders,
      ),
      AppRoutes.login,
    );
    expect(
      resolveRedirect(
        auth: unauthenticated(),
        customerModeEnabled: false,
        location: AppRoutes.devGallery,
      ),
      AppRoutes.login,
    );
  });

  test('authenticated holatda login ekranidan chat ga o\'tadi', () {
    expect(
      resolveRedirect(
        auth: authenticated(Role.manager),
        customerModeEnabled: false,
        location: AppRoutes.login,
      ),
      AppRoutes.chat,
    );
  });

  test('mijoz rejimida faqat chat bo\'limlariga ruxsat beriladi', () {
    expect(
      resolveRedirect(
        auth: authenticated(Role.manager),
        customerModeEnabled: true,
        location: AppRoutes.chat,
      ),
      isNull,
    );
    expect(
      resolveRedirect(
        auth: authenticated(Role.manager),
        customerModeEnabled: true,
        location: AppRoutes.chatConversation('conv-1'),
      ),
      isNull,
    );
    expect(
      resolveRedirect(
        auth: authenticated(Role.manager),
        customerModeEnabled: true,
        location: AppRoutes.orders,
      ),
      AppRoutes.chat,
    );
    expect(
      resolveRedirect(
        auth: authenticated(Role.manager),
        customerModeEnabled: true,
        location: AppRoutes.profile,
      ),
      AppRoutes.chat,
    );
    expect(
      resolveRedirect(
        auth: authenticated(Role.manager),
        customerModeEnabled: true,
        location: AppRoutes.login,
      ),
      AppRoutes.chat,
    );
    expect(
      resolveRedirect(
        auth: authenticated(Role.manager),
        customerModeEnabled: true,
        location: AppRoutes.chatConversation('a/b'),
      ),
      AppRoutes.chat,
    );
  });

  test('boshqaruvchi (manager) barcha bo\'limlarga ruxsat oladi', () {
    final manager = authenticated(Role.manager);

    expect(
      resolveRedirect(
        auth: manager,
        customerModeEnabled: false,
        location: AppRoutes.management,
      ),
      isNull,
    );
    expect(
      resolveRedirect(
        auth: manager,
        customerModeEnabled: false,
        location: AppRoutes.catalog,
      ),
      isNull,
    );
    expect(
      resolveRedirect(
        auth: manager,
        customerModeEnabled: false,
        location: AppRoutes.profile,
      ),
      isNull,
    );
  });

  test('xodim (employee) management bo\'limidan forbidden ga o\'tadi', () {
    final employee = authenticated(Role.employee);

    expect(
      resolveRedirect(
        auth: employee,
        customerModeEnabled: false,
        location: AppRoutes.management,
      ),
      AppRoutes.forbidden,
    );
    expect(
      resolveRedirect(
        auth: employee,
        customerModeEnabled: false,
        location: AppRoutes.forbidden,
      ),
      isNull,
    );
    expect(
      resolveRedirect(
        auth: employee,
        customerModeEnabled: false,
        location: AppRoutes.orders,
      ),
      isNull,
    );
  });

  test('xodim (employee) barcha management sub-route\'laridan forbidden ga tushadi', () {
    final employee = authenticated(Role.employee);
    final managementLocations = [
      AppRoutes.managementEmployees,
      AppRoutes.managementEmployee('employee-1'),
      AppRoutes.managementEmployeeConversations('employee-1'),
      AppRoutes.managementConversationTranscript('employee-1', 'conv-1'),
      AppRoutes.managementProducts,
      AppRoutes.managementProductNew,
      AppRoutes.managementProductEdit('product-1'),
      AppRoutes.managementPricing,
      AppRoutes.managementKnowledge,
    ];

    for (final location in managementLocations) {
      expect(
        resolveRedirect(
          auth: employee,
          customerModeEnabled: false,
          location: location,
        ),
        AppRoutes.forbidden,
        reason: '$location employee uchun forbidden bo\'lishi kerak',
      );
    }
  });

  test('admin boshqaruv bo\'limlariga ruxsat oladi', () {
    final admin = authenticated(Role.admin);

    expect(
      resolveRedirect(
        auth: admin,
        customerModeEnabled: false,
        location: AppRoutes.management,
      ),
      isNull,
    );
    expect(
      resolveRedirect(
        auth: admin,
        customerModeEnabled: false,
        location: AppRoutes.managementEmployees,
      ),
      isNull,
    );
    expect(
      resolveRedirect(
        auth: admin,
        customerModeEnabled: false,
        location: AppRoutes.managementEmployee('employee-1'),
      ),
      isNull,
    );
  });
}
