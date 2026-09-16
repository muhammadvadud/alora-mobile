// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderItem {

 String get id; String? get serviceKey; String? get nameSnapshot; double? get qty; String? get unit; int? get unitPrice; int? get total; int? get sortOrder;
/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemCopyWith<OrderItem> get copyWith => _$OrderItemCopyWithImpl<OrderItem>(this as OrderItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItem&&(identical(other.id, id) || other.id == id)&&(identical(other.serviceKey, serviceKey) || other.serviceKey == serviceKey)&&(identical(other.nameSnapshot, nameSnapshot) || other.nameSnapshot == nameSnapshot)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.total, total) || other.total == total)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}


@override
int get hashCode => Object.hash(runtimeType,id,serviceKey,nameSnapshot,qty,unit,unitPrice,total,sortOrder);

@override
String toString() {
  return 'OrderItem(id: $id, serviceKey: $serviceKey, nameSnapshot: $nameSnapshot, qty: $qty, unit: $unit, unitPrice: $unitPrice, total: $total, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $OrderItemCopyWith<$Res>  {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) _then) = _$OrderItemCopyWithImpl;
@useResult
$Res call({
 String id, String? serviceKey, String? nameSnapshot, double? qty, String? unit, int? unitPrice, int? total, int? sortOrder
});




}
/// @nodoc
class _$OrderItemCopyWithImpl<$Res>
    implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._self, this._then);

  final OrderItem _self;
  final $Res Function(OrderItem) _then;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? serviceKey = freezed,Object? nameSnapshot = freezed,Object? qty = freezed,Object? unit = freezed,Object? unitPrice = freezed,Object? total = freezed,Object? sortOrder = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,serviceKey: freezed == serviceKey ? _self.serviceKey : serviceKey // ignore: cast_nullable_to_non_nullable
as String?,nameSnapshot: freezed == nameSnapshot ? _self.nameSnapshot : nameSnapshot // ignore: cast_nullable_to_non_nullable
as String?,qty: freezed == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as double?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderItem].
extension OrderItemPatterns on OrderItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItem value)  $default,){
final _that = this;
switch (_that) {
case _OrderItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItem value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? serviceKey,  String? nameSnapshot,  double? qty,  String? unit,  int? unitPrice,  int? total,  int? sortOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that.id,_that.serviceKey,_that.nameSnapshot,_that.qty,_that.unit,_that.unitPrice,_that.total,_that.sortOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? serviceKey,  String? nameSnapshot,  double? qty,  String? unit,  int? unitPrice,  int? total,  int? sortOrder)  $default,) {final _that = this;
switch (_that) {
case _OrderItem():
return $default(_that.id,_that.serviceKey,_that.nameSnapshot,_that.qty,_that.unit,_that.unitPrice,_that.total,_that.sortOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? serviceKey,  String? nameSnapshot,  double? qty,  String? unit,  int? unitPrice,  int? total,  int? sortOrder)?  $default,) {final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that.id,_that.serviceKey,_that.nameSnapshot,_that.qty,_that.unit,_that.unitPrice,_that.total,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc


class _OrderItem implements OrderItem {
  const _OrderItem({required this.id, this.serviceKey, this.nameSnapshot, this.qty, this.unit, this.unitPrice, this.total, this.sortOrder});
  

@override final  String id;
@override final  String? serviceKey;
@override final  String? nameSnapshot;
@override final  double? qty;
@override final  String? unit;
@override final  int? unitPrice;
@override final  int? total;
@override final  int? sortOrder;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemCopyWith<_OrderItem> get copyWith => __$OrderItemCopyWithImpl<_OrderItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItem&&(identical(other.id, id) || other.id == id)&&(identical(other.serviceKey, serviceKey) || other.serviceKey == serviceKey)&&(identical(other.nameSnapshot, nameSnapshot) || other.nameSnapshot == nameSnapshot)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.total, total) || other.total == total)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}


@override
int get hashCode => Object.hash(runtimeType,id,serviceKey,nameSnapshot,qty,unit,unitPrice,total,sortOrder);

@override
String toString() {
  return 'OrderItem(id: $id, serviceKey: $serviceKey, nameSnapshot: $nameSnapshot, qty: $qty, unit: $unit, unitPrice: $unitPrice, total: $total, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class _$OrderItemCopyWith<$Res> implements $OrderItemCopyWith<$Res> {
  factory _$OrderItemCopyWith(_OrderItem value, $Res Function(_OrderItem) _then) = __$OrderItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String? serviceKey, String? nameSnapshot, double? qty, String? unit, int? unitPrice, int? total, int? sortOrder
});




}
/// @nodoc
class __$OrderItemCopyWithImpl<$Res>
    implements _$OrderItemCopyWith<$Res> {
  __$OrderItemCopyWithImpl(this._self, this._then);

  final _OrderItem _self;
  final $Res Function(_OrderItem) _then;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? serviceKey = freezed,Object? nameSnapshot = freezed,Object? qty = freezed,Object? unit = freezed,Object? unitPrice = freezed,Object? total = freezed,Object? sortOrder = freezed,}) {
  return _then(_OrderItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,serviceKey: freezed == serviceKey ? _self.serviceKey : serviceKey // ignore: cast_nullable_to_non_nullable
as String?,nameSnapshot: freezed == nameSnapshot ? _self.nameSnapshot : nameSnapshot // ignore: cast_nullable_to_non_nullable
as String?,qty: freezed == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as double?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,unitPrice: freezed == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
