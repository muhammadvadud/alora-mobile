import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/app/theme/app_shadows.dart';

class ScrollDownButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ScrollDownButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Semantics(
      button: true,
      label: 'Scroll down',
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkResponse(
          onTap: onPressed,
          radius: 24,
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: colors.surface,
              shape: BoxShape.circle,
              boxShadow: AppShadows.sm,
            ),
            child: Icon(LucideIcons.arrowDown, size: 16, color: colors.textPrimary),
          ),
        ),
      ),
    );
  }
}
