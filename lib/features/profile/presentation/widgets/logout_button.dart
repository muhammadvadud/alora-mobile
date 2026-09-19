import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/features/auth/application/auth_notifier.dart' show authProvider;
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_dialog.dart';

/// "Chiqish" tugmasi (S-25) — tasdiqlash dialogi bilan.
class LogoutButton extends ConsumerWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    return AppButton.destructive(
      text: l10n.profile_logout,
      onPressed: () => confirmLogout(context, ref),
    );
  }
}

Future<void> confirmLogout(BuildContext context, WidgetRef ref) async {
  final l10n = AppLocalizations.of(context)!;
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (context) => AppDialog(
      title: l10n.profile_logoutConfirmTitle,
      content: l10n.profile_logoutConfirmMessage,
      primaryActionText: l10n.profile_logout,
      onPrimaryAction: () => Navigator.of(context).pop(true),
      secondaryActionText: l10n.common_cancel,
      onSecondaryAction: () => Navigator.of(context).pop(false),
      isDestructive: true,
    ),
  );
  if (confirmed == true) {
    await ref.read(authProvider.notifier).logout();
  }
}
