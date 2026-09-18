import 'package:alora_mobile/shared/extensions/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:alora_mobile/shared/icons/app_icons.dart';
import 'package:alora_mobile/app/theme/app_spacing.dart';
import 'package:alora_mobile/shared/extensions/theme_extensions.dart';
import 'package:alora_mobile/shared/models/order_status.dart';

class StatusTimeline extends StatelessWidget {
  final OrderStatus currentStatus;
  final DateTime? actionDate; // maybe list of actions, but we just highlight the current one for now

  const StatusTimeline({
    super.key,
    required this.currentStatus,
    this.actionDate,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final typography = context.text;

    final steps = [
      OrderStatus.draft,
      OrderStatus.confirmed,
      OrderStatus.measuring,
      OrderStatus.production,
      OrderStatus.ready,
      OrderStatus.installing,
      OrderStatus.completed,
    ];

    if (currentStatus == OrderStatus.cancelled) {
      return Row(
        children: [
          Icon(AppIcons.close, color: colors.danger),
          const SizedBox(width: AppSpacing.s),
          Text(
            context.l10n.cancelled,
            style: typography.bodyL.copyWith(
              color: colors.danger,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    }

    final currentIndex = steps.indexOf(currentStatus);

    return Column(
      children: List.generate(steps.length, (index) {
        final status = steps[index];
        final isPassed = index < currentIndex;
        final isCurrent = index == currentIndex;

        final color = isPassed || isCurrent ? colors.accent : colors.border;
        final iconColor = isPassed || isCurrent
            ? colors.onAccent
            : colors.textDisabled;
        final bgColor = isPassed || isCurrent ? colors.accent : colors.surface;

        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: bgColor,
                      shape: BoxShape.circle,
                      border: isPassed || isCurrent
                          ? null
                          : Border.all(color: color),
                    ),
                    child: isPassed
                        ? Icon(AppIcons.check, size: 14, color: iconColor)
                        : (isCurrent
                              ? Icon(AppIcons.dot, size: 8, color: iconColor)
                              : null),
                  ),
                  if (index < steps.length - 1)
                    Expanded(child: Container(width: 2, color: color)),
                ],
              ),
              const SizedBox(width: AppSpacing.m),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.l),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _getStatusName(status),
                        style: typography.bodyL.copyWith(
                          color: isPassed || isCurrent
                              ? colors.textPrimary
                              : colors.textDisabled,
                          fontWeight: isCurrent
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      if (isCurrent && actionDate != null)
                        Text(
                          actionDate!.toString().split(
                            ' ',
                          )[0], // Format properly in prod
                          style: typography.bodyS.copyWith(
                            color: colors.textSecondary,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  String _getStatusName(OrderStatus status) {
    switch (status) {
      case OrderStatus.draft:
        return 'Qoralama';
      case OrderStatus.confirmed:
        return 'Tasdiqlangan';
      case OrderStatus.measuring:
        return 'O\'lchovda';
      case OrderStatus.production:
        return 'Tikuvda';
      case OrderStatus.ready:
        return 'Tayyor';
      case OrderStatus.installing:
        return 'O\'rnatishda';
      case OrderStatus.completed:
        return 'Topshirildi';
      default:
        return 'Noma\'lum';
    }
  }
}
