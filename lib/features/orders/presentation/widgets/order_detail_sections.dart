part of '../screens/order_detail_screen.dart';

class _OrderDetailBody extends StatelessWidget {
  final Order order;
  final VoidCallback onConfirm;
  final VoidCallback? onCall;
  final VoidCallback? onGeo;

  const _OrderDetailBody({
    required this.order,
    required this.onConfirm,
    this.onCall,
    this.onGeo,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _OrderDetailHeader(order: order),
          const SizedBox(height: AppSpacing.l),
          StatusTimeline(
            currentStatus: order.status,
            actionDate: order.updatedAt,
          ),
          const SizedBox(height: AppSpacing.l),
          if (order.status == OrderStatus.draft) ...[
            AppButton(text: context.l10n.orders_confirm, onPressed: onConfirm),
            const SizedBox(height: AppSpacing.l),
          ],
          if (order.customerName != null || order.address != null)
            _OrderCustomerSection(order: order, onCall: onCall, onGeo: onGeo),
          _OrderRoomsSection(order: order),
          _OrderFinanceSection(order: order),
        ],
      ),
    );
  }
}

class _OrderDetailHeader extends StatelessWidget {
  final Order order;

  const _OrderDetailHeader({required this.order});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              order.number ?? '',
              style: typography.titleL.copyWith(color: colors.textPrimary),
            ),
            StatusPill(status: order.status),
          ],
        ),
        const SizedBox(height: AppSpacing.s),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (order.createdAt != null)
              Text(
                context.l10n.dateLabel(
                  formatDate(order.createdAt!, context: context),
                ),
                style: typography.bodyS.copyWith(color: colors.textSecondary),
              ),
            if (order.user != null)
              Text(
                context.l10n.sellerLabel(order.user!.fullName ?? ''),
                style: typography.bodyS.copyWith(color: colors.textSecondary),
              ),
          ],
        ),
      ],
    );
  }
}

class _OrderCustomerSection extends StatelessWidget {
  final Order order;
  final VoidCallback? onCall;
  final VoidCallback? onGeo;

  const _OrderCustomerSection({required this.order, this.onCall, this.onGeo});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (order.customerName != null) ...[
          Text(
            context.l10n.customer,
            style: typography.titleM.copyWith(color: colors.textPrimary),
          ),
          const SizedBox(height: AppSpacing.s),
          ListTile(
            leading: Icon(AppIcons.profile, color: colors.textSecondary),
            title: Text(order.customerName!, style: typography.bodyL),
            subtitle: Text(order.customerPhone ?? ''),
            trailing: order.customerPhone != null
                ? IconButton(
                    icon: Icon(AppIcons.phone, color: colors.accent),
                    onPressed: onCall,
                  )
                : null,
            contentPadding: EdgeInsets.zero,
          ),
        ],
        if (order.address != null)
          ListTile(
            leading: Icon(AppIcons.mapPin, color: colors.textSecondary),
            title: Text(order.address!, style: typography.bodyL),
            trailing: IconButton(
              icon: Icon(AppIcons.mapPin, color: colors.accent),
              onPressed: onGeo,
            ),
            contentPadding: EdgeInsets.zero,
          ),
      ],
    );
  }
}

class _OrderRoomsSection extends StatelessWidget {
  final Order order;

  const _OrderRoomsSection({required this.order});

  @override
  Widget build(BuildContext context) {
    final typography = context.text;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSpacing.l),
        Text(
          context.l10n.rooms,
          style: typography.titleM.copyWith(color: context.colors.textPrimary),
        ),
        const SizedBox(height: AppSpacing.s),
        ...order.measurements.map((m) {
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.s),
            child: AppCard(
              padding: const EdgeInsets.all(AppSpacing.m),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(m.roomName ?? 'Xona', style: typography.titleS),
                  const SizedBox(height: AppSpacing.s),
                  Text(
                    context.l10n.corniceAndHeight(
                      (m.corniceLengthM ?? 0).toString(),
                      (m.heightM ?? 0).toString(),
                    ),
                    style: typography.bodyS,
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}

class _OrderFinanceSection extends StatelessWidget {
  final Order order;

  const _OrderFinanceSection({required this.order});

  @override
  Widget build(BuildContext context) {
    final typography = context.text;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSpacing.l),
        Text(
          context.l10n.finance,
          style: typography.titleM.copyWith(color: context.colors.textPrimary),
        ),
        const SizedBox(height: AppSpacing.s),
        AppCard(
          padding: const EdgeInsets.all(AppSpacing.m),
          child: Column(
            children: [
              _FinanceRow(
                label: context.l10n.orders_financeTotal,
                value: formatMoney(order.total ?? 0),
              ),
              if (order.prepayment != null)
                _FinanceRow(
                  label: context.l10n.orders_financePrepayment,
                  value: formatMoney(order.prepayment!),
                ),
              if (order.balance != null)
                _FinanceRow(
                  label: context.l10n.orders_financeBalance,
                  value: formatMoney(order.balance!),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FinanceRow extends StatelessWidget {
  final String label;
  final String value;

  const _FinanceRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final typography = context.text;
    final colors = context.colors;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: typography.bodyL.copyWith(color: colors.textSecondary),
          ),
          Text(
            value,
            style: typography.bodyL.copyWith(
              color: colors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _OrderDetailMenu extends StatelessWidget {
  final VoidCallback onPdf;
  final VoidCallback onShare;
  final VoidCallback onCancel;

  const _OrderDetailMenu({
    required this.onPdf,
    required this.onShare,
    required this.onCancel,
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
