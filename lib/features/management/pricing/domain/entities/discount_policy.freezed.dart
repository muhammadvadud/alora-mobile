// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discount_policy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DiscountPolicy {

 String get id; double get manualMaxPercentEmployee; double get manualMaxPercentManager; bool get isActive; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of DiscountPolicy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiscountPolicyCopyWith<DiscountPolicy> get copyWith => _$DiscountPolicyCopyWithImpl<DiscountPolicy>(this as DiscountPolicy, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiscountPolicy&&(identical(other.id, id) || other.id == id)&&(identical(other.manualMaxPercentEmployee, manualMaxPercentEmployee) || other.manualMaxPercentEmployee == manualMaxPercentEmployee)&&(identical(other.manualMaxPercentManager, manualMaxPercentManager) || other.manualMaxPercentManager == manualMaxPercentManager)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,manualMaxPercentEmployee,manualMaxPercentManager,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'DiscountPolicy(id: $id, manualMaxPercentEmployee: $manualMaxPercentEmployee, manualMaxPercentManager: $manualMaxPercentManager, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DiscountPolicyCopyWith<$Res>  {
  factory $DiscountPolicyCopyWith(DiscountPolicy value, $Res Function(DiscountPolicy) _then) = _$DiscountPolicyCopyWithImpl;
@useResult
$Res call({
 String id, double manualMaxPercentEmployee, double manualMaxPercentManager, bool isActive, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$DiscountPolicyCopyWithImpl<$Res>
    implements $DiscountPolicyCopyWith<$Res> {
  _$DiscountPolicyCopyWithImpl(this._self, this._then);

  final DiscountPolicy _self;
  final $Res Function(DiscountPolicy) _then;

/// Create a copy of DiscountPolicy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? manualMaxPercentEmployee = null,Object? manualMaxPercentManager = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,manualMaxPercentEmployee: null == manualMaxPercentEmployee ? _self.manualMaxPercentEmployee : manualMaxPercentEmployee // ignore: cast_nullable_to_non_nullable
as double,manualMaxPercentManager: null == manualMaxPercentManager ? _self.manualMaxPercentManager : manualMaxPercentManager // ignore: cast_nullable_to_non_nullable
as double,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [DiscountPolicy].
extension DiscountPolicyPatterns on DiscountPolicy {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiscountPolicy value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiscountPolicy() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiscountPolicy value)  $default,){
final _that = this;
switch (_that) {
case _DiscountPolicy():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiscountPolicy value)?  $default,){
final _that = this;
switch (_that) {
case _DiscountPolicy() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  double manualMaxPercentEmployee,  double manualMaxPercentManager,  bool isActive,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiscountPolicy() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  double manualMaxPercentEmployee,  double manualMaxPercentManager,  bool isActive,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DiscountPolicy():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  double manualMaxPercentEmployee,  double manualMaxPercentManager,  bool isActive,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DiscountPolicy() when $default != null:
return $default(_that.id,_that.manualMaxPercentEmployee,_that.manualMaxPercentManager,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _DiscountPolicy implements DiscountPolicy {
  const _DiscountPolicy({required this.id, required this.manualMaxPercentEmployee, required this.manualMaxPercentManager, required this.isActive, required this.createdAt, required this.updatedAt});
  

@override final  String id;
@override final  double manualMaxPercentEmployee;
@override final  double manualMaxPercentManager;
@override final  bool isActive;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of DiscountPolicy
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiscountPolicyCopyWith<_DiscountPolicy> get copyWith => __$DiscountPolicyCopyWithImpl<_DiscountPolicy>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiscountPolicy&&(identical(other.id, id) || other.id == id)&&(identical(other.manualMaxPercentEmployee, manualMaxPercentEmployee) || other.manualMaxPercentEmployee == manualMaxPercentEmployee)&&(identical(other.manualMaxPercentManager, manualMaxPercentManager) || other.manualMaxPercentManager == manualMaxPercentManager)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,manualMaxPercentEmployee,manualMaxPercentManager,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'DiscountPolicy(id: $id, manualMaxPercentEmployee: $manualMaxPercentEmployee, manualMaxPercentManager: $manualMaxPercentManager, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DiscountPolicyCopyWith<$Res> implements $DiscountPolicyCopyWith<$Res> {
  factory _$DiscountPolicyCopyWith(_DiscountPolicy value, $Res Function(_DiscountPolicy) _then) = __$DiscountPolicyCopyWithImpl;
@override @useResult
$Res call({
 String id, double manualMaxPercentEmployee, double manualMaxPercentManager, bool isActive, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$DiscountPolicyCopyWithImpl<$Res>
    implements _$DiscountPolicyCopyWith<$Res> {
  __$DiscountPolicyCopyWithImpl(this._self, this._then);

  final _DiscountPolicy _self;
  final $Res Function(_DiscountPolicy) _then;

/// Create a copy of DiscountPolicy
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? manualMaxPercentEmployee = null,Object? manualMaxPercentManager = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_DiscountPolicy(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,manualMaxPercentEmployee: null == manualMaxPercentEmployee ? _self.manualMaxPercentEmployee : manualMaxPercentEmployee // ignore: cast_nullable_to_non_nullable
as double,manualMaxPercentManager: null == manualMaxPercentManager ? _self.manualMaxPercentManager : manualMaxPercentManager // ignore: cast_nullable_to_non_nullable
as double,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
