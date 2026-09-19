import 'package:json_annotation/json_annotation.dart';

part 'token_pair_dto.g.dart';

/// JWT tokenlar juftligi (API-CONTRACT 1.1 / 1.2 javoblari)
@JsonSerializable()
class TokenPairDto {
  final String access;
  final String refresh;

  const TokenPairDto({required this.access, required this.refresh});

  factory TokenPairDto.fromJson(Map<String, dynamic> json) => _$TokenPairDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TokenPairDtoToJson(this);
}
