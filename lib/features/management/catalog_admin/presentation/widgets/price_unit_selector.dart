import 'package:flutter/material.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:alora_mobile/shared/models/price_unit.dart';
import 'package:alora_mobile/shared/widgets/app_chip.dart';

/// Narx birligini (m², dona, metr) tanlash uchun chip qatori.
class PriceUnitSelector extends StatelessWidget {
  const PriceUnitSelector({
    super.key,
    required this.unit,
    required this.isEnabled,
    required this.onChanged,
  });

  final PriceUnit unit;
  final bool isEnabled;
  final ValueChanged<PriceUnit> onChanged;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.s,
      runSpacing: AppSpacing.xs,
      children: [
        for (final u in PriceUnit.values)
          AppChip(
            label: switch (u) {
              PriceUnit.perSqm => context.l10n.price_unit_perSqm,
              PriceUnit.perPiece => context.l10n.price_unit_perPiece,
              PriceUnit.perMeter => context.l10n.price_unit_perMeter,
              PriceUnit.unknown => context.l10n.price_unit_unknown,
            },
            state: u == unit ? AppChipState.selected : AppChipState.unselected,
            onTap: isEnabled ? () => onChanged(u) : null,
          ),
      ],
    );
  }
}
