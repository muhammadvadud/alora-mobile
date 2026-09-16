import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';

class PhoneField extends StatelessWidget {
  final String? errorText;
  final bool isEnabled;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const PhoneField({
    super.key,
    this.errorText,
    this.isEnabled = true,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final maskFormatter = MaskTextInputFormatter(
      mask: '+998 ## ### ## ##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );

    return SizedBox(
      height: errorText != null ? 64 : 46,
      child: TextField(
        controller: controller,
        enabled: isEnabled,
        keyboardType: TextInputType.phone,
        inputFormatters: [maskFormatter],
        onChanged: onChanged,
        style: context.text.bodyM.copyWith(
          color: isEnabled ? colors.textPrimary : colors.textDisabled,
        ),
        decoration: InputDecoration(
          hintText: '+998 __ ___ __ __',
          errorText: errorText,
          fillColor: isEnabled ? colors.surface : colors.surfaceDisabled,
        ),
      ),
    );
  }
}
