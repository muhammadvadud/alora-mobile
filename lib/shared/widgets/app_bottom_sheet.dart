import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';

class AppBottomSheet extends StatelessWidget {
  final String title;
  final Widget content;
  final Widget? action;

  const AppBottomSheet({super.key, required this.title, required this.content, this.action});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    return Container(
      padding: EdgeInsets.only(
        left: AppSpacing.l,
        right: AppSpacing.l,
        top: AppSpacing.m,
        bottom: MediaQuery.of(context).viewInsets.bottom + AppSpacing.l,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(color: colors.border, borderRadius: AppRadius.waveBorder),
            ),
          ),
          const SizedBox(height: AppSpacing.l),
          Text(title, style: typography.titleM),
          const SizedBox(height: AppSpacing.l),
          Flexible(child: SingleChildScrollView(child: content)),
          if (action != null) ...[const SizedBox(height: AppSpacing.l), action!],
        ],
      ),
    );
  }
}
