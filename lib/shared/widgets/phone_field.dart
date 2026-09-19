import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';

class PhoneField extends StatelessWidget {
  final String? label;
  final String? errorText;
  final bool isEnabled;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const PhoneField({
    super.key,
    this.label,
    this.errorText,
    this.isEnabled = true,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    final maskFormatter = MaskTextInputFormatter(
      mask: '+998 ## ### ## ##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );

    final Widget textField = SizedBox(
      height: 44,
      child: TextField(
        controller: controller,
        enabled: isEnabled,
        keyboardType: TextInputType.phone,
        inputFormatters: [maskFormatter],
        onChanged: onChanged,
        style: typography.bodyL.copyWith(
          color: isEnabled ? colors.textPrimary : colors.textDisabled,
        ),
        decoration: InputDecoration(
          hintText: '+998 __ ___ __ __',
          fillColor: isEnabled ? colors.surfaceMuted : colors.surfaceDisabled,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
          errorStyle: const TextStyle(height: 0, fontSize: 0),
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(label!, style: typography.labelS.copyWith(color: colors.textSecondary)),
          const SizedBox(height: 6),
        ],
        textField,
        if (errorText != null) ...[
          const SizedBox(height: 4),
          Text(errorText!, style: typography.labelS.copyWith(color: colors.danger)),
        ],
      ],
    );
  }
}
