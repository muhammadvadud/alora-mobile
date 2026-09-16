import 'dart:async';

import 'package:alora_mobile/core/error/failure.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product_variant.dart';
import 'package:alora_mobile/features/catalog/domain/repositories/catalog_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'providers.dart';

part 'product_detail_notifier.g.dart';

/// Bitta mahsulotni boshqaruvchi notifier (family — productId bo'yicha).
@Riverpod(keepAlive: true)
class ProductDetailNotifier extends _$ProductDetailNotifier {
  @override
  ProductState build(String productId) {
    unawaited(_load());
    return const ProductState(isLoading: true);
  }

  CatalogRepository get _repo => ref.read(catalogRepositoryProvider);

  Future<void> _load() async {
    try {
      final product = await _repo.getProductDetail(productId);
      state = state.copyWith(
        product: product,
        isLoading: false,
        selectedVariantId: product.variants.isNotEmpty
            ? product.variants.first.id
            : null,
      );
    } on Failure catch (error) {
      state = state.copyWith(isLoading: false, error: error);
    }
  }

  /// Variant tanlash (rang chip'i bosilganda).
  void selectVariant(String variantId) {
    state = state.copyWith(selectedVariantId: variantId);
  }

  Future<void> retry() async {
    state = state.copyWith(isLoading: true, error: null);
    await _load();
  }

  ProductVariant? get selectedVariant {
    final product = state.product;
    if (product == null || state.selectedVariantId == null) return null;
    return product.variants
        .where((v) => v.id == state.selectedVariantId)
        .firstOrNull;
  }
}

/// Mahsulot sahifasi holati.
class ProductState {
  final Product? product;
  final String? selectedVariantId;
  final bool isLoading;
  final Failure? error;

  const ProductState({
    this.product,
    this.selectedVariantId,
    this.isLoading = true,
    this.error,
  });

  ProductState copyWith({
    Product? product,
    String? selectedVariantId,
    bool? isLoading,
    Failure? error,
  }) {
    return ProductState(
      product: product ?? this.product,
      selectedVariantId: selectedVariantId ?? this.selectedVariantId,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
