import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/widgets/section_label.dart';

/// S-22 forma bo'limi sarlavhasi — `overline` (SPEC §5).
class ProductFormSectionTitle extends StatelessWidget {
  const ProductFormSectionTitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) => SectionLabel(text);
}
