// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status_transition_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StatusTransitionDto {

 String get code; String get label;
/// Create a copy of StatusTransitionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatusTransitionDtoCopyWith<StatusTransitionDto> get copyWith => _$StatusTransitionDtoCopyWithImpl<StatusTransitionDto>(this as StatusTransitionDto, _$identity);

  /// Serializes this StatusTransitionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatusTransitionDto&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,label);

@override
String toString() {
  return 'StatusTransitionDto(code: $code, label: $label)';
}


}

/// @nodoc
abstract mixin class $StatusTransitionDtoCopyWith<$Res>  {
  factory $StatusTransitionDtoCopyWith(StatusTransitionDto value, $Res Function(StatusTransitionDto) _then) = _$StatusTransitionDtoCopyWithImpl;
@useResult
$Res call({
 String code, String label
});




}
/// @nodoc
class _$StatusTransitionDtoCopyWithImpl<$Res>
    implements $StatusTransitionDtoCopyWith<$Res> {
  _$StatusTransitionDtoCopyWithImpl(this._self, this._then);

  final StatusTransitionDto _self;
  final $Res Function(StatusTransitionDto) _then;

/// Create a copy of StatusTransitionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? label = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StatusTransitionDto].
extension StatusTransitionDtoPatterns on StatusTransitionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatusTransitionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatusTransitionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatusTransitionDto value)  $default,){
final _that = this;
switch (_that) {
case _StatusTransitionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatusTransitionDto value)?  $default,){
final _that = this;
switch (_that) {
case _StatusTransitionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatusTransitionDto() when $default != null:
return $default(_that.code,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String label)  $default,) {final _that = this;
switch (_that) {
case _StatusTransitionDto():
return $default(_that.code,_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String label)?  $default,) {final _that = this;
switch (_that) {
case _StatusTransitionDto() when $default != null:
return $default(_that.code,_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StatusTransitionDto implements StatusTransitionDto {
  const _StatusTransitionDto({required this.code, required this.label});
  factory _StatusTransitionDto.fromJson(Map<String, dynamic> json) => _$StatusTransitionDtoFromJson(json);

@override final  String code;
@override final  String label;

/// Create a copy of StatusTransitionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatusTransitionDtoCopyWith<_StatusTransitionDto> get copyWith => __$StatusTransitionDtoCopyWithImpl<_StatusTransitionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatusTransitionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatusTransitionDto&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,label);

@override
String toString() {
  return 'StatusTransitionDto(code: $code, label: $label)';
}


}

/// @nodoc
abstract mixin class _$StatusTransitionDtoCopyWith<$Res> implements $StatusTransitionDtoCopyWith<$Res> {
  factory _$StatusTransitionDtoCopyWith(_StatusTransitionDto value, $Res Function(_StatusTransitionDto) _then) = __$StatusTransitionDtoCopyWithImpl;
@override @useResult
$Res call({
 String code, String label
});




}
/// @nodoc
class __$StatusTransitionDtoCopyWithImpl<$Res>
    implements _$StatusTransitionDtoCopyWith<$Res> {
  __$StatusTransitionDtoCopyWithImpl(this._self, this._then);

  final _StatusTransitionDto _self;
  final $Res Function(_StatusTransitionDto) _then;

/// Create a copy of StatusTransitionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? label = null,}) {
  return _then(_StatusTransitionDto(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
