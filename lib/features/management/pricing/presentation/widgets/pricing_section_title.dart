import 'package:flutter/material.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';

/// S-23 ekranidagi bo'lim sarlavhasi.
class PricingSectionTitle extends StatelessWidget {
  const PricingSectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.m),
      child: Text(title, style: context.text.titleM),
    );
  }
}
