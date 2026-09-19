import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/core/error/failure_l10n.dart';
import 'package:alora_mobile/features/catalog/application/catalog_notifier.dart';
import 'package:alora_mobile/features/catalog/application/catalog_state.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product_variant.dart';
import 'package:alora_mobile/features/management/catalog_admin/application/providers/catalog_providers.dart';
import 'package:alora_mobile/features/management/catalog_admin/data/dto/catalog_write_dtos.dart';
import 'package:alora_mobile/features/management/catalog_admin/presentation/widgets/bulk_price_sheet.dart';
import 'package:alora_mobile/features/management/catalog_admin/presentation/widgets/products_manage_product_section.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/shared/widgets/app_chip.dart';
import 'package:alora_mobile/shared/widgets/app_snackbar.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';
import 'package:alora_mobile/shared/widgets/empty_state.dart';
import 'package:alora_mobile/shared/widgets/error_state.dart';
import 'package:alora_mobile/shared/widgets/skeleton.dart';

class ProductsManageScreen extends ConsumerStatefulWidget {
  const ProductsManageScreen({super.key});

  @override
  ConsumerState<ProductsManageScreen> createState() =>
      _ProductsManageScreenState();
}

class _ProductsManageScreenState extends ConsumerState<ProductsManageScreen> {
  final TextEditingController _searchCtrl = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final Set<String> _selectedVariantIds = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(catalogProvider.notifier).bootstrap();
    });
    _scrollController.addListener(_maybeLoadMore);
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _maybeLoadMore() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 400) {
      ref.read(catalogProvider.notifier).loadMore();
    }
  }

  List<ProductVariant> get _selectedVariants {
    final state = ref.read(catalogProvider);
    return [
      for (final product in state.products)
        for (final variant in product.variants)
          if (_selectedVariantIds.contains(variant.id)) variant,
    ];
  }

  Future<void> _toggleActive(ProductVariant variant, bool value) async {
    try {
      await ref.read(catalogWriteRepositoryProvider).updateVariant(variant.id, {
        'is_active': value,
      });
      ref.read(catalogProvider.notifier).bootstrap();
    } catch (_) {
      if (mounted) {
        AppSnackbar.show(context, message: context.l10n.common_error);
      }
    }
  }

  Future<void> _applyBulkPrice(BulkPriceDto dto) async {
    try {
      await ref.read(catalogWriteRepositoryProvider).applyBulkPrice(dto);
      if (mounted) {
        setState(_selectedVariantIds.clear);
        AppSnackbar.show(context, message: context.l10n.management_bulkApplied);
      }
      ref.read(catalogProvider.notifier).bootstrap();
    } catch (_) {
      if (mounted) {
        AppSnackbar.show(context, message: context.l10n.common_error);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(catalogProvider);
    final notifier = ref.read(catalogProvider.notifier);
    final isSelectionMode = _selectedVariantIds.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: isSelectionMode
            ? Text(
                context.l10n.management_productsSelected(
                  _selectedVariantIds.length,
                ),
              )
            : Text(context.l10n.management_productsTitle),
        actions: [
          IconButton(
            icon: const Icon(AppIcons.tags),
            tooltip: context.l10n.management_bulkPriceTitle,
            onPressed: isSelectionMode ? _openBulkSheet : null,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.l,
              AppSpacing.s,
              AppSpacing.l,
              AppSpacing.s,
            ),
            child: AppTextField(
              controller: _searchCtrl,
              type: AppTextFieldType.search,
              hintText: context.l10n.management_productsSearchHint,
              onChanged: (value) => notifier.setSearch(value),
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
              children: [
                _CategoryChip(
                  id: null,
                  label: context.l10n.management_productsAll,
                ),
                for (final category in state.categories)
                  _CategoryChip(id: category.id, label: category.name),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.s),
          Expanded(
            child: _ProductList(
              state: state,
              notifier: notifier,
              scrollController: _scrollController,
              selectedIds: _selectedVariantIds,
              onToggleSelection: (variant) {
                setState(() {
                  if (!_selectedVariantIds.remove(variant.id)) {
                    _selectedVariantIds.add(variant.id);
                  }
                });
              },
              onToggleActive: _toggleActive,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openBulkSheet() async {
    final variants = _selectedVariants;
    if (variants.isEmpty) return;
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => BulkPriceSheet(
        selectedVariants: variants,
        onSave: (dto) => _applyBulkPrice(dto),
      ),
    );
  }
}

class _CategoryChip extends ConsumerWidget {
  final String? id;
  final String label;

  const _CategoryChip({required this.id, required this.label});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(catalogProvider).categoryId == id;
    return Padding(
      padding: const EdgeInsets.only(right: AppSpacing.xs),
      child: AppChip(
        label: label,
        state: selected ? AppChipState.selected : AppChipState.unselected,
        onTap: () => ref.read(catalogProvider.notifier).selectCategory(id),
      ),
    );
  }
}

class _ProductList extends StatelessWidget {
  final CatalogState state;
  final CatalogNotifier notifier;
  final ScrollController scrollController;
  final Set<String> selectedIds;
  final void Function(ProductVariant) onToggleSelection;
  final void Function(ProductVariant, bool) onToggleActive;

  const _ProductList({
    required this.state,
    required this.notifier,
    required this.scrollController,
    required this.selectedIds,
    required this.onToggleSelection,
    required this.onToggleActive,
  });

  @override
  Widget build(BuildContext context) {
    if (state.error != null && state.products.isEmpty) {
      return ErrorState(
        title: context.l10n.management_productsLoadError,
        message: state.error!.localizedMessage(context),
        onRetry: () => notifier.retry(),
      );
    }
    if (state.products.isEmpty) {
      if (state.isLoading) {
        return const Padding(
          padding: EdgeInsets.all(AppSpacing.l),
          child: SkeletonList(
            itemCount: 4,
            itemBuilder: SkeletonBox(
              width: double.infinity,
              height: 120,
              borderRadius: AppRadius.card,
            ),
          ),
        );
      }
      return EmptyState(
        icon: AppIcons.inbox,
        title: context.l10n.management_productsEmptyTitle,
        message: context.l10n.management_productsEmptyMessage,
      );
    }

    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.l,
        AppSpacing.xs,
        AppSpacing.l,
        AppSpacing.xl,
      ),
      children: [
        for (final product in state.products)
          ProductsManageProductSection(
            product: product,
            selectedIds: selectedIds,
            selectionMode: selectedIds.isNotEmpty,
            onToggleSelection: onToggleSelection,
            onToggleActive: onToggleActive,
          ),
        if (state.isLoadingMore)
          const Padding(
            padding: EdgeInsets.all(AppSpacing.l),
            child: Center(
              child: SkeletonBox(width: 32, height: 32, shape: BoxShape.circle),
            ),
          ),
      ],
    );
  }
}
