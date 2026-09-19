import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:alora_mobile/app/l10n/app_localizations.dart';
import 'package:alora_mobile/app/router/routes.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/core/connectivity/connectivity_notifier.dart';
import 'package:alora_mobile/core/error/failure_l10n.dart';
import 'package:alora_mobile/features/catalog/application/catalog_notifier.dart';
import 'package:alora_mobile/features/catalog/application/catalog_state.dart';
import 'package:alora_mobile/features/catalog/domain/entities/category.dart';
import 'package:alora_mobile/features/catalog/presentation/widgets/catalog_filter_sheet.dart';
import 'package:alora_mobile/features/catalog/presentation/widgets/catalog_grid_card.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/shared/widgets/app_chip.dart';
import 'package:alora_mobile/shared/widgets/app_text_field.dart';
import 'package:alora_mobile/shared/widgets/empty_state.dart';
import 'package:alora_mobile/shared/widgets/error_state.dart';
import 'package:alora_mobile/shared/widgets/offline_banner.dart';
import 'package:alora_mobile/shared/widgets/product_card.dart';
import 'package:alora_mobile/shared/widgets/skeleton.dart';

/// Katalog sahifasi (S-16): qidiruv + filtr, kategoriya chip'lari,
/// 2 ustunli `ProductCard` grid, skeleton / bo'sh / xato holatlar, load-more.
class CatalogScreen extends ConsumerStatefulWidget {
  const CatalogScreen({super.key});

  @override
  ConsumerState<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends ConsumerState<CatalogScreen> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(catalogProvider.notifier).bootstrap();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.extentAfter < 400) {
      ref.read(catalogProvider.notifier).loadMore();
    }
  }

  Future<void> _openFilterSheet() async {
    final state = ref.read(catalogProvider);
    final result = await showModalBottomSheet<CatalogFilterSheetResult>(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.colors.surface,
      shape: const RoundedRectangleBorder(borderRadius: AppRadius.sheet),
      builder: (_) => CatalogFilterSheet(initial: state.filter),
    );
    if (result != null && result.applied) {
      ref.read(catalogProvider.notifier).setFilter(result.filter);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isOnline = ref.watch(connectivityProvider);
    final state = ref.watch(catalogProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.tab_catalog),
        actions: [
          FilterButton(count: state.activeFilterCount, onTap: _openFilterSheet),
          const SizedBox(width: AppSpacing.screenH),
        ],
      ),
      body: Column(
        children: [
          if (!isOnline) const OfflineBanner(),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.screenH,
              AppSpacing.m,
              AppSpacing.screenH,
              AppSpacing.s,
            ),
            child: AppTextField(
              type: AppTextFieldType.search,
              hintText: l10n.catalog_searchHint,
              controller: _searchController,
              onChanged: (value) => ref.read(catalogProvider.notifier).setSearch(value),
            ),
          ),
          CategoryBar(
            categories: state.categories,
            categoryId: state.categoryId,
            onSelect: (id) => ref.read(catalogProvider.notifier).selectCategory(id),
          ),
          Expanded(
            child: _Body(state: state, scrollController: _scrollController),
          ),
        ],
      ),
    );
  }
}

/// Filtr tugmasi: faol filtrlar soni badge bilan.
class FilterButton extends StatelessWidget {
  final int count;
  final VoidCallback onTap;

  const FilterButton({super.key, required this.count, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          icon: Icon(AppIcons.filter, color: colors.textPrimary, size: 24),
          onPressed: onTap,
        ),
        if (count > 0)
          Positioned(
            right: 8,
            top: 8,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: colors.danger,
                shape: BoxShape.circle,
                border: Border.all(color: colors.surface, width: 1.5),
              ),
            ),
          ),
      ],
    );
  }
}

/// Kategoriya chip'lari (gorizontal): "Hammasi" + backend kategoriyalari.
class CategoryBar extends StatelessWidget {
  final List<Category> categories;
  final String? categoryId;
  final ValueChanged<String?> onSelect;

  const CategoryBar({
    super.key,
    required this.categories,
    required this.categoryId,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.l),
        itemCount: categories.length + 1,
        separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.s),
        itemBuilder: (context, index) {
          if (index == 0) {
            return AppChip(
              label: l10n.catalog_allCategories,
              state: categoryId == null ? AppChipState.categorySelected : AppChipState.outlined,
              onTap: () => onSelect(null),
            );
          }
          final category = categories[index - 1];
          return AppChip(
            label: category.name,
            state: categoryId == category.id
                ? AppChipState.categorySelected
                : AppChipState.outlined,
            onTap: () => onSelect(category.id),
          );
        },
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  final CatalogState state;
  final ScrollController scrollController;

  const _Body({required this.state, required this.scrollController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;

    if (state.isLoading && state.products.isEmpty) {
      return const _SkeletonGrid();
    }
    if (state.error != null && state.products.isEmpty) {
      return ErrorState(
        message: state.error?.localizedMessage(context),
        onRetry: () => ref.read(catalogProvider.notifier).retry(),
      );
    }
    if (state.products.isEmpty) {
      return EmptyState(
        icon: AppIcons.inbox,
        title: l10n.catalog_emptyTitle,
        message: l10n.catalog_emptyMessage,
        actionText: state.isFiltered ? l10n.catalog_filterClear : null,
        onAction: () => ref.read(catalogProvider.notifier).clearFilter(),
      );
    }

    return GridView.builder(
      controller: scrollController,
      padding: const EdgeInsets.all(AppSpacing.l),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: AppSpacing.m,
        crossAxisSpacing: AppSpacing.m,
        childAspectRatio: 0.55,
      ),
      itemCount: state.products.length,
      itemBuilder: (context, index) {
        final product = state.products[index];
        return ProductCard(
          data: productToCardData(product),
          onTap: () => context.go(AppRoutes.catalogProduct(product.id)),
        );
      },
    );
  }
}

class _SkeletonGrid extends StatelessWidget {
  const _SkeletonGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(AppSpacing.l),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: AppSpacing.m,
        crossAxisSpacing: AppSpacing.m,
        childAspectRatio: 0.55,
      ),
      itemCount: 6,
      itemBuilder: (context, _) => const SkeletonBox(borderRadius: AppRadius.card),
    );
  }
}
