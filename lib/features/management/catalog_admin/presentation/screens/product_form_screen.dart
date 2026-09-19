import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/features/catalog/application/catalog_notifier.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product.dart';
import 'package:alora_mobile/features/management/catalog_admin/application/notifiers/product_form_notifier.dart';
import 'package:alora_mobile/features/management/catalog_admin/presentation/widgets/product_form_basic_section.dart';
import 'package:alora_mobile/features/management/catalog_admin/presentation/widgets/product_form_price_section.dart';
import 'package:alora_mobile/features/management/catalog_admin/presentation/widgets/product_form_variants_section.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/app_snackbar.dart';

/// Mahsulot yaratish / tahrirlash formasi (S-22).
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
            ProductFormBasicSection(
              state: state,
              isEnabled: !state.isSaving,
              onChanged: notifier.updateField,
              onToggleRoom: notifier.toggleRecommendedRoom,
            ),
            ProductFormPriceSection(
              state: state,
              isEnabled: !state.isSaving,
              onChanged: notifier.updateField,
            ),
            ProductFormVariantsSection(
              state: state,
              isEnabled: !state.isSaving,
              onAddVariant: notifier.addVariant,
              onChanged: notifier.updateVariant,
              onRemoveVariant: (index) => _confirmRemoveVariant(notifier, index),
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

  Future<void> _confirmRemoveVariant(ProductFormNotifier notifier, int index) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(dialogContext.l10n.management_productFormRemoveVariantTitle),
        content: Text(dialogContext.l10n.management_productFormRemoveVariantMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(dialogContext.l10n.common_cancel),
          ),
          AppButton.destructive(
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
      AppSnackbar.show(context, message: context.l10n.management_productFormSaved);
    }
  }
}
