import 'package:flutter/material.dart';
import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/shared/models/price_unit.dart';
import 'package:alora_mobile/shared/widgets/money_text.dart';

class UnitText extends StatelessWidget {
  final int amount;
  final PriceUnit unit;
  final TextStyle? style;
  final TextStyle? suffixStyle;

  const UnitText({
    super.key,
    required this.amount,
    required this.unit,
    this.style,
    this.suffixStyle,
  });

  String _getSuffix(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (unit) {
      case PriceUnit.perSqm:
        return ' ${l10n.price_unit_perSqm}';
      case PriceUnit.perPiece:
        return ' ${l10n.price_unit_perPiece}';
      case PriceUnit.perMeter:
        return ' ${l10n.price_unit_perMeter}';
      case PriceUnit.unknown:
        return ' ${l10n.price_unit_unknown}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MoneyText(
      amount: amount,
      style: style,
      suffixStyle: suffixStyle,
      suffix: _getSuffix(context),
    );
  }
}
