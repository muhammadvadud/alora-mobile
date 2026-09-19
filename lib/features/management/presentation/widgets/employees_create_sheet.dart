import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/error/failure_l10n.dart';
import 'package:alora_mobile/features/management/application/employees_notifier.dart';
import 'package:alora_mobile/features/management/application/providers.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/models/role.dart';
import 'package:alora_mobile/shared/widgets/app_bottom_sheet.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_chip.dart';
import 'package:alora_mobile/shared/widgets/app_snackbar.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';
import 'package:alora_mobile/shared/widgets/phone_field.dart';

Future<void> showEmployeeCreateSheet(BuildContext context, WidgetRef ref) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (_) => const EmployeeCreateSheet(),
  );
}

class EmployeeCreateSheet extends ConsumerStatefulWidget {
  const EmployeeCreateSheet({super.key});

  @override
  ConsumerState<EmployeeCreateSheet> createState() => _EmployeeCreateSheetState();
}

class _EmployeeCreateSheetState extends ConsumerState<EmployeeCreateSheet> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  Role _role = Role.employee;
  String? _phoneError;
  String? _nameError;
  String? _passwordError;
  bool _saving = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final l10n = AppLocalizations.of(context)!;
    final phone = _phoneController.text.replaceAll(' ', '');

    if (RegExp(r'^\+998\d{9}$').hasMatch(phone) == false) {
      setState(() => _phoneError = l10n.management_createPhoneError);
      return;
    }

    setState(() {
      _saving = true;
      _phoneError = null;
      _nameError = null;
      _passwordError = null;
    });

    try {
      final repository = ref.read(teamRepositoryProvider);
      await repository.createEmployee(
        phone: phone,
        fullName: _nameController.text.trim(),
        password: _passwordController.text,
        role: _role,
        isActive: true,
      );
      if (!mounted) return;
      ref.invalidate(employeesProvider);
      Navigator.of(context).pop();
    } on Failure catch (error) {
      if (!mounted) return;
      setState(() => _saving = false);
      final validation = _validationFailure(error);
      if (validation != null) {
        setState(() {
          _nameError = validation.fieldErrors['full_name'];
          _phoneError = validation.fieldErrors['phone'];
          _passwordError = validation.fieldErrors['password'];
        });
        if (validation.fieldErrors.isEmpty) {
          AppSnackbar.show(context, message: error.localizedMessage(context), isError: true);
        }
      } else {
        AppSnackbar.show(context, message: error.localizedMessage(context), isError: true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AppBottomSheet(
      title: l10n.management_createTitle,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(
            controller: _nameController,
            hintText: l10n.management_createName,
            errorText: _nameError,
          ),
          const SizedBox(height: AppSpacing.m),
          PhoneField(controller: _phoneController, errorText: _phoneError),
          const SizedBox(height: AppSpacing.m),
          AppTextField(
            controller: _passwordController,
            type: AppTextFieldType.password,
            hintText: l10n.management_createPassword,
            errorText: _passwordError,
          ),
          const SizedBox(height: AppSpacing.m),
          Text(l10n.management_createRole, style: context.text.labelM),
          const SizedBox(height: AppSpacing.s),
          Wrap(
            spacing: AppSpacing.s,
            children: [
              AppChip(
                label: l10n.profile_roleEmployee,
                onTap: () => setState(() => _role = Role.employee),
                state: _role == Role.employee ? AppChipState.selected : AppChipState.unselected,
              ),
              AppChip(
                label: l10n.profile_roleManager,
                onTap: () => setState(() => _role = Role.manager),
                state: _role == Role.manager ? AppChipState.selected : AppChipState.unselected,
              ),
            ],
          ),
        ],
      ),
      action: AppButton(text: l10n.common_save, isLoading: _saving, onPressed: _submit),
    );
  }

  ({String detail, Map<String, String> fieldErrors})? _validationFailure(Failure failure) {
    return failure.maybeWhen(
      validation: (detail, fieldErrors) => (detail: detail, fieldErrors: fieldErrors),
      orElse: () => null,
    );
  }
}
