// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calc_rule_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CalcRuleDto {

 String get id; String get key; String get value; String get unit; String get description;@JsonKey(name: 'applies_to', fromJson: mapFromJson) Map<String, dynamic> get appliesTo;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt;
/// Create a copy of CalcRuleDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalcRuleDtoCopyWith<CalcRuleDto> get copyWith => _$CalcRuleDtoCopyWithImpl<CalcRuleDto>(this as CalcRuleDto, _$identity);

  /// Serializes this CalcRuleDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalcRuleDto&&(identical(other.id, id) || other.id == id)&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.appliesTo, appliesTo)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,key,value,unit,description,const DeepCollectionEquality().hash(appliesTo),isActive,createdAt,updatedAt);

@override
String toString() {
  return 'CalcRuleDto(id: $id, key: $key, value: $value, unit: $unit, description: $description, appliesTo: $appliesTo, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $CalcRuleDtoCopyWith<$Res>  {
  factory $CalcRuleDtoCopyWith(CalcRuleDto value, $Res Function(CalcRuleDto) _then) = _$CalcRuleDtoCopyWithImpl;
@useResult
$Res call({
 String id, String key, String value, String unit, String description,@JsonKey(name: 'applies_to', fromJson: mapFromJson) Map<String, dynamic> appliesTo,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt
});




}
/// @nodoc
class _$CalcRuleDtoCopyWithImpl<$Res>
    implements $CalcRuleDtoCopyWith<$Res> {
  _$CalcRuleDtoCopyWithImpl(this._self, this._then);

  final CalcRuleDto _self;
  final $Res Function(CalcRuleDto) _then;

/// Create a copy of CalcRuleDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? key = null,Object? value = null,Object? unit = null,Object? description = null,Object? appliesTo = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,appliesTo: null == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CalcRuleDto].
extension CalcRuleDtoPatterns on CalcRuleDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalcRuleDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalcRuleDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalcRuleDto value)  $default,){
final _that = this;
switch (_that) {
case _CalcRuleDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalcRuleDto value)?  $default,){
final _that = this;
switch (_that) {
case _CalcRuleDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String key,  String value,  String unit,  String description, @JsonKey(name: 'applies_to', fromJson: mapFromJson)  Map<String, dynamic> appliesTo, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalcRuleDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String key,  String value,  String unit,  String description, @JsonKey(name: 'applies_to', fromJson: mapFromJson)  Map<String, dynamic> appliesTo, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _CalcRuleDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String key,  String value,  String unit,  String description, @JsonKey(name: 'applies_to', fromJson: mapFromJson)  Map<String, dynamic> appliesTo, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _CalcRuleDto() when $default != null:
return $default(_that.id,_that.key,_that.value,_that.unit,_that.description,_that.appliesTo,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CalcRuleDto implements CalcRuleDto {
  const _CalcRuleDto({required this.id, required this.key, required this.value, required this.unit, required this.description, @JsonKey(name: 'applies_to', fromJson: mapFromJson) this.appliesTo = const {}, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _CalcRuleDto.fromJson(Map<String, dynamic> json) => _$CalcRuleDtoFromJson(json);

@override final  String id;
@override final  String key;
@override final  String value;
@override final  String unit;
@override final  String description;
@override@JsonKey(name: 'applies_to', fromJson: mapFromJson) final  Map<String, dynamic> appliesTo;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;

/// Create a copy of CalcRuleDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalcRuleDtoCopyWith<_CalcRuleDto> get copyWith => __$CalcRuleDtoCopyWithImpl<_CalcRuleDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalcRuleDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalcRuleDto&&(identical(other.id, id) || other.id == id)&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.appliesTo, appliesTo)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,key,value,unit,description,const DeepCollectionEquality().hash(appliesTo),isActive,createdAt,updatedAt);

@override
String toString() {
  return 'CalcRuleDto(id: $id, key: $key, value: $value, unit: $unit, description: $description, appliesTo: $appliesTo, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$CalcRuleDtoCopyWith<$Res> implements $CalcRuleDtoCopyWith<$Res> {
  factory _$CalcRuleDtoCopyWith(_CalcRuleDto value, $Res Function(_CalcRuleDto) _then) = __$CalcRuleDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String key, String value, String unit, String description,@JsonKey(name: 'applies_to', fromJson: mapFromJson) Map<String, dynamic> appliesTo,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt
});




}
/// @nodoc
class __$CalcRuleDtoCopyWithImpl<$Res>
    implements _$CalcRuleDtoCopyWith<$Res> {
  __$CalcRuleDtoCopyWithImpl(this._self, this._then);

  final _CalcRuleDto _self;
  final $Res Function(_CalcRuleDto) _then;

/// Create a copy of CalcRuleDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? key = null,Object? value = null,Object? unit = null,Object? description = null,Object? appliesTo = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_CalcRuleDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,appliesTo: null == appliesTo ? _self.appliesTo : appliesTo // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
