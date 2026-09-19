import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/router/adaptive_shell.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/auth/application/auth_notifier.dart' show authProvider;
import 'package:alora_mobile/features/auth/application/auth_state.dart';
import 'package:alora_mobile/features/profile/presentation/widgets/about_section.dart';
import 'package:alora_mobile/features/profile/presentation/widgets/language_section.dart';
import 'package:alora_mobile/features/profile/presentation/widgets/logout_button.dart';
import 'package:alora_mobile/features/profile/presentation/widgets/profile_header.dart';
import 'package:alora_mobile/features/profile/presentation/widgets/spend_section.dart';
import 'package:alora_mobile/features/profile/presentation/widgets/theme_section.dart';
import 'package:alora_mobile/shared/widgets/app_card.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';

/// Profil sahifasi (S-25).
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            const AppCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  LanguageSection(),
                  ThemeSection(),
                  AboutSection(),
                  LogoutButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
