import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';

class TranscriptBlock extends StatelessWidget {
  final String text;
  final bool isFinal;

  const TranscriptBlock({super.key, required this.text, this.isFinal = false});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.m),
      decoration: BoxDecoration(
        color: isFinal ? colors.surface : colors.background,
        borderRadius: const BorderRadius.all(Radius.circular(AppRadius.card)),
        border: Border.all(color: colors.borderSubtle),
      ),
      child: Text(
        text,
        style: context.text.bodyM.copyWith(
          color: isFinal ? colors.textPrimary : colors.textSecondary,
        ),
      ),
    );
  }
}
