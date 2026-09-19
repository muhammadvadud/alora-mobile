import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';

class AppRadio extends StatelessWidget {
  final bool isSelected;
  final VoidCallback? onTap;

  const AppRadio({super.key, required this.isSelected, this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Semantics(
      checked: isSelected,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: isSelected ? colors.info : colors.border, width: 1.5),
          ),
          child: isSelected
              ? Center(
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(color: colors.info, shape: BoxShape.circle),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
