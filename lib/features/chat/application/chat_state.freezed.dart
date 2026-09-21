// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatState {

 List<Message> get messages; bool get isStreaming; bool get isLoadingHistory; Failure? get error; List<String> get quickReplies; String? get stage;/// Keyingi (eski) sahifa kursori; `null` — barcha sahifalar yuklangan.
 String? get nextCursor; bool get isLoadingOlder;
/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatStateCopyWith<ChatState> get copyWith => _$ChatStateCopyWithImpl<ChatState>(this as ChatState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatState&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.isStreaming, isStreaming) || other.isStreaming == isStreaming)&&(identical(other.isLoadingHistory, isLoadingHistory) || other.isLoadingHistory == isLoadingHistory)&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other.quickReplies, quickReplies)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.isLoadingOlder, isLoadingOlder) || other.isLoadingOlder == isLoadingOlder));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(messages),isStreaming,isLoadingHistory,error,const DeepCollectionEquality().hash(quickReplies),stage,nextCursor,isLoadingOlder);

@override
String toString() {
  return 'ChatState(messages: $messages, isStreaming: $isStreaming, isLoadingHistory: $isLoadingHistory, error: $error, quickReplies: $quickReplies, stage: $stage, nextCursor: $nextCursor, isLoadingOlder: $isLoadingOlder)';
}


}

/// @nodoc
abstract mixin class $ChatStateCopyWith<$Res>  {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) _then) = _$ChatStateCopyWithImpl;
@useResult
$Res call({
 List<Message> messages, bool isStreaming, bool isLoadingHistory, Failure? error, List<String> quickReplies, String? stage, String? nextCursor, bool isLoadingOlder
});


$FailureCopyWith<$Res>? get error;

}
/// @nodoc
class _$ChatStateCopyWithImpl<$Res>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._self, this._then);

  final ChatState _self;
  final $Res Function(ChatState) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messages = null,Object? isStreaming = null,Object? isLoadingHistory = null,Object? error = freezed,Object? quickReplies = null,Object? stage = freezed,Object? nextCursor = freezed,Object? isLoadingOlder = null,}) {
  return _then(_self.copyWith(
messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,isStreaming: null == isStreaming ? _self.isStreaming : isStreaming // ignore: cast_nullable_to_non_nullable
as bool,isLoadingHistory: null == isLoadingHistory ? _self.isLoadingHistory : isLoadingHistory // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as Failure?,quickReplies: null == quickReplies ? _self.quickReplies : quickReplies // ignore: cast_nullable_to_non_nullable
as List<String>,stage: freezed == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as String?,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,isLoadingOlder: null == isLoadingOlder ? _self.isLoadingOlder : isLoadingOlder // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatState].
extension ChatStatePatterns on ChatState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatState value)  $default,){
final _that = this;
switch (_that) {
case _ChatState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatState value)?  $default,){
final _that = this;
switch (_that) {
case _ChatState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Message> messages,  bool isStreaming,  bool isLoadingHistory,  Failure? error,  List<String> quickReplies,  String? stage,  String? nextCursor,  bool isLoadingOlder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatState() when $default != null:
return $default(_that.messages,_that.isStreaming,_that.isLoadingHistory,_that.error,_that.quickReplies,_that.stage,_that.nextCursor,_that.isLoadingOlder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Message> messages,  bool isStreaming,  bool isLoadingHistory,  Failure? error,  List<String> quickReplies,  String? stage,  String? nextCursor,  bool isLoadingOlder)  $default,) {final _that = this;
switch (_that) {
case _ChatState():
return $default(_that.messages,_that.isStreaming,_that.isLoadingHistory,_that.error,_that.quickReplies,_that.stage,_that.nextCursor,_that.isLoadingOlder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Message> messages,  bool isStreaming,  bool isLoadingHistory,  Failure? error,  List<String> quickReplies,  String? stage,  String? nextCursor,  bool isLoadingOlder)?  $default,) {final _that = this;
switch (_that) {
case _ChatState() when $default != null:
return $default(_that.messages,_that.isStreaming,_that.isLoadingHistory,_that.error,_that.quickReplies,_that.stage,_that.nextCursor,_that.isLoadingOlder);case _:
  return null;

}
}

}

/// @nodoc


class _ChatState implements ChatState {
  const _ChatState({this.messages = const [], this.isStreaming = false, this.isLoadingHistory = true, this.error, this.quickReplies = const [], this.stage, this.nextCursor, this.isLoadingOlder = false});
  

@override@JsonKey() final  List<Message> messages;
@override@JsonKey() final  bool isStreaming;
@override@JsonKey() final  bool isLoadingHistory;
@override final  Failure? error;
@override@JsonKey() final  List<String> quickReplies;
@override final  String? stage;
/// Keyingi (eski) sahifa kursori; `null` — barcha sahifalar yuklangan.
@override final  String? nextCursor;
@override@JsonKey() final  bool isLoadingOlder;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatStateCopyWith<_ChatState> get copyWith => __$ChatStateCopyWithImpl<_ChatState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatState&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.isStreaming, isStreaming) || other.isStreaming == isStreaming)&&(identical(other.isLoadingHistory, isLoadingHistory) || other.isLoadingHistory == isLoadingHistory)&&(identical(other.error, error) || other.error == error)&&const DeepCollectionEquality().equals(other.quickReplies, quickReplies)&&(identical(other.stage, stage) || other.stage == stage)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.isLoadingOlder, isLoadingOlder) || other.isLoadingOlder == isLoadingOlder));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(messages),isStreaming,isLoadingHistory,error,const DeepCollectionEquality().hash(quickReplies),stage,nextCursor,isLoadingOlder);

@override
String toString() {
  return 'ChatState(messages: $messages, isStreaming: $isStreaming, isLoadingHistory: $isLoadingHistory, error: $error, quickReplies: $quickReplies, stage: $stage, nextCursor: $nextCursor, isLoadingOlder: $isLoadingOlder)';
}


}

/// @nodoc
abstract mixin class _$ChatStateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$ChatStateCopyWith(_ChatState value, $Res Function(_ChatState) _then) = __$ChatStateCopyWithImpl;
@override @useResult
$Res call({
 List<Message> messages, bool isStreaming, bool isLoadingHistory, Failure? error, List<String> quickReplies, String? stage, String? nextCursor, bool isLoadingOlder
});


@override $FailureCopyWith<$Res>? get error;

}
/// @nodoc
class __$ChatStateCopyWithImpl<$Res>
    implements _$ChatStateCopyWith<$Res> {
  __$ChatStateCopyWithImpl(this._self, this._then);

  final _ChatState _self;
  final $Res Function(_ChatState) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messages = null,Object? isStreaming = null,Object? isLoadingHistory = null,Object? error = freezed,Object? quickReplies = null,Object? stage = freezed,Object? nextCursor = freezed,Object? isLoadingOlder = null,}) {
  return _then(_ChatState(
messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,isStreaming: null == isStreaming ? _self.isStreaming : isStreaming // ignore: cast_nullable_to_non_nullable
as bool,isLoadingHistory: null == isLoadingHistory ? _self.isLoadingHistory : isLoadingHistory // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as Failure?,quickReplies: null == quickReplies ? _self.quickReplies : quickReplies // ignore: cast_nullable_to_non_nullable
as List<String>,stage: freezed == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as String?,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,isLoadingOlder: null == isLoadingOlder ? _self.isLoadingOlder : isLoadingOlder // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
