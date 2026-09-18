import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/catalog/application/catalog_notifier.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product.dart';
import 'package:alora_mobile/features/management/catalog_admin/application/notifiers/product_form_notifier.dart';
import 'package:alora_mobile/features/management/catalog_admin/data/dto/catalog_write_dtos.dart';
import 'package:alora_mobile/features/auth/application/auth_notifier.dart';
import 'package:alora_mobile/features/auth/application/auth_state.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/models/price_unit.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_chip.dart';
import 'package:alora_mobile/shared/widgets/app_snackbar.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';
import 'package:alora_mobile/shared/widgets/color_dot.dart';
import 'package:alora_mobile/shared/widgets/role_gate.dart';
import 'package:alora_mobile/shared/models/role.dart';

const List<String> _roomSuggestions = [
  'Mehmonxona',
  'Zal',
  'Oshxona',
  'Bolalar xonasi',
  'Ofis',
  'Kvartira',
];

class ProductFormScreen extends ConsumerStatefulWidget {
  final String? productId;
  const ProductFormScreen({super.key, this.productId});

  @override
  ConsumerState<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends ConsumerState<ProductFormScreen> {
  bool _loaded = false;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(productFormProvider);
    final notifier = ref.read(productFormProvider.notifier);

    if (widget.productId != null && !_loaded) {
      Product? matched;
      final products = ref.watch(catalogProvider).products;
      for (final p in products) {
        if (p.id == widget.productId) {
          matched = p;
          break;
        }
      }
      if (matched != null) {
        _loaded = true;
        notifier.load(matched);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.productId == null
              ? context.l10n.management_productFormTitle
              : context.l10n.management_productFormEditTitle,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: AppSpacing.m,
          right: AppSpacing.m,
          top: AppSpacing.m,
          bottom: AppSpacing.m + MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionTitle(text: context.l10n.management_productFormBasic),
            const SizedBox(height: AppSpacing.s),
            AppTextField(
              hintText: context.l10n.management_productFormName,
              isEnabled: !state.isSaving,
              controller: TextEditingController(text: state.name),
              onChanged: (v) => notifier.updateField('name', v),
              errorText: state.errors['name'],
            ),
            const SizedBox(height: AppSpacing.s),
            AppTextField(
              hintText: context.l10n.management_productFormCode,
              isEnabled: !state.isSaving,
              controller: TextEditingController(text: state.code),
              onChanged: (v) => notifier.updateField('code', v),
              errorText: state.errors['code'],
            ),
            const SizedBox(height: AppSpacing.s),
            AppTextField(
              hintText: context.l10n.management_productFormCategory,
              isEnabled: !state.isSaving,
              controller: TextEditingController(text: state.category),
              onChanged: (v) => notifier.updateField('category', v),
              errorText: state.errors['category'],
            ),
            const SizedBox(height: AppSpacing.s),
            AppTextField(
              hintText: context.l10n.management_productFormDescription,
              isEnabled: !state.isSaving,
              controller: TextEditingController(text: state.description),
              onChanged: (v) => notifier.updateField('description', v),
              maxLines: 3,
            ),
            const SizedBox(height: AppSpacing.s),
            AppTextField(
              hintText: context.l10n.management_productFormFabricType,
              isEnabled: !state.isSaving,
              controller: TextEditingController(text: state.fabricType),
              onChanged: (v) => notifier.updateField('fabricType', v),
            ),
            const SizedBox(height: AppSpacing.s),
            AppTextField(
              hintText: context.l10n.management_productFormComposition,
              isEnabled: !state.isSaving,
              controller: TextEditingController(text: state.composition),
              onChanged: (v) => notifier.updateField('composition', v),
            ),
            const SizedBox(height: AppSpacing.s),
            AppTextField(
              hintText: context.l10n.management_productFormCare,
              isEnabled: !state.isSaving,
              controller: TextEditingController(text: state.care),
              onChanged: (v) => notifier.updateField('care', v),
            ),
            const SizedBox(height: AppSpacing.s),
            AppTextField(
              hintText: context.l10n.management_productFormSegment,
              isEnabled: !state.isSaving,
              controller: TextEditingController(text: state.segment),
              onChanged: (v) => notifier.updateField('segment', v),
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
                    onTap: state.isSaving
                        ? null
                        : () => notifier.toggleRecommendedRoom(room),
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.l),
            _SectionTitle(text: context.l10n.management_productFormBasePrice),
            const SizedBox(height: AppSpacing.s),
            AppTextField(
              hintText: context.l10n.management_productFormPrice,
              isEnabled: !state.isSaving,
              type: AppTextFieldType.number,
              controller: TextEditingController(text: state.price),
              onChanged: (v) => notifier.updateField('price', v),
              errorText: state.errors['price'],
            ),
            const SizedBox(height: AppSpacing.s),
            _UnitSelector(
              unit: state.priceUnit,
              isEnabled: !state.isSaving,
              onChanged: (u) => notifier.updateField('priceUnit', u.name),
            ),
            if (state.errors['form'] != null) ...[
              const SizedBox(height: AppSpacing.s),
              Text(
                state.errors['form']!,
                style: context.text.bodyS.copyWith(
                  color: context.colors.danger,
                ),
              ),
            ],
            const SizedBox(height: AppSpacing.l),
            Row(
              children: [
                Expanded(
                  child: _SectionTitle(
                    text: context.l10n.management_productFormVariants,
                  ),
                ),
                const SizedBox(width: AppSpacing.s),
                Flexible(
                  child: AppButton.secondary(
                    text: context.l10n.management_productFormAddVariant,
                    onPressed: state.isSaving ? null : notifier.addVariant,
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
                _VariantCard(
                  index: i,
                  variant: state.variants[i],
                  isEnabled: !state.isSaving,
                  errors: state.errors,
                  onChanged: (field, value) =>
                      notifier.updateVariant(i, field, value),
                  onRemove: () => _confirmRemoveVariant(notifier, i),
                ),
            const SizedBox(height: AppSpacing.l),
            AppButton(
              text: context.l10n.common_save,
              isLoading: state.isSaving,
              isEnabled: state.isDirty && !state.isSaving,
              onPressed: () => _save(notifier),
            ),
            const SizedBox(height: AppSpacing.l),
          ],
        ),
      ),
    );
  }

  Future<void> _confirmRemoveVariant(
    ProductFormNotifier notifier,
    int index,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(
          dialogContext.l10n.management_productFormRemoveVariantTitle,
        ),
        content: Text(
          dialogContext.l10n.management_productFormRemoveVariantMessage,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(dialogContext.l10n.common_cancel),
          ),
          AppButton.dialogDestructive(
            text: dialogContext.l10n.management_productFormRemoveVariant,
            onPressed: () => Navigator.pop(dialogContext, true),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      notifier.removeVariant(index);
    }
  }

  Future<void> _save(ProductFormNotifier notifier) async {
    final ok = await notifier.save(productId: widget.productId);
    if (ok && mounted) {
      AppSnackbar.show(
        context,
        message: context.l10n.management_productFormSaved,
      );
    }
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.text.bodyM.copyWith(fontWeight: FontWeight.w700),
    );
  }
}

class _UnitSelector extends StatelessWidget {
  final PriceUnit unit;
  final bool isEnabled;
  final ValueChanged<PriceUnit> onChanged;
  const _UnitSelector({
    required this.unit,
    required this.isEnabled,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.s,
      runSpacing: AppSpacing.xs,
      children: [
        for (final u in PriceUnit.values)
          AppChip(
            label: switch (u) {
              PriceUnit.perSqm => context.l10n.price_unit_perSqm,
              PriceUnit.perPiece => context.l10n.price_unit_perPiece,
              PriceUnit.perMeter => context.l10n.price_unit_perMeter,
              PriceUnit.unknown => context.l10n.price_unit_unknown,
            },
            state: u == unit ? AppChipState.selected : AppChipState.unselected,
            onTap: isEnabled ? () => onChanged(u) : null,
          ),
      ],
    );
  }
}

class _VariantCard extends ConsumerWidget {
  final int index;
  final VariantWriteDto variant;
  final bool isEnabled;
  final Map<String, String> errors;
  final void Function(String, dynamic) onChanged;
  final VoidCallback onRemove;

  const _VariantCard({
    required this.index,
    required this.variant,
    required this.isEnabled,
    required this.errors,
    required this.onChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.m),
      padding: const EdgeInsets.all(AppSpacing.m),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: AppRadius.cardBorder,
        border: Border.all(color: context.colors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ColorDot(colorHex: variant.colorHex),
              const SizedBox(width: AppSpacing.s),
              Expanded(
                child: Text(
                  context.l10n.management_productFormVariantLabel(index + 1),
                  style: context.text.bodyM.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              IconButton(
                onPressed: isEnabled ? onRemove : null,
                icon: const Icon(LucideIcons.trash),
                color: context.colors.danger,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.s),
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
          AppTextField(
            hintText: context.l10n.management_productFormWidth,
            isEnabled: isEnabled,
            type: AppTextFieldType.number,
            controller: TextEditingController(
              text: variant.widthM?.toString() ?? '',
            ),
            onChanged: (v) =>
                onChanged('widthM', num.tryParse(v == '' ? '0' : v) ?? 0),
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
                .maybeWhen(
                  authenticated: (user) => user.role,
                  orElse: () => Role.employee,
                ),
            child: Column(
              children: [
                AppTextField(
                  hintText: context.l10n.management_productFormCost,
                  isEnabled: isEnabled,
                  type: AppTextFieldType.number,
                  controller: TextEditingController(
                    text: variant.costPrice ?? '',
                  ),
                  onChanged: (v) => onChanged('costPrice', v),
                ),
                const SizedBox(height: AppSpacing.s),
              ],
            ),
          ),
          _UnitSelector(
            unit: variant.priceUnit,
            isEnabled: isEnabled,
            onChanged: (u) => onChanged('priceUnit', u.name),
          ),
          const SizedBox(height: AppSpacing.s),
          Material(
            type: MaterialType.transparency,
            child: SwitchListTile(
              contentPadding: EdgeInsets.zero,
              dense: true,
              title: Text(
                context.l10n.management_productFormIsActive,
                style: context.text.bodyM,
              ),
              value: variant.isActive ?? true,
              onChanged: isEnabled ? (v) => onChanged('isActive', v) : null,
            ),
          ),
        ],
      ),
    );
  }
}
