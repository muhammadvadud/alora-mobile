import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/shared/models/product_card_data.dart';
import 'package:alora_mobile/shared/widgets/color_dot.dart';
import 'package:alora_mobile/shared/widgets/unit_text.dart';

enum ProductCardType { normal, wide }

class ProductCard extends StatelessWidget {
  final ProductCardData data;
  final bool isCarousel;
  final VoidCallback? onTap;
  final ProductCardType type;

  const ProductCard({super.key, required this.data, this.isCarousel = false, this.onTap})
    : type = ProductCardType.normal;

  const ProductCard.wide({super.key, required this.data, this.isCarousel = true, this.onTap})
    : type = ProductCardType.wide;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    if (type == ProductCardType.wide) {
      final content = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _WideImage(data: data),
          const SizedBox(width: 16),
          Expanded(child: _WideDetails(data: data)),
        ],
      );

      final card = Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: AppRadius.cardBorder,
          border: Border.all(color: colors.border, width: 1.0),
        ),
        child: content,
      );

      Widget result = Semantics(
        button: true,
        label: '${data.name}, ${data.colorName}',
        child: GestureDetector(onTap: onTap, behavior: HitTestBehavior.opaque, child: card),
      );

      if (isCarousel) {
        result = SizedBox(
          width: 327, // Spec: 327 eni
          child: result,
        );
      }

      return result;
    }

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ProductCardImage(data: data),
        _ProductCardDetails(data: data),
      ],
    );

    final card = Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: AppRadius.cardBorder,
        border: Border.all(color: colors.border, width: 1.0),
      ),
      child: content,
    );

    Widget result = Semantics(
      button: true,
      label: '${data.name}, ${data.colorName}',
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          constraints: const BoxConstraints(minHeight: 48, minWidth: 48),
          child: card,
        ),
      ),
    );

    if (isCarousel) {
      result = SizedBox(width: 180, child: result);
    }

    return result;
  }
}

class _WideImage extends StatelessWidget {
  final ProductCardData data;

  const _WideImage({required this.data});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    Widget imageWidget;
    if (data.imageUrl != null && data.imageUrl!.isNotEmpty) {
      imageWidget = CachedNetworkImage(
        imageUrl: data.imageUrl!,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(color: colors.surfaceMuted),
        errorWidget: (context, url, error) => Container(
          color: colors.surfaceMuted,
          child: Icon(LucideIcons.imageOff, color: colors.textDisabled),
        ),
      );
    } else {
      imageWidget = Container(
        color: colors.surfaceMuted,
        child: Icon(LucideIcons.image, color: colors.textDisabled),
      );
    }

    return SizedBox(
      width: 88,
      height: 88,
      child: ClipRRect(borderRadius: AppRadius.smallBorder, child: imageWidget),
    );
  }
}

class _WideDetails extends StatelessWidget {
  final ProductCardData data;

  const _WideDetails({required this.data});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data.name,
          style: typography.titleL.copyWith(color: colors.textPrimary),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            ColorDot(colorHex: data.colorHex, size: 16),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                data.colorName,
                style: typography.bodyL.copyWith(color: colors.textSecondary),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        UnitText(
          amount: data.price,
          unit: data.priceUnit,
          style: typography.bodyL.copyWith(color: colors.textPrimary),
        ),
      ],
    );
  }
}

class _ProductCardImage extends StatelessWidget {
  final ProductCardData data;

  const _ProductCardImage({required this.data});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final aspectRatio = 0.8; // 4:5

    Widget imageWidget;
    if (data.imageUrl != null && data.imageUrl!.isNotEmpty) {
      imageWidget = CachedNetworkImage(
        imageUrl: data.imageUrl!,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(color: colors.surfaceMuted),
        errorWidget: (context, url, error) => Container(
          color: colors.surfaceMuted,
          child: Icon(LucideIcons.imageOff, color: colors.textDisabled),
        ),
      );
    } else {
      imageWidget = Container(
        color: colors.surfaceMuted,
        child: Icon(LucideIcons.image, color: colors.textDisabled),
      );
    }

    return AspectRatio(
      aspectRatio: aspectRatio,
      child: ClipRRect(borderRadius: AppRadius.smallBorder, child: imageWidget),
    );
  }
}

class _ProductCardDetails extends StatelessWidget {
  final ProductCardData data;

  const _ProductCardDetails({required this.data});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 4.0, right: 4.0, bottom: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.name,
            style: typography.titleS.copyWith(color: colors.textPrimary),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              ColorDot(colorHex: data.colorHex, size: 12),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  data.colorName,
                  style: typography.bodyS.copyWith(color: colors.textSecondary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          UnitText(
            amount: data.price,
            unit: data.priceUnit,
            style: typography.labelL.copyWith(color: colors.textPrimary),
          ),
        ],
      ),
    );
  }
}
