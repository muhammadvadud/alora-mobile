import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alora_mobile/features/auth/application/auth_notifier.dart';
import 'package:alora_mobile/features/auth/application/auth_state.dart';
import 'package:alora_mobile/features/auth/domain/entities/user.dart';
import 'package:alora_mobile/shared/models/role.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/limit_exceeded_view.dart';

import '../../helpers/pump_app.dart';

class _UnauthNotifier extends AuthNotifier {
  @override
  AuthState build() => const AuthState.unauthenticated();
}

class _AuthWithManagerNotifier extends AuthNotifier {
  @override
  AuthState build() => const AuthState.authenticated(
    user: User(
      id: 'u1',
      phone: '+998901234567',
      fullName: 'Test Xodim',
      role: Role.employee,
      tenant: 't1',
      managerPhone: '+998900000001',
    ),
  );
}

Widget _wrap(Widget child, AuthNotifier Function() auth, ThemeMode mode) {
  return ProviderScope(
    overrides: [authProvider.overrideWith(auth)],
    child: child.pumpApp(themeMode: mode),
  );
}

void main() {
  group('LimitExceededView', () {
    testWidgets("limit tugagan matni ko'rsatiladi", (tester) async {
      await tester.pumpWidget(
        _wrap(const LimitExceededView(), _UnauthNotifier.new, ThemeMode.light),
      );

      expect(find.text('Limit tugadi'), findsOneWidget);
      expect(find.byType(Icon), findsOneWidget);
    });

    testWidgets("manager telefoni yo'q bo'lsa aloqa tugmalari ko'rinmaydi", (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(const LimitExceededView(), _UnauthNotifier.new, ThemeMode.light),
      );

      expect(find.byType(AppButton), findsNothing);
    });

    testWidgets("manager telefoni bo'lsa Qo'ng'iroq va SMS tugmalari chiqadi", (
      tester,
    ) async {
      await tester.pumpWidget(
        _wrap(
          const LimitExceededView(),
          _AuthWithManagerNotifier.new,
          ThemeMode.light,
        ),
      );

      expect(find.byType(AppButton), findsNWidgets(2));
      expect(find.text("Qo'ng'iroq"), findsOneWidget);
      expect(find.text('SMS'), findsOneWidget);
    });

    testWidgets("dark rejimda ham to'g'ri ko'rsatiladi", (tester) async {
      await tester.pumpWidget(
        _wrap(const LimitExceededView(), _UnauthNotifier.new, ThemeMode.dark),
      );

      expect(find.text('Limit tugadi'), findsOneWidget);
    });
  });
}
