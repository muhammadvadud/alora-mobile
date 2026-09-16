// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_ref.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductRef {

 String get id; String get name; String get category; int get price; String get priceUnit; String get imageUrl; String get colorHex; String get colorName;
/// Create a copy of ProductRef
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductRefCopyWith<ProductRef> get copyWith => _$ProductRefCopyWithImpl<ProductRef>(this as ProductRef, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductRef&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceUnit, priceUnit) || other.priceUnit == priceUnit)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.colorName, colorName) || other.colorName == colorName));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,category,price,priceUnit,imageUrl,colorHex,colorName);

@override
String toString() {
  return 'ProductRef(id: $id, name: $name, category: $category, price: $price, priceUnit: $priceUnit, imageUrl: $imageUrl, colorHex: $colorHex, colorName: $colorName)';
}


}

/// @nodoc
abstract mixin class $ProductRefCopyWith<$Res>  {
  factory $ProductRefCopyWith(ProductRef value, $Res Function(ProductRef) _then) = _$ProductRefCopyWithImpl;
@useResult
$Res call({
 String id, String name, String category, int price, String priceUnit, String imageUrl, String colorHex, String colorName
});




}
/// @nodoc
class _$ProductRefCopyWithImpl<$Res>
    implements $ProductRefCopyWith<$Res> {
  _$ProductRefCopyWithImpl(this._self, this._then);

  final ProductRef _self;
  final $Res Function(ProductRef) _then;

/// Create a copy of ProductRef
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? category = null,Object? price = null,Object? priceUnit = null,Object? imageUrl = null,Object? colorHex = null,Object? colorName = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,priceUnit: null == priceUnit ? _self.priceUnit : priceUnit // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,colorHex: null == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String,colorName: null == colorName ? _self.colorName : colorName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductRef].
extension ProductRefPatterns on ProductRef {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductRef value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductRef() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductRef value)  $default,){
final _that = this;
switch (_that) {
case _ProductRef():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductRef value)?  $default,){
final _that = this;
switch (_that) {
case _ProductRef() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String category,  int price,  String priceUnit,  String imageUrl,  String colorHex,  String colorName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductRef() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.price,_that.priceUnit,_that.imageUrl,_that.colorHex,_that.colorName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String category,  int price,  String priceUnit,  String imageUrl,  String colorHex,  String colorName)  $default,) {final _that = this;
switch (_that) {
case _ProductRef():
return $default(_that.id,_that.name,_that.category,_that.price,_that.priceUnit,_that.imageUrl,_that.colorHex,_that.colorName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String category,  int price,  String priceUnit,  String imageUrl,  String colorHex,  String colorName)?  $default,) {final _that = this;
switch (_that) {
case _ProductRef() when $default != null:
return $default(_that.id,_that.name,_that.category,_that.price,_that.priceUnit,_that.imageUrl,_that.colorHex,_that.colorName);case _:
  return null;

}
}

}

/// @nodoc


class _ProductRef implements ProductRef {
  const _ProductRef({required this.id, required this.name, required this.category, required this.price, required this.priceUnit, required this.imageUrl, required this.colorHex, required this.colorName});
  

@override final  String id;
@override final  String name;
@override final  String category;
@override final  int price;
@override final  String priceUnit;
@override final  String imageUrl;
@override final  String colorHex;
@override final  String colorName;

/// Create a copy of ProductRef
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductRefCopyWith<_ProductRef> get copyWith => __$ProductRefCopyWithImpl<_ProductRef>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductRef&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceUnit, priceUnit) || other.priceUnit == priceUnit)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.colorName, colorName) || other.colorName == colorName));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,category,price,priceUnit,imageUrl,colorHex,colorName);

@override
String toString() {
  return 'ProductRef(id: $id, name: $name, category: $category, price: $price, priceUnit: $priceUnit, imageUrl: $imageUrl, colorHex: $colorHex, colorName: $colorName)';
}


}

/// @nodoc
abstract mixin class _$ProductRefCopyWith<$Res> implements $ProductRefCopyWith<$Res> {
  factory _$ProductRefCopyWith(_ProductRef value, $Res Function(_ProductRef) _then) = __$ProductRefCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String category, int price, String priceUnit, String imageUrl, String colorHex, String colorName
});




}
/// @nodoc
class __$ProductRefCopyWithImpl<$Res>
    implements _$ProductRefCopyWith<$Res> {
  __$ProductRefCopyWithImpl(this._self, this._then);

  final _ProductRef _self;
  final $Res Function(_ProductRef) _then;

/// Create a copy of ProductRef
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? category = null,Object? price = null,Object? priceUnit = null,Object? imageUrl = null,Object? colorHex = null,Object? colorName = null,}) {
  return _then(_ProductRef(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,priceUnit: null == priceUnit ? _self.priceUnit : priceUnit // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,colorHex: null == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String,colorName: null == colorName ? _self.colorName : colorName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
