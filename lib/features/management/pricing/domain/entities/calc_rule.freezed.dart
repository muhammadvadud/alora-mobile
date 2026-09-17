// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calc_rule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CalcRule {

 String get id; String get key; double get value; String get unit; String get description; String get appliesTo; bool get isActive; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of CalcRule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalcRuleCopyWith<CalcRule> get copyWith => _$CalcRuleCopyWithImpl<CalcRule>(this as CalcRule, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalcRule&&(identical(other.id, id) || other.id == id)&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.description, description) || other.description == description)&&(identical(other.appliesTo, appliesTo) || other.appliesTo == appliesTo)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,key,value,unit,description,appliesTo,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'CalcRule(id: $id, key: $key, value: $value, unit: $unit, description: $description, appliesTo: $appliesTo, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CalcRuleCopyWith<$Res>  {
  factory $CalcRuleCopyWith(CalcRule value, $Res Function(CalcRule) _then) = _$CalcRuleCopyWithImpl;
@useResult
$Res call({
 String id, String key, double value, String unit, String description, String appliesTo, bool isActive, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$CalcRuleCopyWithImpl<$Res>
    implements $CalcRuleCopyWith<$Res> {
  _$CalcRuleCopyWithImpl(this._self, this._then);

  final CalcRule _self;
  final $Res Function(CalcRule) _then;

/// Create a copy of CalcRule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? key = null,Object? value = null,Object? unit = null,Object? description = null,Object? appliesTo = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,appliesTo: null == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [CalcRule].
extension CalcRulePatterns on CalcRule {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalcRule value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalcRule() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalcRule value)  $default,){
final _that = this;
switch (_that) {
case _CalcRule():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalcRule value)?  $default,){
final _that = this;
switch (_that) {
case _CalcRule() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String key,  double value,  String unit,  String description,  String appliesTo,  bool isActive,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalcRule() when $default != null:
return $default(_that.id,_that.key,_that.value,_that.unit,_that.description,_that.appliesTo,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String key,  double value,  String unit,  String description,  String appliesTo,  bool isActive,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CalcRule():
return $default(_that.id,_that.key,_that.value,_that.unit,_that.description,_that.appliesTo,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String key,  double value,  String unit,  String description,  String appliesTo,  bool isActive,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CalcRule() when $default != null:
return $default(_that.id,_that.key,_that.value,_that.unit,_that.description,_that.appliesTo,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _CalcRule implements CalcRule {
  const _CalcRule({required this.id, required this.key, required this.value, required this.unit, required this.description, required this.appliesTo, required this.isActive, required this.createdAt, required this.updatedAt});
  

@override final  String id;
@override final  String key;
@override final  double value;
@override final  String unit;
@override final  String description;
@override final  String appliesTo;
@override final  bool isActive;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of CalcRule
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalcRuleCopyWith<_CalcRule> get copyWith => __$CalcRuleCopyWithImpl<_CalcRule>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalcRule&&(identical(other.id, id) || other.id == id)&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.description, description) || other.description == description)&&(identical(other.appliesTo, appliesTo) || other.appliesTo == appliesTo)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,key,value,unit,description,appliesTo,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'CalcRule(id: $id, key: $key, value: $value, unit: $unit, description: $description, appliesTo: $appliesTo, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CalcRuleCopyWith<$Res> implements $CalcRuleCopyWith<$Res> {
  factory _$CalcRuleCopyWith(_CalcRule value, $Res Function(_CalcRule) _then) = __$CalcRuleCopyWithImpl;
@override @useResult
$Res call({
 String id, String key, double value, String unit, String description, String appliesTo, bool isActive, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$CalcRuleCopyWithImpl<$Res>
    implements _$CalcRuleCopyWith<$Res> {
  __$CalcRuleCopyWithImpl(this._self, this._then);

  final _CalcRule _self;
  final $Res Function(_CalcRule) _then;

/// Create a copy of CalcRule
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? key = null,Object? value = null,Object? unit = null,Object? description = null,Object? appliesTo = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_CalcRule(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,appliesTo: null == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
