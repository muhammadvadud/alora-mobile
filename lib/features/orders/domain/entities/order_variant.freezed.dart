// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_variant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderVariant {

 String get id; String? get sku; String? get colorName; String? get productName; PriceUnit? get priceUnit;
/// Create a copy of OrderVariant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderVariantCopyWith<OrderVariant> get copyWith => _$OrderVariantCopyWithImpl<OrderVariant>(this as OrderVariant, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderVariant&&(identical(other.id, id) || other.id == id)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.colorName, colorName) || other.colorName == colorName)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.priceUnit, priceUnit) || other.priceUnit == priceUnit));
}


@override
int get hashCode => Object.hash(runtimeType,id,sku,colorName,productName,priceUnit);

@override
String toString() {
  return 'OrderVariant(id: $id, sku: $sku, colorName: $colorName, productName: $productName, priceUnit: $priceUnit)';
}


}

/// @nodoc
abstract mixin class $OrderVariantCopyWith<$Res>  {
  factory $OrderVariantCopyWith(OrderVariant value, $Res Function(OrderVariant) _then) = _$OrderVariantCopyWithImpl;
@useResult
$Res call({
 String id, String? sku, String? colorName, String? productName, PriceUnit? priceUnit
});




}
/// @nodoc
class _$OrderVariantCopyWithImpl<$Res>
    implements $OrderVariantCopyWith<$Res> {
  _$OrderVariantCopyWithImpl(this._self, this._then);

  final OrderVariant _self;
  final $Res Function(OrderVariant) _then;

/// Create a copy of OrderVariant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sku = freezed,Object? colorName = freezed,Object? productName = freezed,Object? priceUnit = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,colorName: freezed == colorName ? _self.colorName : colorName // ignore: cast_nullable_to_non_nullable
as String?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,priceUnit: freezed == priceUnit ? _self.priceUnit : priceUnit // ignore: cast_nullable_to_non_nullable
as PriceUnit?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderVariant].
extension OrderVariantPatterns on OrderVariant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderVariant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderVariant() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderVariant value)  $default,){
final _that = this;
switch (_that) {
case _OrderVariant():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderVariant value)?  $default,){
final _that = this;
switch (_that) {
case _OrderVariant() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? sku,  String? colorName,  String? productName,  PriceUnit? priceUnit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderVariant() when $default != null:
return $default(_that.id,_that.sku,_that.colorName,_that.productName,_that.priceUnit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? sku,  String? colorName,  String? productName,  PriceUnit? priceUnit)  $default,) {final _that = this;
switch (_that) {
case _OrderVariant():
return $default(_that.id,_that.sku,_that.colorName,_that.productName,_that.priceUnit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? sku,  String? colorName,  String? productName,  PriceUnit? priceUnit)?  $default,) {final _that = this;
switch (_that) {
case _OrderVariant() when $default != null:
return $default(_that.id,_that.sku,_that.colorName,_that.productName,_that.priceUnit);case _:
  return null;

}
}

}

/// @nodoc


class _OrderVariant implements OrderVariant {
  const _OrderVariant({required this.id, this.sku, this.colorName, this.productName, this.priceUnit});
  

@override final  String id;
@override final  String? sku;
@override final  String? colorName;
@override final  String? productName;
@override final  PriceUnit? priceUnit;

/// Create a copy of OrderVariant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderVariantCopyWith<_OrderVariant> get copyWith => __$OrderVariantCopyWithImpl<_OrderVariant>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderVariant&&(identical(other.id, id) || other.id == id)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.colorName, colorName) || other.colorName == colorName)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.priceUnit, priceUnit) || other.priceUnit == priceUnit));
}


@override
int get hashCode => Object.hash(runtimeType,id,sku,colorName,productName,priceUnit);

@override
String toString() {
  return 'OrderVariant(id: $id, sku: $sku, colorName: $colorName, productName: $productName, priceUnit: $priceUnit)';
}


}

/// @nodoc
abstract mixin class _$OrderVariantCopyWith<$Res> implements $OrderVariantCopyWith<$Res> {
  factory _$OrderVariantCopyWith(_OrderVariant value, $Res Function(_OrderVariant) _then) = __$OrderVariantCopyWithImpl;
@override @useResult
$Res call({
 String id, String? sku, String? colorName, String? productName, PriceUnit? priceUnit
});




}
/// @nodoc
class __$OrderVariantCopyWithImpl<$Res>
    implements _$OrderVariantCopyWith<$Res> {
  __$OrderVariantCopyWithImpl(this._self, this._then);

  final _OrderVariant _self;
  final $Res Function(_OrderVariant) _then;

/// Create a copy of OrderVariant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sku = freezed,Object? colorName = freezed,Object? productName = freezed,Object? priceUnit = freezed,}) {
  return _then(_OrderVariant(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sku: freezed == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String?,colorName: freezed == colorName ? _self.colorName : colorName // ignore: cast_nullable_to_non_nullable
as String?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,priceUnit: freezed == priceUnit ? _self.priceUnit : priceUnit // ignore: cast_nullable_to_non_nullable
as PriceUnit?,
  ));
}


}

// dart format on
