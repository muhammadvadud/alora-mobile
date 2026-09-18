import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:alora_mobile/shared/models/price_unit.dart';
import 'package:alora_mobile/features/management/catalog_admin/data/dto/catalog_write_dtos.dart';

part 'product_form_state.freezed.dart';

@freezed
abstract class ProductFormState with _$ProductFormState {
  const factory ProductFormState({
    required String name,
    required String code,
    required String category,
    required String price,
    required PriceUnit priceUnit,
    required List<VariantWriteDto> variants,
    @Default('') String description,
    @Default('') String fabricType,
    @Default('') String composition,
    @Default('') String care,
    @Default('') String segment,
    @Default([]) List<String> recommendedRooms,
    @Default(false) bool isDirty,
    @Default(false) bool isSaving,
    @Default({}) Map<String, String> errors,
  }) = _ProductFormState;
}
