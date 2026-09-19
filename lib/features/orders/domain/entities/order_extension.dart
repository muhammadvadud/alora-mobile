import 'package:flutter/material.dart';
import 'package:alora_mobile/features/orders/domain/entities/order.dart';
import 'package:alora_mobile/app/theme/app_colors.dart';

extension OrderExtension on Order {
  Color? deadlineColor(AppColors colors) {
    if (deadlineDate == null) return null;

    final now = DateTime.now();
    final difference = deadlineDate!.difference(now);

    if (difference.isNegative) {
      return colors.danger;
    } else if (difference.inDays <= 3) {
      return colors.warning;
    }

    return null;
  }
}
