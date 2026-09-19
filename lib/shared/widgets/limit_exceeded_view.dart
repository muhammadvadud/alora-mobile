import 'package:alora_mobile/features/auth/application/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:alora_mobile/features/auth/application/auth_notifier.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';

class LimitExceededView extends ConsumerWidget {
  const LimitExceededView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;
    final typography = context.text;
    final l10n = AppLocalizations.of(context)!;
    final authState = ref.watch(authProvider);

    String? managerPhone;
    authState.maybeWhen(
      authenticated: (user) {
        managerPhone = user.managerPhone;
      },
      orElse: () {},
    );

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxl, vertical: AppSpacing.xxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(LucideIcons.ban, size: 48, color: colors.textDisabled),
            const SizedBox(height: AppSpacing.l),
            Text(
              l10n.error_limit,
              style: typography.titleM.copyWith(color: colors.textPrimary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.s),
            Text(
              l10n.profile_limitDailyReset,
              style: typography.bodyS.copyWith(color: colors.textSecondary),
              textAlign: TextAlign.center,
            ),
            if (managerPhone != null) ...[
              const SizedBox(height: AppSpacing.xl),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: AppButton.secondary(
                      text: l10n.limit_callManager,
                      onPressed: () => launchUrl(Uri.parse('tel:$managerPhone')),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.m),
                  Expanded(
                    child: AppButton.secondary(
                      text: l10n.limit_smsManager,
                      onPressed: () => launchUrl(Uri.parse('sms:$managerPhone')),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
