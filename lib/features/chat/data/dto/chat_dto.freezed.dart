// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MessageDto {

 String get id; String get role; String get content;@JsonKey(name: 'tool_calls') List<Map<String, dynamic>>? get toolCalls;@JsonKey(name: 'tool_result') Map<String, dynamic>? get toolResult;@JsonKey(name: 'audio_url') String? get audioUrl;@JsonKey(name: 'created_at') DateTime get createdAt;
/// Create a copy of MessageDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageDtoCopyWith<MessageDto> get copyWith => _$MessageDtoCopyWithImpl<MessageDto>(this as MessageDto, _$identity);

  /// Serializes this MessageDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageDto&&(identical(other.id, id) || other.id == id)&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other.toolCalls, toolCalls)&&const DeepCollectionEquality().equals(other.toolResult, toolResult)&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,role,content,const DeepCollectionEquality().hash(toolCalls),const DeepCollectionEquality().hash(toolResult),audioUrl,createdAt);

@override
String toString() {
  return 'MessageDto(id: $id, role: $role, content: $content, toolCalls: $toolCalls, toolResult: $toolResult, audioUrl: $audioUrl, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $MessageDtoCopyWith<$Res>  {
  factory $MessageDtoCopyWith(MessageDto value, $Res Function(MessageDto) _then) = _$MessageDtoCopyWithImpl;
@useResult
$Res call({
 String id, String role, String content,@JsonKey(name: 'tool_calls') List<Map<String, dynamic>>? toolCalls,@JsonKey(name: 'tool_result') Map<String, dynamic>? toolResult,@JsonKey(name: 'audio_url') String? audioUrl,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class _$MessageDtoCopyWithImpl<$Res>
    implements $MessageDtoCopyWith<$Res> {
  _$MessageDtoCopyWithImpl(this._self, this._then);

  final MessageDto _self;
  final $Res Function(MessageDto) _then;

/// Create a copy of MessageDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? role = null,Object? content = null,Object? toolCalls = freezed,Object? toolResult = freezed,Object? audioUrl = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,toolCalls: freezed == toolCalls ? _self.toolCalls : toolCalls // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>?,toolResult: freezed == toolResult ? _self.toolResult : toolResult // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,audioUrl: freezed == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [MessageDto].
extension MessageDtoPatterns on MessageDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageDto value)  $default,){
final _that = this;
switch (_that) {
case _MessageDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageDto value)?  $default,){
final _that = this;
switch (_that) {
case _MessageDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String role,  String content, @JsonKey(name: 'tool_calls')  List<Map<String, dynamic>>? toolCalls, @JsonKey(name: 'tool_result')  Map<String, dynamic>? toolResult, @JsonKey(name: 'audio_url')  String? audioUrl, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageDto() when $default != null:
return $default(_that.id,_that.role,_that.content,_that.toolCalls,_that.toolResult,_that.audioUrl,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String role,  String content, @JsonKey(name: 'tool_calls')  List<Map<String, dynamic>>? toolCalls, @JsonKey(name: 'tool_result')  Map<String, dynamic>? toolResult, @JsonKey(name: 'audio_url')  String? audioUrl, @JsonKey(name: 'created_at')  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _MessageDto():
return $default(_that.id,_that.role,_that.content,_that.toolCalls,_that.toolResult,_that.audioUrl,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String role,  String content, @JsonKey(name: 'tool_calls')  List<Map<String, dynamic>>? toolCalls, @JsonKey(name: 'tool_result')  Map<String, dynamic>? toolResult, @JsonKey(name: 'audio_url')  String? audioUrl, @JsonKey(name: 'created_at')  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _MessageDto() when $default != null:
return $default(_that.id,_that.role,_that.content,_that.toolCalls,_that.toolResult,_that.audioUrl,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessageDto implements MessageDto {
  const _MessageDto({required this.id, required this.role, required this.content, @JsonKey(name: 'tool_calls') this.toolCalls, @JsonKey(name: 'tool_result') this.toolResult, @JsonKey(name: 'audio_url') this.audioUrl, @JsonKey(name: 'created_at') required this.createdAt});
  factory _MessageDto.fromJson(Map<String, dynamic> json) => _$MessageDtoFromJson(json);

@override final  String id;
@override final  String role;
@override final  String content;
@override@JsonKey(name: 'tool_calls') final  List<Map<String, dynamic>>? toolCalls;
@override@JsonKey(name: 'tool_result') final  Map<String, dynamic>? toolResult;
@override@JsonKey(name: 'audio_url') final  String? audioUrl;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;

/// Create a copy of MessageDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageDtoCopyWith<_MessageDto> get copyWith => __$MessageDtoCopyWithImpl<_MessageDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageDto&&(identical(other.id, id) || other.id == id)&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content)&&const DeepCollectionEquality().equals(other.toolCalls, toolCalls)&&const DeepCollectionEquality().equals(other.toolResult, toolResult)&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,role,content,const DeepCollectionEquality().hash(toolCalls),const DeepCollectionEquality().hash(toolResult),audioUrl,createdAt);

@override
String toString() {
  return 'MessageDto(id: $id, role: $role, content: $content, toolCalls: $toolCalls, toolResult: $toolResult, audioUrl: $audioUrl, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$MessageDtoCopyWith<$Res> implements $MessageDtoCopyWith<$Res> {
  factory _$MessageDtoCopyWith(_MessageDto value, $Res Function(_MessageDto) _then) = __$MessageDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String role, String content,@JsonKey(name: 'tool_calls') List<Map<String, dynamic>>? toolCalls,@JsonKey(name: 'tool_result') Map<String, dynamic>? toolResult,@JsonKey(name: 'audio_url') String? audioUrl,@JsonKey(name: 'created_at') DateTime createdAt
});




}
/// @nodoc
class __$MessageDtoCopyWithImpl<$Res>
    implements _$MessageDtoCopyWith<$Res> {
  __$MessageDtoCopyWithImpl(this._self, this._then);

  final _MessageDto _self;
  final $Res Function(_MessageDto) _then;

/// Create a copy of MessageDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? role = null,Object? content = null,Object? toolCalls = freezed,Object? toolResult = freezed,Object? audioUrl = freezed,Object? createdAt = null,}) {
  return _then(_MessageDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,toolCalls: freezed == toolCalls ? _self.toolCalls : toolCalls // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>?,toolResult: freezed == toolResult ? _self.toolResult : toolResult // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,audioUrl: freezed == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$SendMessageContextDto {

@JsonKey(name: 'customer_mode') bool get customerMode; String? get stage;
/// Create a copy of SendMessageContextDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendMessageContextDtoCopyWith<SendMessageContextDto> get copyWith => _$SendMessageContextDtoCopyWithImpl<SendMessageContextDto>(this as SendMessageContextDto, _$identity);

  /// Serializes this SendMessageContextDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendMessageContextDto&&(identical(other.customerMode, customerMode) || other.customerMode == customerMode)&&(identical(other.stage, stage) || other.stage == stage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerMode,stage);

@override
String toString() {
  return 'SendMessageContextDto(customerMode: $customerMode, stage: $stage)';
}


}

/// @nodoc
abstract mixin class $SendMessageContextDtoCopyWith<$Res>  {
  factory $SendMessageContextDtoCopyWith(SendMessageContextDto value, $Res Function(SendMessageContextDto) _then) = _$SendMessageContextDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'customer_mode') bool customerMode, String? stage
});




}
/// @nodoc
class _$SendMessageContextDtoCopyWithImpl<$Res>
    implements $SendMessageContextDtoCopyWith<$Res> {
  _$SendMessageContextDtoCopyWithImpl(this._self, this._then);

  final SendMessageContextDto _self;
  final $Res Function(SendMessageContextDto) _then;

/// Create a copy of SendMessageContextDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customerMode = null,Object? stage = freezed,}) {
  return _then(_self.copyWith(
customerMode: null == customerMode ? _self.customerMode : customerMode // ignore: cast_nullable_to_non_nullable
as bool,stage: freezed == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SendMessageContextDto].
extension SendMessageContextDtoPatterns on SendMessageContextDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SendMessageContextDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendMessageContextDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SendMessageContextDto value)  $default,){
final _that = this;
switch (_that) {
case _SendMessageContextDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SendMessageContextDto value)?  $default,){
final _that = this;
switch (_that) {
case _SendMessageContextDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'customer_mode')  bool customerMode,  String? stage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendMessageContextDto() when $default != null:
return $default(_that.customerMode,_that.stage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'customer_mode')  bool customerMode,  String? stage)  $default,) {final _that = this;
switch (_that) {
case _SendMessageContextDto():
return $default(_that.customerMode,_that.stage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'customer_mode')  bool customerMode,  String? stage)?  $default,) {final _that = this;
switch (_that) {
case _SendMessageContextDto() when $default != null:
return $default(_that.customerMode,_that.stage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SendMessageContextDto implements SendMessageContextDto {
  const _SendMessageContextDto({@JsonKey(name: 'customer_mode') required this.customerMode, this.stage});
  factory _SendMessageContextDto.fromJson(Map<String, dynamic> json) => _$SendMessageContextDtoFromJson(json);

@override@JsonKey(name: 'customer_mode') final  bool customerMode;
@override final  String? stage;

/// Create a copy of SendMessageContextDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendMessageContextDtoCopyWith<_SendMessageContextDto> get copyWith => __$SendMessageContextDtoCopyWithImpl<_SendMessageContextDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SendMessageContextDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendMessageContextDto&&(identical(other.customerMode, customerMode) || other.customerMode == customerMode)&&(identical(other.stage, stage) || other.stage == stage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerMode,stage);

@override
String toString() {
  return 'SendMessageContextDto(customerMode: $customerMode, stage: $stage)';
}


}

/// @nodoc
abstract mixin class _$SendMessageContextDtoCopyWith<$Res> implements $SendMessageContextDtoCopyWith<$Res> {
  factory _$SendMessageContextDtoCopyWith(_SendMessageContextDto value, $Res Function(_SendMessageContextDto) _then) = __$SendMessageContextDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'customer_mode') bool customerMode, String? stage
});




}
/// @nodoc
class __$SendMessageContextDtoCopyWithImpl<$Res>
    implements _$SendMessageContextDtoCopyWith<$Res> {
  __$SendMessageContextDtoCopyWithImpl(this._self, this._then);

  final _SendMessageContextDto _self;
  final $Res Function(_SendMessageContextDto) _then;

/// Create a copy of SendMessageContextDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customerMode = null,Object? stage = freezed,}) {
  return _then(_SendMessageContextDto(
customerMode: null == customerMode ? _self.customerMode : customerMode // ignore: cast_nullable_to_non_nullable
as bool,stage: freezed == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SendMessageRequestDto {

 String get content; String get locale; SendMessageContextDto get context;
/// Create a copy of SendMessageRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendMessageRequestDtoCopyWith<SendMessageRequestDto> get copyWith => _$SendMessageRequestDtoCopyWithImpl<SendMessageRequestDto>(this as SendMessageRequestDto, _$identity);

  /// Serializes this SendMessageRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendMessageRequestDto&&(identical(other.content, content) || other.content == content)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.context, context) || other.context == context));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,content,locale,context);

@override
String toString() {
  return 'SendMessageRequestDto(content: $content, locale: $locale, context: $context)';
}


}

/// @nodoc
abstract mixin class $SendMessageRequestDtoCopyWith<$Res>  {
  factory $SendMessageRequestDtoCopyWith(SendMessageRequestDto value, $Res Function(SendMessageRequestDto) _then) = _$SendMessageRequestDtoCopyWithImpl;
@useResult
$Res call({
 String content, String locale, SendMessageContextDto context
});


$SendMessageContextDtoCopyWith<$Res> get context;

}
/// @nodoc
class _$SendMessageRequestDtoCopyWithImpl<$Res>
    implements $SendMessageRequestDtoCopyWith<$Res> {
  _$SendMessageRequestDtoCopyWithImpl(this._self, this._then);

  final SendMessageRequestDto _self;
  final $Res Function(SendMessageRequestDto) _then;

/// Create a copy of SendMessageRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? content = null,Object? locale = null,Object? context = null,}) {
  return _then(_self.copyWith(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,context: null == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as SendMessageContextDto,
  ));
}
/// Create a copy of SendMessageRequestDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SendMessageContextDtoCopyWith<$Res> get context {
  
  return $SendMessageContextDtoCopyWith<$Res>(_self.context, (value) {
    return _then(_self.copyWith(context: value));
  });
}
}


/// Adds pattern-matching-related methods to [SendMessageRequestDto].
extension SendMessageRequestDtoPatterns on SendMessageRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SendMessageRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendMessageRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SendMessageRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _SendMessageRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SendMessageRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _SendMessageRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String content,  String locale,  SendMessageContextDto context)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendMessageRequestDto() when $default != null:
return $default(_that.content,_that.locale,_that.context);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String content,  String locale,  SendMessageContextDto context)  $default,) {final _that = this;
switch (_that) {
case _SendMessageRequestDto():
return $default(_that.content,_that.locale,_that.context);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String content,  String locale,  SendMessageContextDto context)?  $default,) {final _that = this;
switch (_that) {
case _SendMessageRequestDto() when $default != null:
return $default(_that.content,_that.locale,_that.context);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SendMessageRequestDto implements SendMessageRequestDto {
  const _SendMessageRequestDto({required this.content, required this.locale, required this.context});
  factory _SendMessageRequestDto.fromJson(Map<String, dynamic> json) => _$SendMessageRequestDtoFromJson(json);

@override final  String content;
@override final  String locale;
@override final  SendMessageContextDto context;

/// Create a copy of SendMessageRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendMessageRequestDtoCopyWith<_SendMessageRequestDto> get copyWith => __$SendMessageRequestDtoCopyWithImpl<_SendMessageRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SendMessageRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendMessageRequestDto&&(identical(other.content, content) || other.content == content)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.context, context) || other.context == context));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,content,locale,context);

@override
String toString() {
  return 'SendMessageRequestDto(content: $content, locale: $locale, context: $context)';
}


}

/// @nodoc
abstract mixin class _$SendMessageRequestDtoCopyWith<$Res> implements $SendMessageRequestDtoCopyWith<$Res> {
  factory _$SendMessageRequestDtoCopyWith(_SendMessageRequestDto value, $Res Function(_SendMessageRequestDto) _then) = __$SendMessageRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 String content, String locale, SendMessageContextDto context
});


@override $SendMessageContextDtoCopyWith<$Res> get context;

}
/// @nodoc
class __$SendMessageRequestDtoCopyWithImpl<$Res>
    implements _$SendMessageRequestDtoCopyWith<$Res> {
  __$SendMessageRequestDtoCopyWithImpl(this._self, this._then);

  final _SendMessageRequestDto _self;
  final $Res Function(_SendMessageRequestDto) _then;

/// Create a copy of SendMessageRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? content = null,Object? locale = null,Object? context = null,}) {
  return _then(_SendMessageRequestDto(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,context: null == context ? _self.context : context // ignore: cast_nullable_to_non_nullable
as SendMessageContextDto,
  ));
}

/// Create a copy of SendMessageRequestDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SendMessageContextDtoCopyWith<$Res> get context {
  
  return $SendMessageContextDtoCopyWith<$Res>(_self.context, (value) {
    return _then(_self.copyWith(context: value));
  });
}
}


/// @nodoc
mixin _$UsageDto {

@JsonKey(name: 'prompt_tokens') int get promptTokens;@JsonKey(name: 'completion_tokens') int get completionTokens;@JsonKey(name: 'total_tokens') int get totalTokens;@JsonKey(name: 'cost_uzs') String get costUzs;
/// Create a copy of UsageDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsageDtoCopyWith<UsageDto> get copyWith => _$UsageDtoCopyWithImpl<UsageDto>(this as UsageDto, _$identity);

  /// Serializes this UsageDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsageDto&&(identical(other.promptTokens, promptTokens) || other.promptTokens == promptTokens)&&(identical(other.completionTokens, completionTokens) || other.completionTokens == completionTokens)&&(identical(other.totalTokens, totalTokens) || other.totalTokens == totalTokens)&&(identical(other.costUzs, costUzs) || other.costUzs == costUzs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,promptTokens,completionTokens,totalTokens,costUzs);

@override
String toString() {
  return 'UsageDto(promptTokens: $promptTokens, completionTokens: $completionTokens, totalTokens: $totalTokens, costUzs: $costUzs)';
}


}

/// @nodoc
abstract mixin class $UsageDtoCopyWith<$Res>  {
  factory $UsageDtoCopyWith(UsageDto value, $Res Function(UsageDto) _then) = _$UsageDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'prompt_tokens') int promptTokens,@JsonKey(name: 'completion_tokens') int completionTokens,@JsonKey(name: 'total_tokens') int totalTokens,@JsonKey(name: 'cost_uzs') String costUzs
});




}
/// @nodoc
class _$UsageDtoCopyWithImpl<$Res>
    implements $UsageDtoCopyWith<$Res> {
  _$UsageDtoCopyWithImpl(this._self, this._then);

  final UsageDto _self;
  final $Res Function(UsageDto) _then;

/// Create a copy of UsageDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? promptTokens = null,Object? completionTokens = null,Object? totalTokens = null,Object? costUzs = null,}) {
  return _then(_self.copyWith(
promptTokens: null == promptTokens ? _self.promptTokens : promptTokens // ignore: cast_nullable_to_non_nullable
as int,completionTokens: null == completionTokens ? _self.completionTokens : completionTokens // ignore: cast_nullable_to_non_nullable
as int,totalTokens: null == totalTokens ? _self.totalTokens : totalTokens // ignore: cast_nullable_to_non_nullable
as int,costUzs: null == costUzs ? _self.costUzs : costUzs // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UsageDto].
extension UsageDtoPatterns on UsageDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UsageDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UsageDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UsageDto value)  $default,){
final _that = this;
switch (_that) {
case _UsageDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UsageDto value)?  $default,){
final _that = this;
switch (_that) {
case _UsageDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'prompt_tokens')  int promptTokens, @JsonKey(name: 'completion_tokens')  int completionTokens, @JsonKey(name: 'total_tokens')  int totalTokens, @JsonKey(name: 'cost_uzs')  String costUzs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UsageDto() when $default != null:
return $default(_that.promptTokens,_that.completionTokens,_that.totalTokens,_that.costUzs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'prompt_tokens')  int promptTokens, @JsonKey(name: 'completion_tokens')  int completionTokens, @JsonKey(name: 'total_tokens')  int totalTokens, @JsonKey(name: 'cost_uzs')  String costUzs)  $default,) {final _that = this;
switch (_that) {
case _UsageDto():
return $default(_that.promptTokens,_that.completionTokens,_that.totalTokens,_that.costUzs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'prompt_tokens')  int promptTokens, @JsonKey(name: 'completion_tokens')  int completionTokens, @JsonKey(name: 'total_tokens')  int totalTokens, @JsonKey(name: 'cost_uzs')  String costUzs)?  $default,) {final _that = this;
switch (_that) {
case _UsageDto() when $default != null:
return $default(_that.promptTokens,_that.completionTokens,_that.totalTokens,_that.costUzs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UsageDto implements UsageDto {
  const _UsageDto({@JsonKey(name: 'prompt_tokens') required this.promptTokens, @JsonKey(name: 'completion_tokens') required this.completionTokens, @JsonKey(name: 'total_tokens') required this.totalTokens, @JsonKey(name: 'cost_uzs') required this.costUzs});
  factory _UsageDto.fromJson(Map<String, dynamic> json) => _$UsageDtoFromJson(json);

@override@JsonKey(name: 'prompt_tokens') final  int promptTokens;
@override@JsonKey(name: 'completion_tokens') final  int completionTokens;
@override@JsonKey(name: 'total_tokens') final  int totalTokens;
@override@JsonKey(name: 'cost_uzs') final  String costUzs;

/// Create a copy of UsageDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsageDtoCopyWith<_UsageDto> get copyWith => __$UsageDtoCopyWithImpl<_UsageDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UsageDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsageDto&&(identical(other.promptTokens, promptTokens) || other.promptTokens == promptTokens)&&(identical(other.completionTokens, completionTokens) || other.completionTokens == completionTokens)&&(identical(other.totalTokens, totalTokens) || other.totalTokens == totalTokens)&&(identical(other.costUzs, costUzs) || other.costUzs == costUzs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,promptTokens,completionTokens,totalTokens,costUzs);

@override
String toString() {
  return 'UsageDto(promptTokens: $promptTokens, completionTokens: $completionTokens, totalTokens: $totalTokens, costUzs: $costUzs)';
}


}

/// @nodoc
abstract mixin class _$UsageDtoCopyWith<$Res> implements $UsageDtoCopyWith<$Res> {
  factory _$UsageDtoCopyWith(_UsageDto value, $Res Function(_UsageDto) _then) = __$UsageDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'prompt_tokens') int promptTokens,@JsonKey(name: 'completion_tokens') int completionTokens,@JsonKey(name: 'total_tokens') int totalTokens,@JsonKey(name: 'cost_uzs') String costUzs
});




}
/// @nodoc
class __$UsageDtoCopyWithImpl<$Res>
    implements _$UsageDtoCopyWith<$Res> {
  __$UsageDtoCopyWithImpl(this._self, this._then);

  final _UsageDto _self;
  final $Res Function(_UsageDto) _then;

/// Create a copy of UsageDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? promptTokens = null,Object? completionTokens = null,Object? totalTokens = null,Object? costUzs = null,}) {
  return _then(_UsageDto(
promptTokens: null == promptTokens ? _self.promptTokens : promptTokens // ignore: cast_nullable_to_non_nullable
as int,completionTokens: null == completionTokens ? _self.completionTokens : completionTokens // ignore: cast_nullable_to_non_nullable
as int,totalTokens: null == totalTokens ? _self.totalTokens : totalTokens // ignore: cast_nullable_to_non_nullable
as int,costUzs: null == costUzs ? _self.costUzs : costUzs // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
