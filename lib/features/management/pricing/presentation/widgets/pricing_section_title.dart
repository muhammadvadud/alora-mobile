import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/widgets/section_label.dart';

/// S-23 ekranidagi bo'lim sarlavhasi — `overline` (SPEC §5 «Bo'lim sarlavhasi»).
class PricingSectionTitle extends StatelessWidget {
  const PricingSectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) => SectionLabel(title);
}
