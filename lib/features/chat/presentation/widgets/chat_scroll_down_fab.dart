import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';

/// Pastga surilganda ko'rinadigan "Yangi xabar" share'li tugma.
class ChatScrollDownFab extends StatelessWidget {
  const ChatScrollDownFab({
    super.key,
    required this.onPressed,
    required this.label,
  });

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return FloatingActionButton.extended(
      onPressed: onPressed,
      backgroundColor: colors.surface,
      foregroundColor: colors.textPrimary,
      label: Text(label),
    );
  }
}
