import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/router/routes.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/core/error/failure_l10n.dart';
import 'package:alora_mobile/features/catalog/application/product_detail_notifier.dart';
import 'package:alora_mobile/features/catalog/presentation/widgets/product_gallery.dart';
import 'package:alora_mobile/features/catalog/presentation/widgets/product_properties_table.dart';
import 'package:alora_mobile/features/catalog/presentation/widgets/product_variant_selector.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/widgets/app_button.dart';
import 'package:alora_mobile/shared/widgets/error_state.dart';
import 'package:alora_mobile/shared/widgets/skeleton.dart';
import 'package:alora_mobile/shared/widgets/unit_text.dart';

/// Mahsulot sahifasi (S-18): galereya, nom/kategoriya, narx,
/// rang variantlari, xususiyatlar jadvali, AI/Hisob tugmalari.
class ProductScreen extends ConsumerWidget {
  final String productId;

  const ProductScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final colors = context.colors;
    final typography = context.text;
    final state = ref.watch(productDetailProvider(productId));
    final notifier = ref.read(productDetailProvider(productId).notifier);

    if (state.isLoading && state.product == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Padding(
          padding: EdgeInsets.all(AppSpacing.l),
          child: SkeletonBox(height: 300, borderRadius: 16),
        ),
      );
    }

    if (state.product == null && state.error != null) {
      return Scaffold(
        appBar: AppBar(),
        body: ErrorState(
          message: state.error?.localizedMessage(context),
          onRetry: notifier.retry,
        ),
      );
    }

    final product = state.product!;
    final selectedVariant = product.variants.isEmpty
        ? null
        : product.variants.firstWhere(
            (v) => v.id == state.selectedVariantId,
            orElse: () => product.variants.first,
          );
    final images = selectedVariant?.images ?? const [];

    final categoryLabel = product.categoryData != null
        ? '${product.categoryData!.name.toUpperCase()} · ${product.code}'
        : product.code.toUpperCase();

    void openChat(String message) {
      context.go(AppRoutes.chat, extra: {'initialMessage': message});
    }

    final askAiMessage = selectedVariant != null
        ? l10n.product_askAiMessage(product.name, selectedVariant.colorName)
        : product.name;
    final addToAccountMessage = selectedVariant != null
        ? l10n.product_addToAccountMessage(
            '${product.name}, ${selectedVariant.colorName}',
          )
        : product.name;

    return Scaffold(
      backgroundColor: colors.background,
      appBar: AppBar(title: Text(product.name)),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.l),
        children: [
          ProductGallery(images: images),
          const SizedBox(height: AppSpacing.m),
          Text(
            categoryLabel,
            style: typography.overline.copyWith(color: colors.brass),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(product.name, style: typography.titleL),
          const SizedBox(height: AppSpacing.s),
          if (selectedVariant != null)
            UnitText(
              amount: selectedVariant.price,
              unit: selectedVariant.priceUnit,
              style: typography.displayM.copyWith(color: colors.textPrimary),
            ),
          const SizedBox(height: AppSpacing.m),
          if (selectedVariant != null)
            Text(
              '${l10n.product_colorLabel}: ${selectedVariant.colorName}',
              style: typography.bodyM.copyWith(color: colors.textSecondary),
            ),
          const SizedBox(height: AppSpacing.s),
          ProductVariantSelector(
            product: product,
            selectedVariantId: state.selectedVariantId,
            onSelected: notifier.selectVariant,
          ),
          const SizedBox(height: AppSpacing.xl),
          ProductPropertiesTable(product: product),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.l,
            AppSpacing.s,
            AppSpacing.l,
            AppSpacing.m,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppButton(
                text: l10n.product_askAi,
                onPressed: () => openChat(askAiMessage),
              ),
              const SizedBox(height: AppSpacing.s),
              AppButton.secondary(
                text: l10n.product_addToAccount,
                onPressed: () => openChat(addToAccountMessage),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
