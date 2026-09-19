import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';

class LetterAvatar extends StatelessWidget {
  final String name;

  const LetterAvatar({super.key, required this.name});

  String _getLetter() {
    if (name.isEmpty) return '?';
    return name.trimLeft()[0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(color: colors.accent, borderRadius: AppRadius.avatarBorder),
      alignment: Alignment.center,
      child: Text(
        _getLetter(),
        style: context.text.bodyL.copyWith(fontWeight: FontWeight.w600, color: colors.onAccent),
      ),
    );
  }
}
