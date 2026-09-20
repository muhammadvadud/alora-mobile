import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/router/adaptive_shell.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/auth/application/auth_notifier.dart' show authProvider;
import 'package:alora_mobile/features/auth/application/auth_state.dart';
import 'package:alora_mobile/features/profile/presentation/widgets/about_section.dart';
import 'package:alora_mobile/features/profile/application/profile_password_notifier.dart';
import 'package:alora_mobile/features/profile/presentation/widgets/change_password_dialog.dart';
import 'package:alora_mobile/features/profile/presentation/widgets/language_section.dart';
import 'package:alora_mobile/features/profile/presentation/widgets/logout_button.dart';
import 'package:alora_mobile/features/profile/presentation/widgets/profile_header.dart';
import 'package:alora_mobile/features/profile/presentation/widgets/spend_section.dart';
import 'package:alora_mobile/features/profile/presentation/widgets/theme_section.dart';
import 'package:alora_mobile/shared/widgets/app_card.dart';
import 'package:alora_mobile/shared/widgets/app_list_tile.dart';
import 'package:alora_mobile/shared/widgets/app_snackbar.dart';
import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/core/error/failure_l10n.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';

/// Profil sahifasi (S-25).
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool _changingPassword = false;

  Future<void> _changePassword() async {
    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (_) => const ChangePasswordDialog(),
    );
    if (result == null || !mounted) return;

    setState(() => _changingPassword = true);
    try {
      await ref
          .read(profilePasswordProvider.notifier)
          .change(
            password: result['password']!,
            passwordConfirmation: result['password_confirmation']!,
          );
      if (!mounted) return;
      AppSnackbar.show(context, message: AppLocalizations.of(context)!.profile_passwordChanged);
    } on Failure catch (error) {
      if (!mounted) return;
      AppSnackbar.show(context, message: error.localizedMessage(context), isError: true);
    } finally {
      if (mounted) setState(() => _changingPassword = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final auth = ref.watch(authProvider);
    final user = auth.maybeWhen(authenticated: (u) => u, orElse: () => null);

    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(title: Text(l10n.tab_profile)),
      body: TabletCentered(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.screenH,
            vertical: AppSpacing.l,
          ),
          children: [
            if (user != null) ...[ProfileHeader(user: user), const SizedBox(height: AppSpacing.xl)],
            const SpendSection(),
            const SizedBox(height: AppSpacing.xl),
            const AppCard(child: LanguageSection()),
            const SizedBox(height: AppSpacing.m),
            const AppCard(child: ThemeSection()),
            const SizedBox(height: AppSpacing.m),
            AppCard(
              child: AppListTile(
                title: l10n.profile_changePassword,
                leading: const Icon(AppIcons.lock, size: 20),
                trailing: _changingPassword
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : null,
                onTap: _changingPassword ? null : _changePassword,
                showDivider: false,
              ),
            ),
            const SizedBox(height: AppSpacing.m),
            const AppCard(child: AboutSection()),
            const SizedBox(height: AppSpacing.xl),
            const LogoutButton(),
          ],
        ),
      ),
    );
  }
}
