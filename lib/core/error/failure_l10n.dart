import 'package:flutter/widgets.dart';

import '../../app/l10n/app_localizations.dart';
import 'failure.dart';

extension FailureL10nX on Failure {
  /// Failure holatini foydalanuvchi tushunadigan tilda (l10n orqali) qaytaradi
  String localizedMessage(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return map(
      network: (_) => l10n.error_network,
      validation: (f) => f.detail,
      auth: (_) => l10n.error_auth,
      permission: (_) => l10n.error_permission,
      notFound: (_) => l10n.error_notFound,
      limit: (f) => f.detail.isNotEmpty ? f.detail : l10n.error_limit,
      serviceUnavailable: (_) => l10n.error_serviceUnavailable,
      server: (_) => l10n.error_server,
      unknown: (f) => f.detail.isNotEmpty ? f.detail : l10n.error_unknown,
    );
  }
}
