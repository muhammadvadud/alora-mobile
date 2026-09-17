import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_price.freezed.dart';

@freezed
abstract class ServicePrice with _$ServicePrice {
  const factory ServicePrice({
    required String id,
    required String key,
    required String name,
    required int price,
    required String unit,
    required bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ServicePrice;
}
