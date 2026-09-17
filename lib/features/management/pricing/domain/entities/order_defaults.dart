import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_defaults.freezed.dart';

@freezed
abstract class OrderDefaults with _$OrderDefaults {
  const factory OrderDefaults({
    required String id,
    required double defaultPrepaymentPercent,
    required int defaultDeliveryAmount,
    required bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _OrderDefaults;
}
