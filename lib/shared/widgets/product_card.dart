import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/shared/models/product_card_data.dart';
import 'package:alora_mobile/shared/models/price_unit.dart';
import 'package:alora_mobile/shared/widgets/color_dot.dart';
import 'package:alora_mobile/shared/widgets/unit_text.dart';

class ProductCard extends StatelessWidget {
  final ProductCardData data;
  final bool isCarousel;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.data,
    this.isCarousel = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ProductCardImage(data: data),
        _ProductCardDetails(data: data),
      ],
    );

    final card = Container(
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

class _ProductCardImage extends StatelessWidget {
  final ProductCardData data;

  const _ProductCardImage({required this.data});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final aspectRatio = data.priceUnit == PriceUnit.perPiece ? 1.0 : 0.8;

    Widget imageWidget;
    if (data.imageUrl != null && data.imageUrl!.isNotEmpty) {
      imageWidget = CachedNetworkImage(
        imageUrl: data.imageUrl!,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(color: colors.borderSubtle),
        errorWidget: (context, url, error) => Container(
          color: colors.borderSubtle,
          child: Icon(AppIcons.imageOff, color: colors.textDisabled),
        ),
      );
    } else {
      imageWidget = Container(
        color: colors.borderSubtle,
        child: Icon(AppIcons.image, color: colors.textDisabled),
      );
    }

    return AspectRatio(
      aspectRatio: aspectRatio,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: AppRadius.cardTopRadius),
        child: imageWidget,
      ),
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
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.s,
        vertical: AppSpacing.s,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.name,
            style: typography.titleS,
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
                  style: typography.labelM.copyWith(
                    color: colors.textSecondary,
                    fontWeight: FontWeight.normal,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.s),
          UnitText(
            amount: data.price,
            unit: data.priceUnit,
            style: typography.priceM,
          ),
        ],
      ),
    );
  }
}
