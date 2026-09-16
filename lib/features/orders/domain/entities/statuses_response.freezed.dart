// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statuses_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StatusesResponse {

 List<StatusTransition> get statuses; Map<String, List<String>> get transitions;
/// Create a copy of StatusesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatusesResponseCopyWith<StatusesResponse> get copyWith => _$StatusesResponseCopyWithImpl<StatusesResponse>(this as StatusesResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatusesResponse&&const DeepCollectionEquality().equals(other.statuses, statuses)&&const DeepCollectionEquality().equals(other.transitions, transitions));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(statuses),const DeepCollectionEquality().hash(transitions));

@override
String toString() {
  return 'StatusesResponse(statuses: $statuses, transitions: $transitions)';
}


}

/// @nodoc
abstract mixin class $StatusesResponseCopyWith<$Res>  {
  factory $StatusesResponseCopyWith(StatusesResponse value, $Res Function(StatusesResponse) _then) = _$StatusesResponseCopyWithImpl;
@useResult
$Res call({
 List<StatusTransition> statuses, Map<String, List<String>> transitions
});




}
/// @nodoc
class _$StatusesResponseCopyWithImpl<$Res>
    implements $StatusesResponseCopyWith<$Res> {
  _$StatusesResponseCopyWithImpl(this._self, this._then);

  final StatusesResponse _self;
  final $Res Function(StatusesResponse) _then;

/// Create a copy of StatusesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statuses = null,Object? transitions = null,}) {
  return _then(_self.copyWith(
statuses: null == statuses ? _self.statuses : statuses // ignore: cast_nullable_to_non_nullable
as List<StatusTransition>,transitions: null == transitions ? _self.transitions : transitions // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,
  ));
}

}


/// Adds pattern-matching-related methods to [StatusesResponse].
extension StatusesResponsePatterns on StatusesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatusesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatusesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatusesResponse value)  $default,){
final _that = this;
switch (_that) {
case _StatusesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatusesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _StatusesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<StatusTransition> statuses,  Map<String, List<String>> transitions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatusesResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<StatusTransition> statuses,  Map<String, List<String>> transitions)  $default,) {final _that = this;
switch (_that) {
case _StatusesResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<StatusTransition> statuses,  Map<String, List<String>> transitions)?  $default,) {final _that = this;
switch (_that) {
case _StatusesResponse() when $default != null:
return $default(_that.statuses,_that.transitions);case _:
  return null;

}
}

}

/// @nodoc


class _StatusesResponse implements StatusesResponse {
  const _StatusesResponse({this.statuses = const [], this.transitions = const {}});
  

@override@JsonKey() final  List<StatusTransition> statuses;
@override@JsonKey() final  Map<String, List<String>> transitions;

/// Create a copy of StatusesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatusesResponseCopyWith<_StatusesResponse> get copyWith => __$StatusesResponseCopyWithImpl<_StatusesResponse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatusesResponse&&const DeepCollectionEquality().equals(other.statuses, statuses)&&const DeepCollectionEquality().equals(other.transitions, transitions));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(statuses),const DeepCollectionEquality().hash(transitions));

@override
String toString() {
  return 'StatusesResponse(statuses: $statuses, transitions: $transitions)';
}


}

/// @nodoc
abstract mixin class _$StatusesResponseCopyWith<$Res> implements $StatusesResponseCopyWith<$Res> {
  factory _$StatusesResponseCopyWith(_StatusesResponse value, $Res Function(_StatusesResponse) _then) = __$StatusesResponseCopyWithImpl;
@override @useResult
$Res call({
 List<StatusTransition> statuses, Map<String, List<String>> transitions
});




}
/// @nodoc
class __$StatusesResponseCopyWithImpl<$Res>
    implements _$StatusesResponseCopyWith<$Res> {
  __$StatusesResponseCopyWithImpl(this._self, this._then);

  final _StatusesResponse _self;
  final $Res Function(_StatusesResponse) _then;

/// Create a copy of StatusesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statuses = null,Object? transitions = null,}) {
  return _then(_StatusesResponse(
statuses: null == statuses ? _self.statuses : statuses // ignore: cast_nullable_to_non_nullable
as List<StatusTransition>,transitions: null == transitions ? _self.transitions : transitions // ignore: cast_nullable_to_non_nullable
as Map<String, List<String>>,
  ));
}


}

// dart format on
