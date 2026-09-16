// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statuses_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StatusesResponseDto {

 List<StatusTransitionDto> get statuses; Map<String, List<String>> get transitions;
/// Create a copy of StatusesResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatusesResponseDtoCopyWith<StatusesResponseDto> get copyWith => _$StatusesResponseDtoCopyWithImpl<StatusesResponseDto>(this as StatusesResponseDto, _$identity);

  /// Serializes this StatusesResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatusesResponseDto&&const DeepCollectionEquality().equals(other.statuses, statuses)&&const DeepCollectionEquality().equals(other.transitions, transitions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(statuses),const DeepCollectionEquality().hash(transitions));

@override
String toString() {
  return 'StatusesResponseDto(statuses: $statuses, transitions: $transitions)';
}


}

/// @nodoc
abstract mixin class $StatusesResponseDtoCopyWith<$Res>  {
  factory $StatusesResponseDtoCopyWith(StatusesResponseDto value, $Res Function(StatusesResponseDto) _then) = _$StatusesResponseDtoCopyWithImpl;
@useResult
$Res call({
 List<StatusTransitionDto> statuses, Map<String, List<String>> transitions
});




}
/// @nodoc
class _$StatusesResponseDtoCopyWithImpl<$Res>
    implements $StatusesResponseDtoCopyWith<$Res> {
  _$StatusesResponseDtoCopyWithImpl(this._self, this._then);

  final StatusesResponseDto _self;
  final $Res Function(StatusesResponseDto) _then;

/// Create a copy of StatusesResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statuses = null,Object? transitions = null,}) {
  return _then(_self.copyWith(
statuses: null == statuses ? _self.statuses : statuses // ignore: cast_nullable_to_non_nullable
as List<StatusTransitionDto>,transitions: null == transitions ? _self.transitions : transitions // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,
  ));
}

}


/// Adds pattern-matching-related methods to [StatusesResponseDto].
extension StatusesResponseDtoPatterns on StatusesResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatusesResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatusesResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatusesResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _StatusesResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatusesResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _StatusesResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<StatusTransitionDto> statuses,  Map<String, List<String>> transitions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatusesResponseDto() when $default != null:
return $default(_that.statuses,_that.transitions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<StatusTransitionDto> statuses,  Map<String, List<String>> transitions)  $default,) {final _that = this;
switch (_that) {
case _StatusesResponseDto():
return $default(_that.statuses,_that.transitions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<StatusTransitionDto> statuses,  Map<String, List<String>> transitions)?  $default,) {final _that = this;
switch (_that) {
case _StatusesResponseDto() when $default != null:
return $default(_that.statuses,_that.transitions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StatusesResponseDto implements StatusesResponseDto {
  const _StatusesResponseDto({this.statuses = const [], this.transitions = const {}});
  factory _StatusesResponseDto.fromJson(Map<String, dynamic> json) => _$StatusesResponseDtoFromJson(json);

@override@JsonKey() final  List<StatusTransitionDto> statuses;
@override@JsonKey() final  Map<String, List<String>> transitions;

/// Create a copy of StatusesResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatusesResponseDtoCopyWith<_StatusesResponseDto> get copyWith => __$StatusesResponseDtoCopyWithImpl<_StatusesResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatusesResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatusesResponseDto&&const DeepCollectionEquality().equals(other.statuses, statuses)&&const DeepCollectionEquality().equals(other.transitions, transitions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(statuses),const DeepCollectionEquality().hash(transitions));

@override
String toString() {
  return 'StatusesResponseDto(statuses: $statuses, transitions: $transitions)';
}


}

/// @nodoc
abstract mixin class _$StatusesResponseDtoCopyWith<$Res> implements $StatusesResponseDtoCopyWith<$Res> {
  factory _$StatusesResponseDtoCopyWith(_StatusesResponseDto value, $Res Function(_StatusesResponseDto) _then) = __$StatusesResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 List<StatusTransitionDto> statuses, Map<String, List<String>> transitions
});




}
/// @nodoc
class __$StatusesResponseDtoCopyWithImpl<$Res>
    implements _$StatusesResponseDtoCopyWith<$Res> {
  __$StatusesResponseDtoCopyWithImpl(this._self, this._then);

  final _StatusesResponseDto _self;
  final $Res Function(_StatusesResponseDto) _then;

/// Create a copy of StatusesResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statuses = null,Object? transitions = null,}) {
  return _then(_StatusesResponseDto(
statuses: null == statuses ? _self.statuses : statuses // ignore: cast_nullable_to_non_nullable
as List<StatusTransitionDto>,transitions: null == transitions ? _self.transitions : transitions // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,
  ));
}


}

// dart format on
