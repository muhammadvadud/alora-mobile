import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/features/auth/application/auth_notifier.dart' show authProvider;
import 'package:alora_mobile/shared/widgets/app_dialog.dart';
import 'package:alora_mobile/shared/widgets/app_list_tile.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';

/// "Chiqish" tugmasi — tasdiqlash dialogi bilan.
class LogoutButton extends ConsumerWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    return AppListTile(
      title: l10n.profile_logout,
      leading: Icon(LucideIcons.logOut, color: context.colors.danger, size: 24),
      onTap: () => confirmLogout(context, ref),
      showDivider: false,
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
