// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_user_dto.freezed.dart';
part 'order_user_dto.g.dart';

@freezed
abstract class OrderUserDto with _$OrderUserDto {
  const factory OrderUserDto({
    required String id,
    @JsonKey(name: 'full_name') String? fullName,
    String? phone,
  }) = _OrderUserDto;

  factory OrderUserDto.fromJson(Map<String, dynamic> json) =>
      _$OrderUserDtoFromJson(json);
}
