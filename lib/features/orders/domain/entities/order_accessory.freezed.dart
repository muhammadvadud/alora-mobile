// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_accessory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderAccessory {

 String get id; OrderVariant? get variant; double? get qty; String? get unit; int? get unitPrice; int? get total; int? get sortOrder;
/// Create a copy of OrderAccessory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderAccessoryCopyWith<OrderAccessory> get copyWith => _$OrderAccessoryCopyWithImpl<OrderAccessory>(this as OrderAccessory, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderAccessory&&(identical(other.id, id) || other.id == id)&&(identical(other.variant, variant) || other.variant == variant)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.total, total) || other.total == total)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}


@override
int get hashCode => Object.hash(runtimeType,id,variant,qty,unit,unitPrice,total,sortOrder);

@override
String toString() {
  return 'OrderAccessory(id: $id, variant: $variant, qty: $qty, unit: $unit, unitPrice: $unitPrice, total: $total, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $OrderAccessoryCopyWith<$Res>  {
  factory $OrderAccessoryCopyWith(OrderAccessory value, $Res Function(OrderAccessory) _then) = _$OrderAccessoryCopyWithImpl;
@useResult
$Res call({
 String id, OrderVariant? variant, double? qty, String? unit, int? unitPrice, int? total, int? sortOrder
});


$OrderVariantCopyWith<$Res>? get variant;

}
/// @nodoc
class _$OrderAccessoryCopyWithImpl<$Res>
    implements $OrderAccessoryCopyWith<$Res> {
  _$OrderAccessoryCopyWithImpl(this._self, this._then);

  final OrderAccessory _self;
  final $Res Function(OrderAccessory) _then;

/// Create a copy of OrderAccessory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? variant = freezed,Object? qty = freezed,Object? unit = freezed,Object? unitPrice = freezed,Object? total = freezed,Object? sortOrder = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,variant: freezed == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as OrderVariant?,qty: freezed == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as double?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of OrderAccessory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderVariantCopyWith<$Res>? get variant {
    if (_self.variant == null) {
    return null;
  }

  return $OrderVariantCopyWith<$Res>(_self.variant!, (value) {
    return _then(_self.copyWith(variant: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderAccessory].
extension OrderAccessoryPatterns on OrderAccessory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderAccessory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderAccessory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderAccessory value)  $default,){
final _that = this;
switch (_that) {
case _OrderAccessory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderAccessory value)?  $default,){
final _that = this;
switch (_that) {
case _OrderAccessory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  OrderVariant? variant,  double? qty,  String? unit,  int? unitPrice,  int? total,  int? sortOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderAccessory() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  OrderVariant? variant,  double? qty,  String? unit,  int? unitPrice,  int? total,  int? sortOrder)  $default,) {final _that = this;
switch (_that) {
case _OrderAccessory():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  OrderVariant? variant,  double? qty,  String? unit,  int? unitPrice,  int? total,  int? sortOrder)?  $default,) {final _that = this;
switch (_that) {
case _OrderAccessory() when $default != null:
return $default(_that.id,_that.variant,_that.qty,_that.unit,_that.unitPrice,_that.total,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc


class _OrderAccessory implements OrderAccessory {
  const _OrderAccessory({required this.id, this.variant, this.qty, this.unit, this.unitPrice, this.total, this.sortOrder});
  

@override final  String id;
@override final  OrderVariant? variant;
@override final  double? qty;
@override final  String? unit;
@override final  int? unitPrice;
@override final  int? total;
@override final  int? sortOrder;

/// Create a copy of OrderAccessory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderAccessoryCopyWith<_OrderAccessory> get copyWith => __$OrderAccessoryCopyWithImpl<_OrderAccessory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderAccessory&&(identical(other.id, id) || other.id == id)&&(identical(other.variant, variant) || other.variant == variant)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.total, total) || other.total == total)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}


@override
int get hashCode => Object.hash(runtimeType,id,variant,qty,unit,unitPrice,total,sortOrder);

@override
String toString() {
  return 'OrderAccessory(id: $id, variant: $variant, qty: $qty, unit: $unit, unitPrice: $unitPrice, total: $total, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class _$OrderAccessoryCopyWith<$Res> implements $OrderAccessoryCopyWith<$Res> {
  factory _$OrderAccessoryCopyWith(_OrderAccessory value, $Res Function(_OrderAccessory) _then) = __$OrderAccessoryCopyWithImpl;
@override @useResult
$Res call({
 String id, OrderVariant? variant, double? qty, String? unit, int? unitPrice, int? total, int? sortOrder
});


@override $OrderVariantCopyWith<$Res>? get variant;

}
/// @nodoc
class __$OrderAccessoryCopyWithImpl<$Res>
    implements _$OrderAccessoryCopyWith<$Res> {
  __$OrderAccessoryCopyWithImpl(this._self, this._then);

  final _OrderAccessory _self;
  final $Res Function(_OrderAccessory) _then;

/// Create a copy of OrderAccessory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? variant = freezed,Object? qty = freezed,Object? unit = freezed,Object? unitPrice = freezed,Object? total = freezed,Object? sortOrder = freezed,}) {
  return _then(_OrderAccessory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,variant: freezed == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as OrderVariant?,qty: freezed == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as double?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of OrderAccessory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderVariantCopyWith<$Res>? get variant {
    if (_self.variant == null) {
    return null;
  }

  return $OrderVariantCopyWith<$Res>(_self.variant!, (value) {
    return _then(_self.copyWith(variant: value));
  });
}
}

// dart format on
