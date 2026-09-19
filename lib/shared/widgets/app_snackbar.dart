import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/app/theme/app_shadows.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';

class AppSnackbar {
  static void show(
    BuildContext context, {
    required String message,
    bool isError = false,
    String? actionText,
    VoidCallback? onAction,
  }) {
    final colors = context.colors;
    final typography = context.text;

    final dotColor = isError ? colors.danger : colors.onInverse;

    final snackBar = SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      padding: EdgeInsets.zero,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: colors.inverse,
          borderRadius: AppRadius.inputBorder,
          boxShadow: AppShadows.md,
        ),
        child: Row(
          children: [
            Container(
              width: 7,
              height: 7,
              decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
            ),
            const SizedBox(width: AppSpacing.s),
            Expanded(
              child: Text(message, style: typography.bodyS.copyWith(color: colors.onInverse)),
            ),
            if (actionText != null && onAction != null) ...[
              const SizedBox(width: AppSpacing.m),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  onAction();
                },
                child: Text(actionText, style: typography.labelM.copyWith(color: colors.onInverse)),
              ),
            ],
          ],
        ),
      ),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 4),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
