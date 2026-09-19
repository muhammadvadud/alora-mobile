import 'dart:convert';

/// JSON'dagi Decimal qiymatni Dart o'lcham yoki koeffitsientiga aylantiradi.
double? doubleFromJson(Object? value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

/// Majburiy JSON Decimal qiymatini Dart double'ga aylantiradi.
double doubleFromJsonRequired(Object? value) => doubleFromJson(value) ?? 0.0;

/// Backend Decimal maydonlari uchun String JSON ko'rinishini qaytaradi.
String? doubleToJson(double? value) => value?.toString();

/// Tool natijasi Map yoki JSON string bo'lishi mumkin.
Map<String, dynamic>? toolResultFromJson(Object? value) {
  if (value == null) return null;
  if (value is Map<String, dynamic>) return value;
  if (value is String) {
    try {
      final decoded = jsonDecode(value);
      if (decoded is Map<String, dynamic>) return decoded;
    } on FormatException {
      return {'raw': value};
    }
    return {'raw': value};
  }
  return null;
}

/// Eski kesh/test javoblaridagi String applies_to qiymatini ham qabul qiladi.
Map<String, dynamic> mapFromJson(Object? value) {
  if (value is Map<String, dynamic>) return value;
  if (value is String && value.isNotEmpty) return {'value': value};
  if (value is List) return {'values': value};
  return <String, dynamic>{};
}
