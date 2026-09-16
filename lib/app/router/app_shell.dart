import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/features/auth/application/auth_notifier.dart'
    show authProvider;
import 'package:alora_mobile/features/auth/application/auth_state.dart';
import 'package:alora_mobile/features/orders/application/providers.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/shared/models/role.dart';
import 'package:alora_mobile/shared/widgets/app_tab_bar.dart';

import 'package:go_router/go_router.dart';

/// O'ng qo'l navigatsiya paneli (AppTabBar) bilan shell layout.
class AloraShell extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;

  const AloraShell({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final auth = ref.watch(authProvider);
    final draftCount = ref.watch(draftOrdersCountProvider);

    final isEmployee = auth.maybeWhen(
      authenticated: (u) => u.role == Role.employee,
      orElse: () => false,
    );

    final branchIndices = <int>[];
    final tabItems = <AppTabBarItem>[
      AppTabBarItem(
        icon: AppIcons.chat,
        activeIcon: AppIcons.chat,
        label: l10n.tab_chat,
      ),
      AppTabBarItem(
        icon: AppIcons.orders,
        activeIcon: AppIcons.orders,
        label: l10n.tab_orders,
        badgeCount: draftCount,
      ),
      AppTabBarItem(
        icon: AppIcons.catalog,
        activeIcon: AppIcons.catalog,
        label: l10n.tab_catalog,
      ),
    ];
    branchIndices.addAll([0, 1, 2]);

    if (!isEmployee) {
      branchIndices.add(3);
      tabItems.add(
        AppTabBarItem(
          icon: AppIcons.management,
          activeIcon: AppIcons.management,
          label: l10n.tab_management,
        ),
      );
    }

    branchIndices.add(4);
    tabItems.add(
      AppTabBarItem(
        icon: AppIcons.profile,
        activeIcon: AppIcons.profile,
        label: l10n.tab_profile,
      ),
    );

    final currentTab = branchIndices
        .indexOf(navigationShell.currentIndex)
        .clamp(0, tabItems.length - 1)
        .toInt();

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: AppTabBar(
        currentIndex: currentTab,
        items: tabItems,
        onTap: (tabIndex) {
          final branchIndex = branchIndices[tabIndex];
          navigationShell.goBranch(
            branchIndex,
            initialLocation: tabIndex == currentTab,
          );
        },
      ),
    );
  }
}
