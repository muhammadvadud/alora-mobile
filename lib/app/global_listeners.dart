import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:alora_mobile/core/connectivity/offline_flush_notifier.dart';
import 'package:alora_mobile/features/auth/application/session_expired_notifier.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:alora_mobile/shared/widgets/app_snackbar.dart';

/// Global signal'larni tinglaydi va UI qatlamida ko'rsatadi.
class GlobalListeners extends ConsumerWidget {
  final Widget child;

  const GlobalListeners({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(offlineFlushMessagesProvider, (previous, next) {
      if (next.isNotEmpty) {
        AppSnackbar.show(context, message: context.l10n.offline_flushFailed, isError: true);
        ref.read(offlineFlushMessagesProvider.notifier).clear();
      }
    });

    ref.listen(sessionExpiredProvider, (previous, next) {
      final prevCount = previous ?? 0;
      if (next > prevCount) {
        AppSnackbar.show(context, message: context.l10n.error_auth, isError: true);
      }
    });

    return child;
  }
}
