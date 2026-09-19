import 'package:flutter/material.dart';

import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';

/// Xodimning katta avatari (dizaynda 56×56, radius 16).
class EmployeeAvatar extends StatelessWidget {
  final String name;
  final double size;

  const EmployeeAvatar({super.key, required this.name, this.size = 56});

  String _getLetter() {
    if (name.isEmpty) return '?';
    return name.trimLeft()[0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: colors.accent, borderRadius: AppRadius.cardBorder),
      alignment: Alignment.center,
      child: Text(_getLetter(), style: context.text.titleL.copyWith(color: colors.onAccent)),
    );
  }
}
