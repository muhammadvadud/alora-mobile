import 'package:flutter/widgets.dart';

import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:alora_mobile/core/env.dart';
import 'package:alora_mobile/core/dev/component_gallery.dart';
import 'package:alora_mobile/features/auth/application/auth_notifier.dart';
import 'package:alora_mobile/features/auth/application/auth_state.dart';
import 'package:alora_mobile/features/auth/presentation/screens/login_screen.dart';
import 'package:alora_mobile/features/chat/presentation/screens/chat_screen.dart';
import 'package:alora_mobile/features/conversations/presentation/screens/conversations_screen.dart';
import 'package:alora_mobile/features/catalog/presentation/screens/catalog_screen.dart';
import 'package:alora_mobile/features/catalog/presentation/screens/product_screen.dart';
import 'package:alora_mobile/features/chat/domain/entities/order_draft.dart';
import 'package:alora_mobile/features/customer_mode/application/providers.dart';
import 'package:alora_mobile/features/management/presentation/screens/management_screen.dart';
import 'package:alora_mobile/features/management/presentation/screens/employees_screen.dart';
import 'package:alora_mobile/features/management/presentation/screens/employee_detail_screen.dart';
import 'package:alora_mobile/features/management/presentation/screens/employee_conversations_screen.dart';
import 'package:alora_mobile/features/management/presentation/screens/transcript_screen.dart';
import 'package:alora_mobile/features/management/catalog_admin/presentation/screens/products_manage_screen.dart';
import 'package:alora_mobile/features/management/catalog_admin/presentation/screens/product_form_screen.dart';
import 'package:alora_mobile/features/management/pricing/presentation/screens/pricing_rules_screen.dart';
import 'package:alora_mobile/features/management/knowledge/presentation/screens/knowledge_screen.dart';
import 'package:alora_mobile/features/orders/presentation/screens/orders_screen.dart';
import 'package:alora_mobile/features/orders/presentation/screens/order_form_screen.dart';
import 'package:alora_mobile/features/profile/presentation/screens/profile_screen.dart';
import 'package:alora_mobile/shared/models/role.dart';
import 'package:alora_mobile/features/management/settings/presentation/screens/system_prompt_screen.dart';
import 'package:alora_mobile/features/management/settings/presentation/screens/model_pricings_screen.dart';

import '../../features/customer_mode/presentation/widgets/customer_mode_pop_scope.dart';
import 'app_shell.dart';
import 'forbidden_screen.dart';
import 'routes.dart';

part 'app_router.g.dart';

/// Ilova marshrut tuzilishi (GoRouter).
@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final router = GoRouter(
    initialLocation: AppRoutes.chat,
    debugLogDiagnostics: false,
    redirect: (context, state) => _redirect(ref, state),
    routes: _routes(),
  );

  ref.listen<AuthState>(authProvider, (previous, next) {
    if (previous != next) {
      router.refresh();
    }
  });
  // Mijoz rejimi yoqilganda/o'chganda redirect qayta baholanadi (§4.3, §12).
  ref.listen<bool>(customerModeEnabledProvider, (previous, next) {
    if (previous != next) {
      router.refresh();
    }
  });

  return router;
}

/// Testlarda bevosita ishlatiladigan pure redirect funksiyasi.
@visibleForTesting
String? resolveRedirect({
  required AuthState auth,
  required bool customerModeEnabled,
  required String location,
}) {
  final isAuthenticated = auth.maybeWhen(
    authenticated: (_) => true,
    orElse: () => false,
  );
  final isUnknown = auth.maybeWhen(unknown: () => true, orElse: () => false);

  if (isUnknown) return null;

  if (!isAuthenticated) {
    return location == AppRoutes.login ? null : AppRoutes.login;
  }

  if (customerModeEnabled) {
    if (location == AppRoutes.login) return AppRoutes.chat;
    final isOpenConversation = RegExp(r'^/chat/[^/]+$').hasMatch(location);
    if (!isOpenConversation && location != AppRoutes.chat) {
      return AppRoutes.chat;
    }
    return null;
  }

  if (location == AppRoutes.login) return AppRoutes.chat;

  final isEmployee = auth.maybeWhen(
    authenticated: (u) => u.role == Role.employee,
    orElse: () => false,
  );
  if (isEmployee && location.startsWith(AppRoutes.management)) {
    return AppRoutes.forbidden;
  }

  final isManager = auth.maybeWhen(
    authenticated: (u) => u.role == Role.manager,
    orElse: () => false,
  );
  if (isManager && location.startsWith('/management/settings')) {
    return AppRoutes.forbidden;
  }

  return null;
}

String? _redirect(Ref ref, GoRouterState state) {
  final auth = ref.read(authProvider);
  final customerMode = ref.read(customerModeEnabledProvider);
  return resolveRedirect(
    auth: auth,
    customerModeEnabled: customerMode,
    location: state.matchedLocation,
  );
}

final _chatNavKey = GlobalKey<NavigatorState>();
final _ordersNavKey = GlobalKey<NavigatorState>();
final _catalogNavKey = GlobalKey<NavigatorState>();
final _managementNavKey = GlobalKey<NavigatorState>();
final _profileNavKey = GlobalKey<NavigatorState>();

List<RouteBase> _routes() {
  return [
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.forbidden,
      builder: (context, state) => const ForbiddenScreen(),
    ),
    if (Env.isDev)
      GoRoute(
        path: AppRoutes.devGallery,
        builder: (context, state) => const ComponentGallery(),
      ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => CustomerModePopScope(
        child: AloraShell(navigationShell: navigationShell),
      ),
      branches: [
        StatefulShellBranch(
          navigatorKey: _chatNavKey,
          routes: [
            GoRoute(
              path: AppRoutes.chat,
              builder: (_, _) => const ConversationsScreen(),
              routes: [
                GoRoute(
                  path: ':conversationId',
                  builder: (_, state) => ChatScreen(
                    conversationId: state.pathParameters['conversationId'],
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _ordersNavKey,
          routes: [
            GoRoute(
              path: AppRoutes.orders,
              builder: (_, _) => const OrdersScreen(),
              routes: [
                GoRoute(
                  path: 'new',
                  builder: (_, state) => OrderFormScreen(
                    initialDraft: state.extra is OrderDraft
                        ? state.extra as OrderDraft
                        : null,
                  ),
                ),
                GoRoute(
                  path: ':orderId',
                  builder: (_, state) =>
                      OrdersScreen(orderId: state.pathParameters['orderId']),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _catalogNavKey,
          routes: [
            GoRoute(
              path: AppRoutes.catalog,
              builder: (_, _) => const CatalogScreen(),
              routes: [
                GoRoute(
                  path: 'products/:productId',
                  builder: (_, state) => ProductScreen(
                    productId: state.pathParameters['productId']!,
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _managementNavKey,
          routes: [
            GoRoute(
              path: AppRoutes.management,
              builder: (_, _) => const ManagementScreen(),
              routes: [
                GoRoute(
                  path: 'products',
                  builder: (_, _) => const ProductsManageScreen(),
                  routes: [
                    GoRoute(
                      path: 'new',
                      builder: (_, _) => const ProductFormScreen(),
                    ),
                    GoRoute(
                      path: ':id/edit',
                      builder: (_, state) => ProductFormScreen(
                        productId: state.pathParameters['id'],
                      ),
                    ),
                  ],
                ),
                GoRoute(
                  path: 'pricing',
                  builder: (_, _) => const PricingRulesScreen(),
                ),
                GoRoute(
                  path: 'knowledge',
                  builder: (_, _) => const KnowledgeScreen(),
                ),
                GoRoute(
                  path: 'settings/prompt',
                  builder: (_, _) => const SystemPromptScreen(),
                ),
                GoRoute(
                  path: 'settings/models',
                  builder: (_, _) => const ModelPricingsScreen(),
                ),
                GoRoute(
                  path: 'employees',
                  builder: (_, _) => const EmployeesScreen(),
                  routes: [
                    GoRoute(
                      path: ':employeeId',
                      builder: (_, state) => EmployeeDetailScreen(
                        employeeId: state.pathParameters['employeeId']!,
                      ),
                      routes: [
                        GoRoute(
                          path: 'conversations',
                          builder: (_, state) => EmployeeConversationsScreen(
                            employeeId: state.pathParameters['employeeId']!,
                          ),
                          routes: [
                            GoRoute(
                              path: ':conversationId',
                              builder: (_, state) => TranscriptScreen(
                                conversationId:
                                    state.pathParameters['conversationId']!,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _profileNavKey,
          routes: [
            GoRoute(
              path: AppRoutes.profile,
              builder: (_, _) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    ),
  ];
}
