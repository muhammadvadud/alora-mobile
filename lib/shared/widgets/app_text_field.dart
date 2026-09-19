import 'package:flutter/material.dart';
import "package:alora_mobile/app/theme/app_radius.dart";
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

enum AppTextFieldType { text, password, number, search, multiline }

class AppTextField extends StatefulWidget {
  final String? label;
  final String? hintText;
  final String? errorText;
  final bool isEnabled;
  final AppTextFieldType type;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final int? maxLines;

  const AppTextField({
    super.key,
    this.label,
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
    final typography = context.text;

    final innerField = _InnerTextField(
      widget: widget,
      obscureText: _obscureText,
      onToggleObscure: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          Text(widget.label!, style: typography.labelS.copyWith(color: colors.textSecondary)),
          const SizedBox(height: 6),
        ],
        innerField,
        if (widget.errorText != null) ...[
          const SizedBox(height: 4),
          Text(widget.errorText!, style: typography.labelS.copyWith(color: colors.danger)),
        ],
      ],
    );
  }
}

class _InnerTextField extends StatelessWidget {
  final AppTextField widget;
  final bool obscureText;
  final VoidCallback onToggleObscure;

  const _InnerTextField({
    required this.widget,
    required this.obscureText,
    required this.onToggleObscure,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    Widget? suffixIcon;
    Widget? prefixIcon;

    if (widget.type == AppTextFieldType.password) {
      suffixIcon = IconButton(
        icon: Icon(
          obscureText ? LucideIcons.eye : LucideIcons.eyeOff,
          color: colors.textSecondary,
          size: 20,
        ),
        onPressed: onToggleObscure,
      );
    } else if (widget.type == AppTextFieldType.search) {
      prefixIcon = Icon(LucideIcons.search, color: colors.textSecondary, size: 20);
    }

    final int effectiveMaxLines = widget.type == AppTextFieldType.multiline
        ? (widget.maxLines ?? 4)
        : 1;
    final bool effectiveObscureText = widget.type == AppTextFieldType.password
        ? obscureText
        : false;
    TextInputType keyboardType = TextInputType.text;

    if (widget.type == AppTextFieldType.number) {
      keyboardType = const TextInputType.numberWithOptions(decimal: true);
    } else if (widget.type == AppTextFieldType.multiline) {
      keyboardType = TextInputType.multiline;
    }

    return SizedBox(
      height: widget.type == AppTextFieldType.multiline ? null : 44,
      child: TextField(
        controller: widget.controller,
        enabled: widget.isEnabled,
        obscureText: effectiveObscureText,
        keyboardType: keyboardType,
        maxLines: effectiveMaxLines,
        minLines: widget.type == AppTextFieldType.multiline ? 1 : null,
        onChanged: widget.onChanged,
        style: typography.bodyL.copyWith(
          color: widget.isEnabled ? colors.textPrimary : colors.textDisabled,
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          fillColor: widget.isEnabled ? colors.surfaceMuted : colors.surfaceDisabled,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
          errorStyle: const TextStyle(height: 0, fontSize: 0),
          border: widget.type == AppTextFieldType.search
              ? OutlineInputBorder(
                  borderRadius: AppRadius.pillBorder,
                  borderSide: BorderSide.none,
                )
              : null,
          enabledBorder: widget.type == AppTextFieldType.search
              ? OutlineInputBorder(
                  borderRadius: AppRadius.pillBorder,
                  borderSide: BorderSide.none,
                )
              : null,
          focusedBorder: widget.type == AppTextFieldType.search
              ? OutlineInputBorder(
                  borderRadius: AppRadius.pillBorder,
                  borderSide: BorderSide(color: colors.accent, width: 2), // Should use accent, but I will get it via colors.accent. Wait, Colors.blue is a placeholder, let's use colors.accent
                )
              : null,
        ),
      ),
    );
  }
}
