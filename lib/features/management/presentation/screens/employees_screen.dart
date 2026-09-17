import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/router/adaptive_shell.dart';
import 'package:alora_mobile/app/router/routes.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/core/error/failure_l10n.dart';
import 'package:alora_mobile/features/management/application/employees_notifier.dart';
import 'package:alora_mobile/features/management/application/employees_state.dart';
import 'package:alora_mobile/features/management/presentation/widgets/employee_row.dart';
import 'package:alora_mobile/features/management/presentation/widgets/employees_create_sheet.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';
import 'package:alora_mobile/shared/widgets/empty_state.dart';
import 'package:alora_mobile/shared/widgets/error_state.dart';
import 'package:alora_mobile/shared/widgets/skeleton.dart';

/// Xodimlar sahifasi (S-20): qidiruv, ro'yxat, "Xodim qo'shish".
class EmployeesScreen extends ConsumerWidget {
  const EmployeesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(employeesProvider);
    final notifier = ref.read(employeesProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.management_employeesTitle)),
      body: TabletCentered(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.screenH,
                AppSpacing.l,
                AppSpacing.screenH,
                0,
              ),
              child: AppTextField(
                type: AppTextFieldType.search,
                hintText: l10n.management_employeesSearchHint,
                onChanged: notifier.search,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.screenH,
                AppSpacing.m,
                AppSpacing.screenH,
                AppSpacing.l,
              ),
              child: AppButton(
                text: l10n.management_employeeAdd,
                onPressed: () => showEmployeeCreateSheet(context, ref),
              ),
            ),
            Expanded(
              child: state.maybeWhen(
                loading: (_) => const SkeletonList(
                  itemCount: 5,
                  itemBuilder: SkeletonBox(height: 84),
                ),
                error: (failure, _) => ErrorState(
                  message: failure.localizedMessage(context),
                  onRetry: () => ref.read(employeesProvider.notifier).retry(),
                ),
                empty: (query) => EmptyState(
                  icon: query.isEmpty ? AppIcons.profile : AppIcons.search,
                  title: query.isEmpty
                      ? l10n.management_employeesEmptyTitle
                      : l10n.management_employeesSearchEmptyTitle,
                  message: query.isEmpty
                      ? l10n.management_employeesEmptyMessage
                      : l10n.management_employeesSearchEmptyMessage,
                ),
                loaded: (items, query) => ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.screenH,
                    vertical: AppSpacing.s,
                  ),
                  itemCount: items.length,
                  separatorBuilder: (_, _) =>
                      const SizedBox(height: AppSpacing.s),
                  itemBuilder: (context, index) {
                    final employee = items[index];
                    return EmployeeRow(
                      employee: employee,
                      onTap: () =>
                          context.go(AppRoutes.managementEmployee(employee.id)),
                    );
                  },
                ),
                orElse: () => const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
