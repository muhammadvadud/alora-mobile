import 'package:flutter/material.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/management/catalog_admin/application/notifiers/product_form_state.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';

import 'product_form_section_title.dart';
import 'product_form_variant_card.dart';

/// Variantlar bo'limi: qo'shish tugmasi, variant kartochkalari va bo'sh
/// holat xabari.
class ProductFormVariantsSection extends StatelessWidget {
  const ProductFormVariantsSection({
    super.key,
    required this.state,
    required this.isEnabled,
    required this.onAddVariant,
    required this.onChanged,
    required this.onRemoveVariant,
  });

  final ProductFormState state;
  final bool isEnabled;
  final VoidCallback onAddVariant;
  final void Function(int index, String field, Object? value) onChanged;
  final ValueChanged<int> onRemoveVariant;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: ProductFormSectionTitle(
                text: context.l10n.management_productFormVariants,
              ),
            ),
            const SizedBox(width: AppSpacing.s),
            Flexible(
              child: AppButton.secondary(
                text: context.l10n.management_productFormAddVariant,
                onPressed: isEnabled ? onAddVariant : null,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.s),
        if (state.variants.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.m),
            child: Text(
              context.l10n.management_productFormVariantsEmpty,
              style: context.text.bodyM.copyWith(
                color: context.colors.textSecondary,
              ),
            ),
          )
        else
          for (int i = 0; i < state.variants.length; i++)
            ProductFormVariantCard(
              index: i,
              variant: state.variants[i],
              isEnabled: isEnabled,
              errors: state.errors,
              onChanged: (field, value) => onChanged(i, field, value),
              onRemove: () => onRemoveVariant(i),
            ),
      ],
    );
  }
}
