import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/router/adaptive_shell.dart';
import 'package:alora_mobile/app/router/routes.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/error/failure_l10n.dart';
import 'package:alora_mobile/features/management/application/employee_detail_notifier.dart';
import 'package:alora_mobile/features/management/application/employee_detail_state.dart';
import 'package:alora_mobile/features/management/domain/entities/employee.dart';
import 'package:alora_mobile/features/management/presentation/widgets/employee_avatar.dart';
import 'package:alora_mobile/features/management/presentation/widgets/employee_limit_editor.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/models/role.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_card.dart';
import 'package:alora_mobile/shared/widgets/app_chip.dart';
import 'package:alora_mobile/shared/widgets/app_dialog.dart';
import 'package:alora_mobile/shared/widgets/app_snackbar.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';
import 'package:alora_mobile/shared/widgets/error_state.dart';
import 'package:alora_mobile/shared/widgets/skeleton.dart';

/// Xodim profili sahifasi (S-21): ism/rol, bloklash, suhbatlar, limit.
class EmployeeDetailScreen extends ConsumerStatefulWidget {
  final String employeeId;

  const EmployeeDetailScreen({super.key, required this.employeeId});

  @override
  ConsumerState<EmployeeDetailScreen> createState() =>
      _EmployeeDetailScreenState();
}

class _EmployeeDetailScreenState extends ConsumerState<EmployeeDetailScreen> {
  final _nameController = TextEditingController();
  Role _role = Role.employee;
  String? _loadedEmployeeId;
  bool _saving = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _saveProfile() async {
    final l10n = AppLocalizations.of(context)!;
    final name = _nameController.text.trim();
    if (name.isEmpty) return;

    setState(() => _saving = true);
    try {
      await ref
          .read(employeeDetailProvider(widget.employeeId).notifier)
          .updateProfile(fullName: name, role: _role);
      if (!mounted) return;
      setState(() => _saving = false);
      AppSnackbar.show(context, message: l10n.common_save);
    } on Failure catch (error) {
      if (!mounted) return;
      setState(() => _saving = false);
      AppSnackbar.show(
        context,
        message: error.localizedMessage(context),
        isError: true,
      );
    }
  }

  Future<void> _toggleBlocked(bool blocked) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AppDialog(
        title: blocked
            ? l10n.management_employeeBlockConfirmTitle
            : l10n.management_employeeUnblockConfirmTitle,
        content: blocked
            ? l10n.management_employeeBlockConfirmMessage
            : l10n.management_employeeUnblockConfirmMessage,
        primaryActionText: blocked
            ? l10n.management_employeeBlock
            : l10n.management_employeeUnblock,
        onPrimaryAction: () => Navigator.of(context).pop(true),
        secondaryActionText: l10n.common_cancel,
        onSecondaryAction: () => Navigator.of(context).pop(false),
        isDestructive: true,
      ),
    );
    if (confirmed != true) return;

    try {
      await ref
          .read(employeeDetailProvider(widget.employeeId).notifier)
          .toggleBlocked(blocked);
    } on Failure catch (error) {
      if (!mounted) return;
      AppSnackbar.show(
        context,
        message: error.localizedMessage(context),
        isError: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.watch(employeeDetailProvider(widget.employeeId));

    final loaded = state.maybeWhen(loaded: (e, _) => e, orElse: () => null);
    if (loaded != null && loaded.id != _loadedEmployeeId) {
      _loadedEmployeeId = loaded.id;
      _nameController.text = loaded.fullName;
      _role = loaded.role;
    }
    final limit = state.maybeWhen(loaded: (_, l) => l, orElse: () => null);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.management_employeeProfileTitle),
        actions: [
          if (loaded != null)
            TextButton(
              onPressed: _saving ? null : _saveProfile,
              child: Text(l10n.common_save),
            ),
        ],
      ),
      body: state.maybeWhen(
        loading: () => const SkeletonList(
          itemCount: 4,
          itemBuilder: SkeletonBox(height: 84),
        ),
        error: (failure) => ErrorState(
          message: failure.localizedMessage(context),
          onRetry: () => ref
              .read(employeeDetailProvider(widget.employeeId).notifier)
              .load(),
        ),
        loaded: (employee, _) => _DetailBody(
          employee: employee,
          nameController: _nameController,
          role: _role,
          onRoleChanged: (role) => setState(() => _role = role),
          onViewConversations: () => context.go(
            AppRoutes.managementEmployeeConversations(employee.id),
          ),
          onBlockChanged: (blocked) => _toggleBlocked(blocked),
          limitEditor: EmployeeLimitEditor(
            key: ValueKey(limit?.id),
            employeeId: widget.employeeId,
            initialLimit: limit,
          ),
        ),
        orElse: () => const SizedBox.shrink(),
      ),
    );
  }
}

class _DetailBody extends StatelessWidget {
  final Employee employee;
  final TextEditingController nameController;
  final Role role;
  final ValueChanged<Role> onRoleChanged;
  final VoidCallback onViewConversations;
  final ValueChanged<bool> onBlockChanged;
  final Widget limitEditor;

  const _DetailBody({
    required this.employee,
    required this.nameController,
    required this.role,
    required this.onRoleChanged,
    required this.onViewConversations,
    required this.onBlockChanged,
    required this.limitEditor,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colors = context.colors;
    final typography = context.text;

    return TabletCentered(
      child: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.screenH,
          vertical: AppSpacing.l,
        ),
        children: [
          Row(
            children: [
              EmployeeAvatar(name: employee.fullName),
              const SizedBox(width: AppSpacing.l),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      employee.fullName,
                      style: typography.titleL.copyWith(
                        color: colors.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      employee.phone,
                      style: typography.bodyM.copyWith(
                        color: colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.management_createName,
                  style: typography.labelM.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
                const SizedBox(height: AppSpacing.s),
                AppTextField(controller: nameController, onChanged: (_) => {}),
                const SizedBox(height: AppSpacing.m),
                Text(
                  l10n.management_createRole,
                  style: typography.labelM.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
                const SizedBox(height: AppSpacing.s),
                Wrap(
                  spacing: AppSpacing.s,
                  children: [
                    _roleChip(
                      context,
                      label: l10n.profile_roleEmployee,
                      value: Role.employee,
                    ),
                    _roleChip(
                      context,
                      label: l10n.profile_roleManager,
                      value: Role.manager,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.l),
          AppButton.secondary(
            text: l10n.management_employeeViewThreads,
            onPressed: onViewConversations,
          ),
          const SizedBox(height: AppSpacing.l),
          AppCard(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    employee.isBlocked
                        ? l10n.management_employeeBlock
                        : l10n.management_employeeUnblock,
                    style: typography.titleS.copyWith(
                      color: colors.textPrimary,
                    ),
                  ),
                ),
                Switch(value: employee.isBlocked, onChanged: onBlockChanged),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          limitEditor,
        ],
      ),
    );
  }

  Widget _roleChip(
    BuildContext context, {
    required String label,
    required Role value,
  }) {
    return AppChip(
      label: label,
      onTap: () => onRoleChanged(value),
      state: role == value ? AppChipState.selected : AppChipState.unselected,
    );
  }
}
