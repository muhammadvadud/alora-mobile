import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/widgets/app_card.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/auth/application/auth_notifier.dart';
import 'package:alora_mobile/features/auth/application/auth_state.dart';
import 'package:alora_mobile/features/management/catalog_admin/data/dto/catalog_write_dtos.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/models/role.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';
import 'package:alora_mobile/shared/widgets/color_dot.dart';
import 'package:alora_mobile/shared/widgets/role_gate.dart';

import 'price_unit_selector.dart';

class ProductFormVariantCard extends ConsumerWidget {
  const ProductFormVariantCard({
    super.key,
    required this.index,
    required this.variant,
    required this.isEnabled,
    required this.errors,
    required this.onChanged,
    required this.onRemove,
  });

  final int index;
  final VariantWriteDto variant;
  final bool isEnabled;
  final Map<String, String> errors;
  final void Function(String field, Object? value) onChanged;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.m),
      child: AppCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _VariantHeader(
              index: index,
              variant: variant,
              isEnabled: isEnabled,
              onRemove: onRemove,
            ),
            const SizedBox(height: AppSpacing.s),
            _VariantBasicFields(
              variant: variant,
              isEnabled: isEnabled,
              errors: errors,
              index: index,
              onChanged: onChanged,
            ),
            _VariantMetricsFields(
              variant: variant,
              isEnabled: isEnabled,
              errors: errors,
              index: index,
              onChanged: onChanged,
              ref: ref,
            ),
            const SizedBox(height: AppSpacing.s),
            Material(
              type: MaterialType.transparency,
              child: SwitchListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                title: Text(context.l10n.management_productFormIsActive, style: context.text.bodyM),
                value: variant.isActive ?? true,
                onChanged: isEnabled ? (v) => onChanged('isActive', v) : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VariantHeader extends StatelessWidget {
  final int index;
  final VariantWriteDto variant;
  final bool isEnabled;
  final VoidCallback onRemove;

  const _VariantHeader({
    required this.index,
    required this.variant,
    required this.isEnabled,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ColorDot(colorHex: variant.colorHex),
        const SizedBox(width: AppSpacing.s),
        Expanded(
          child: Text(
            context.l10n.management_productFormVariantLabel(index + 1),
            style: context.text.bodyM.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        IconButton(
          onPressed: isEnabled ? onRemove : null,
          icon: const Icon(AppIcons.trash),
          color: context.colors.danger,
        ),
      ],
    );
  }
}

class _VariantBasicFields extends StatelessWidget {
  final VariantWriteDto variant;
  final bool isEnabled;
  final Map<String, String> errors;
  final int index;
  final void Function(String field, Object? value) onChanged;

  const _VariantBasicFields({
    required this.variant,
    required this.isEnabled,
    required this.errors,
    required this.index,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          hintText: context.l10n.management_productFormSku,
          isEnabled: isEnabled,
          controller: TextEditingController(text: variant.sku),
          onChanged: (v) => onChanged('sku', v),
          errorText: errors['variants.$index.sku'],
        ),
        const SizedBox(height: AppSpacing.s),
        AppTextField(
          hintText: context.l10n.management_productFormColorName,
          isEnabled: isEnabled,
          controller: TextEditingController(text: variant.colorName),
          onChanged: (v) => onChanged('colorName', v),
        ),
        const SizedBox(height: AppSpacing.s),
        AppTextField(
          hintText: context.l10n.management_productFormColorHex,
          isEnabled: isEnabled,
          controller: TextEditingController(text: variant.colorHex),
          onChanged: (v) => onChanged('colorHex', v),
          errorText: errors['variants.$index.color_hex'],
        ),
        const SizedBox(height: AppSpacing.s),
      ],
    );
  }
}

class _VariantMetricsFields extends StatelessWidget {
  final VariantWriteDto variant;
  final bool isEnabled;
  final Map<String, String> errors;
  final int index;
  final void Function(String field, Object? value) onChanged;
  final WidgetRef ref;

  const _VariantMetricsFields({
    required this.variant,
    required this.isEnabled,
    required this.errors,
    required this.index,
    required this.onChanged,
    required this.ref,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          hintText: context.l10n.management_productFormWidth,
          isEnabled: isEnabled,
          type: AppTextFieldType.number,
          controller: TextEditingController(text: variant.widthM?.toString() ?? ''),
          onChanged: (v) => onChanged('widthM', num.tryParse(v == '' ? '0' : v) ?? 0),
        ),
        const SizedBox(height: AppSpacing.s),
        AppTextField(
          hintText: context.l10n.management_productFormPrice,
          isEnabled: isEnabled,
          type: AppTextFieldType.number,
          controller: TextEditingController(text: variant.price),
          onChanged: (v) => onChanged('price', v),
          errorText: errors['variants.$index.price'],
        ),
        const SizedBox(height: AppSpacing.s),
        RoleGate(
          minRole: Role.admin,
          currentRole: ref
              .watch(authProvider)
              .maybeWhen(authenticated: (user) => user.role, orElse: () => Role.employee),
          child: Column(
            children: [
              AppTextField(
                hintText: context.l10n.management_productFormCost,
                isEnabled: isEnabled,
                type: AppTextFieldType.number,
                controller: TextEditingController(text: variant.costPrice ?? ''),
                onChanged: (v) => onChanged('costPrice', v),
              ),
              const SizedBox(height: AppSpacing.s),
            ],
          ),
        ),
        PriceUnitSelector(
          unit: variant.priceUnit,
          isEnabled: isEnabled,
          onChanged: (u) => onChanged('priceUnit', u.name),
        ),
      ],
    );
  }
}
