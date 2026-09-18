// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_defaults.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderDefaults {

 String get id; double get defaultPrepaymentPercent; int get defaultDeliveryAmount; int get deadlineDays; bool get isActive; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of OrderDefaults
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDefaultsCopyWith<OrderDefaults> get copyWith => _$OrderDefaultsCopyWithImpl<OrderDefaults>(this as OrderDefaults, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDefaults&&(identical(other.id, id) || other.id == id)&&(identical(other.defaultPrepaymentPercent, defaultPrepaymentPercent) || other.defaultPrepaymentPercent == defaultPrepaymentPercent)&&(identical(other.defaultDeliveryAmount, defaultDeliveryAmount) || other.defaultDeliveryAmount == defaultDeliveryAmount)&&(identical(other.deadlineDays, deadlineDays) || other.deadlineDays == deadlineDays)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,defaultPrepaymentPercent,defaultDeliveryAmount,deadlineDays,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'OrderDefaults(id: $id, defaultPrepaymentPercent: $defaultPrepaymentPercent, defaultDeliveryAmount: $defaultDeliveryAmount, deadlineDays: $deadlineDays, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $OrderDefaultsCopyWith<$Res>  {
  factory $OrderDefaultsCopyWith(OrderDefaults value, $Res Function(OrderDefaults) _then) = _$OrderDefaultsCopyWithImpl;
@useResult
$Res call({
 String id, double defaultPrepaymentPercent, int defaultDeliveryAmount, int deadlineDays, bool isActive, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$OrderDefaultsCopyWithImpl<$Res>
    implements $OrderDefaultsCopyWith<$Res> {
  _$OrderDefaultsCopyWithImpl(this._self, this._then);

  final OrderDefaults _self;
  final $Res Function(OrderDefaults) _then;

/// Create a copy of OrderDefaults
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? defaultPrepaymentPercent = null,Object? defaultDeliveryAmount = null,Object? deadlineDays = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,defaultPrepaymentPercent: null == defaultPrepaymentPercent ? _self.defaultPrepaymentPercent : defaultPrepaymentPercent // ignore: cast_nullable_to_non_nullable
as double,defaultDeliveryAmount: null == defaultDeliveryAmount ? _self.defaultDeliveryAmount : defaultDeliveryAmount // ignore: cast_nullable_to_non_nullable
as int,deadlineDays: null == deadlineDays ? _self.deadlineDays : deadlineDays // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderDefaults].
extension OrderDefaultsPatterns on OrderDefaults {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderDefaults value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderDefaults() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderDefaults value)  $default,){
final _that = this;
switch (_that) {
case _OrderDefaults():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderDefaults value)?  $default,){
final _that = this;
switch (_that) {
case _OrderDefaults() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  double defaultPrepaymentPercent,  int defaultDeliveryAmount,  int deadlineDays,  bool isActive,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderDefaults() when $default != null:
return $default(_that.id,_that.defaultPrepaymentPercent,_that.defaultDeliveryAmount,_that.deadlineDays,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  double defaultPrepaymentPercent,  int defaultDeliveryAmount,  int deadlineDays,  bool isActive,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _OrderDefaults():
return $default(_that.id,_that.defaultPrepaymentPercent,_that.defaultDeliveryAmount,_that.deadlineDays,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  double defaultPrepaymentPercent,  int defaultDeliveryAmount,  int deadlineDays,  bool isActive,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _OrderDefaults() when $default != null:
return $default(_that.id,_that.defaultPrepaymentPercent,_that.defaultDeliveryAmount,_that.deadlineDays,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _OrderDefaults implements OrderDefaults {
  const _OrderDefaults({required this.id, required this.defaultPrepaymentPercent, required this.defaultDeliveryAmount, this.deadlineDays = 0, required this.isActive, required this.createdAt, required this.updatedAt});
  

@override final  String id;
@override final  double defaultPrepaymentPercent;
@override final  int defaultDeliveryAmount;
@override@JsonKey() final  int deadlineDays;
@override final  bool isActive;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of OrderDefaults
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDefaultsCopyWith<_OrderDefaults> get copyWith => __$OrderDefaultsCopyWithImpl<_OrderDefaults>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDefaults&&(identical(other.id, id) || other.id == id)&&(identical(other.defaultPrepaymentPercent, defaultPrepaymentPercent) || other.defaultPrepaymentPercent == defaultPrepaymentPercent)&&(identical(other.defaultDeliveryAmount, defaultDeliveryAmount) || other.defaultDeliveryAmount == defaultDeliveryAmount)&&(identical(other.deadlineDays, deadlineDays) || other.deadlineDays == deadlineDays)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,defaultPrepaymentPercent,defaultDeliveryAmount,deadlineDays,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'OrderDefaults(id: $id, defaultPrepaymentPercent: $defaultPrepaymentPercent, defaultDeliveryAmount: $defaultDeliveryAmount, deadlineDays: $deadlineDays, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$OrderDefaultsCopyWith<$Res> implements $OrderDefaultsCopyWith<$Res> {
  factory _$OrderDefaultsCopyWith(_OrderDefaults value, $Res Function(_OrderDefaults) _then) = __$OrderDefaultsCopyWithImpl;
@override @useResult
$Res call({
 String id, double defaultPrepaymentPercent, int defaultDeliveryAmount, int deadlineDays, bool isActive, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$OrderDefaultsCopyWithImpl<$Res>
    implements _$OrderDefaultsCopyWith<$Res> {
  __$OrderDefaultsCopyWithImpl(this._self, this._then);

  final _OrderDefaults _self;
  final $Res Function(_OrderDefaults) _then;

/// Create a copy of OrderDefaults
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? defaultPrepaymentPercent = null,Object? defaultDeliveryAmount = null,Object? deadlineDays = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_OrderDefaults(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,defaultPrepaymentPercent: null == defaultPrepaymentPercent ? _self.defaultPrepaymentPercent : defaultPrepaymentPercent // ignore: cast_nullable_to_non_nullable
as double,defaultDeliveryAmount: null == defaultDeliveryAmount ? _self.defaultDeliveryAmount : defaultDeliveryAmount // ignore: cast_nullable_to_non_nullable
as int,deadlineDays: null == deadlineDays ? _self.deadlineDays : deadlineDays // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
