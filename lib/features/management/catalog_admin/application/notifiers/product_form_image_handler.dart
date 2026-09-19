import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

/// Ruxsat berilmaganida xato matni.
const String imagePermissionError = 'Ruxsat berilmadi';

/// Mahsulot rasmini tanlash, kesish va siqish bosqichlarini birlashtirgan
/// yordamchi. Notifier bundan faqat tayyor fayl yo'lini oladi.
class ProductFormImageHandler {
  const ProductFormImageHandler();

  /// Ruxsat so'raydi, galereyadan rasm tanlaydi, kesadi va siqadi.
  /// Foydalanuvchi bekor qilsa `[ProductFormImageResult.path]` `null` bo'ladi.
  Future<ProductFormImageResult> pickAndCompress() async {
    final status = await Permission.photos.request();
    if (status.isDenied || status.isPermanentlyDenied) {
      return const ProductFormImageResult(error: imagePermissionError);
    }

    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return const ProductFormImageResult();

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
          aspectRatioPresets: [CropAspectRatioPreset.ratio5x4, CropAspectRatioPreset.square],
        ),
      ],
    );
    if (croppedFile == null) return const ProductFormImageResult();

    final compressedBytes = await FlutterImageCompress.compressWithFile(
      croppedFile.path,
      minWidth: 1200,
      minHeight: 1200,
      quality: 85,
    );
    if (compressedBytes == null) return const ProductFormImageResult();

    final tempDir = await getTemporaryDirectory();
    final compressedFile = File('${tempDir.path}/compressed_image.jpg');
    await compressedFile.writeAsBytes(compressedBytes);
    return ProductFormImageResult(path: compressedFile.path);
  }
}

/// Rasmni tayyorlash natijasi. `path` — yuklashga tayyor fayl, `error` —
/// ruxsat/tayyorlash xatosi.
class ProductFormImageResult {
  const ProductFormImageResult({this.path, this.error});

  final String? path;
  final String? error;
}
