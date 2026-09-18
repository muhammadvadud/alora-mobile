import "dart:io";

import "package:flutter/foundation.dart";
import "package:permission_handler/permission_handler.dart";
import "package:image_picker/image_picker.dart";
import "package:image_cropper/image_cropper.dart";
import "package:flutter_image_compress/flutter_image_compress.dart";
import "package:path_provider/path_provider.dart";
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../providers/catalog_providers.dart';
import '../../data/dto/catalog_write_dtos.dart';

import 'package:alora_mobile/features/catalog/domain/entities/product.dart';

import 'package:alora_mobile/core/storage/offline_queue.dart';
import 'package:alora_mobile/core/storage/offline_queue_item.dart';
import 'package:alora_mobile/core/error/failure.dart';

import 'product_form_state.dart';

import 'package:alora_mobile/shared/models/price_unit.dart';

part 'product_form_notifier.g.dart';

@riverpod
class ProductFormNotifier extends _$ProductFormNotifier {
  late ProductFormState _initialState;

  @override
  ProductFormState build() {
    _initialState = const ProductFormState(
      name: '',
      code: '',
      category: '',
      price: '',
      priceUnit: PriceUnit.perSqm,
      variants: [],
    );
    return _initialState;
  }

  void updateField(String key, Object? value) {
    var newState = state;
    switch (key) {
      case 'name':
        newState = newState.copyWith(name: value as String);
      case 'code':
        newState = newState.copyWith(code: value as String);
      case 'category':
        newState = newState.copyWith(category: value as String);
      case 'price':
        newState = newState.copyWith(price: value as String);
      case 'description':
        newState = newState.copyWith(description: value as String);
      case 'fabricType':
        newState = newState.copyWith(fabricType: value as String);
      case 'composition':
        newState = newState.copyWith(composition: value as String);
      case 'care':
        newState = newState.copyWith(care: value as String);
      case 'segment':
        newState = newState.copyWith(segment: value as String);
      case 'priceUnit':
        newState = newState.copyWith(
          priceUnit: PriceUnit.values.firstWhere(
            (u) => u.name == value,
            orElse: () => PriceUnit.perSqm,
          ),
        );
    }

    final errors = Map<String, String>.from(newState.errors);
    _validate(newState, errors);

    final isDirty =
        newState.name != _initialState.name ||
        newState.code != _initialState.code ||
        newState.category != _initialState.category ||
        newState.price != _initialState.price ||
        newState.priceUnit != _initialState.priceUnit ||
        newState.description != _initialState.description ||
        newState.fabricType != _initialState.fabricType ||
        newState.composition != _initialState.composition ||
        newState.care != _initialState.care ||
        newState.segment != _initialState.segment;

    state = newState.copyWith(errors: errors, isDirty: isDirty);
  }

  void toggleRecommendedRoom(String room) {
    final rooms = [...state.recommendedRooms];
    if (rooms.contains(room)) {
      rooms.remove(room);
    } else {
      rooms.add(room);
    }
    state = state.copyWith(
      recommendedRooms: rooms,
      isDirty: !setEquals(
        rooms.toSet(),
        _initialState.recommendedRooms.toSet(),
      ),
    );
  }

  void load(Product product) {
    final variants = product.variants
        .map(
          (v) => VariantWriteDto(
            id: v.id,
            sku: v.sku,
            colorName: v.colorName,
            colorHex: v.colorHex,
            widthM: v.widthM,
            price: v.price.toString(),
            priceUnit: v.priceUnit,
            isActive: v.isActive,
          ),
        )
        .toList();
    _initialState = ProductFormState(
      name: product.name,
      code: product.code,
      category: product.categoryId,
      price: product.variants.isEmpty
          ? ''
          : product.variants.first.price.toString(),
      priceUnit: product.variants.isEmpty
          ? PriceUnit.perSqm
          : product.variants.first.priceUnit,
      variants: variants,
      description: product.description ?? '',
      fabricType: product.fabricType ?? '',
      composition: product.composition ?? '',
      care: product.care ?? '',
      segment: product.segment?.name ?? '',
      recommendedRooms: [...product.recommendedRooms],
    );
    state = _initialState;
  }

  void addVariant() {
    final variant = VariantWriteDto(
      sku: state.code,
      colorName: '',
      colorHex: '#FFFFFF',
      price: state.price,
      priceUnit: state.priceUnit,
    );
    state = state.copyWith(
      variants: [...state.variants, variant],
      isDirty: true,
    );
  }

  void updateVariant(int index, String field, Object? value) {
    if (index < 0 || index >= state.variants.length) return;
    final current = state.variants[index];
    VariantWriteDto updated;
    switch (field) {
      case 'sku':
        updated = current.copyWith(sku: value as String);
      case 'colorName':
        updated = current.copyWith(colorName: value as String);
      case 'colorHex':
        updated = current.copyWith(colorHex: value as String);
      case 'widthM':
        updated = current.copyWith(widthM: (value as num).toDouble());
      case 'price':
        updated = current.copyWith(price: value as String);
      case 'priceUnit':
        updated = current.copyWith(
          priceUnit: PriceUnit.values.firstWhere(
            (u) => u.name == value,
            orElse: () => PriceUnit.perSqm,
          ),
        );
      case 'isActive':
        updated = current.copyWith(isActive: value as bool);
      default:
        return;
    }
    final variants = [...state.variants]..[index] = updated;
    state = state.copyWith(variants: variants, isDirty: true);
  }

  void removeVariant(int index) {
    if (index < 0 || index >= state.variants.length) return;
    state = state.copyWith(
      variants: [...state.variants]..removeAt(index),
      isDirty: true,
    );
  }

  VariantWriteDto _defaultVariant() {
    return VariantWriteDto(
      sku: state.code,
      colorName: 'Standart',
      colorHex: '#FFFFFF',
      widthM: null,
      price: state.price,
      priceUnit: state.priceUnit,
      isActive: true,
    );
  }

  void _validate(ProductFormState s, Map<String, String> errors) {
    if (s.name.isEmpty) {
      errors['name'] = 'Kiritish majburiy';
    } else {
      errors.remove('name');
    }

    if (s.code.isEmpty) {
      errors['code'] = 'Kiritish majburiy';
    } else {
      errors.remove('code');
    }

    if (s.category.isEmpty) {
      errors['category'] = 'Kiritish majburiy';
    } else {
      errors.remove('category');
    }

    final priceVal = double.tryParse(s.price);
    if (priceVal == null || priceVal <= 0) {
      errors['price'] = 'Noldan katta bo\'lishi kerak';
    } else {
      errors.remove('price');
    }

    for (int i = 0; i < s.variants.length; i++) {
      final v = s.variants[i];
      if (!RegExp(r'^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$').hasMatch(v.colorHex)) {
        errors['variants.$i.color_hex'] = 'Format noto\'g\'ri';
      } else {
        errors.remove('variants.$i.color_hex');
      }
      if (v.sku.isEmpty) {
        errors['variants.$i.sku'] = 'Kiritish majburiy';
      } else {
        errors.remove('variants.$i.sku');
      }
      final variantPrice = double.tryParse(v.price);
      if (variantPrice == null || variantPrice <= 0) {
        errors['variants.$i.price'] = 'Noldan katta bo\'lishi kerak';
      } else {
        errors.remove('variants.$i.price');
      }
    }
  }

  Future<bool> save({String? productId}) async {
    final errors = <String, String>{};
    _validate(state, errors);
    if (errors.isNotEmpty) {
      state = state.copyWith(errors: errors);
      return false;
    }

    final variants = state.variants.isEmpty
        ? [_defaultVariant()]
        : state.variants;

    state = state.copyWith(isSaving: true);
    try {
      final repo = ref.read(catalogWriteRepositoryProvider);
      if (productId == null) {
        final dto = ProductWriteDto(
          name: state.name,
          code: state.code,
          category: state.category,
          style: 'default',
          pattern: 'default',
          transparency: 'default',
          recommendedRooms: state.recommendedRooms,
          segment: state.segment.isEmpty ? 'default' : state.segment,
          description: state.description.isEmpty ? null : state.description,
          fabricType: state.fabricType.isEmpty ? null : state.fabricType,
          composition: state.composition.isEmpty ? null : state.composition,
          care: state.care.isEmpty ? null : state.care,
          variants: variants,
        );
        await repo.createProduct(dto);
      } else {
        final patchData = <String, dynamic>{};
        if (state.name != _initialState.name) patchData['name'] = state.name;
        if (state.code != _initialState.code) patchData['code'] = state.code;
        if (state.category != _initialState.category) {
          patchData['category'] = state.category;
        }

        if (patchData.isNotEmpty) {
          await repo.updateProduct(productId, patchData);
        }

        for (final variant in state.variants) {
          final body = <String, dynamic>{
            'sku': variant.sku,
            'color_name': variant.colorName,
            'color_hex': variant.colorHex,
            'price': variant.price,
            'price_unit': variant.priceUnit.name,
            if (variant.widthM != null) 'width_m': variant.widthM,
            if (variant.isActive != null) 'is_active': variant.isActive,
          };
          if (variant.id == null) {
            await repo.createVariant(productId, variant);
          } else {
            await repo.updateVariant(variant.id!, body);
          }
        }

        for (final removed in _initialState.variants) {
          if (removed.id != null &&
              !state.variants.any((v) => v.id == removed.id)) {
            await repo.deleteVariant(removed.id!);
          }
        }
      }
      state = state.copyWith(isSaving: false, isDirty: false);
      _initialState = state;
      return true;
    } catch (e) {
      state = state.copyWith(isSaving: false);
      if (e is Failure) {
        e.whenOrNull(
          network: () {
            // Queue on offline
            final method = productId == null ? 'POST' : 'PATCH';
            final path = productId == null
                ? '/catalog/products/'
                : '/catalog/products/$productId/';
            final data = productId == null
                ? {
                    'name': state.name,
                    'code': state.code,
                    'category': state.category,
                    'style': 'default',
                    'pattern': 'default',
                    'transparency': 'default',
                    'recommended_rooms': state.recommendedRooms,
                    'segment': state.segment.isEmpty
                        ? 'default'
                        : state.segment,
                    if (state.description.isNotEmpty)
                      'description': state.description,
                    if (state.fabricType.isNotEmpty)
                      'fabric_type': state.fabricType,
                    if (state.composition.isNotEmpty)
                      'composition': state.composition,
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
                  }
                : {
                    if (state.name != _initialState.name) 'name': state.name,
                    if (state.code != _initialState.code) 'code': state.code,
                    if (state.category != _initialState.category)
                      'category': state.category,
                  };

            final item = OfflineQueueItem.create(
              method: method,
              path: path,
              body: data,
            );
            OfflineQueue.add(item);
          },
          validation: (detail, fieldErrors) {
            state = state.copyWith(errors: fieldErrors);
          },
          server: () {
            state = state.copyWith(
              errors: {
                ...state.errors,
                'form': 'Server versiyasi saqlandi (Konflikt) yoki xatolik',
              },
            );
          },
        );
      }
      return false;
    }
  }

  // coverage:ignore-start
  Future<void> uploadImage(String productId) async {
    // 1. permission (sababi bilan)
    final status = await Permission.photos.request();
    if (status.isDenied || status.isPermanentlyDenied) {
      state = state.copyWith(
        errors: {...state.errors, 'image': 'Ruxsat berilmadi'},
      );
      return;
    }

    // 2. picker
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return;

    // 3. cropper
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Rasmni kesish',
          initAspectRatio: CropAspectRatioPreset.ratio5x4,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Rasmni kesish',
          aspectRatioPresets: [
            CropAspectRatioPreset.ratio5x4,
            CropAspectRatioPreset.square,
          ],
        ),
      ],
    );
    if (croppedFile == null) return;

    // 4. compress
    final compressedBytes = await FlutterImageCompress.compressWithFile(
      croppedFile.path,
      minWidth: 1200,
      minHeight: 1200,
      quality: 85,
    );
    if (compressedBytes == null) return;

    final tempDir = await getTemporaryDirectory();
    final compressedFile = File('${tempDir.path}/compressed_image.jpg');
    await compressedFile.writeAsBytes(compressedBytes);

    // 5. repo.uploadProductImage
    state = state.copyWith(isSaving: true);
    try {
      final repo = ref.read(catalogWriteRepositoryProvider);
      await repo.uploadProductImage(
        productId,
        compressedFile.path,
        onSendProgress: (sent, total) {
          // You could update progress in state here
        },
      );
      state = state.copyWith(isSaving: false);
    } catch (e) {
      state = state.copyWith(isSaving: false);
      if (e is Failure) {
        e.whenOrNull(
          server: () {
            state = state.copyWith(
              errors: {...state.errors, 'image': 'Xatolik yuz berdi'},
            );
          },
        );
      }
    }
  }
  // coverage:ignore-end
}
