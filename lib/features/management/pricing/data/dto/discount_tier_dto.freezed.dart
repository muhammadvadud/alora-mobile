// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discount_tier_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DiscountTierDto {

 String get id;@JsonKey(name: 'min_amount') String get minAmount; String get percent;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt;
/// Create a copy of DiscountTierDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiscountTierDtoCopyWith<DiscountTierDto> get copyWith => _$DiscountTierDtoCopyWithImpl<DiscountTierDto>(this as DiscountTierDto, _$identity);

  /// Serializes this DiscountTierDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiscountTierDto&&(identical(other.id, id) || other.id == id)&&(identical(other.minAmount, minAmount) || other.minAmount == minAmount)&&(identical(other.percent, percent) || other.percent == percent)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,minAmount,percent,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'DiscountTierDto(id: $id, minAmount: $minAmount, percent: $percent, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DiscountTierDtoCopyWith<$Res>  {
  factory $DiscountTierDtoCopyWith(DiscountTierDto value, $Res Function(DiscountTierDto) _then) = _$DiscountTierDtoCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'min_amount') String minAmount, String percent,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt
});




}
/// @nodoc
class _$DiscountTierDtoCopyWithImpl<$Res>
    implements $DiscountTierDtoCopyWith<$Res> {
  _$DiscountTierDtoCopyWithImpl(this._self, this._then);

  final DiscountTierDto _self;
  final $Res Function(DiscountTierDto) _then;

/// Create a copy of DiscountTierDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? minAmount = null,Object? percent = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,minAmount: null == minAmount ? _self.minAmount : minAmount // ignore: cast_nullable_to_non_nullable
as String,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DiscountTierDto].
extension DiscountTierDtoPatterns on DiscountTierDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiscountTierDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiscountTierDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiscountTierDto value)  $default,){
final _that = this;
switch (_that) {
case _DiscountTierDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiscountTierDto value)?  $default,){
final _that = this;
switch (_that) {
case _DiscountTierDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'min_amount')  String minAmount,  String percent, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiscountTierDto() when $default != null:
return $default(_that.id,_that.minAmount,_that.percent,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'min_amount')  String minAmount,  String percent, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DiscountTierDto():
return $default(_that.id,_that.minAmount,_that.percent,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'min_amount')  String minAmount,  String percent, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DiscountTierDto() when $default != null:
return $default(_that.id,_that.minAmount,_that.percent,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DiscountTierDto implements DiscountTierDto {
  const _DiscountTierDto({required this.id, @JsonKey(name: 'min_amount') required this.minAmount, required this.percent, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _DiscountTierDto.fromJson(Map<String, dynamic> json) => _$DiscountTierDtoFromJson(json);

@override final  String id;
@override@JsonKey(name: 'min_amount') final  String minAmount;
@override final  String percent;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;

/// Create a copy of DiscountTierDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiscountTierDtoCopyWith<_DiscountTierDto> get copyWith => __$DiscountTierDtoCopyWithImpl<_DiscountTierDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DiscountTierDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiscountTierDto&&(identical(other.id, id) || other.id == id)&&(identical(other.minAmount, minAmount) || other.minAmount == minAmount)&&(identical(other.percent, percent) || other.percent == percent)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,minAmount,percent,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'DiscountTierDto(id: $id, minAmount: $minAmount, percent: $percent, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DiscountTierDtoCopyWith<$Res> implements $DiscountTierDtoCopyWith<$Res> {
  factory _$DiscountTierDtoCopyWith(_DiscountTierDto value, $Res Function(_DiscountTierDto) _then) = __$DiscountTierDtoCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'min_amount') String minAmount, String percent,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt
});




}
/// @nodoc
class __$DiscountTierDtoCopyWithImpl<$Res>
    implements _$DiscountTierDtoCopyWith<$Res> {
  __$DiscountTierDtoCopyWithImpl(this._self, this._then);

  final _DiscountTierDto _self;
  final $Res Function(_DiscountTierDto) _then;

/// Create a copy of DiscountTierDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? minAmount = null,Object? percent = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_DiscountTierDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,minAmount: null == minAmount ? _self.minAmount : minAmount // ignore: cast_nullable_to_non_nullable
as String,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
