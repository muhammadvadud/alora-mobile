import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';

enum AppTextFieldType { text, password, number, search, multiline }

class AppTextField extends StatefulWidget {
  final String? hintText;
  final String? errorText;
  final bool isEnabled;
  final AppTextFieldType type;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final int? maxLines;

  const AppTextField({
    super.key,
    this.hintText,
    this.errorText,
    this.isEnabled = true,
    this.type = AppTextFieldType.text,
    this.controller,
    this.onChanged,
    this.maxLines,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    Widget? suffixIcon;
    Widget? prefixIcon;

    if (widget.type == AppTextFieldType.password) {
      suffixIcon = IconButton(
        icon: Icon(
          _obscureText ? AppIcons.eye : AppIcons.eyeOff,
          color: colors.textSecondary,
          size: 20,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      );
    } else if (widget.type == AppTextFieldType.search) {
      prefixIcon = Icon(AppIcons.search, color: colors.textSecondary, size: 20);
    }

    final int effectiveMaxLines = widget.type == AppTextFieldType.multiline
        ? (widget.maxLines ?? 4)
        : 1;
    final bool effectiveObscureText = widget.type == AppTextFieldType.password
        ? _obscureText
        : false;
    TextInputType keyboardType = TextInputType.text;

    switch (widget.type) {
      case AppTextFieldType.number:
        keyboardType = const TextInputType.numberWithOptions(decimal: true);
        break;
      case AppTextFieldType.multiline:
        keyboardType = TextInputType.multiline;
        break;
      case AppTextFieldType.search:
      case AppTextFieldType.text:
      case AppTextFieldType.password:
        break;
    }

    return SizedBox(
      height: widget.type == AppTextFieldType.multiline
          ? null
          : (widget.errorText != null ? 64 : 46),
      child: TextField(
        controller: widget.controller,
        enabled: widget.isEnabled,
        obscureText: effectiveObscureText,
        keyboardType: keyboardType,
        maxLines: effectiveMaxLines,
        minLines: widget.type == AppTextFieldType.multiline ? 1 : null,
        onChanged: widget.onChanged,
        style: context.text.bodyM.copyWith(
          color: widget.isEnabled ? colors.textPrimary : colors.textDisabled,
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          errorText: widget.errorText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          fillColor: widget.isEnabled ? colors.surface : colors.surfaceDisabled,
          // Other properties are defined in AppTheme inputDecorationTheme
        ),
      ),
    );
  }
}
