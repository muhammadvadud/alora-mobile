import 'package:flutter/widgets.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';

extension L10nBuildContextX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
