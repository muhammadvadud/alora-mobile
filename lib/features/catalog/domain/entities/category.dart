import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class Category with _$Category {
  const factory Category({
    required String id,
    required String name,
    required String slug,
    String? parent,
    @Default(0) int sortOrder,
    @Default(true) bool isActive,
  }) = _Category;
}
