// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discount_policy_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DiscountPolicyDto {

 String get id;@JsonKey(name: 'manual_max_percent_employee') String get manualMaxPercentEmployee;@JsonKey(name: 'manual_max_percent_manager') String get manualMaxPercentManager;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt;
/// Create a copy of DiscountPolicyDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiscountPolicyDtoCopyWith<DiscountPolicyDto> get copyWith => _$DiscountPolicyDtoCopyWithImpl<DiscountPolicyDto>(this as DiscountPolicyDto, _$identity);

  /// Serializes this DiscountPolicyDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiscountPolicyDto&&(identical(other.id, id) || other.id == id)&&(identical(other.manualMaxPercentEmployee, manualMaxPercentEmployee) || other.manualMaxPercentEmployee == manualMaxPercentEmployee)&&(identical(other.manualMaxPercentManager, manualMaxPercentManager) || other.manualMaxPercentManager == manualMaxPercentManager)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,manualMaxPercentEmployee,manualMaxPercentManager,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'DiscountPolicyDto(id: $id, manualMaxPercentEmployee: $manualMaxPercentEmployee, manualMaxPercentManager: $manualMaxPercentManager, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DiscountPolicyDtoCopyWith<$Res>  {
  factory $DiscountPolicyDtoCopyWith(DiscountPolicyDto value, $Res Function(DiscountPolicyDto) _then) = _$DiscountPolicyDtoCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'manual_max_percent_employee') String manualMaxPercentEmployee,@JsonKey(name: 'manual_max_percent_manager') String manualMaxPercentManager,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt
});




}
/// @nodoc
class _$DiscountPolicyDtoCopyWithImpl<$Res>
    implements $DiscountPolicyDtoCopyWith<$Res> {
  _$DiscountPolicyDtoCopyWithImpl(this._self, this._then);

  final DiscountPolicyDto _self;
  final $Res Function(DiscountPolicyDto) _then;

/// Create a copy of DiscountPolicyDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? manualMaxPercentEmployee = null,Object? manualMaxPercentManager = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,manualMaxPercentEmployee: null == manualMaxPercentEmployee ? _self.manualMaxPercentEmployee : manualMaxPercentEmployee // ignore: cast_nullable_to_non_nullable
as String,manualMaxPercentManager: null == manualMaxPercentManager ? _self.manualMaxPercentManager : manualMaxPercentManager // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DiscountPolicyDto].
extension DiscountPolicyDtoPatterns on DiscountPolicyDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiscountPolicyDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiscountPolicyDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiscountPolicyDto value)  $default,){
final _that = this;
switch (_that) {
case _DiscountPolicyDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiscountPolicyDto value)?  $default,){
final _that = this;
switch (_that) {
case _DiscountPolicyDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'manual_max_percent_employee')  String manualMaxPercentEmployee, @JsonKey(name: 'manual_max_percent_manager')  String manualMaxPercentManager, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiscountPolicyDto() when $default != null:
return $default(_that.id,_that.manualMaxPercentEmployee,_that.manualMaxPercentManager,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'manual_max_percent_employee')  String manualMaxPercentEmployee, @JsonKey(name: 'manual_max_percent_manager')  String manualMaxPercentManager, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DiscountPolicyDto():
return $default(_that.id,_that.manualMaxPercentEmployee,_that.manualMaxPercentManager,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'manual_max_percent_employee')  String manualMaxPercentEmployee, @JsonKey(name: 'manual_max_percent_manager')  String manualMaxPercentManager, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DiscountPolicyDto() when $default != null:
return $default(_that.id,_that.manualMaxPercentEmployee,_that.manualMaxPercentManager,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DiscountPolicyDto implements DiscountPolicyDto {
  const _DiscountPolicyDto({required this.id, @JsonKey(name: 'manual_max_percent_employee') required this.manualMaxPercentEmployee, @JsonKey(name: 'manual_max_percent_manager') required this.manualMaxPercentManager, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _DiscountPolicyDto.fromJson(Map<String, dynamic> json) => _$DiscountPolicyDtoFromJson(json);

@override final  String id;
@override@JsonKey(name: 'manual_max_percent_employee') final  String manualMaxPercentEmployee;
@override@JsonKey(name: 'manual_max_percent_manager') final  String manualMaxPercentManager;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;

/// Create a copy of DiscountPolicyDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiscountPolicyDtoCopyWith<_DiscountPolicyDto> get copyWith => __$DiscountPolicyDtoCopyWithImpl<_DiscountPolicyDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DiscountPolicyDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiscountPolicyDto&&(identical(other.id, id) || other.id == id)&&(identical(other.manualMaxPercentEmployee, manualMaxPercentEmployee) || other.manualMaxPercentEmployee == manualMaxPercentEmployee)&&(identical(other.manualMaxPercentManager, manualMaxPercentManager) || other.manualMaxPercentManager == manualMaxPercentManager)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,manualMaxPercentEmployee,manualMaxPercentManager,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'DiscountPolicyDto(id: $id, manualMaxPercentEmployee: $manualMaxPercentEmployee, manualMaxPercentManager: $manualMaxPercentManager, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DiscountPolicyDtoCopyWith<$Res> implements $DiscountPolicyDtoCopyWith<$Res> {
  factory _$DiscountPolicyDtoCopyWith(_DiscountPolicyDto value, $Res Function(_DiscountPolicyDto) _then) = __$DiscountPolicyDtoCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'manual_max_percent_employee') String manualMaxPercentEmployee,@JsonKey(name: 'manual_max_percent_manager') String manualMaxPercentManager,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt
});




}
/// @nodoc
class __$DiscountPolicyDtoCopyWithImpl<$Res>
    implements _$DiscountPolicyDtoCopyWith<$Res> {
  __$DiscountPolicyDtoCopyWithImpl(this._self, this._then);

  final _DiscountPolicyDto _self;
  final $Res Function(_DiscountPolicyDto) _then;

/// Create a copy of DiscountPolicyDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? manualMaxPercentEmployee = null,Object? manualMaxPercentManager = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_DiscountPolicyDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,manualMaxPercentEmployee: null == manualMaxPercentEmployee ? _self.manualMaxPercentEmployee : manualMaxPercentEmployee // ignore: cast_nullable_to_non_nullable
as String,manualMaxPercentManager: null == manualMaxPercentManager ? _self.manualMaxPercentManager : manualMaxPercentManager // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
