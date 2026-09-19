// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prompt_version_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PromptVersionDto {

 String get id; int get version; String get content; String? get author;@JsonKey(name: 'author_name') String? get authorName;@JsonKey(name: 'is_current') bool get isCurrent;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of PromptVersionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PromptVersionDtoCopyWith<PromptVersionDto> get copyWith => _$PromptVersionDtoCopyWithImpl<PromptVersionDto>(this as PromptVersionDto, _$identity);

  /// Serializes this PromptVersionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PromptVersionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.version, version) || other.version == version)&&(identical(other.content, content) || other.content == content)&&(identical(other.author, author) || other.author == author)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.isCurrent, isCurrent) || other.isCurrent == isCurrent)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,version,content,author,authorName,isCurrent,createdAt);

@override
String toString() {
  return 'PromptVersionDto(id: $id, version: $version, content: $content, author: $author, authorName: $authorName, isCurrent: $isCurrent, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $PromptVersionDtoCopyWith<$Res>  {
  factory $PromptVersionDtoCopyWith(PromptVersionDto value, $Res Function(PromptVersionDto) _then) = _$PromptVersionDtoCopyWithImpl;
@useResult
$Res call({
 String id, int version, String content, String? author,@JsonKey(name: 'author_name') String? authorName,@JsonKey(name: 'is_current') bool isCurrent,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$PromptVersionDtoCopyWithImpl<$Res>
    implements $PromptVersionDtoCopyWith<$Res> {
  _$PromptVersionDtoCopyWithImpl(this._self, this._then);

  final PromptVersionDto _self;
  final $Res Function(PromptVersionDto) _then;

/// Create a copy of PromptVersionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? version = null,Object? content = null,Object? author = freezed,Object? authorName = freezed,Object? isCurrent = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,authorName: freezed == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String?,isCurrent: null == isCurrent ? _self.isCurrent : isCurrent // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PromptVersionDto].
extension PromptVersionDtoPatterns on PromptVersionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PromptVersionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PromptVersionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PromptVersionDto value)  $default,){
final _that = this;
switch (_that) {
case _PromptVersionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PromptVersionDto value)?  $default,){
final _that = this;
switch (_that) {
case _PromptVersionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int version,  String content,  String? author, @JsonKey(name: 'author_name')  String? authorName, @JsonKey(name: 'is_current')  bool isCurrent, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PromptVersionDto() when $default != null:
return $default(_that.id,_that.version,_that.content,_that.author,_that.authorName,_that.isCurrent,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int version,  String content,  String? author, @JsonKey(name: 'author_name')  String? authorName, @JsonKey(name: 'is_current')  bool isCurrent, @JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _PromptVersionDto():
return $default(_that.id,_that.version,_that.content,_that.author,_that.authorName,_that.isCurrent,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int version,  String content,  String? author, @JsonKey(name: 'author_name')  String? authorName, @JsonKey(name: 'is_current')  bool isCurrent, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PromptVersionDto() when $default != null:
return $default(_that.id,_that.version,_that.content,_that.author,_that.authorName,_that.isCurrent,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PromptVersionDto implements PromptVersionDto {
  const _PromptVersionDto({required this.id, required this.version, required this.content, this.author, @JsonKey(name: 'author_name') this.authorName, @JsonKey(name: 'is_current') this.isCurrent = false, @JsonKey(name: 'created_at') this.createdAt});
  factory _PromptVersionDto.fromJson(Map<String, dynamic> json) => _$PromptVersionDtoFromJson(json);

@override final  String id;
@override final  int version;
@override final  String content;
@override final  String? author;
@override@JsonKey(name: 'author_name') final  String? authorName;
@override@JsonKey(name: 'is_current') final  bool isCurrent;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of PromptVersionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PromptVersionDtoCopyWith<_PromptVersionDto> get copyWith => __$PromptVersionDtoCopyWithImpl<_PromptVersionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PromptVersionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PromptVersionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.version, version) || other.version == version)&&(identical(other.content, content) || other.content == content)&&(identical(other.author, author) || other.author == author)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.isCurrent, isCurrent) || other.isCurrent == isCurrent)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,version,content,author,authorName,isCurrent,createdAt);

@override
String toString() {
  return 'PromptVersionDto(id: $id, version: $version, content: $content, author: $author, authorName: $authorName, isCurrent: $isCurrent, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PromptVersionDtoCopyWith<$Res> implements $PromptVersionDtoCopyWith<$Res> {
  factory _$PromptVersionDtoCopyWith(_PromptVersionDto value, $Res Function(_PromptVersionDto) _then) = __$PromptVersionDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, int version, String content, String? author,@JsonKey(name: 'author_name') String? authorName,@JsonKey(name: 'is_current') bool isCurrent,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$PromptVersionDtoCopyWithImpl<$Res>
    implements _$PromptVersionDtoCopyWith<$Res> {
  __$PromptVersionDtoCopyWithImpl(this._self, this._then);

  final _PromptVersionDto _self;
  final $Res Function(_PromptVersionDto) _then;

/// Create a copy of PromptVersionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? version = null,Object? content = null,Object? author = freezed,Object? authorName = freezed,Object? isCurrent = null,Object? createdAt = freezed,}) {
  return _then(_PromptVersionDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String?,authorName: freezed == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String?,isCurrent: null == isCurrent ? _self.isCurrent : isCurrent // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$PromptHistoryDto {

 PromptVersionDto? get current; List<PromptVersionDto> get history;
/// Create a copy of PromptHistoryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PromptHistoryDtoCopyWith<PromptHistoryDto> get copyWith => _$PromptHistoryDtoCopyWithImpl<PromptHistoryDto>(this as PromptHistoryDto, _$identity);

  /// Serializes this PromptHistoryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PromptHistoryDto&&(identical(other.current, current) || other.current == current)&&const DeepCollectionEquality().equals(other.history, history));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,current,const DeepCollectionEquality().hash(history));

@override
String toString() {
  return 'PromptHistoryDto(current: $current, history: $history)';
}


}

/// @nodoc
abstract mixin class $PromptHistoryDtoCopyWith<$Res>  {
  factory $PromptHistoryDtoCopyWith(PromptHistoryDto value, $Res Function(PromptHistoryDto) _then) = _$PromptHistoryDtoCopyWithImpl;
@useResult
$Res call({
 PromptVersionDto? current, List<PromptVersionDto> history
});


$PromptVersionDtoCopyWith<$Res>? get current;

}
/// @nodoc
class _$PromptHistoryDtoCopyWithImpl<$Res>
    implements $PromptHistoryDtoCopyWith<$Res> {
  _$PromptHistoryDtoCopyWithImpl(this._self, this._then);

  final PromptHistoryDto _self;
  final $Res Function(PromptHistoryDto) _then;

/// Create a copy of PromptHistoryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? current = freezed,Object? history = null,}) {
  return _then(_self.copyWith(
current: freezed == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as PromptVersionDto?,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<PromptVersionDto>,
  ));
}
/// Create a copy of PromptHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PromptVersionDtoCopyWith<$Res>? get current {
    if (_self.current == null) {
    return null;
  }

  return $PromptVersionDtoCopyWith<$Res>(_self.current!, (value) {
    return _then(_self.copyWith(current: value));
  });
}
}


/// Adds pattern-matching-related methods to [PromptHistoryDto].
extension PromptHistoryDtoPatterns on PromptHistoryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PromptHistoryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PromptHistoryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PromptHistoryDto value)  $default,){
final _that = this;
switch (_that) {
case _PromptHistoryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PromptHistoryDto value)?  $default,){
final _that = this;
switch (_that) {
case _PromptHistoryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PromptVersionDto? current,  List<PromptVersionDto> history)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PromptHistoryDto() when $default != null:
return $default(_that.current,_that.history);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PromptVersionDto? current,  List<PromptVersionDto> history)  $default,) {final _that = this;
switch (_that) {
case _PromptHistoryDto():
return $default(_that.current,_that.history);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PromptVersionDto? current,  List<PromptVersionDto> history)?  $default,) {final _that = this;
switch (_that) {
case _PromptHistoryDto() when $default != null:
return $default(_that.current,_that.history);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PromptHistoryDto implements PromptHistoryDto {
  const _PromptHistoryDto({this.current, this.history = const []});
  factory _PromptHistoryDto.fromJson(Map<String, dynamic> json) => _$PromptHistoryDtoFromJson(json);

@override final  PromptVersionDto? current;
@override@JsonKey() final  List<PromptVersionDto> history;

/// Create a copy of PromptHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PromptHistoryDtoCopyWith<_PromptHistoryDto> get copyWith => __$PromptHistoryDtoCopyWithImpl<_PromptHistoryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PromptHistoryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PromptHistoryDto&&(identical(other.current, current) || other.current == current)&&const DeepCollectionEquality().equals(other.history, history));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,current,const DeepCollectionEquality().hash(history));

@override
String toString() {
  return 'PromptHistoryDto(current: $current, history: $history)';
}


}

/// @nodoc
abstract mixin class _$PromptHistoryDtoCopyWith<$Res> implements $PromptHistoryDtoCopyWith<$Res> {
  factory _$PromptHistoryDtoCopyWith(_PromptHistoryDto value, $Res Function(_PromptHistoryDto) _then) = __$PromptHistoryDtoCopyWithImpl;
@override @useResult
$Res call({
 PromptVersionDto? current, List<PromptVersionDto> history
});


@override $PromptVersionDtoCopyWith<$Res>? get current;

}
/// @nodoc
class __$PromptHistoryDtoCopyWithImpl<$Res>
    implements _$PromptHistoryDtoCopyWith<$Res> {
  __$PromptHistoryDtoCopyWithImpl(this._self, this._then);

  final _PromptHistoryDto _self;
  final $Res Function(_PromptHistoryDto) _then;

/// Create a copy of PromptHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? current = freezed,Object? history = null,}) {
  return _then(_PromptHistoryDto(
current: freezed == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as PromptVersionDto?,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<PromptVersionDto>,
  ));
}

/// Create a copy of PromptHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PromptVersionDtoCopyWith<$Res>? get current {
    if (_self.current == null) {
    return null;
  }

  return $PromptVersionDtoCopyWith<$Res>(_self.current!, (value) {
    return _then(_self.copyWith(current: value));
  });
}
}

// dart format on
