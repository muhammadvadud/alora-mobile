// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_accessory_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderAccessoryDto {

 String get id; Map<String, dynamic>? get variant; String? get qty; String? get unit;@JsonKey(name: 'unit_price') String? get unitPrice; String? get total;@JsonKey(name: 'sort_order') int? get sortOrder;
/// Create a copy of OrderAccessoryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderAccessoryDtoCopyWith<OrderAccessoryDto> get copyWith => _$OrderAccessoryDtoCopyWithImpl<OrderAccessoryDto>(this as OrderAccessoryDto, _$identity);

  /// Serializes this OrderAccessoryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderAccessoryDto&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.variant, variant)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.total, total) || other.total == total)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(variant),qty,unit,unitPrice,total,sortOrder);

@override
String toString() {
  return 'OrderAccessoryDto(id: $id, variant: $variant, qty: $qty, unit: $unit, unitPrice: $unitPrice, total: $total, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $OrderAccessoryDtoCopyWith<$Res>  {
  factory $OrderAccessoryDtoCopyWith(OrderAccessoryDto value, $Res Function(OrderAccessoryDto) _then) = _$OrderAccessoryDtoCopyWithImpl;
@useResult
$Res call({
 String id, Map<String, dynamic>? variant, String? qty, String? unit,@JsonKey(name: 'unit_price') String? unitPrice, String? total,@JsonKey(name: 'sort_order') int? sortOrder
});




}
/// @nodoc
class _$OrderAccessoryDtoCopyWithImpl<$Res>
    implements $OrderAccessoryDtoCopyWith<$Res> {
  _$OrderAccessoryDtoCopyWithImpl(this._self, this._then);

  final OrderAccessoryDto _self;
  final $Res Function(OrderAccessoryDto) _then;

/// Create a copy of OrderAccessoryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? variant = freezed,Object? qty = freezed,Object? unit = freezed,Object? unitPrice = freezed,Object? total = freezed,Object? sortOrder = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,variant: freezed == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,qty: freezed == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as String?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as String?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderAccessoryDto].
extension OrderAccessoryDtoPatterns on OrderAccessoryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderAccessoryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderAccessoryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderAccessoryDto value)  $default,){
final _that = this;
switch (_that) {
case _OrderAccessoryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderAccessoryDto value)?  $default,){
final _that = this;
switch (_that) {
case _OrderAccessoryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  Map<String, dynamic>? variant,  String? qty,  String? unit, @JsonKey(name: 'unit_price')  String? unitPrice,  String? total, @JsonKey(name: 'sort_order')  int? sortOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderAccessoryDto() when $default != null:
return $default(_that.id,_that.variant,_that.qty,_that.unit,_that.unitPrice,_that.total,_that.sortOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  Map<String, dynamic>? variant,  String? qty,  String? unit, @JsonKey(name: 'unit_price')  String? unitPrice,  String? total, @JsonKey(name: 'sort_order')  int? sortOrder)  $default,) {final _that = this;
switch (_that) {
case _OrderAccessoryDto():
return $default(_that.id,_that.variant,_that.qty,_that.unit,_that.unitPrice,_that.total,_that.sortOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  Map<String, dynamic>? variant,  String? qty,  String? unit, @JsonKey(name: 'unit_price')  String? unitPrice,  String? total, @JsonKey(name: 'sort_order')  int? sortOrder)?  $default,) {final _that = this;
switch (_that) {
case _OrderAccessoryDto() when $default != null:
return $default(_that.id,_that.variant,_that.qty,_that.unit,_that.unitPrice,_that.total,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderAccessoryDto implements OrderAccessoryDto {
  const _OrderAccessoryDto({required this.id, this.variant, this.qty, this.unit, @JsonKey(name: 'unit_price') this.unitPrice, this.total, @JsonKey(name: 'sort_order') this.sortOrder});
  factory _OrderAccessoryDto.fromJson(Map<String, dynamic> json) => _$OrderAccessoryDtoFromJson(json);

@override final  String id;
@override final  Map<String, dynamic>? variant;
@override final  String? qty;
@override final  String? unit;
@override@JsonKey(name: 'unit_price') final  String? unitPrice;
@override final  String? total;
@override@JsonKey(name: 'sort_order') final  int? sortOrder;

/// Create a copy of OrderAccessoryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderAccessoryDtoCopyWith<_OrderAccessoryDto> get copyWith => __$OrderAccessoryDtoCopyWithImpl<_OrderAccessoryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderAccessoryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderAccessoryDto&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.variant, variant)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.total, total) || other.total == total)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(variant),qty,unit,unitPrice,total,sortOrder);

@override
String toString() {
  return 'OrderAccessoryDto(id: $id, variant: $variant, qty: $qty, unit: $unit, unitPrice: $unitPrice, total: $total, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class _$OrderAccessoryDtoCopyWith<$Res> implements $OrderAccessoryDtoCopyWith<$Res> {
  factory _$OrderAccessoryDtoCopyWith(_OrderAccessoryDto value, $Res Function(_OrderAccessoryDto) _then) = __$OrderAccessoryDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, Map<String, dynamic>? variant, String? qty, String? unit,@JsonKey(name: 'unit_price') String? unitPrice, String? total,@JsonKey(name: 'sort_order') int? sortOrder
});




}
/// @nodoc
class __$OrderAccessoryDtoCopyWithImpl<$Res>
    implements _$OrderAccessoryDtoCopyWith<$Res> {
  __$OrderAccessoryDtoCopyWithImpl(this._self, this._then);

  final _OrderAccessoryDto _self;
  final $Res Function(_OrderAccessoryDto) _then;

/// Create a copy of OrderAccessoryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? variant = freezed,Object? qty = freezed,Object? unit = freezed,Object? unitPrice = freezed,Object? total = freezed,Object? sortOrder = freezed,}) {
  return _then(_OrderAccessoryDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,variant: freezed == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,qty: freezed == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as String?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as String?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
