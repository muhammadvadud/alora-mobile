import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote.freezed.dart';

@freezed
abstract class QuoteFabric with _$QuoteFabric {
  const factory QuoteFabric({
    required String role,
    required String variantId,
    required String colorName,
    required String colorHex,
    required double widthM,
    required double heightM,
    required double coef,
    required double areaSqm,
    required int pricePerSqm,
    required int total,
  }) = _QuoteFabric;
}

@freezed
abstract class QuoteAccessory with _$QuoteAccessory {
  const factory QuoteAccessory({
    required String name,
    required double qty,
    required String unit,
    required int unitPrice,
    required int total,
  }) = _QuoteAccessory;
}

@freezed
abstract class QuoteService with _$QuoteService {
  const factory QuoteService({
    required String name,
    double? qty,
    required int total,
  }) = _QuoteService;
}

@freezed
abstract class QuoteMeasurement with _$QuoteMeasurement {
  const factory QuoteMeasurement({
    String? room,
    required double cornice,
    required double height,
    required double coef,
  }) = _QuoteMeasurement;
}

@freezed
abstract class Quote with _$Quote {
  const factory Quote({
    required List<QuoteFabric> fabrics,
    required List<QuoteAccessory> accessories,
    required List<QuoteService> services,
    required List<String> wasteWarnings,
    required String formula,
    required int subtotal,
    required int discount,
    required int delivery,
    required int total,
    QuoteMeasurement? measurement,
  }) = _Quote;
}
