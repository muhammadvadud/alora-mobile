part of '../screens/order_detail_screen.dart';

class _OrderDetailBody extends StatelessWidget {
  final Order order;
  final VoidCallback onConfirm;
  final VoidCallback? onCall;
  final VoidCallback? onGeo;

  const _OrderDetailBody({required this.order, required this.onConfirm, this.onCall, this.onGeo});

  @override
  Widget build(BuildContext context) {
    final sections = <Widget>[
      if (order.customerName != null || order.address != null)
        _CustomerSection(order: order, onCall: onCall, onGeo: onGeo),
      ...order.measurements.map((m) => _MeasurementSection(measurement: m)),
      if (order.items.isNotEmpty) _ServicesSection(order: order),
      _FinanceSection(order: order),
      if (order.paymentStatusDisplay != null) _PaymentSection(order: order),
      _StatusHistorySection(order: order),
    ];

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.screenH),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _OrderDetailHeader(order: order),
                const SizedBox(height: AppSpacing.l),
                AppCard.sections(sections: sections),
              ],
            ),
          ),
        ),
        _BottomActions(order: order, onConfirm: onConfirm),
      ],
    );
  }
}

class _OrderDetailHeader extends StatelessWidget {
  final Order order;

  const _OrderDetailHeader({required this.order});

  @override
  Widget build(BuildContext context) {
    final typography = context.text;
    final colors = context.colors;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(order.number ?? '', style: typography.titleL.copyWith(color: colors.textPrimary)),
        StatusPill(status: order.status),
      ],
    );
  }
}

class _CustomerSection extends StatelessWidget {
  final Order order;
  final VoidCallback? onCall;
  final VoidCallback? onGeo;

  const _CustomerSection({required this.order, this.onCall, this.onGeo});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(context.l10n.customer, style: typography.bodyS.copyWith(color: colors.textSecondary)),
        const SizedBox(height: AppSpacing.s),
        if (order.customerName != null)
          Text(order.customerName!, style: typography.titleS.copyWith(color: colors.textPrimary)),
        if (order.customerPhone != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: GestureDetector(
              onTap: onCall,
              child: Text(
                order.customerPhone!,
                style: typography.bodyL.copyWith(color: colors.textPrimary),
              ),
            ),
          ),
        if (order.address != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: GestureDetector(
              onTap: onGeo,
              child: Text(
                order.address!,
                style: typography.bodyL.copyWith(color: colors.textPrimary),
              ),
            ),
          ),
      ],
    );
  }
}

class _PaymentSection extends StatelessWidget {
  final Order order;

  const _PaymentSection({required this.order});

  @override
  Widget build(BuildContext context) {
    final typography = context.text;
    final colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.orders_sectionPayment,
          style: typography.bodyS.copyWith(color: colors.textSecondary),
        ),
        const SizedBox(height: AppSpacing.s),
        PaymentChip(status: order.paymentStatus),
      ],
    );
  }
}

class _StatusHistorySection extends StatelessWidget {
  final Order order;

  const _StatusHistorySection({required this.order});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.orders_sectionStatusHistory,
          style: typography.bodyS.copyWith(color: colors.textSecondary),
        ),
        const SizedBox(height: AppSpacing.s),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StatusPill(status: order.status),
            if (order.updatedAt != null)
              Text(
                formatDate(order.updatedAt!, context: context),
                style: typography.labelS.copyWith(color: colors.textSecondary),
              ),
          ],
        ),
      ],
    );
  }
}

class _BottomActions extends ConsumerWidget {
  final Order order;
  final VoidCallback onConfirm;

  const _BottomActions({required this.order, required this.onConfirm});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = context.colors;

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.screenH),
        decoration: BoxDecoration(
          color: colors.background,
          border: Border(top: BorderSide(color: colors.border)),
        ),
        child: Column(
          children: [
            if (order.status == OrderStatus.draft) ...[
              AppButton(text: context.l10n.orders_confirm, onPressed: onConfirm),
              const SizedBox(height: AppSpacing.m),
            ],
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    text: context.l10n.orders_statusButton,
                    type: AppButtonType.secondary,
                    onPressed: () => StatusChangeSheet.show(context, order),
                  ),
                ),
                const SizedBox(width: AppSpacing.m),
                Expanded(
                  child: AppButton(
                    text: context.l10n.orders_pdf,
                    type: AppButtonType.secondary,
                    icon: AppIcons.fileText,
                    onPressed: () => ref.read(orderPdfProvider(order.id).notifier).openPdf(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderDetailMenu extends StatelessWidget {
  final VoidCallback onPdf;
  final VoidCallback onShare;
  final VoidCallback onCancel;
  final VoidCallback? onMarkPaid;

  const _OrderDetailMenu({
    required this.onPdf,
    required this.onShare,
    required this.onCancel,
    required this.onMarkPaid,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(AppIcons.more, color: context.colors.textPrimary),
      onSelected: (value) {
        if (value == 'pdf') {
          onPdf();
        } else if (value == 'share') {
          onShare();
        } else if (value == 'cancel') {
          onCancel();
        } else if (value == 'paid') {
          onMarkPaid?.call();
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(value: 'pdf', child: Text(context.l10n.orders_pdf)),
        PopupMenuItem(value: 'share', child: Text(context.l10n.orders_share)),
        PopupMenuItem(value: 'cancel', child: Text(context.l10n.common_cancel)),
        if (onMarkPaid != null)
          PopupMenuItem(value: 'paid', child: Text(context.l10n.payment_status_fullyPaid)),
      ],
    );
  }
}

/// Ko'rsatish uchun qo'shimcha maydon qatori.
class _MetaLine extends StatelessWidget {
  final String text;

  const _MetaLine(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.xs),
      child: Text(text, style: context.text.bodyS.copyWith(color: context.colors.textSecondary)),
    );
  }
}

/// Qiymatni ixcham formatlaydi: 2.0 -> "2", 2.5 -> "2.5".
String _formatMeasure(double? value) {
  if (value == null) return '0';
  return value % 1 == 0 ? value.toInt().toString() : value.toString();
}

/// Bo'lak roli kodini lokalizatsiya qilingan nomiga o'giradi.
String _roleLabel(AppLocalizations l10n, String? code) {
  switch (code) {
    case 'portyera':
      return l10n.orders_role_portyera;
    case 'tul':
      return l10n.orders_role_tul;
    case 'lambrekan':
      return l10n.orders_role_lambrekan;
    case 'kant':
      return l10n.orders_role_kant;
    case 'dekor':
      return l10n.orders_role_dekor;
    case 'astar':
      return l10n.orders_role_astar;
    default:
      return l10n.orders_role_unknown;
  }
}

/// Miqdor birligini (kod) ko'rsatish uchun belgiga o'giradi.
String _unitLabel(AppLocalizations l10n, String? code) {
  switch (code) {
    case 'per_sqm':
      return l10n.orders_unitSqm;
    case 'per_piece':
      return l10n.orders_unitPiece;
    case 'per_meter':
      return l10n.orders_unitMeter;
    default:
      return code ?? '';
  }
}

/// Birlik kodidan narx birligi enum'iga o'tish.
PriceUnit _unitFromCode(String? code) {
  switch (code) {
    case 'per_sqm':
      return PriceUnit.perSqm;
    case 'per_piece':
      return PriceUnit.perPiece;
    case 'per_meter':
      return PriceUnit.perMeter;
    default:
      return PriceUnit.unknown;
  }
}

/// Birlik narxi suffiksi (masalan: " so'm/m²").
String _priceUnitText(AppLocalizations l10n, PriceUnit? unit) {
  switch (unit) {
    case PriceUnit.perSqm:
      return ' ${l10n.price_unit_perSqm}';
    case PriceUnit.perPiece:
      return ' ${l10n.price_unit_perPiece}';
    case PriceUnit.perMeter:
      return ' ${l10n.price_unit_perMeter}';
    case PriceUnit.unknown:
    case null:
      return '';
  }
}

String _discountLabel(Order order, AppLocalizations l10n) {
  final percent = order.discountPercent;
  if (percent != null && percent != 0) {
    final pct = formatPercent(percent);
    final source = order.discountSourceDisplay;
    return (source != null && source.isNotEmpty)
        ? l10n.orders_discountWithSource(pct, source)
        : l10n.orders_discountWithPercent(pct);
  }
  return l10n.discount;
}

String _prepaymentLabel(Order order, AppLocalizations l10n) {
  final percent = order.prepaymentPercent;
  if (percent != null && percent != 0) {
    return l10n.orders_financePrepaymentWithPercent(formatPercent(percent));
  }
  return l10n.orders_financePrepayment;
}
