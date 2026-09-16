// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Product {

 String get id; String get categoryId; Category? get categoryData; String get name; String get code; String? get description; String? get fabricType; ProductStyle? get style; ProductPattern? get pattern; ProductTransparency? get transparency; ProductDensity? get density; String? get composition; String? get care; List<String> get recommendedRooms; double? get recommendedCoef; double? get defaultWidthM; bool get isSewingRequired; ProductSegment? get segment; List<String> get tags; int get sortOrder; bool get isActive; List<ProductVariant> get variants;
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCopyWith<Product> get copyWith => _$ProductCopyWithImpl<Product>(this as Product, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Product&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryData, categoryData) || other.categoryData == categoryData)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.description, description) || other.description == description)&&(identical(other.fabricType, fabricType) || other.fabricType == fabricType)&&(identical(other.style, style) || other.style == style)&&(identical(other.pattern, pattern) || other.pattern == pattern)&&(identical(other.transparency, transparency) || other.transparency == transparency)&&(identical(other.density, density) || other.density == density)&&(identical(other.composition, composition) || other.composition == composition)&&(identical(other.care, care) || other.care == care)&&const DeepCollectionEquality().equals(other.recommendedRooms, recommendedRooms)&&(identical(other.recommendedCoef, recommendedCoef) || other.recommendedCoef == recommendedCoef)&&(identical(other.defaultWidthM, defaultWidthM) || other.defaultWidthM == defaultWidthM)&&(identical(other.isSewingRequired, isSewingRequired) || other.isSewingRequired == isSewingRequired)&&(identical(other.segment, segment) || other.segment == segment)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other.variants, variants));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,categoryId,categoryData,name,code,description,fabricType,style,pattern,transparency,density,composition,care,const DeepCollectionEquality().hash(recommendedRooms),recommendedCoef,defaultWidthM,isSewingRequired,segment,const DeepCollectionEquality().hash(tags),sortOrder,isActive,const DeepCollectionEquality().hash(variants)]);

@override
String toString() {
  return 'Product(id: $id, categoryId: $categoryId, categoryData: $categoryData, name: $name, code: $code, description: $description, fabricType: $fabricType, style: $style, pattern: $pattern, transparency: $transparency, density: $density, composition: $composition, care: $care, recommendedRooms: $recommendedRooms, recommendedCoef: $recommendedCoef, defaultWidthM: $defaultWidthM, isSewingRequired: $isSewingRequired, segment: $segment, tags: $tags, sortOrder: $sortOrder, isActive: $isActive, variants: $variants)';
}


}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res>  {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) = _$ProductCopyWithImpl;
@useResult
$Res call({
 String id, String categoryId, Category? categoryData, String name, String code, String? description, String? fabricType, ProductStyle? style, ProductPattern? pattern, ProductTransparency? transparency, ProductDensity? density, String? composition, String? care, List<String> recommendedRooms, double? recommendedCoef, double? defaultWidthM, bool isSewingRequired, ProductSegment? segment, List<String> tags, int sortOrder, bool isActive, List<ProductVariant> variants
});


$CategoryCopyWith<$Res>? get categoryData;

}
/// @nodoc
class _$ProductCopyWithImpl<$Res>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? categoryId = null,Object? categoryData = freezed,Object? name = null,Object? code = null,Object? description = freezed,Object? fabricType = freezed,Object? style = freezed,Object? pattern = freezed,Object? transparency = freezed,Object? density = freezed,Object? composition = freezed,Object? care = freezed,Object? recommendedRooms = null,Object? recommendedCoef = freezed,Object? defaultWidthM = freezed,Object? isSewingRequired = null,Object? segment = freezed,Object? tags = null,Object? sortOrder = null,Object? isActive = null,Object? variants = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,categoryData: freezed == categoryData ? _self.categoryData : categoryData // ignore: cast_nullable_to_non_nullable
as Category?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,fabricType: freezed == fabricType ? _self.fabricType : fabricType // ignore: cast_nullable_to_non_nullable
as String?,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as ProductStyle?,pattern: freezed == pattern ? _self.pattern : pattern // ignore: cast_nullable_to_non_nullable
as ProductPattern?,transparency: freezed == transparency ? _self.transparency : transparency // ignore: cast_nullable_to_non_nullable
as ProductTransparency?,density: freezed == density ? _self.density : density // ignore: cast_nullable_to_non_nullable
as ProductDensity?,composition: freezed == composition ? _self.composition : composition // ignore: cast_nullable_to_non_nullable
as String?,care: freezed == care ? _self.care : care // ignore: cast_nullable_to_non_nullable
as String?,recommendedRooms: null == recommendedRooms ? _self.recommendedRooms : recommendedRooms // ignore: cast_nullable_to_non_nullable
as List<String>,recommendedCoef: freezed == recommendedCoef ? _self.recommendedCoef : recommendedCoef // ignore: cast_nullable_to_non_nullable
as double?,defaultWidthM: freezed == defaultWidthM ? _self.defaultWidthM : defaultWidthM // ignore: cast_nullable_to_non_nullable
as double?,isSewingRequired: null == isSewingRequired ? _self.isSewingRequired : isSewingRequired // ignore: cast_nullable_to_non_nullable
as bool,segment: freezed == segment ? _self.segment : segment // ignore: cast_nullable_to_non_nullable
as ProductSegment?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,variants: null == variants ? _self.variants : variants // ignore: cast_nullable_to_non_nullable
as List<ProductVariant>,
  ));
}
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res>? get categoryData {
    if (_self.categoryData == null) {
    return null;
  }

  return $CategoryCopyWith<$Res>(_self.categoryData!, (value) {
    return _then(_self.copyWith(categoryData: value));
  });
}
}


/// Adds pattern-matching-related methods to [Product].
extension ProductPatterns on Product {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Product value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Product value)  $default,){
final _that = this;
switch (_that) {
case _Product():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Product value)?  $default,){
final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String categoryId,  Category? categoryData,  String name,  String code,  String? description,  String? fabricType,  ProductStyle? style,  ProductPattern? pattern,  ProductTransparency? transparency,  ProductDensity? density,  String? composition,  String? care,  List<String> recommendedRooms,  double? recommendedCoef,  double? defaultWidthM,  bool isSewingRequired,  ProductSegment? segment,  List<String> tags,  int sortOrder,  bool isActive,  List<ProductVariant> variants)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.categoryId,_that.categoryData,_that.name,_that.code,_that.description,_that.fabricType,_that.style,_that.pattern,_that.transparency,_that.density,_that.composition,_that.care,_that.recommendedRooms,_that.recommendedCoef,_that.defaultWidthM,_that.isSewingRequired,_that.segment,_that.tags,_that.sortOrder,_that.isActive,_that.variants);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String categoryId,  Category? categoryData,  String name,  String code,  String? description,  String? fabricType,  ProductStyle? style,  ProductPattern? pattern,  ProductTransparency? transparency,  ProductDensity? density,  String? composition,  String? care,  List<String> recommendedRooms,  double? recommendedCoef,  double? defaultWidthM,  bool isSewingRequired,  ProductSegment? segment,  List<String> tags,  int sortOrder,  bool isActive,  List<ProductVariant> variants)  $default,) {final _that = this;
switch (_that) {
case _Product():
return $default(_that.id,_that.categoryId,_that.categoryData,_that.name,_that.code,_that.description,_that.fabricType,_that.style,_that.pattern,_that.transparency,_that.density,_that.composition,_that.care,_that.recommendedRooms,_that.recommendedCoef,_that.defaultWidthM,_that.isSewingRequired,_that.segment,_that.tags,_that.sortOrder,_that.isActive,_that.variants);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String categoryId,  Category? categoryData,  String name,  String code,  String? description,  String? fabricType,  ProductStyle? style,  ProductPattern? pattern,  ProductTransparency? transparency,  ProductDensity? density,  String? composition,  String? care,  List<String> recommendedRooms,  double? recommendedCoef,  double? defaultWidthM,  bool isSewingRequired,  ProductSegment? segment,  List<String> tags,  int sortOrder,  bool isActive,  List<ProductVariant> variants)?  $default,) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.categoryId,_that.categoryData,_that.name,_that.code,_that.description,_that.fabricType,_that.style,_that.pattern,_that.transparency,_that.density,_that.composition,_that.care,_that.recommendedRooms,_that.recommendedCoef,_that.defaultWidthM,_that.isSewingRequired,_that.segment,_that.tags,_that.sortOrder,_that.isActive,_that.variants);case _:
  return null;

}
}

}

/// @nodoc


class _Product implements Product {
  const _Product({required this.id, required this.categoryId, required this.categoryData, required this.name, required this.code, this.description, this.fabricType, this.style, this.pattern, this.transparency, this.density, this.composition, this.care, this.recommendedRooms = const [], this.recommendedCoef, this.defaultWidthM, this.isSewingRequired = true, this.segment, this.tags = const [], this.sortOrder = 0, this.isActive = true, this.variants = const []});
  

@override final  String id;
@override final  String categoryId;
@override final  Category? categoryData;
@override final  String name;
@override final  String code;
@override final  String? description;
@override final  String? fabricType;
@override final  ProductStyle? style;
@override final  ProductPattern? pattern;
@override final  ProductTransparency? transparency;
@override final  ProductDensity? density;
@override final  String? composition;
@override final  String? care;
@override@JsonKey() final  List<String> recommendedRooms;
@override final  double? recommendedCoef;
@override final  double? defaultWidthM;
@override@JsonKey() final  bool isSewingRequired;
@override final  ProductSegment? segment;
@override@JsonKey() final  List<String> tags;
@override@JsonKey() final  int sortOrder;
@override@JsonKey() final  bool isActive;
@override@JsonKey() final  List<ProductVariant> variants;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCopyWith<_Product> get copyWith => __$ProductCopyWithImpl<_Product>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Product&&(identical(other.id, id) || other.id == id)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryData, categoryData) || other.categoryData == categoryData)&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.description, description) || other.description == description)&&(identical(other.fabricType, fabricType) || other.fabricType == fabricType)&&(identical(other.style, style) || other.style == style)&&(identical(other.pattern, pattern) || other.pattern == pattern)&&(identical(other.transparency, transparency) || other.transparency == transparency)&&(identical(other.density, density) || other.density == density)&&(identical(other.composition, composition) || other.composition == composition)&&(identical(other.care, care) || other.care == care)&&const DeepCollectionEquality().equals(other.recommendedRooms, recommendedRooms)&&(identical(other.recommendedCoef, recommendedCoef) || other.recommendedCoef == recommendedCoef)&&(identical(other.defaultWidthM, defaultWidthM) || other.defaultWidthM == defaultWidthM)&&(identical(other.isSewingRequired, isSewingRequired) || other.isSewingRequired == isSewingRequired)&&(identical(other.segment, segment) || other.segment == segment)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other.variants, variants));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,categoryId,categoryData,name,code,description,fabricType,style,pattern,transparency,density,composition,care,const DeepCollectionEquality().hash(recommendedRooms),recommendedCoef,defaultWidthM,isSewingRequired,segment,const DeepCollectionEquality().hash(tags),sortOrder,isActive,const DeepCollectionEquality().hash(variants)]);

@override
String toString() {
  return 'Product(id: $id, categoryId: $categoryId, categoryData: $categoryData, name: $name, code: $code, description: $description, fabricType: $fabricType, style: $style, pattern: $pattern, transparency: $transparency, density: $density, composition: $composition, care: $care, recommendedRooms: $recommendedRooms, recommendedCoef: $recommendedCoef, defaultWidthM: $defaultWidthM, isSewingRequired: $isSewingRequired, segment: $segment, tags: $tags, sortOrder: $sortOrder, isActive: $isActive, variants: $variants)';
}


}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) = __$ProductCopyWithImpl;
@override @useResult
$Res call({
 String id, String categoryId, Category? categoryData, String name, String code, String? description, String? fabricType, ProductStyle? style, ProductPattern? pattern, ProductTransparency? transparency, ProductDensity? density, String? composition, String? care, List<String> recommendedRooms, double? recommendedCoef, double? defaultWidthM, bool isSewingRequired, ProductSegment? segment, List<String> tags, int sortOrder, bool isActive, List<ProductVariant> variants
});


@override $CategoryCopyWith<$Res>? get categoryData;

}
/// @nodoc
class __$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? categoryId = null,Object? categoryData = freezed,Object? name = null,Object? code = null,Object? description = freezed,Object? fabricType = freezed,Object? style = freezed,Object? pattern = freezed,Object? transparency = freezed,Object? density = freezed,Object? composition = freezed,Object? care = freezed,Object? recommendedRooms = null,Object? recommendedCoef = freezed,Object? defaultWidthM = freezed,Object? isSewingRequired = null,Object? segment = freezed,Object? tags = null,Object? sortOrder = null,Object? isActive = null,Object? variants = null,}) {
  return _then(_Product(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,categoryData: freezed == categoryData ? _self.categoryData : categoryData // ignore: cast_nullable_to_non_nullable
as Category?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,fabricType: freezed == fabricType ? _self.fabricType : fabricType // ignore: cast_nullable_to_non_nullable
as String?,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as ProductStyle?,pattern: freezed == pattern ? _self.pattern : pattern // ignore: cast_nullable_to_non_nullable
as ProductPattern?,transparency: freezed == transparency ? _self.transparency : transparency // ignore: cast_nullable_to_non_nullable
as ProductTransparency?,density: freezed == density ? _self.density : density // ignore: cast_nullable_to_non_nullable
as ProductDensity?,composition: freezed == composition ? _self.composition : composition // ignore: cast_nullable_to_non_nullable
as String?,care: freezed == care ? _self.care : care // ignore: cast_nullable_to_non_nullable
as String?,recommendedRooms: null == recommendedRooms ? _self.recommendedRooms : recommendedRooms // ignore: cast_nullable_to_non_nullable
as List<String>,recommendedCoef: freezed == recommendedCoef ? _self.recommendedCoef : recommendedCoef // ignore: cast_nullable_to_non_nullable
as double?,defaultWidthM: freezed == defaultWidthM ? _self.defaultWidthM : defaultWidthM // ignore: cast_nullable_to_non_nullable
as double?,isSewingRequired: null == isSewingRequired ? _self.isSewingRequired : isSewingRequired // ignore: cast_nullable_to_non_nullable
as bool,segment: freezed == segment ? _self.segment : segment // ignore: cast_nullable_to_non_nullable
as ProductSegment?,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,variants: null == variants ? _self.variants : variants // ignore: cast_nullable_to_non_nullable
as List<ProductVariant>,
  ));
}

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res>? get categoryData {
    if (_self.categoryData == null) {
    return null;
  }

  return $CategoryCopyWith<$Res>(_self.categoryData!, (value) {
    return _then(_self.copyWith(categoryData: value));
  });
}
}

// dart format on
