import 'package:flutter/material.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/management/catalog_admin/application/notifiers/product_form_state.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';

import 'price_unit_selector.dart';
import 'product_form_section_title.dart';

/// Asosiy narx bo'limi: narx maydoni, birlik tanlovi va forma xatosi.
class ProductFormPriceSection extends StatelessWidget {
  const ProductFormPriceSection({
    super.key,
    required this.state,
    required this.isEnabled,
    required this.onChanged,
  });

  final ProductFormState state;
  final bool isEnabled;
  final void Function(String field, Object? value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductFormSectionTitle(text: context.l10n.management_productFormBasePrice),
        const SizedBox(height: AppSpacing.s),
        AppTextField(
          hintText: context.l10n.management_productFormPrice,
          isEnabled: isEnabled,
          type: AppTextFieldType.number,
          controller: TextEditingController(text: state.price),
          onChanged: (v) => onChanged('price', v),
          errorText: state.errors['price'],
        ),
        const SizedBox(height: AppSpacing.s),
        PriceUnitSelector(
          unit: state.priceUnit,
          isEnabled: isEnabled,
          onChanged: (u) => onChanged('priceUnit', u.name),
        ),
        if (state.errors['form'] != null) ...[
          const SizedBox(height: AppSpacing.s),
          Text(
            state.errors['form']!,
            style: context.text.bodyS.copyWith(color: context.colors.danger),
          ),
        ],
        const SizedBox(height: AppSpacing.l),
      ],
    );
  }
}
