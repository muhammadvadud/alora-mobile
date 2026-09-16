// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_variant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductVariant {

 String get id; String get sku; String get colorName; String get colorHex; double get widthM; int get price; PriceUnit get priceUnit; int? get oldPrice; int? get costPrice; bool get isActive; List<ProductImage> get images;
/// Create a copy of ProductVariant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductVariantCopyWith<ProductVariant> get copyWith => _$ProductVariantCopyWithImpl<ProductVariant>(this as ProductVariant, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductVariant&&(identical(other.id, id) || other.id == id)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.colorName, colorName) || other.colorName == colorName)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.widthM, widthM) || other.widthM == widthM)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceUnit, priceUnit) || other.priceUnit == priceUnit)&&(identical(other.oldPrice, oldPrice) || other.oldPrice == oldPrice)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other.images, images));
}


@override
int get hashCode => Object.hash(runtimeType,id,sku,colorName,colorHex,widthM,price,priceUnit,oldPrice,costPrice,isActive,const DeepCollectionEquality().hash(images));

@override
String toString() {
  return 'ProductVariant(id: $id, sku: $sku, colorName: $colorName, colorHex: $colorHex, widthM: $widthM, price: $price, priceUnit: $priceUnit, oldPrice: $oldPrice, costPrice: $costPrice, isActive: $isActive, images: $images)';
}


}

/// @nodoc
abstract mixin class $ProductVariantCopyWith<$Res>  {
  factory $ProductVariantCopyWith(ProductVariant value, $Res Function(ProductVariant) _then) = _$ProductVariantCopyWithImpl;
@useResult
$Res call({
 String id, String sku, String colorName, String colorHex, double widthM, int price, PriceUnit priceUnit, int? oldPrice, int? costPrice, bool isActive, List<ProductImage> images
});




}
/// @nodoc
class _$ProductVariantCopyWithImpl<$Res>
    implements $ProductVariantCopyWith<$Res> {
  _$ProductVariantCopyWithImpl(this._self, this._then);

  final ProductVariant _self;
  final $Res Function(ProductVariant) _then;

/// Create a copy of ProductVariant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sku = null,Object? colorName = null,Object? colorHex = null,Object? widthM = null,Object? price = null,Object? priceUnit = null,Object? oldPrice = freezed,Object? costPrice = freezed,Object? isActive = null,Object? images = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,colorName: null == colorName ? _self.colorName : colorName // ignore: cast_nullable_to_non_nullable
as String,colorHex: null == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String,widthM: null == widthM ? _self.widthM : widthM // ignore: cast_nullable_to_non_nullable
as double,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,priceUnit: null == priceUnit ? _self.priceUnit : priceUnit // ignore: cast_nullable_to_non_nullable
as PriceUnit,oldPrice: freezed == oldPrice ? _self.oldPrice : oldPrice // ignore: cast_nullable_to_non_nullable
as int?,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as int?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<ProductImage>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductVariant].
extension ProductVariantPatterns on ProductVariant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductVariant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductVariant() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductVariant value)  $default,){
final _that = this;
switch (_that) {
case _ProductVariant():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductVariant value)?  $default,){
final _that = this;
switch (_that) {
case _ProductVariant() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String sku,  String colorName,  String colorHex,  double widthM,  int price,  PriceUnit priceUnit,  int? oldPrice,  int? costPrice,  bool isActive,  List<ProductImage> images)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductVariant() when $default != null:
return $default(_that.id,_that.sku,_that.colorName,_that.colorHex,_that.widthM,_that.price,_that.priceUnit,_that.oldPrice,_that.costPrice,_that.isActive,_that.images);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String sku,  String colorName,  String colorHex,  double widthM,  int price,  PriceUnit priceUnit,  int? oldPrice,  int? costPrice,  bool isActive,  List<ProductImage> images)  $default,) {final _that = this;
switch (_that) {
case _ProductVariant():
return $default(_that.id,_that.sku,_that.colorName,_that.colorHex,_that.widthM,_that.price,_that.priceUnit,_that.oldPrice,_that.costPrice,_that.isActive,_that.images);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String sku,  String colorName,  String colorHex,  double widthM,  int price,  PriceUnit priceUnit,  int? oldPrice,  int? costPrice,  bool isActive,  List<ProductImage> images)?  $default,) {final _that = this;
switch (_that) {
case _ProductVariant() when $default != null:
return $default(_that.id,_that.sku,_that.colorName,_that.colorHex,_that.widthM,_that.price,_that.priceUnit,_that.oldPrice,_that.costPrice,_that.isActive,_that.images);case _:
  return null;

}
}

}

/// @nodoc


class _ProductVariant implements ProductVariant {
  const _ProductVariant({required this.id, required this.sku, required this.colorName, required this.colorHex, required this.widthM, required this.price, required this.priceUnit, this.oldPrice, this.costPrice, this.isActive = true, this.images = const []});
  

@override final  String id;
@override final  String sku;
@override final  String colorName;
@override final  String colorHex;
@override final  double widthM;
@override final  int price;
@override final  PriceUnit priceUnit;
@override final  int? oldPrice;
@override final  int? costPrice;
@override@JsonKey() final  bool isActive;
@override@JsonKey() final  List<ProductImage> images;

/// Create a copy of ProductVariant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductVariantCopyWith<_ProductVariant> get copyWith => __$ProductVariantCopyWithImpl<_ProductVariant>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductVariant&&(identical(other.id, id) || other.id == id)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.colorName, colorName) || other.colorName == colorName)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.widthM, widthM) || other.widthM == widthM)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceUnit, priceUnit) || other.priceUnit == priceUnit)&&(identical(other.oldPrice, oldPrice) || other.oldPrice == oldPrice)&&(identical(other.costPrice, costPrice) || other.costPrice == costPrice)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other.images, images));
}


@override
int get hashCode => Object.hash(runtimeType,id,sku,colorName,colorHex,widthM,price,priceUnit,oldPrice,costPrice,isActive,const DeepCollectionEquality().hash(images));

@override
String toString() {
  return 'ProductVariant(id: $id, sku: $sku, colorName: $colorName, colorHex: $colorHex, widthM: $widthM, price: $price, priceUnit: $priceUnit, oldPrice: $oldPrice, costPrice: $costPrice, isActive: $isActive, images: $images)';
}


}

/// @nodoc
abstract mixin class _$ProductVariantCopyWith<$Res> implements $ProductVariantCopyWith<$Res> {
  factory _$ProductVariantCopyWith(_ProductVariant value, $Res Function(_ProductVariant) _then) = __$ProductVariantCopyWithImpl;
@override @useResult
$Res call({
 String id, String sku, String colorName, String colorHex, double widthM, int price, PriceUnit priceUnit, int? oldPrice, int? costPrice, bool isActive, List<ProductImage> images
});




}
/// @nodoc
class __$ProductVariantCopyWithImpl<$Res>
    implements _$ProductVariantCopyWith<$Res> {
  __$ProductVariantCopyWithImpl(this._self, this._then);

  final _ProductVariant _self;
  final $Res Function(_ProductVariant) _then;

/// Create a copy of ProductVariant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sku = null,Object? colorName = null,Object? colorHex = null,Object? widthM = null,Object? price = null,Object? priceUnit = null,Object? oldPrice = freezed,Object? costPrice = freezed,Object? isActive = null,Object? images = null,}) {
  return _then(_ProductVariant(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,colorName: null == colorName ? _self.colorName : colorName // ignore: cast_nullable_to_non_nullable
as String,colorHex: null == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String,widthM: null == widthM ? _self.widthM : widthM // ignore: cast_nullable_to_non_nullable
as double,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,priceUnit: null == priceUnit ? _self.priceUnit : priceUnit // ignore: cast_nullable_to_non_nullable
as PriceUnit,oldPrice: freezed == oldPrice ? _self.oldPrice : oldPrice // ignore: cast_nullable_to_non_nullable
as int?,costPrice: freezed == costPrice ? _self.costPrice : costPrice // ignore: cast_nullable_to_non_nullable
as int?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<ProductImage>,
  ));
}


}

// dart format on
