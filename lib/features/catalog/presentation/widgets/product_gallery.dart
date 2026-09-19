import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:alora_mobile/app/theme/app_radius.dart';
import 'package:alora_mobile/features/catalog/domain/entities/product_image.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';

/// Rasm galereyasi: PageView + nuqtalar, rasm nisbati 4:5.
class ProductGallery extends StatefulWidget {
  final List<ProductImage> images;
  final int initialIndex;

  const ProductGallery({super.key, required this.images, this.initialIndex = 0});

  @override
  State<ProductGallery> createState() => _ProductGalleryState();
}

class _ProductGalleryState extends State<ProductGallery> {
  late final PageController _controller;
  late int _current;

  @override
  void initState() {
    super.initState();
    final last = widget.images.isEmpty ? 0 : widget.images.length - 1;
    _current = widget.initialIndex.clamp(0, last);
    _controller = PageController(initialPage: _current);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    final images = widget.images;
    final isEmpty = images.isEmpty;

    Widget imageWidget(int index) {
      if (isEmpty) {
        return Container(
          color: colors.borderSubtle,
          child: Icon(AppIcons.imageOff, color: colors.textDisabled, size: 48),
        );
      }
      return CachedNetworkImage(
        imageUrl: images[index].imageUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(color: colors.borderSubtle),
        errorWidget: (context, url, error) => Container(
          color: colors.borderSubtle,
          child: Icon(AppIcons.imageOff, color: colors.textDisabled, size: 48),
        ),
      );
    }

    return AspectRatio(
      aspectRatio: 0.8, // 4:5
      child: ClipRRect(
        borderRadius: AppRadius.cardBorder,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (isEmpty)
              imageWidget(0)
            else
              PageView.builder(
                controller: _controller,
                onPageChanged: (index) => setState(() => _current = index),
                itemCount: images.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => _current != index
                      ? _controller.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeOut,
                        )
                      : null,
                  child: imageWidget(index),
                ),
              ),
            if (images.length > 1)
              Positioned(
                bottom: 12,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 0; i < images.length; i++) ...[
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: i == _current ? 8 : 6,
                        height: i == _current ? 8 : 6,
                        decoration: BoxDecoration(
                          color: i == _current
                              ? colors.inverse
                              : colors.inverse.withValues(alpha: 0.4),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
