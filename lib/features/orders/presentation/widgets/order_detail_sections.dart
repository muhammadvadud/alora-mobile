part of '../screens/order_detail_screen.dart';

class _OrderDetailBody extends StatelessWidget {
  final Order order;
  final VoidCallback onConfirm;
  final VoidCallback? onCall;
  final VoidCallback? onGeo;

  const _OrderDetailBody({required this.order, required this.onConfirm, this.onCall, this.onGeo});

  @override
  Widget build(BuildContext context) {
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
                AppCard.sections(
                  sections: [
                    if (order.customerName != null || order.address != null)
                      _CustomerSection(order: order, onCall: onCall, onGeo: onGeo),
                    if (order.measurements.isNotEmpty) _RoomsSection(order: order),
                    _FinanceSection(order: order),
                    if (order.paymentStatusDisplay != null) _PaymentSection(order: order),
                    _StatusHistorySection(order: order),
                  ],
                ),
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
        Text('Mijoz', style: typography.bodyS.copyWith(color: colors.textSecondary)),
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

class _RoomsSection extends StatelessWidget {
  final Order order;

  const _RoomsSection({required this.order});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Buyurtma qismlari', style: typography.bodyS.copyWith(color: colors.textSecondary)),
        const SizedBox(height: AppSpacing.s),
        ...order.measurements.map((m) {
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.xs),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  m.roomName ?? 'Xona',
                  style: typography.titleS.copyWith(color: colors.textPrimary),
                ),
                Text(
                  context.l10n.corniceAndHeight(
                    (m.corniceLengthM ?? 0).toString(),
                    (m.heightM ?? 0).toString(),
                  ),
                  style: typography.bodyS.copyWith(color: colors.textSecondary),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}

class _FinanceSection extends StatelessWidget {
  final Order order;

  const _FinanceSection({required this.order});

  @override
  Widget build(BuildContext context) {
    final typography = context.text;
    final colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Hisob', style: typography.bodyS.copyWith(color: colors.textSecondary)),
        const SizedBox(height: AppSpacing.s),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('JAMI', style: typography.titleM.copyWith(color: colors.textPrimary)),
            MoneyText(
              amount: order.total ?? 0,
              style: typography.displayM.copyWith(color: colors.textPrimary),
            ),
          ],
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
        Text('To\'lov', style: typography.bodyS.copyWith(color: colors.textSecondary)),
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
        Text('Statuslar tarixi', style: typography.bodyS.copyWith(color: colors.textSecondary)),
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
                    text: 'Status',
                    type: AppButtonType.secondary,
                    onPressed: () => StatusChangeSheet.show(context, order),
                  ),
                ),
                const SizedBox(width: AppSpacing.m),
                Expanded(
                  child: AppButton(
                    text: 'PDF',
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

  const _OrderDetailMenu({required this.onPdf, required this.onShare, required this.onCancel});

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
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(value: 'pdf', child: Text(context.l10n.orders_pdf)),
        PopupMenuItem(value: 'share', child: Text(context.l10n.orders_share)),
        PopupMenuItem(value: 'cancel', child: Text(context.l10n.common_cancel)),
      ],
    );
  }
}
