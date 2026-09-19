import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/app/theme/app_typography.dart';

String _defaultMoneyFormatter(int amount) {
  final str = amount.toString();
  final buffer = StringBuffer();
  for (int i = 0; i < str.length; i++) {
    if (i > 0 && (str.length - i) % 3 == 0) {
      buffer.write(' ');
    }
    buffer.write(str[i]);
  }
  return buffer.toString();
}

class MoneyText extends StatelessWidget {
  final int amount;
  final TextStyle? style;
  final TextStyle? suffixStyle;
  final String Function(int) formatter;
  final String suffix;

  const MoneyText({
    super.key,
    required this.amount,
    this.style,
    this.suffixStyle,
    this.formatter = _defaultMoneyFormatter,
    this.suffix = " so'm",
  });

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = style ?? context.text.bodyL;
    final effectiveSuffixStyle =
        suffixStyle ?? context.text.bodyS.copyWith(color: context.colors.textSecondary);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(formatter(amount), style: effectiveStyle.tabular),
        Text(suffix, style: effectiveSuffixStyle),
      ],
    );
  }
}
