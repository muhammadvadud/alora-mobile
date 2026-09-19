import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/router/adaptive_shell.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/features/auth/application/auth_notifier.dart';
import "package:alora_mobile/app/theme/app_radius.dart";
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';
import 'package:alora_mobile/core/utils/phone_format.dart';
import 'package:alora_mobile/shared/widgets/phone_field.dart';

/// S-01 Login ekrani: telefon + parol, "Kirish" tugmasi.
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isSubmitting = false;
  String? _errorText;

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String _errorMessage(Failure failure) {
    final l10n = AppLocalizations.of(context)!;
    return failure.map(
      network: (_) => l10n.error_network,
      auth: (_) => l10n.login_errorAuthFailed,
      permission: (_) => l10n.login_errorAuthFailed,
      notFound: (_) => l10n.login_errorAuthFailed,
      serviceUnavailable: (_) => l10n.error_serviceUnavailable,
      server: (_) => l10n.error_server,
      limit: (f) => f.detail.isNotEmpty ? f.detail : l10n.error_limit,
      validation: (f) => f.detail.isNotEmpty ? f.detail : l10n.login_errorAuthFailed,
      unknown: (f) => f.detail.isNotEmpty ? f.detail : l10n.login_errorAuthFailed,
    );
  }

  Future<void> _submit() async {
    if (_isSubmitting) return;

    final phone = normalizePhone(_phoneController.text);
    final password = _passwordController.text.trim();
    if (phone.isEmpty || password.isEmpty) {
      setState(() {
        _errorText = AppLocalizations.of(context)!.login_errorRequired;
      });
      return;
    }

    FocusScope.of(context).unfocus();
    setState(() {
      _isSubmitting = true;
      _errorText = null;
    });

    final failure = await ref.read(authProvider.notifier).login(phone: phone, password: password);

    if (!mounted) return;
    setState(() {
      _isSubmitting = false;
      if (failure != null) {
        _errorText = _errorMessage(failure);
      }
    });
  }

  void _clearError() {
    if (_errorText != null) {
      setState(() => _errorText = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: TabletCentered(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.xl,
                      AppSpacing.xxl,
                      AppSpacing.xl,
                      AppSpacing.xl,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const _LoginHeader(),
                        const SizedBox(height: AppSpacing.xxl),
                        _LoginFormFields(
                          phoneController: _phoneController,
                          passwordController: _passwordController,
                          isSubmitting: _isSubmitting,
                          errorText: _errorText,
                          onChanged: _clearError,
                          onSubmit: _submit,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _LoginHeader extends StatelessWidget {
  const _LoginHeader();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = context.text;
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: colors.surfaceMuted,
            borderRadius: AppRadius.inputBorder,
          ),
          child: Center(
            child: Text('A', style: text.displayL.copyWith(color: colors.textPrimary)),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          l10n.app_name,
          style: text.displayL.copyWith(color: colors.textPrimary),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.s),
        Text(
          l10n.login_tagline,
          style: text.bodyS.copyWith(color: colors.textSecondary),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _LoginFormFields extends StatelessWidget {
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final bool isSubmitting;
  final String? errorText;
  final VoidCallback onChanged;
  final VoidCallback onSubmit;

  const _LoginFormFields({
    required this.phoneController,
    required this.passwordController,
    required this.isSubmitting,
    required this.errorText,
    required this.onChanged,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final text = context.text;
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PhoneField(
          controller: phoneController,
          isEnabled: !isSubmitting,
          onChanged: (_) => onChanged(),
        ),
        const SizedBox(height: AppSpacing.m),
        AppTextField(
          type: AppTextFieldType.password,
          controller: passwordController,
          isEnabled: !isSubmitting,
          hintText: l10n.login_passwordLabel,
          errorText: errorText,
          onChanged: (_) => onChanged(),
        ),
        const SizedBox(height: AppSpacing.m),
        AppButton(text: l10n.login_signIn, isLoading: isSubmitting, onPressed: onSubmit),
        const SizedBox(height: AppSpacing.l),
        Text(
          l10n.login_forgotPassword,
          style: text.bodyS.copyWith(color: colors.textSecondary),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
