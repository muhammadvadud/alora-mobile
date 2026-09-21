part of '../screens/order_detail_screen.dart';

/// Xona (o'lchov) bo'limi: karniz/balandlik/koeffitsient + bo'laklar + aksessuarlar.
class _MeasurementSection extends StatelessWidget {
  final OrderMeasurement measurement;

  const _MeasurementSection({required this.measurement});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;
    final l10n = context.l10n;
    final m = measurement;

    final roomName = (m.roomName != null && m.roomName!.isNotEmpty)
        ? m.roomName!
        : l10n.orders_roomDefault;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(roomName),
        Text(
          l10n.orders_measurementSummary(
            _formatMeasure(m.corniceLengthM),
            _formatMeasure(m.heightM),
            _formatMeasure(m.coefficient),
          ),
          style: typography.bodyS.copyWith(color: colors.textSecondary),
        ),
        if (m.note != null && m.note!.isNotEmpty) _MetaLine(m.note!),
        if (m.parts.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.s),
          Text(l10n.orders_parts, style: typography.labelM.copyWith(color: colors.textSecondary)),
          const SizedBox(height: AppSpacing.xs),
          ...m.parts.map((p) => _PartRow(part: p)),
        ],
        if (m.accessories.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.s),
          Text(
            l10n.orders_accessories,
            style: typography.labelM.copyWith(color: colors.textSecondary),
          ),
          const SizedBox(height: AppSpacing.xs),
          ...m.accessories.map((a) => _AccessoryRow(accessory: a)),
        ],
      ],
    );
  }
}

class _PartRow extends StatelessWidget {
  final OrderCurtainPart part;

  const _PartRow({required this.part});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;
    final l10n = context.l10n;
    final p = part;
    final sku = p.variant?.sku;

    final pricePerUnit =
        '${formatMoneyPlain(p.pricePerSqm ?? 0)}${_priceUnitText(l10n, p.variant?.priceUnit)}';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.s),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _RoleTag(label: _roleLabel(l10n, p.role)),
                    const SizedBox(width: AppSpacing.xs),
                    Expanded(
                      child: Text(
                        _partName(p),
                        style: typography.titleS.copyWith(color: colors.textPrimary),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                if (sku != null && sku.isNotEmpty) _MetaLine(l10n.orders_partSku(sku)),
                _MetaLine(
                  l10n.orders_partDims(_formatMeasure(p.widthM), _formatMeasure(p.heightM)),
                ),
                _MetaLine(
                  l10n.orders_partMeta(
                    _formatMeasure(p.coefficient),
                    _formatMeasure(p.areaSqm),
                    pricePerUnit,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.m),
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.xs),
            child: MoneyText(
              amount: p.total ?? 0,
              style: typography.bodyM.copyWith(
                color: colors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AccessoryRow extends StatelessWidget {
  final OrderAccessory accessory;

  const _AccessoryRow({required this.accessory});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;
    final l10n = context.l10n;
    final a = accessory;
    final sku = a.variant?.sku;

    final meta = l10n.orders_rowMeta(
      _formatMeasure(a.qty),
      _unitLabel(l10n, a.unit),
      '${formatMoneyPlain(a.unitPrice ?? 0)}${_priceUnitText(l10n, a.variant?.priceUnit)}',
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.s),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  a.variant?.productName ?? a.variant?.colorName ?? '',
                  style: typography.titleS.copyWith(color: colors.textPrimary),
                ),
                if (sku != null && sku.isNotEmpty) _MetaLine(l10n.orders_partSku(sku)),
                _MetaLine(meta),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.m),
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.xs),
            child: MoneyText(
              amount: a.total ?? 0,
              style: typography.bodyM.copyWith(
                color: colors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RoleTag extends StatelessWidget {
  final String label;

  const _RoleTag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs, vertical: 2),
      decoration: BoxDecoration(
        color: context.colors.surfaceMuted,
        borderRadius: AppRadius.smallBorder,
      ),
      child: Text(label, style: context.text.labelS.copyWith(color: context.colors.textSecondary)),
    );
  }
}

String _partName(OrderCurtainPart p) {
  final variant = p.variant;
  if (variant == null) return '';
  return variant.productName ?? variant.colorName ?? '';
}
