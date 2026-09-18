// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_defaults_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderDefaultsDto {

 String get id;@JsonKey(name: 'prepayment_percent') String get defaultPrepaymentPercent;@JsonKey(name: 'delivery_amount') String get defaultDeliveryAmount;@JsonKey(name: 'deadline_days') int get deadlineDays;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt;
/// Create a copy of OrderDefaultsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDefaultsDtoCopyWith<OrderDefaultsDto> get copyWith => _$OrderDefaultsDtoCopyWithImpl<OrderDefaultsDto>(this as OrderDefaultsDto, _$identity);

  /// Serializes this OrderDefaultsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDefaultsDto&&(identical(other.id, id) || other.id == id)&&(identical(other.defaultPrepaymentPercent, defaultPrepaymentPercent) || other.defaultPrepaymentPercent == defaultPrepaymentPercent)&&(identical(other.defaultDeliveryAmount, defaultDeliveryAmount) || other.defaultDeliveryAmount == defaultDeliveryAmount)&&(identical(other.deadlineDays, deadlineDays) || other.deadlineDays == deadlineDays)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,defaultPrepaymentPercent,defaultDeliveryAmount,deadlineDays,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'OrderDefaultsDto(id: $id, defaultPrepaymentPercent: $defaultPrepaymentPercent, defaultDeliveryAmount: $defaultDeliveryAmount, deadlineDays: $deadlineDays, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $OrderDefaultsDtoCopyWith<$Res>  {
  factory $OrderDefaultsDtoCopyWith(OrderDefaultsDto value, $Res Function(OrderDefaultsDto) _then) = _$OrderDefaultsDtoCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'prepayment_percent') String defaultPrepaymentPercent,@JsonKey(name: 'delivery_amount') String defaultDeliveryAmount,@JsonKey(name: 'deadline_days') int deadlineDays,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt
});




}
/// @nodoc
class _$OrderDefaultsDtoCopyWithImpl<$Res>
    implements $OrderDefaultsDtoCopyWith<$Res> {
  _$OrderDefaultsDtoCopyWithImpl(this._self, this._then);

  final OrderDefaultsDto _self;
  final $Res Function(OrderDefaultsDto) _then;

/// Create a copy of OrderDefaultsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? defaultPrepaymentPercent = null,Object? defaultDeliveryAmount = null,Object? deadlineDays = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,defaultPrepaymentPercent: null == defaultPrepaymentPercent ? _self.defaultPrepaymentPercent : defaultPrepaymentPercent // ignore: cast_nullable_to_non_nullable
as String,defaultDeliveryAmount: null == defaultDeliveryAmount ? _self.defaultDeliveryAmount : defaultDeliveryAmount // ignore: cast_nullable_to_non_nullable
as String,deadlineDays: null == deadlineDays ? _self.deadlineDays : deadlineDays // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderDefaultsDto].
extension OrderDefaultsDtoPatterns on OrderDefaultsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderDefaultsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderDefaultsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderDefaultsDto value)  $default,){
final _that = this;
switch (_that) {
case _OrderDefaultsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderDefaultsDto value)?  $default,){
final _that = this;
switch (_that) {
case _OrderDefaultsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'prepayment_percent')  String defaultPrepaymentPercent, @JsonKey(name: 'delivery_amount')  String defaultDeliveryAmount, @JsonKey(name: 'deadline_days')  int deadlineDays, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderDefaultsDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'prepayment_percent')  String defaultPrepaymentPercent, @JsonKey(name: 'delivery_amount')  String defaultDeliveryAmount, @JsonKey(name: 'deadline_days')  int deadlineDays, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _OrderDefaultsDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'prepayment_percent')  String defaultPrepaymentPercent, @JsonKey(name: 'delivery_amount')  String defaultDeliveryAmount, @JsonKey(name: 'deadline_days')  int deadlineDays, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _OrderDefaultsDto() when $default != null:
return $default(_that.id,_that.defaultPrepaymentPercent,_that.defaultDeliveryAmount,_that.deadlineDays,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderDefaultsDto implements OrderDefaultsDto {
  const _OrderDefaultsDto({required this.id, @JsonKey(name: 'prepayment_percent') required this.defaultPrepaymentPercent, @JsonKey(name: 'delivery_amount') required this.defaultDeliveryAmount, @JsonKey(name: 'deadline_days') this.deadlineDays = 0, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _OrderDefaultsDto.fromJson(Map<String, dynamic> json) => _$OrderDefaultsDtoFromJson(json);

@override final  String id;
@override@JsonKey(name: 'prepayment_percent') final  String defaultPrepaymentPercent;
@override@JsonKey(name: 'delivery_amount') final  String defaultDeliveryAmount;
@override@JsonKey(name: 'deadline_days') final  int deadlineDays;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;

/// Create a copy of OrderDefaultsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDefaultsDtoCopyWith<_OrderDefaultsDto> get copyWith => __$OrderDefaultsDtoCopyWithImpl<_OrderDefaultsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderDefaultsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDefaultsDto&&(identical(other.id, id) || other.id == id)&&(identical(other.defaultPrepaymentPercent, defaultPrepaymentPercent) || other.defaultPrepaymentPercent == defaultPrepaymentPercent)&&(identical(other.defaultDeliveryAmount, defaultDeliveryAmount) || other.defaultDeliveryAmount == defaultDeliveryAmount)&&(identical(other.deadlineDays, deadlineDays) || other.deadlineDays == deadlineDays)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,defaultPrepaymentPercent,defaultDeliveryAmount,deadlineDays,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'OrderDefaultsDto(id: $id, defaultPrepaymentPercent: $defaultPrepaymentPercent, defaultDeliveryAmount: $defaultDeliveryAmount, deadlineDays: $deadlineDays, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$OrderDefaultsDtoCopyWith<$Res> implements $OrderDefaultsDtoCopyWith<$Res> {
  factory _$OrderDefaultsDtoCopyWith(_OrderDefaultsDto value, $Res Function(_OrderDefaultsDto) _then) = __$OrderDefaultsDtoCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'prepayment_percent') String defaultPrepaymentPercent,@JsonKey(name: 'delivery_amount') String defaultDeliveryAmount,@JsonKey(name: 'deadline_days') int deadlineDays,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt
});




}
/// @nodoc
class __$OrderDefaultsDtoCopyWithImpl<$Res>
    implements _$OrderDefaultsDtoCopyWith<$Res> {
  __$OrderDefaultsDtoCopyWithImpl(this._self, this._then);

  final _OrderDefaultsDto _self;
  final $Res Function(_OrderDefaultsDto) _then;

/// Create a copy of OrderDefaultsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? defaultPrepaymentPercent = null,Object? defaultDeliveryAmount = null,Object? deadlineDays = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_OrderDefaultsDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,defaultPrepaymentPercent: null == defaultPrepaymentPercent ? _self.defaultPrepaymentPercent : defaultPrepaymentPercent // ignore: cast_nullable_to_non_nullable
as String,defaultDeliveryAmount: null == defaultDeliveryAmount ? _self.defaultDeliveryAmount : defaultDeliveryAmount // ignore: cast_nullable_to_non_nullable
as String,deadlineDays: null == deadlineDays ? _self.deadlineDays : deadlineDays // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
