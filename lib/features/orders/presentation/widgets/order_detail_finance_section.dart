part of '../screens/order_detail_screen.dart';

/// Xizmatlar bo'limi (buyurtma darajasidagi OrderItem ro'yxati).
class _ServicesSection extends StatelessWidget {
  final Order order;

  const _ServicesSection({required this.order});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(l10n.orders_services),
        ...order.items.map((item) => _ServiceRow(item: item)),
      ],
    );
  }
}

class _ServiceRow extends StatelessWidget {
  final OrderItem item;

  const _ServiceRow({required this.item});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;
    final l10n = context.l10n;
    final unitEnum = _unitFromCode(item.unit);

    final meta = l10n.orders_rowMeta(
      _formatMeasure(item.qty),
      _unitLabel(l10n, item.unit),
      '${formatMoneyPlain(item.unitPrice ?? 0)}${_priceUnitText(l10n, unitEnum)}',
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
                  item.nameSnapshot ?? '',
                  style: typography.titleS.copyWith(color: colors.textPrimary),
                ),
                _MetaLine(meta),
              ],
            ),
          ),
          const SizedBox(width: AppSpacing.m),
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.xs),
            child: MoneyText(
              amount: item.total ?? 0,
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

/// Yakuniy hisob bo'limi: bo'laklar/aksessuarlar/xizmatlar yakuniy summalari,
/// chegirma, yetkazish, jami, avans va qoldiq.
class _FinanceSection extends StatelessWidget {
  final Order order;

  const _FinanceSection({required this.order});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(l10n.finance),
        _MoneyRow(label: l10n.orders_financeParts, amount: order.partsTotal),
        _MoneyRow(label: l10n.orders_financeAccessories, amount: order.accessoriesTotal),
        _MoneyRow(label: l10n.orders_financeServices, amount: order.servicesTotal),
        if (order.discountAmount != null && order.discountAmount != 0)
          _MoneyRow(label: _discountLabel(order, l10n), amount: order.discountAmount ?? 0),
        if (order.deliveryAmount != null && order.deliveryAmount! > 0)
          _MoneyRow(label: l10n.orders_financeDelivery, amount: order.deliveryAmount!),
        const SizedBox(height: AppSpacing.xs),
        _MoneyRow(label: l10n.orders_financeTotal, amount: order.total ?? 0, emphasized: true),
        if (order.prepayment != null)
          _MoneyRow(label: _prepaymentLabel(order, l10n), amount: order.prepayment ?? 0),
        _MoneyRow(label: l10n.orders_financeBalance, amount: order.balance ?? 0),
      ],
    );
  }
}

/// Yetakchi qatorlar: chapda nom, o'ngda summa.
class _MoneyRow extends StatelessWidget {
  final String label;
  final int amount;
  final bool emphasized;

  const _MoneyRow({required this.label, required this.amount, this.emphasized = false});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    final labelStyle = emphasized
        ? typography.titleM.copyWith(color: colors.textPrimary)
        : typography.bodyM.copyWith(color: colors.textSecondary);
    final amountStyle = emphasized
        ? typography.displayM.copyWith(color: colors.textPrimary)
        : typography.bodyM.copyWith(color: colors.textPrimary);

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.s),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(label, style: labelStyle)),
          const SizedBox(width: AppSpacing.m),
          MoneyText(amount: amount, style: amountStyle),
        ],
      ),
    );
  }
}
