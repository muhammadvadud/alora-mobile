import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
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
import 'package:alora_mobile/features/management/presentation/widgets/employee_role_chip.dart';
import 'package:alora_mobile/shared/widgets/app_dialog.dart';
import 'package:alora_mobile/shared/widgets/app_snackbar.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';
import 'package:alora_mobile/shared/widgets/error_state.dart';
import 'package:alora_mobile/shared/widgets/skeleton.dart';

import 'package:alora_mobile/shared/widgets/letter_avatar.dart';
import 'package:alora_mobile/features/management/presentation/widgets/employee_limit_editor.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/models/role.dart';
import 'package:alora_mobile/shared/widgets/app_card.dart';
import 'package:alora_mobile/shared/widgets/app_chip.dart';
import 'package:alora_mobile/shared/widgets/app_list_tile.dart';

class EmployeeDetailScreen extends ConsumerStatefulWidget {
  final String employeeId;

  const EmployeeDetailScreen({super.key, required this.employeeId});

  @override
  ConsumerState<EmployeeDetailScreen> createState() => _EmployeeDetailScreenState();
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
      AppSnackbar.show(context, message: l10n.common_save);
    } on Failure catch (error) {
      if (!mounted) return;
      AppSnackbar.show(context, message: error.localizedMessage(context), isError: true);
    } finally {
      if (mounted) setState(() => _saving = false);
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
      await ref.read(employeeDetailProvider(widget.employeeId).notifier).toggleBlocked(blocked);
    } on Failure catch (error) {
      if (!mounted) return;
      AppSnackbar.show(context, message: error.localizedMessage(context), isError: true);
    }
  }

  Future<void> _changePassword() async {
    final l10n = AppLocalizations.of(context)!;
    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (dialogContext) => _PasswordDialog(l10n: l10n),
    );
    if (result == null || !mounted) return;

    try {
      await ref
          .read(employeeDetailProvider(widget.employeeId).notifier)
          .changePassword(
            password: result['password']!,
            passwordConfirmation: result['password_confirmation']!,
          );
      if (!mounted) return;
      AppSnackbar.show(context, message: l10n.management_employeePasswordChanged);
    } on Failure catch (error) {
      if (!mounted) return;
      AppSnackbar.show(context, message: error.localizedMessage(context), isError: true);
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
            TextButton(onPressed: _saving ? null : _saveProfile, child: Text(l10n.common_save)),
        ],
      ),
      body: state.maybeWhen(
        loading: () => const SkeletonList(
          itemCount: 4,
          itemBuilder: SkeletonBox(height: 84),
          separator: SizedBox(height: AppSpacing.m),
          padding: EdgeInsets.all(AppSpacing.screenH),
        ),
        error: (failure) => ErrorState(
          message: failure.localizedMessage(context),
          onRetry: () => ref.read(employeeDetailProvider(widget.employeeId).notifier).load(),
        ),
        loaded: (employee, _) => _DetailBody(
          employee: employee,
          nameController: _nameController,
          role: _role,
          onRoleChanged: (role) => setState(() => _role = role),
          onViewConversations: () =>
              context.go(AppRoutes.managementEmployeeConversations(employee.id)),
          onBlockChanged: (blocked) => _toggleBlocked(blocked),
          onChangePassword: employee.role == Role.employee ? _changePassword : null,
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
  final VoidCallback? onChangePassword;
  final Widget limitEditor;

  const _DetailBody({
    required this.employee,
    required this.nameController,
    required this.role,
    required this.onRoleChanged,
    required this.onViewConversations,
    required this.onBlockChanged,
    required this.onChangePassword,
    required this.limitEditor,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return TabletCentered(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.screenH, vertical: AppSpacing.l),
        children: [
          _EmployeeHeader(employee: employee),
          const SizedBox(height: AppSpacing.xl),
          AppCard.sections(
            sections: [
              _EmployeeEditForm(
                nameController: nameController,
                role: role,
                onRoleChanged: onRoleChanged,
              ),
              AppListTile(
                title: l10n.management_employeeViewThreads,
                leading: const Icon(AppIcons.messageSquare, size: 24),
                onTap: onViewConversations,
                showDivider: false,
              ),
              _BlockToggleCard(isBlocked: employee.isBlocked, onBlockChanged: onBlockChanged),
              if (onChangePassword != null)
                AppListTile(
                  title: l10n.management_employeeChangePassword,
                  leading: const Icon(AppIcons.lock, size: 24),
                  onTap: onChangePassword,
                  showDivider: false,
                ),
              limitEditor,
            ],
          ),
        ],
      ),
    );
  }
}

class _EmployeeHeader extends StatelessWidget {
  final Employee employee;

  const _EmployeeHeader({required this.employee});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    return AppCard(
      child: Center(
        child: Column(
          children: [
            LetterAvatar(name: employee.fullName, size: 64),
            const SizedBox(height: AppSpacing.m),
            Text(
              employee.fullName,
              style: typography.titleL.copyWith(color: colors.textPrimary),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(employee.phone, style: typography.bodyM.copyWith(color: colors.textSecondary)),
            const SizedBox(height: AppSpacing.m),
            EmployeeRoleChip(role: employee.role, showBlocked: employee.isBlocked),
          ],
        ),
      ),
    );
  }
}

class _EmployeeEditForm extends StatelessWidget {
  final TextEditingController nameController;
  final Role role;
  final ValueChanged<Role> onRoleChanged;

  const _EmployeeEditForm({
    required this.nameController,
    required this.role,
    required this.onRoleChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colors = context.colors;
    final typography = context.text;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.management_createName,
          style: typography.labelM.copyWith(color: colors.textSecondary),
        ),
        const SizedBox(height: AppSpacing.s),
        AppTextField(controller: nameController, onChanged: (_) => {}),
        const SizedBox(height: AppSpacing.m),
        Text(
          l10n.management_createRole,
          style: typography.labelM.copyWith(color: colors.textSecondary),
        ),
        const SizedBox(height: AppSpacing.s),
        Wrap(
          spacing: AppSpacing.s,
          children: [
            AppChip(
              label: l10n.profile_roleEmployee,
              onTap: () => onRoleChanged(Role.employee),
              state: role == Role.employee ? AppChipState.selected : AppChipState.unselected,
            ),
            AppChip(
              label: l10n.profile_roleManager,
              onTap: () => onRoleChanged(Role.manager),
              state: role == Role.manager ? AppChipState.selected : AppChipState.unselected,
            ),
          ],
        ),
      ],
    );
  }
}

class _BlockToggleCard extends StatelessWidget {
  final bool isBlocked;
  final ValueChanged<bool> onBlockChanged;

  const _BlockToggleCard({required this.isBlocked, required this.onBlockChanged});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AppListTile(
      title: isBlocked ? l10n.management_employeeBlock : l10n.management_employeeUnblock,
      leading: const Icon(AppIcons.ban, size: 24),
      trailing: Switch(value: isBlocked, onChanged: onBlockChanged),
      showDivider: false,
    );
  }
}

class _PasswordDialog extends StatefulWidget {
  final AppLocalizations l10n;

  const _PasswordDialog({required this.l10n});

  @override
  State<_PasswordDialog> createState() => _PasswordDialogState();
}

class _PasswordDialogState extends State<_PasswordDialog> {
  final _passwordController = TextEditingController();
  final _confirmationController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmationController.dispose();
    super.dispose();
  }

  void _submit() {
    final password = _passwordController.text;
    final confirmation = _confirmationController.text;
    if (password.length < 8 || password != confirmation) return;
    Navigator.of(context).pop({'password': password, 'password_confirmation': confirmation});
  }

  @override
  Widget build(BuildContext context) {
    final l10n = widget.l10n;
    return AlertDialog(
      title: Text(l10n.management_employeeChangePassword),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextField(
            controller: _passwordController,
            type: AppTextFieldType.password,
            hintText: l10n.management_employeeNewPassword,
          ),
          const SizedBox(height: AppSpacing.m),
          AppTextField(
            controller: _confirmationController,
            type: AppTextFieldType.password,
            hintText: l10n.management_employeeConfirmPassword,
          ),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(), child: Text(l10n.common_cancel)),
        FilledButton(onPressed: _submit, child: Text(l10n.common_save)),
      ],
    );
  }
}
