// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prompt_version.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PromptVersion {

 String get id; int get version; String get content; String? get authorId; String? get authorName; bool get isCurrent; DateTime? get createdAt;
/// Create a copy of PromptVersion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PromptVersionCopyWith<PromptVersion> get copyWith => _$PromptVersionCopyWithImpl<PromptVersion>(this as PromptVersion, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PromptVersion&&(identical(other.id, id) || other.id == id)&&(identical(other.version, version) || other.version == version)&&(identical(other.content, content) || other.content == content)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.isCurrent, isCurrent) || other.isCurrent == isCurrent)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,version,content,authorId,authorName,isCurrent,createdAt);

@override
String toString() {
  return 'PromptVersion(id: $id, version: $version, content: $content, authorId: $authorId, authorName: $authorName, isCurrent: $isCurrent, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $PromptVersionCopyWith<$Res>  {
  factory $PromptVersionCopyWith(PromptVersion value, $Res Function(PromptVersion) _then) = _$PromptVersionCopyWithImpl;
@useResult
$Res call({
 String id, int version, String content, String? authorId, String? authorName, bool isCurrent, DateTime? createdAt
});




}
/// @nodoc
class _$PromptVersionCopyWithImpl<$Res>
    implements $PromptVersionCopyWith<$Res> {
  _$PromptVersionCopyWithImpl(this._self, this._then);

  final PromptVersion _self;
  final $Res Function(PromptVersion) _then;

/// Create a copy of PromptVersion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? version = null,Object? content = null,Object? authorId = freezed,Object? authorName = freezed,Object? isCurrent = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,authorId: freezed == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String?,authorName: freezed == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String?,isCurrent: null == isCurrent ? _self.isCurrent : isCurrent // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PromptVersion].
extension PromptVersionPatterns on PromptVersion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PromptVersion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PromptVersion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PromptVersion value)  $default,){
final _that = this;
switch (_that) {
case _PromptVersion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PromptVersion value)?  $default,){
final _that = this;
switch (_that) {
case _PromptVersion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int version,  String content,  String? authorId,  String? authorName,  bool isCurrent,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PromptVersion() when $default != null:
return $default(_that.id,_that.version,_that.content,_that.authorId,_that.authorName,_that.isCurrent,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int version,  String content,  String? authorId,  String? authorName,  bool isCurrent,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _PromptVersion():
return $default(_that.id,_that.version,_that.content,_that.authorId,_that.authorName,_that.isCurrent,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int version,  String content,  String? authorId,  String? authorName,  bool isCurrent,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PromptVersion() when $default != null:
return $default(_that.id,_that.version,_that.content,_that.authorId,_that.authorName,_that.isCurrent,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _PromptVersion implements PromptVersion {
  const _PromptVersion({required this.id, required this.version, required this.content, this.authorId, this.authorName, this.isCurrent = false, this.createdAt});
  

@override final  String id;
@override final  int version;
@override final  String content;
@override final  String? authorId;
@override final  String? authorName;
@override@JsonKey() final  bool isCurrent;
@override final  DateTime? createdAt;

/// Create a copy of PromptVersion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PromptVersionCopyWith<_PromptVersion> get copyWith => __$PromptVersionCopyWithImpl<_PromptVersion>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PromptVersion&&(identical(other.id, id) || other.id == id)&&(identical(other.version, version) || other.version == version)&&(identical(other.content, content) || other.content == content)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.isCurrent, isCurrent) || other.isCurrent == isCurrent)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,version,content,authorId,authorName,isCurrent,createdAt);

@override
String toString() {
  return 'PromptVersion(id: $id, version: $version, content: $content, authorId: $authorId, authorName: $authorName, isCurrent: $isCurrent, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PromptVersionCopyWith<$Res> implements $PromptVersionCopyWith<$Res> {
  factory _$PromptVersionCopyWith(_PromptVersion value, $Res Function(_PromptVersion) _then) = __$PromptVersionCopyWithImpl;
@override @useResult
$Res call({
 String id, int version, String content, String? authorId, String? authorName, bool isCurrent, DateTime? createdAt
});




}
/// @nodoc
class __$PromptVersionCopyWithImpl<$Res>
    implements _$PromptVersionCopyWith<$Res> {
  __$PromptVersionCopyWithImpl(this._self, this._then);

  final _PromptVersion _self;
  final $Res Function(_PromptVersion) _then;

/// Create a copy of PromptVersion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? version = null,Object? content = null,Object? authorId = freezed,Object? authorName = freezed,Object? isCurrent = null,Object? createdAt = freezed,}) {
  return _then(_PromptVersion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,authorId: freezed == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String?,authorName: freezed == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String?,isCurrent: null == isCurrent ? _self.isCurrent : isCurrent // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$PromptHistory {

 PromptVersion get current; List<PromptVersion> get history;
/// Create a copy of PromptHistory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PromptHistoryCopyWith<PromptHistory> get copyWith => _$PromptHistoryCopyWithImpl<PromptHistory>(this as PromptHistory, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PromptHistory&&(identical(other.current, current) || other.current == current)&&const DeepCollectionEquality().equals(other.history, history));
}


@override
int get hashCode => Object.hash(runtimeType,current,const DeepCollectionEquality().hash(history));

@override
String toString() {
  return 'PromptHistory(current: $current, history: $history)';
}


}

/// @nodoc
abstract mixin class $PromptHistoryCopyWith<$Res>  {
  factory $PromptHistoryCopyWith(PromptHistory value, $Res Function(PromptHistory) _then) = _$PromptHistoryCopyWithImpl;
@useResult
$Res call({
 PromptVersion current, List<PromptVersion> history
});


$PromptVersionCopyWith<$Res> get current;

}
/// @nodoc
class _$PromptHistoryCopyWithImpl<$Res>
    implements $PromptHistoryCopyWith<$Res> {
  _$PromptHistoryCopyWithImpl(this._self, this._then);

  final PromptHistory _self;
  final $Res Function(PromptHistory) _then;

/// Create a copy of PromptHistory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? current = null,Object? history = null,}) {
  return _then(_self.copyWith(
current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as PromptVersion,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<PromptVersion>,
  ));
}
/// Create a copy of PromptHistory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PromptVersionCopyWith<$Res> get current {
  
  return $PromptVersionCopyWith<$Res>(_self.current, (value) {
    return _then(_self.copyWith(current: value));
  });
}
}


/// Adds pattern-matching-related methods to [PromptHistory].
extension PromptHistoryPatterns on PromptHistory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PromptHistory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PromptHistory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PromptHistory value)  $default,){
final _that = this;
switch (_that) {
case _PromptHistory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PromptHistory value)?  $default,){
final _that = this;
switch (_that) {
case _PromptHistory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PromptVersion current,  List<PromptVersion> history)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PromptHistory() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PromptVersion current,  List<PromptVersion> history)  $default,) {final _that = this;
switch (_that) {
case _PromptHistory():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PromptVersion current,  List<PromptVersion> history)?  $default,) {final _that = this;
switch (_that) {
case _PromptHistory() when $default != null:
return $default(_that.current,_that.history);case _:
  return null;

}
}

}

/// @nodoc


class _PromptHistory implements PromptHistory {
  const _PromptHistory({required this.current, this.history = const []});
  

@override final  PromptVersion current;
@override@JsonKey() final  List<PromptVersion> history;

/// Create a copy of PromptHistory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PromptHistoryCopyWith<_PromptHistory> get copyWith => __$PromptHistoryCopyWithImpl<_PromptHistory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PromptHistory&&(identical(other.current, current) || other.current == current)&&const DeepCollectionEquality().equals(other.history, history));
}


@override
int get hashCode => Object.hash(runtimeType,current,const DeepCollectionEquality().hash(history));

@override
String toString() {
  return 'PromptHistory(current: $current, history: $history)';
}


}

/// @nodoc
abstract mixin class _$PromptHistoryCopyWith<$Res> implements $PromptHistoryCopyWith<$Res> {
  factory _$PromptHistoryCopyWith(_PromptHistory value, $Res Function(_PromptHistory) _then) = __$PromptHistoryCopyWithImpl;
@override @useResult
$Res call({
 PromptVersion current, List<PromptVersion> history
});


@override $PromptVersionCopyWith<$Res> get current;

}
/// @nodoc
class __$PromptHistoryCopyWithImpl<$Res>
    implements _$PromptHistoryCopyWith<$Res> {
  __$PromptHistoryCopyWithImpl(this._self, this._then);

  final _PromptHistory _self;
  final $Res Function(_PromptHistory) _then;

/// Create a copy of PromptHistory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? current = null,Object? history = null,}) {
  return _then(_PromptHistory(
current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as PromptVersion,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<PromptVersion>,
  ));
}

/// Create a copy of PromptHistory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PromptVersionCopyWith<$Res> get current {
  
  return $PromptVersionCopyWith<$Res>(_self.current, (value) {
    return _then(_self.copyWith(current: value));
  });
}
}

// dart format on
