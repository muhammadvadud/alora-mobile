import 'package:json_annotation/json_annotation.dart';

enum ProductType {
  @JsonValue('fabric')
  fabric,
  @JsonValue('accessory')
  accessory,
  @JsonValue('unknown')
  unknown,
}

enum ProductStyle {
  @JsonValue('klassik')
  klassik,
  @JsonValue('zamonaviy')
  zamonaviy,
  @JsonValue('minimalist')
  minimalist,
  @JsonValue('unknown')
  unknown,
}

enum ProductRoom {
  @JsonValue('mehmonxona')
  mehmonxona,
  @JsonValue('yotoqxona')
  yotoqxona,
  @JsonValue('oshxona')
  oshxona,
  @JsonValue('bolalar_xonasi')
  bolalarXonasi,
  @JsonValue('ofis')
  ofis,
  @JsonValue('unknown')
  unknown,
}

enum ProductPattern {
  @JsonValue('yassi')
  yassi,
  @JsonValue('gulli')
  gulli,
  @JsonValue('chiziqli')
  chiziqli,
  @JsonValue('geometrik')
  geometrik,
  @JsonValue('unknown')
  unknown,
}

enum ProductTransparency {
  @JsonValue('yopiq')
  yopiq,
  @JsonValue('yarim_yorug')
  yarimYorug,
  @JsonValue('yorug')
  yorug,
  @JsonValue('unknown')
  unknown,
}

enum ProductDensity {
  @JsonValue('yengil')
  yengil,
  @JsonValue('ogir')
  ogir,
  @JsonValue('unknown')
  unknown,
}

enum ProductSegment {
  @JsonValue('economy')
  economy,
  @JsonValue('standard')
  standard,
  @JsonValue('premium')
  premium,
  @JsonValue('unknown')
  unknown,
}
