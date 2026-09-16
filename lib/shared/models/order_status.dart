import 'package:json_annotation/json_annotation.dart';

enum OrderStatus {
  @JsonValue('draft')
  draft,
  @JsonValue('confirmed')
  confirmed,
  @JsonValue('measuring')
  measuring,
  @JsonValue('production')
  production,
  @JsonValue('ready')
  ready,
  @JsonValue('installing')
  installing,
  @JsonValue('completed')
  completed,
  @JsonValue('cancelled')
  cancelled,
  @JsonValue('unknown')
  unknown,
}
