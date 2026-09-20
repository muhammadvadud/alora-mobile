import 'package:flutter/material.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';

class ChangePasswordDialog extends StatefulWidget {
  const ChangePasswordDialog({super.key});

  @override
  State<ChangePasswordDialog> createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
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
    final l10n = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(l10n.profile_changePassword),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextField(
            controller: _passwordController,
            type: AppTextFieldType.password,
            hintText: l10n.profile_newPassword,
          ),
          const SizedBox(height: AppSpacing.m),
          AppTextField(
            controller: _confirmationController,
            type: AppTextFieldType.password,
            hintText: l10n.profile_confirmPassword,
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
