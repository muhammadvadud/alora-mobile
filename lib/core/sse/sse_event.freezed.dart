// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sse_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SseEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SseEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SseEvent()';
}


}

/// @nodoc
class $SseEventCopyWith<$Res>  {
$SseEventCopyWith(SseEvent _, $Res Function(SseEvent) __);
}


/// Adds pattern-matching-related methods to [SseEvent].
extension SseEventPatterns on SseEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _SseEventStart value)?  start,TResult Function( _SseEventThinking value)?  thinking,TResult Function( _SseEventContent value)?  content,TResult Function( _SseEventToolCall value)?  toolCall,TResult Function( _SseEventToolArgs value)?  toolArgs,TResult Function( _SseEventToolResult value)?  toolResult,TResult Function( _SseEventDone value)?  done,TResult Function( _SseEventError value)?  error,TResult Function( _SseEventUnknown value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SseEventStart() when start != null:
return start(_that);case _SseEventThinking() when thinking != null:
return thinking(_that);case _SseEventContent() when content != null:
return content(_that);case _SseEventToolCall() when toolCall != null:
return toolCall(_that);case _SseEventToolArgs() when toolArgs != null:
return toolArgs(_that);case _SseEventToolResult() when toolResult != null:
return toolResult(_that);case _SseEventDone() when done != null:
return done(_that);case _SseEventError() when error != null:
return error(_that);case _SseEventUnknown() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _SseEventStart value)  start,required TResult Function( _SseEventThinking value)  thinking,required TResult Function( _SseEventContent value)  content,required TResult Function( _SseEventToolCall value)  toolCall,required TResult Function( _SseEventToolArgs value)  toolArgs,required TResult Function( _SseEventToolResult value)  toolResult,required TResult Function( _SseEventDone value)  done,required TResult Function( _SseEventError value)  error,required TResult Function( _SseEventUnknown value)  unknown,}){
final _that = this;
switch (_that) {
case _SseEventStart():
return start(_that);case _SseEventThinking():
return thinking(_that);case _SseEventContent():
return content(_that);case _SseEventToolCall():
return toolCall(_that);case _SseEventToolArgs():
return toolArgs(_that);case _SseEventToolResult():
return toolResult(_that);case _SseEventDone():
return done(_that);case _SseEventError():
return error(_that);case _SseEventUnknown():
return unknown(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _SseEventStart value)?  start,TResult? Function( _SseEventThinking value)?  thinking,TResult? Function( _SseEventContent value)?  content,TResult? Function( _SseEventToolCall value)?  toolCall,TResult? Function( _SseEventToolArgs value)?  toolArgs,TResult? Function( _SseEventToolResult value)?  toolResult,TResult? Function( _SseEventDone value)?  done,TResult? Function( _SseEventError value)?  error,TResult? Function( _SseEventUnknown value)?  unknown,}){
final _that = this;
switch (_that) {
case _SseEventStart() when start != null:
return start(_that);case _SseEventThinking() when thinking != null:
return thinking(_that);case _SseEventContent() when content != null:
return content(_that);case _SseEventToolCall() when toolCall != null:
return toolCall(_that);case _SseEventToolArgs() when toolArgs != null:
return toolArgs(_that);case _SseEventToolResult() when toolResult != null:
return toolResult(_that);case _SseEventDone() when done != null:
return done(_that);case _SseEventError() when error != null:
return error(_that);case _SseEventUnknown() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  start,TResult Function()?  thinking,TResult Function( String content)?  content,TResult Function( String tool)?  toolCall,TResult Function( String tool,  String args)?  toolArgs,TResult Function( String tool,  String result)?  toolResult,TResult Function( Map<String, dynamic>? usage,  List? products)?  done,TResult Function( String detail)?  error,TResult Function()?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SseEventStart() when start != null:
return start();case _SseEventThinking() when thinking != null:
return thinking();case _SseEventContent() when content != null:
return content(_that.content);case _SseEventToolCall() when toolCall != null:
return toolCall(_that.tool);case _SseEventToolArgs() when toolArgs != null:
return toolArgs(_that.tool,_that.args);case _SseEventToolResult() when toolResult != null:
return toolResult(_that.tool,_that.result);case _SseEventDone() when done != null:
return done(_that.usage,_that.products);case _SseEventError() when error != null:
return error(_that.detail);case _SseEventUnknown() when unknown != null:
return unknown();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  start,required TResult Function()  thinking,required TResult Function( String content)  content,required TResult Function( String tool)  toolCall,required TResult Function( String tool,  String args)  toolArgs,required TResult Function( String tool,  String result)  toolResult,required TResult Function( Map<String, dynamic>? usage,  List? products)  done,required TResult Function( String detail)  error,required TResult Function()  unknown,}) {final _that = this;
switch (_that) {
case _SseEventStart():
return start();case _SseEventThinking():
return thinking();case _SseEventContent():
return content(_that.content);case _SseEventToolCall():
return toolCall(_that.tool);case _SseEventToolArgs():
return toolArgs(_that.tool,_that.args);case _SseEventToolResult():
return toolResult(_that.tool,_that.result);case _SseEventDone():
return done(_that.usage,_that.products);case _SseEventError():
return error(_that.detail);case _SseEventUnknown():
return unknown();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  start,TResult? Function()?  thinking,TResult? Function( String content)?  content,TResult? Function( String tool)?  toolCall,TResult? Function( String tool,  String args)?  toolArgs,TResult? Function( String tool,  String result)?  toolResult,TResult? Function( Map<String, dynamic>? usage,  List? products)?  done,TResult? Function( String detail)?  error,TResult? Function()?  unknown,}) {final _that = this;
switch (_that) {
case _SseEventStart() when start != null:
return start();case _SseEventThinking() when thinking != null:
return thinking();case _SseEventContent() when content != null:
return content(_that.content);case _SseEventToolCall() when toolCall != null:
return toolCall(_that.tool);case _SseEventToolArgs() when toolArgs != null:
return toolArgs(_that.tool,_that.args);case _SseEventToolResult() when toolResult != null:
return toolResult(_that.tool,_that.result);case _SseEventDone() when done != null:
return done(_that.usage,_that.products);case _SseEventError() when error != null:
return error(_that.detail);case _SseEventUnknown() when unknown != null:
return unknown();case _:
  return null;

}
}

}

/// @nodoc


class _SseEventStart implements SseEvent {
  const _SseEventStart();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SseEventStart);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SseEvent.start()';
}


}




/// @nodoc


class _SseEventThinking implements SseEvent {
  const _SseEventThinking();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SseEventThinking);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SseEvent.thinking()';
}


}




/// @nodoc


class _SseEventContent implements SseEvent {
  const _SseEventContent(this.content);
  

 final  String content;

/// Create a copy of SseEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SseEventContentCopyWith<_SseEventContent> get copyWith => __$SseEventContentCopyWithImpl<_SseEventContent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SseEventContent&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,content);

@override
String toString() {
  return 'SseEvent.content(content: $content)';
}


}

/// @nodoc
abstract mixin class _$SseEventContentCopyWith<$Res> implements $SseEventCopyWith<$Res> {
  factory _$SseEventContentCopyWith(_SseEventContent value, $Res Function(_SseEventContent) _then) = __$SseEventContentCopyWithImpl;
@useResult
$Res call({
 String content
});




}
/// @nodoc
class __$SseEventContentCopyWithImpl<$Res>
    implements _$SseEventContentCopyWith<$Res> {
  __$SseEventContentCopyWithImpl(this._self, this._then);

  final _SseEventContent _self;
  final $Res Function(_SseEventContent) _then;

/// Create a copy of SseEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? content = null,}) {
  return _then(_SseEventContent(
null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SseEventToolCall implements SseEvent {
  const _SseEventToolCall(this.tool);
  

 final  String tool;

/// Create a copy of SseEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SseEventToolCallCopyWith<_SseEventToolCall> get copyWith => __$SseEventToolCallCopyWithImpl<_SseEventToolCall>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SseEventToolCall&&(identical(other.tool, tool) || other.tool == tool));
}


@override
int get hashCode => Object.hash(runtimeType,tool);

@override
String toString() {
  return 'SseEvent.toolCall(tool: $tool)';
}


}

/// @nodoc
abstract mixin class _$SseEventToolCallCopyWith<$Res> implements $SseEventCopyWith<$Res> {
  factory _$SseEventToolCallCopyWith(_SseEventToolCall value, $Res Function(_SseEventToolCall) _then) = __$SseEventToolCallCopyWithImpl;
@useResult
$Res call({
 String tool
});




}
/// @nodoc
class __$SseEventToolCallCopyWithImpl<$Res>
    implements _$SseEventToolCallCopyWith<$Res> {
  __$SseEventToolCallCopyWithImpl(this._self, this._then);

  final _SseEventToolCall _self;
  final $Res Function(_SseEventToolCall) _then;

/// Create a copy of SseEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tool = null,}) {
  return _then(_SseEventToolCall(
null == tool ? _self.tool : tool // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SseEventToolArgs implements SseEvent {
  const _SseEventToolArgs(this.tool, this.args);
  

 final  String tool;
 final  String args;

/// Create a copy of SseEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SseEventToolArgsCopyWith<_SseEventToolArgs> get copyWith => __$SseEventToolArgsCopyWithImpl<_SseEventToolArgs>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SseEventToolArgs&&(identical(other.tool, tool) || other.tool == tool)&&(identical(other.args, args) || other.args == args));
}


@override
int get hashCode => Object.hash(runtimeType,tool,args);

@override
String toString() {
  return 'SseEvent.toolArgs(tool: $tool, args: $args)';
}


}

/// @nodoc
abstract mixin class _$SseEventToolArgsCopyWith<$Res> implements $SseEventCopyWith<$Res> {
  factory _$SseEventToolArgsCopyWith(_SseEventToolArgs value, $Res Function(_SseEventToolArgs) _then) = __$SseEventToolArgsCopyWithImpl;
@useResult
$Res call({
 String tool, String args
});




}
/// @nodoc
class __$SseEventToolArgsCopyWithImpl<$Res>
    implements _$SseEventToolArgsCopyWith<$Res> {
  __$SseEventToolArgsCopyWithImpl(this._self, this._then);

  final _SseEventToolArgs _self;
  final $Res Function(_SseEventToolArgs) _then;

/// Create a copy of SseEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tool = null,Object? args = null,}) {
  return _then(_SseEventToolArgs(
null == tool ? _self.tool : tool // ignore: cast_nullable_to_non_nullable
as String,null == args ? _self.args : args // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SseEventToolResult implements SseEvent {
  const _SseEventToolResult(this.tool, this.result);
  

 final  String tool;
 final  String result;

/// Create a copy of SseEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SseEventToolResultCopyWith<_SseEventToolResult> get copyWith => __$SseEventToolResultCopyWithImpl<_SseEventToolResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SseEventToolResult&&(identical(other.tool, tool) || other.tool == tool)&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode => Object.hash(runtimeType,tool,result);

@override
String toString() {
  return 'SseEvent.toolResult(tool: $tool, result: $result)';
}


}

/// @nodoc
abstract mixin class _$SseEventToolResultCopyWith<$Res> implements $SseEventCopyWith<$Res> {
  factory _$SseEventToolResultCopyWith(_SseEventToolResult value, $Res Function(_SseEventToolResult) _then) = __$SseEventToolResultCopyWithImpl;
@useResult
$Res call({
 String tool, String result
});




}
/// @nodoc
class __$SseEventToolResultCopyWithImpl<$Res>
    implements _$SseEventToolResultCopyWith<$Res> {
  __$SseEventToolResultCopyWithImpl(this._self, this._then);

  final _SseEventToolResult _self;
  final $Res Function(_SseEventToolResult) _then;

/// Create a copy of SseEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tool = null,Object? result = null,}) {
  return _then(_SseEventToolResult(
null == tool ? _self.tool : tool // ignore: cast_nullable_to_non_nullable
as String,null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SseEventDone implements SseEvent {
  const _SseEventDone({this.usage, this.products});
  

 final  Map<String, dynamic>? usage;
 final  List? products;

/// Create a copy of SseEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SseEventDoneCopyWith<_SseEventDone> get copyWith => __$SseEventDoneCopyWithImpl<_SseEventDone>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SseEventDone&&const DeepCollectionEquality().equals(other.usage, usage)&&const DeepCollectionEquality().equals(other.products, products));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(usage),const DeepCollectionEquality().hash(products));

@override
String toString() {
  return 'SseEvent.done(usage: $usage, products: $products)';
}


}

/// @nodoc
abstract mixin class _$SseEventDoneCopyWith<$Res> implements $SseEventCopyWith<$Res> {
  factory _$SseEventDoneCopyWith(_SseEventDone value, $Res Function(_SseEventDone) _then) = __$SseEventDoneCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic>? usage, List? products
});




}
/// @nodoc
class __$SseEventDoneCopyWithImpl<$Res>
    implements _$SseEventDoneCopyWith<$Res> {
  __$SseEventDoneCopyWithImpl(this._self, this._then);

  final _SseEventDone _self;
  final $Res Function(_SseEventDone) _then;

/// Create a copy of SseEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? usage = freezed,Object? products = freezed,}) {
  return _then(_SseEventDone(
usage: freezed == usage ? _self.usage : usage // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,products: freezed == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List?,
  ));
}


}

/// @nodoc


class _SseEventError implements SseEvent {
  const _SseEventError(this.detail);
  

 final  String detail;

/// Create a copy of SseEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SseEventErrorCopyWith<_SseEventError> get copyWith => __$SseEventErrorCopyWithImpl<_SseEventError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SseEventError&&(identical(other.detail, detail) || other.detail == detail));
}


@override
int get hashCode => Object.hash(runtimeType,detail);

@override
String toString() {
  return 'SseEvent.error(detail: $detail)';
}


}

/// @nodoc
abstract mixin class _$SseEventErrorCopyWith<$Res> implements $SseEventCopyWith<$Res> {
  factory _$SseEventErrorCopyWith(_SseEventError value, $Res Function(_SseEventError) _then) = __$SseEventErrorCopyWithImpl;
@useResult
$Res call({
 String detail
});




}
/// @nodoc
class __$SseEventErrorCopyWithImpl<$Res>
    implements _$SseEventErrorCopyWith<$Res> {
  __$SseEventErrorCopyWithImpl(this._self, this._then);

  final _SseEventError _self;
  final $Res Function(_SseEventError) _then;

/// Create a copy of SseEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? detail = null,}) {
  return _then(_SseEventError(
null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _SseEventUnknown implements SseEvent {
  const _SseEventUnknown();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SseEventUnknown);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SseEvent.unknown()';
}


}




// dart format on
