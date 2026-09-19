import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';

/// Mahsulot formasi bo'limi sarlavhasi.
class ProductFormSectionTitle extends StatelessWidget {
  const ProductFormSectionTitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.text.bodyM.copyWith(fontWeight: FontWeight.w700),
    );
  }
}
