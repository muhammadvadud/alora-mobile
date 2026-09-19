import 'package:flutter/material.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/management/catalog_admin/application/notifiers/product_form_state.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_chip.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';

import 'product_form_section_title.dart';

const List<String> _roomSuggestions = [
  'Mehmonxona',
  'Zal',
  'Oshxona',
  'Bolalar xonasi',
  'Ofis',
  'Kvartira',
];

/// Mahsulotning asosiy maydonlari (nom, kod, tur, tavsif) va tavsiya
/// etilgan xonalar chip'larini ko'rsatadi.
class ProductFormBasicSection extends StatelessWidget {
  const ProductFormBasicSection({
    super.key,
    required this.state,
    required this.isEnabled,
    required this.onChanged,
    required this.onToggleRoom,
  });

  final ProductFormState state;
  final bool isEnabled;
  final void Function(String field, Object? value) onChanged;
  final ValueChanged<String> onToggleRoom;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductFormSectionTitle(text: context.l10n.management_productFormBasic),
        const SizedBox(height: AppSpacing.s),
        AppTextField(
          hintText: context.l10n.management_productFormName,
          isEnabled: isEnabled,
          controller: TextEditingController(text: state.name),
          onChanged: (v) => onChanged('name', v),
          errorText: state.errors['name'],
        ),
        const SizedBox(height: AppSpacing.s),
        AppTextField(
          hintText: context.l10n.management_productFormCode,
          isEnabled: isEnabled,
          controller: TextEditingController(text: state.code),
          onChanged: (v) => onChanged('code', v),
          errorText: state.errors['code'],
        ),
        const SizedBox(height: AppSpacing.s),
        AppTextField(
          hintText: context.l10n.management_productFormCategory,
          isEnabled: isEnabled,
          controller: TextEditingController(text: state.category),
          onChanged: (v) => onChanged('category', v),
          errorText: state.errors['category'],
        ),
        const SizedBox(height: AppSpacing.s),
        AppTextField(
          hintText: context.l10n.management_productFormDescription,
          isEnabled: isEnabled,
          controller: TextEditingController(text: state.description),
          onChanged: (v) => onChanged('description', v),
          maxLines: 3,
        ),
        const SizedBox(height: AppSpacing.s),
        AppTextField(
          hintText: context.l10n.management_productFormFabricType,
          isEnabled: isEnabled,
          controller: TextEditingController(text: state.fabricType),
          onChanged: (v) => onChanged('fabricType', v),
        ),
        const SizedBox(height: AppSpacing.s),
        AppTextField(
          hintText: context.l10n.management_productFormComposition,
          isEnabled: isEnabled,
          controller: TextEditingController(text: state.composition),
          onChanged: (v) => onChanged('composition', v),
        ),
        const SizedBox(height: AppSpacing.s),
        AppTextField(
          hintText: context.l10n.management_productFormCare,
          isEnabled: isEnabled,
          controller: TextEditingController(text: state.care),
          onChanged: (v) => onChanged('care', v),
        ),
        const SizedBox(height: AppSpacing.s),
        AppTextField(
          hintText: context.l10n.management_productFormSegment,
          isEnabled: isEnabled,
          controller: TextEditingController(text: state.segment),
          onChanged: (v) => onChanged('segment', v),
        ),
        const SizedBox(height: AppSpacing.m),
        Text(
          context.l10n.management_productFormRecommendedRooms,
          style: context.text.bodyM,
        ),
        const SizedBox(height: AppSpacing.xs),
        Wrap(
          spacing: AppSpacing.s,
          runSpacing: AppSpacing.xs,
          children: [
            for (final room in _roomSuggestions)
              AppChip(
                label: room,
                state: state.recommendedRooms.contains(room)
                    ? AppChipState.selected
                    : AppChipState.unselected,
                onTap: isEnabled ? () => onToggleRoom(room) : null,
              ),
          ],
        ),
        const SizedBox(height: AppSpacing.l),
      ],
    );
  }
}
