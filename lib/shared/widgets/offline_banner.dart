import 'package:flutter/material.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';

class OfflineBanner extends StatelessWidget {
  const OfflineBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;
    final l10n = AppLocalizations.of(context)!;

    return Container(
      width: double.infinity,
      height: 40,
      color: colors.inverse,
      alignment: Alignment.center,
      child: Text(
        l10n.common_noInternet,
        style: typography.bodyS.copyWith(color: colors.onInverse),
        textAlign: TextAlign.center,
      ),
    );
  }
}
