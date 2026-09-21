import 'package:alora_mobile/features/orders/domain/entities/order.dart';

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
