// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'knowledge_rule_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KnowledgeRuleDto {

 String get id; String get kind; List<String> get condition; String get recommendation; int get priority;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of KnowledgeRuleDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KnowledgeRuleDtoCopyWith<KnowledgeRuleDto> get copyWith => _$KnowledgeRuleDtoCopyWithImpl<KnowledgeRuleDto>(this as KnowledgeRuleDto, _$identity);

  /// Serializes this KnowledgeRuleDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KnowledgeRuleDto&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&const DeepCollectionEquality().equals(other.condition, condition)&&(identical(other.recommendation, recommendation) || other.recommendation == recommendation)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,const DeepCollectionEquality().hash(condition),recommendation,priority,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'KnowledgeRuleDto(id: $id, kind: $kind, condition: $condition, recommendation: $recommendation, priority: $priority, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $KnowledgeRuleDtoCopyWith<$Res>  {
  factory $KnowledgeRuleDtoCopyWith(KnowledgeRuleDto value, $Res Function(KnowledgeRuleDto) _then) = _$KnowledgeRuleDtoCopyWithImpl;
@useResult
$Res call({
 String id, String kind, List<String> condition, String recommendation, int priority,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class _$KnowledgeRuleDtoCopyWithImpl<$Res>
    implements $KnowledgeRuleDtoCopyWith<$Res> {
  _$KnowledgeRuleDtoCopyWithImpl(this._self, this._then);

  final KnowledgeRuleDto _self;
  final $Res Function(KnowledgeRuleDto) _then;

/// Create a copy of KnowledgeRuleDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? condition = null,Object? recommendation = null,Object? priority = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as List<String>,recommendation: null == recommendation ? _self.recommendation : recommendation // ignore: cast_nullable_to_non_nullable
as String,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [KnowledgeRuleDto].
extension KnowledgeRuleDtoPatterns on KnowledgeRuleDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KnowledgeRuleDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KnowledgeRuleDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KnowledgeRuleDto value)  $default,){
final _that = this;
switch (_that) {
case _KnowledgeRuleDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KnowledgeRuleDto value)?  $default,){
final _that = this;
switch (_that) {
case _KnowledgeRuleDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String kind,  List<String> condition,  String recommendation,  int priority, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KnowledgeRuleDto() when $default != null:
return $default(_that.id,_that.kind,_that.condition,_that.recommendation,_that.priority,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String kind,  List<String> condition,  String recommendation,  int priority, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _KnowledgeRuleDto():
return $default(_that.id,_that.kind,_that.condition,_that.recommendation,_that.priority,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String kind,  List<String> condition,  String recommendation,  int priority, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _KnowledgeRuleDto() when $default != null:
return $default(_that.id,_that.kind,_that.condition,_that.recommendation,_that.priority,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KnowledgeRuleDto implements KnowledgeRuleDto {
  const _KnowledgeRuleDto({required this.id, required this.kind, required this.condition, required this.recommendation, required this.priority, @JsonKey(name: 'is_active') required this.isActive, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt});
  factory _KnowledgeRuleDto.fromJson(Map<String, dynamic> json) => _$KnowledgeRuleDtoFromJson(json);

@override final  String id;
@override final  String kind;
@override final  List<String> condition;
@override final  String recommendation;
@override final  int priority;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of KnowledgeRuleDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KnowledgeRuleDtoCopyWith<_KnowledgeRuleDto> get copyWith => __$KnowledgeRuleDtoCopyWithImpl<_KnowledgeRuleDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KnowledgeRuleDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KnowledgeRuleDto&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&const DeepCollectionEquality().equals(other.condition, condition)&&(identical(other.recommendation, recommendation) || other.recommendation == recommendation)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,const DeepCollectionEquality().hash(condition),recommendation,priority,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'KnowledgeRuleDto(id: $id, kind: $kind, condition: $condition, recommendation: $recommendation, priority: $priority, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$KnowledgeRuleDtoCopyWith<$Res> implements $KnowledgeRuleDtoCopyWith<$Res> {
  factory _$KnowledgeRuleDtoCopyWith(_KnowledgeRuleDto value, $Res Function(_KnowledgeRuleDto) _then) = __$KnowledgeRuleDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String kind, List<String> condition, String recommendation, int priority,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});




}
/// @nodoc
class __$KnowledgeRuleDtoCopyWithImpl<$Res>
    implements _$KnowledgeRuleDtoCopyWith<$Res> {
  __$KnowledgeRuleDtoCopyWithImpl(this._self, this._then);

  final _KnowledgeRuleDto _self;
  final $Res Function(_KnowledgeRuleDto) _then;

/// Create a copy of KnowledgeRuleDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? condition = null,Object? recommendation = null,Object? priority = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_KnowledgeRuleDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as List<String>,recommendation: null == recommendation ? _self.recommendation : recommendation // ignore: cast_nullable_to_non_nullable
as String,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
