import 'package:flutter/material.dart';
import 'package:alora_mobile/features/orders/domain/entities/order.dart';
import 'package:alora_mobile/app/theme/app_colors.dart';

/// Ajratib ko'rsatish uchun yig'indi getterlari. Hisob-kitoblar backendda
/// bajariladi (rules.md §0.8), bu yerda faqat ko'rsatish uchun yig'iladi.
extension OrderSumsX on Order {
  int get partsTotal {
    var sum = 0;
    for (final m in measurements) {
      for (final part in m.parts) {
        sum += part.total ?? 0;
      }
    }
    return sum;
  }

  int get accessoriesTotal {
    var sum = 0;
    for (final m in measurements) {
      for (final accessory in m.accessories) {
        sum += accessory.total ?? 0;
      }
    }
    return sum;
  }

  int get servicesTotal {
    var sum = 0;
    for (final item in items) {
      sum += item.total ?? 0;
    }
    return sum;
  }
}

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
