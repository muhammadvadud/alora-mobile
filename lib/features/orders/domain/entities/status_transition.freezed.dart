// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status_transition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StatusTransition {

 String get code; String get label;
/// Create a copy of StatusTransition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatusTransitionCopyWith<StatusTransition> get copyWith => _$StatusTransitionCopyWithImpl<StatusTransition>(this as StatusTransition, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatusTransition&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label));
}


@override
int get hashCode => Object.hash(runtimeType,code,label);

@override
String toString() {
  return 'StatusTransition(code: $code, label: $label)';
}


}

/// @nodoc
abstract mixin class $StatusTransitionCopyWith<$Res>  {
  factory $StatusTransitionCopyWith(StatusTransition value, $Res Function(StatusTransition) _then) = _$StatusTransitionCopyWithImpl;
@useResult
$Res call({
 String code, String label
});




}
/// @nodoc
class _$StatusTransitionCopyWithImpl<$Res>
    implements $StatusTransitionCopyWith<$Res> {
  _$StatusTransitionCopyWithImpl(this._self, this._then);

  final StatusTransition _self;
  final $Res Function(StatusTransition) _then;

/// Create a copy of StatusTransition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? label = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StatusTransition].
extension StatusTransitionPatterns on StatusTransition {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatusTransition value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatusTransition() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatusTransition value)  $default,){
final _that = this;
switch (_that) {
case _StatusTransition():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatusTransition value)?  $default,){
final _that = this;
switch (_that) {
case _StatusTransition() when $default != null:
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
case _StatusTransition() when $default != null:
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
case _StatusTransition():
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
case _StatusTransition() when $default != null:
return $default(_that.code,_that.label);case _:
  return null;

}
}

}

/// @nodoc


class _StatusTransition implements StatusTransition {
  const _StatusTransition({required this.code, required this.label});
  

@override final  String code;
@override final  String label;

/// Create a copy of StatusTransition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatusTransitionCopyWith<_StatusTransition> get copyWith => __$StatusTransitionCopyWithImpl<_StatusTransition>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatusTransition&&(identical(other.code, code) || other.code == code)&&(identical(other.label, label) || other.label == label));
}


@override
int get hashCode => Object.hash(runtimeType,code,label);

@override
String toString() {
  return 'StatusTransition(code: $code, label: $label)';
}


}

/// @nodoc
abstract mixin class _$StatusTransitionCopyWith<$Res> implements $StatusTransitionCopyWith<$Res> {
  factory _$StatusTransitionCopyWith(_StatusTransition value, $Res Function(_StatusTransition) _then) = __$StatusTransitionCopyWithImpl;
@override @useResult
$Res call({
 String code, String label
});




}
/// @nodoc
class __$StatusTransitionCopyWithImpl<$Res>
    implements _$StatusTransitionCopyWith<$Res> {
  __$StatusTransitionCopyWithImpl(this._self, this._then);

  final _StatusTransition _self;
  final $Res Function(_StatusTransition) _then;

/// Create a copy of StatusTransition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? label = null,}) {
  return _then(_StatusTransition(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
