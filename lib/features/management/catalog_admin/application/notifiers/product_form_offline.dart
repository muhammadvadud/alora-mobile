import 'package:alora_mobile/features/management/catalog_admin/application/notifiers/product_form_state.dart';
import 'package:alora_mobile/features/management/catalog_admin/data/dto/catalog_write_dtos.dart';

/// Oflayn navbatga qo'shish uchun mahsulot tana (body) qismini tuzadi.
/// `isCreate` — yangi mahsulot (`POST`), aks holda faqat o'zgargan
/// maydonlar tahrirlash (`PATCH`) uchun qaytariladi.
Map<String, dynamic> productOfflineBody({
  required ProductFormState state,
  required ProductFormState initial,
  required List<VariantWriteDto> variants,
  required bool isCreate,
}) {
  if (isCreate) {
    return {
      'name': state.name,
      'code': state.code,
      'category': state.category,
      'style': 'default',
      'pattern': 'default',
      'transparency': 'default',
      'recommended_rooms': state.recommendedRooms,
      'segment': state.segment.isEmpty ? 'default' : state.segment,
      if (state.description.isNotEmpty) 'description': state.description,
      if (state.fabricType.isNotEmpty) 'fabric_type': state.fabricType,
      if (state.composition.isNotEmpty) 'composition': state.composition,
      if (state.care.isNotEmpty) 'care': state.care,
      'variants': [
        for (final v in variants)
          {
            'sku': v.sku,
            'color_name': v.colorName,
            'color_hex': v.colorHex,
            if (v.widthM != null) 'width_m': v.widthM,
            'price': v.price,
            'price_unit': v.priceUnit.name,
          },
      ],
    };
  }
  return {
    if (state.name != initial.name) 'name': state.name,
    if (state.code != initial.code) 'code': state.code,
    if (state.category != initial.category) 'category': state.category,
  };
}
