import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:alora_mobile/shared/widgets/app_tab_bar.dart';

import '../../helpers/pump_app.dart';

void main() {
  group('AppTabBar testlari', () {
    testWidgets('AppTabBar 4 ta tab bilan to\'g\'ri ko\'rsatiladi', (tester) async {
      int tappedIndex = -1;
      final items = [
        const AppTabBarItem(icon: Icons.home_outlined, activeIcon: Icons.home, label: 'Asosiy'),
        const AppTabBarItem(
          icon: Icons.search_outlined,
          activeIcon: Icons.search,
          label: 'Qidiruv',
        ),
        const AppTabBarItem(icon: Icons.person_outline, activeIcon: Icons.person, label: 'Profil'),
        const AppTabBarItem(
          icon: Icons.settings_outlined,
          activeIcon: Icons.settings,
          label: 'Sozlamalar',
        ),
      ];

      await tester.pumpWidget(
        AppTabBar(
          currentIndex: 0,
          onTap: (index) {
            tappedIndex = index;
          },
          items: items,
        ).pumpApp(),
      );

      expect(find.text('Asosiy'), findsOneWidget);
      expect(find.text('Qidiruv'), findsOneWidget);
      expect(find.text('Profil'), findsOneWidget);
      expect(find.text('Sozlamalar'), findsOneWidget);

      await tester.tap(find.text('Qidiruv'));
      await tester.pumpAndSettle();

      expect(tappedIndex, 1);
    });

    testWidgets('AppTabBar badge count to\'g\'ri ko\'rsatiladi', (tester) async {
      final items = [
        const AppTabBarItem(icon: Icons.home_outlined, activeIcon: Icons.home, label: 'Asosiy'),
        const AppTabBarItem(
          icon: Icons.notifications_outlined,
          activeIcon: Icons.notifications,
          label: 'Xabarlar',
          badgeCount: 5,
        ),
      ];

      await tester.pumpWidget(
        AppTabBar(currentIndex: 0, onTap: (index) {}, items: items).pumpApp(),
      );

      expect(find.text('5'), findsOneWidget);
    });
  });
}
