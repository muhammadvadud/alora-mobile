// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voice_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VoiceState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoiceState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VoiceState()';
}


}

/// @nodoc
class $VoiceStateCopyWith<$Res>  {
$VoiceStateCopyWith(VoiceState _, $Res Function(VoiceState) __);
}


/// Adds pattern-matching-related methods to [VoiceState].
extension VoiceStatePatterns on VoiceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Idle value)?  idle,TResult Function( _Listening value)?  listening,TResult Function( _Transcribing value)?  transcribing,TResult Function( _Speaking value)?  speaking,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _Listening() when listening != null:
return listening(_that);case _Transcribing() when transcribing != null:
return transcribing(_that);case _Speaking() when speaking != null:
return speaking(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Idle value)  idle,required TResult Function( _Listening value)  listening,required TResult Function( _Transcribing value)  transcribing,required TResult Function( _Speaking value)  speaking,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Idle():
return idle(_that);case _Listening():
return listening(_that);case _Transcribing():
return transcribing(_that);case _Speaking():
return speaking(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Idle value)?  idle,TResult? Function( _Listening value)?  listening,TResult? Function( _Transcribing value)?  transcribing,TResult? Function( _Speaking value)?  speaking,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _Listening() when listening != null:
return listening(_that);case _Transcribing() when transcribing != null:
return transcribing(_that);case _Speaking() when speaking != null:
return speaking(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function( double amplitude,  Duration duration)?  listening,TResult Function()?  transcribing,TResult Function( double amplitude)?  speaking,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _Listening() when listening != null:
return listening(_that.amplitude,_that.duration);case _Transcribing() when transcribing != null:
return transcribing();case _Speaking() when speaking != null:
return speaking(_that.amplitude);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function( double amplitude,  Duration duration)  listening,required TResult Function()  transcribing,required TResult Function( double amplitude)  speaking,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _Idle():
return idle();case _Listening():
return listening(_that.amplitude,_that.duration);case _Transcribing():
return transcribing();case _Speaking():
return speaking(_that.amplitude);case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function( double amplitude,  Duration duration)?  listening,TResult? Function()?  transcribing,TResult? Function( double amplitude)?  speaking,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _Listening() when listening != null:
return listening(_that.amplitude,_that.duration);case _Transcribing() when transcribing != null:
return transcribing();case _Speaking() when speaking != null:
return speaking(_that.amplitude);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Idle implements VoiceState {
  const _Idle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Idle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VoiceState.idle()';
}


}




/// @nodoc


class _Listening implements VoiceState {
  const _Listening({this.amplitude = 0.0, this.duration = Duration.zero});
  

@JsonKey() final  double amplitude;
@JsonKey() final  Duration duration;

/// Create a copy of VoiceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListeningCopyWith<_Listening> get copyWith => __$ListeningCopyWithImpl<_Listening>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Listening&&(identical(other.amplitude, amplitude) || other.amplitude == amplitude)&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,amplitude,duration);

@override
String toString() {
  return 'VoiceState.listening(amplitude: $amplitude, duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$ListeningCopyWith<$Res> implements $VoiceStateCopyWith<$Res> {
  factory _$ListeningCopyWith(_Listening value, $Res Function(_Listening) _then) = __$ListeningCopyWithImpl;
@useResult
$Res call({
 double amplitude, Duration duration
});




}
/// @nodoc
class __$ListeningCopyWithImpl<$Res>
    implements _$ListeningCopyWith<$Res> {
  __$ListeningCopyWithImpl(this._self, this._then);

  final _Listening _self;
  final $Res Function(_Listening) _then;

/// Create a copy of VoiceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? amplitude = null,Object? duration = null,}) {
  return _then(_Listening(
amplitude: null == amplitude ? _self.amplitude : amplitude // ignore: cast_nullable_to_non_nullable
as double,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

/// @nodoc


class _Transcribing implements VoiceState {
  const _Transcribing();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Transcribing);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VoiceState.transcribing()';
}


}




/// @nodoc


class _Speaking implements VoiceState {
  const _Speaking({this.amplitude = 0.0});
  

@JsonKey() final  double amplitude;

/// Create a copy of VoiceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpeakingCopyWith<_Speaking> get copyWith => __$SpeakingCopyWithImpl<_Speaking>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Speaking&&(identical(other.amplitude, amplitude) || other.amplitude == amplitude));
}


@override
int get hashCode => Object.hash(runtimeType,amplitude);

@override
String toString() {
  return 'VoiceState.speaking(amplitude: $amplitude)';
}


}

/// @nodoc
abstract mixin class _$SpeakingCopyWith<$Res> implements $VoiceStateCopyWith<$Res> {
  factory _$SpeakingCopyWith(_Speaking value, $Res Function(_Speaking) _then) = __$SpeakingCopyWithImpl;
@useResult
$Res call({
 double amplitude
});




}
/// @nodoc
class __$SpeakingCopyWithImpl<$Res>
    implements _$SpeakingCopyWith<$Res> {
  __$SpeakingCopyWithImpl(this._self, this._then);

  final _Speaking _self;
  final $Res Function(_Speaking) _then;

/// Create a copy of VoiceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? amplitude = null,}) {
  return _then(_Speaking(
amplitude: null == amplitude ? _self.amplitude : amplitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class _Error implements VoiceState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of VoiceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'VoiceState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $VoiceStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of VoiceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
