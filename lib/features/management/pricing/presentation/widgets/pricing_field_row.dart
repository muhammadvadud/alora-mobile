import 'package:flutter/material.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';

/// Koeffitsient qatorini chap tomonda label/tavsif, o'ngda tahrir maydoni
/// bilan bir satrga joylashtiradi.
class PricingFieldRow extends StatelessWidget {
  const PricingFieldRow({
    super.key,
    required this.label,
    required this.description,
    required this.field,
  });

  final String label;
  final String description;
  final Widget field;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: context.text.bodyM),
                if (description.isNotEmpty)
                  Text(
                    description,
                    style: context.text.bodyS.copyWith(color: context.colors.textSecondary),
                  ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.m),
          SizedBox(width: 110, child: field),
        ],
      ),
    );
  }
}
