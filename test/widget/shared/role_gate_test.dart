import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/shared/models/role.dart';
import 'package:alora_mobile/shared/widgets/role_gate.dart';

import '../../helpers/pump_app.dart';

void main() {
  const child = Text('Bola');
  const replacement = Text('Ruxsat yo\'q');

  group('RoleGate Widget Testlari', () {
    testWidgets('employee minRole: employee kiradi', (WidgetTester tester) async {
      await tester.pumpWidget(
        const RoleGate(minRole: Role.employee, currentRole: Role.employee, child: child).pumpApp(),
      );
      expect(find.text('Bola'), findsOneWidget);
    });

    testWidgets('employee minRole: manager kirmaydi', (WidgetTester tester) async {
      await tester.pumpWidget(
        const RoleGate(
          minRole: Role.manager,
          currentRole: Role.employee,
          replacement: replacement,
          child: child,
        ).pumpApp(),
      );
      expect(find.text('Ruxsat yo\'q'), findsOneWidget);
    });

    testWidgets('employee minRole: admin kirmaydi', (WidgetTester tester) async {
      await tester.pumpWidget(
        const RoleGate(
          minRole: Role.admin,
          currentRole: Role.employee,
          replacement: replacement,
          child: child,
        ).pumpApp(),
      );
      expect(find.text('Ruxsat yo\'q'), findsOneWidget);
    });

    testWidgets('manager minRole: employee kiradi', (WidgetTester tester) async {
      await tester.pumpWidget(
        const RoleGate(minRole: Role.employee, currentRole: Role.manager, child: child).pumpApp(),
      );
      expect(find.text('Bola'), findsOneWidget);
    });

    testWidgets('manager minRole: manager kiradi', (WidgetTester tester) async {
      await tester.pumpWidget(
        const RoleGate(minRole: Role.manager, currentRole: Role.manager, child: child).pumpApp(),
      );
      expect(find.text('Bola'), findsOneWidget);
    });

    testWidgets('manager minRole: admin kirmaydi', (WidgetTester tester) async {
      await tester.pumpWidget(
        const RoleGate(
          minRole: Role.admin,
          currentRole: Role.manager,
          replacement: replacement,
          child: child,
        ).pumpApp(),
      );
      expect(find.text('Ruxsat yo\'q'), findsOneWidget);
    });

    testWidgets('admin minRole: employee kiradi', (WidgetTester tester) async {
      await tester.pumpWidget(
        const RoleGate(minRole: Role.employee, currentRole: Role.admin, child: child).pumpApp(),
      );
      expect(find.text('Bola'), findsOneWidget);
    });

    testWidgets('admin minRole: manager kiradi', (WidgetTester tester) async {
      await tester.pumpWidget(
        const RoleGate(minRole: Role.manager, currentRole: Role.admin, child: child).pumpApp(),
      );
      expect(find.text('Bola'), findsOneWidget);
    });

    testWidgets('admin minRole: admin kiradi', (WidgetTester tester) async {
      await tester.pumpWidget(
        const RoleGate(minRole: Role.admin, currentRole: Role.admin, child: child).pumpApp(),
      );
      expect(find.text('Bola'), findsOneWidget);
    });
  });
}
