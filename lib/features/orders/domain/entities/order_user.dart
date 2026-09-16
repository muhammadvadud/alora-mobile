import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_user.freezed.dart';

@freezed
abstract class OrderUser with _$OrderUser {
  const factory OrderUser({
    required String id,
    String? fullName,
    String? phone,
  }) = _OrderUser;
}
