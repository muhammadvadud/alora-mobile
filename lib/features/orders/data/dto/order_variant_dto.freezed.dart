// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_variant_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderVariantDto {

 String get id; String? get sku;@JsonKey(name: 'color_name') String? get colorName;@JsonKey(name: 'product_name') String? get productName;@JsonKey(name: 'price_unit', unknownEnumValue: PriceUnit.unknown) PriceUnit? get priceUnit;
/// Create a copy of OrderVariantDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderVariantDtoCopyWith<OrderVariantDto> get copyWith => _$OrderVariantDtoCopyWithImpl<OrderVariantDto>(this as OrderVariantDto, _$identity);

  /// Serializes this OrderVariantDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderVariantDto&&(identical(other.id, id) || other.id == id)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.colorName, colorName) || other.colorName == colorName)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.priceUnit, priceUnit) || other.priceUnit == priceUnit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sku,colorName,productName,priceUnit);

@override
String toString() {
  return 'OrderVariantDto(id: $id, sku: $sku, colorName: $colorName, productName: $productName, priceUnit: $priceUnit)';
}


}

/// @nodoc
abstract mixin class $OrderVariantDtoCopyWith<$Res>  {
  factory $OrderVariantDtoCopyWith(OrderVariantDto value, $Res Function(OrderVariantDto) _then) = _$OrderVariantDtoCopyWithImpl;
@useResult
$Res call({
 String id, String? sku,@JsonKey(name: 'color_name') String? colorName,@JsonKey(name: 'product_name') String? productName,@JsonKey(name: 'price_unit', unknownEnumValue: PriceUnit.unknown) PriceUnit? priceUnit
});




}
/// @nodoc
class _$OrderVariantDtoCopyWithImpl<$Res>
    implements $OrderVariantDtoCopyWith<$Res> {
  _$OrderVariantDtoCopyWithImpl(this._self, this._then);

  final OrderVariantDto _self;
  final $Res Function(OrderVariantDto) _then;

/// Create a copy of OrderVariantDto
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


/// Adds pattern-matching-related methods to [OrderVariantDto].
extension OrderVariantDtoPatterns on OrderVariantDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderVariantDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderVariantDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderVariantDto value)  $default,){
final _that = this;
switch (_that) {
case _OrderVariantDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderVariantDto value)?  $default,){
final _that = this;
switch (_that) {
case _OrderVariantDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? sku, @JsonKey(name: 'color_name')  String? colorName, @JsonKey(name: 'product_name')  String? productName, @JsonKey(name: 'price_unit', unknownEnumValue: PriceUnit.unknown)  PriceUnit? priceUnit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderVariantDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? sku, @JsonKey(name: 'color_name')  String? colorName, @JsonKey(name: 'product_name')  String? productName, @JsonKey(name: 'price_unit', unknownEnumValue: PriceUnit.unknown)  PriceUnit? priceUnit)  $default,) {final _that = this;
switch (_that) {
case _OrderVariantDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? sku, @JsonKey(name: 'color_name')  String? colorName, @JsonKey(name: 'product_name')  String? productName, @JsonKey(name: 'price_unit', unknownEnumValue: PriceUnit.unknown)  PriceUnit? priceUnit)?  $default,) {final _that = this;
switch (_that) {
case _OrderVariantDto() when $default != null:
return $default(_that.id,_that.sku,_that.colorName,_that.productName,_that.priceUnit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderVariantDto implements OrderVariantDto {
  const _OrderVariantDto({required this.id, this.sku, @JsonKey(name: 'color_name') this.colorName, @JsonKey(name: 'product_name') this.productName, @JsonKey(name: 'price_unit', unknownEnumValue: PriceUnit.unknown) this.priceUnit});
  factory _OrderVariantDto.fromJson(Map<String, dynamic> json) => _$OrderVariantDtoFromJson(json);

@override final  String id;
@override final  String? sku;
@override@JsonKey(name: 'color_name') final  String? colorName;
@override@JsonKey(name: 'product_name') final  String? productName;
@override@JsonKey(name: 'price_unit', unknownEnumValue: PriceUnit.unknown) final  PriceUnit? priceUnit;

/// Create a copy of OrderVariantDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderVariantDtoCopyWith<_OrderVariantDto> get copyWith => __$OrderVariantDtoCopyWithImpl<_OrderVariantDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderVariantDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderVariantDto&&(identical(other.id, id) || other.id == id)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.colorName, colorName) || other.colorName == colorName)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.priceUnit, priceUnit) || other.priceUnit == priceUnit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sku,colorName,productName,priceUnit);

@override
String toString() {
  return 'OrderVariantDto(id: $id, sku: $sku, colorName: $colorName, productName: $productName, priceUnit: $priceUnit)';
}


}

/// @nodoc
abstract mixin class _$OrderVariantDtoCopyWith<$Res> implements $OrderVariantDtoCopyWith<$Res> {
  factory _$OrderVariantDtoCopyWith(_OrderVariantDto value, $Res Function(_OrderVariantDto) _then) = __$OrderVariantDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String? sku,@JsonKey(name: 'color_name') String? colorName,@JsonKey(name: 'product_name') String? productName,@JsonKey(name: 'price_unit', unknownEnumValue: PriceUnit.unknown) PriceUnit? priceUnit
});




}
/// @nodoc
class __$OrderVariantDtoCopyWithImpl<$Res>
    implements _$OrderVariantDtoCopyWith<$Res> {
  __$OrderVariantDtoCopyWithImpl(this._self, this._then);

  final _OrderVariantDto _self;
  final $Res Function(_OrderVariantDto) _then;

/// Create a copy of OrderVariantDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sku = freezed,Object? colorName = freezed,Object? productName = freezed,Object? priceUnit = freezed,}) {
  return _then(_OrderVariantDto(
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
