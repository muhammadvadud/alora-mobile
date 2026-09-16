// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offline_queue_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OfflineQueueItem {

 String get id; String get method; String get path; Map<String, dynamic>? get body; DateTime get createdAt; int get attempts;
/// Create a copy of OfflineQueueItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfflineQueueItemCopyWith<OfflineQueueItem> get copyWith => _$OfflineQueueItemCopyWithImpl<OfflineQueueItem>(this as OfflineQueueItem, _$identity);

  /// Serializes this OfflineQueueItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfflineQueueItem&&(identical(other.id, id) || other.id == id)&&(identical(other.method, method) || other.method == method)&&(identical(other.path, path) || other.path == path)&&const DeepCollectionEquality().equals(other.body, body)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.attempts, attempts) || other.attempts == attempts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,method,path,const DeepCollectionEquality().hash(body),createdAt,attempts);

@override
String toString() {
  return 'OfflineQueueItem(id: $id, method: $method, path: $path, body: $body, createdAt: $createdAt, attempts: $attempts)';
}


}

/// @nodoc
abstract mixin class $OfflineQueueItemCopyWith<$Res>  {
  factory $OfflineQueueItemCopyWith(OfflineQueueItem value, $Res Function(OfflineQueueItem) _then) = _$OfflineQueueItemCopyWithImpl;
@useResult
$Res call({
 String id, String method, String path, Map<String, dynamic>? body, DateTime createdAt, int attempts
});




}
/// @nodoc
class _$OfflineQueueItemCopyWithImpl<$Res>
    implements $OfflineQueueItemCopyWith<$Res> {
  _$OfflineQueueItemCopyWithImpl(this._self, this._then);

  final OfflineQueueItem _self;
  final $Res Function(OfflineQueueItem) _then;

/// Create a copy of OfflineQueueItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? method = null,Object? path = null,Object? body = freezed,Object? createdAt = null,Object? attempts = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OfflineQueueItem].
extension OfflineQueueItemPatterns on OfflineQueueItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OfflineQueueItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OfflineQueueItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OfflineQueueItem value)  $default,){
final _that = this;
switch (_that) {
case _OfflineQueueItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OfflineQueueItem value)?  $default,){
final _that = this;
switch (_that) {
case _OfflineQueueItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String method,  String path,  Map<String, dynamic>? body,  DateTime createdAt,  int attempts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfflineQueueItem() when $default != null:
return $default(_that.id,_that.method,_that.path,_that.body,_that.createdAt,_that.attempts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String method,  String path,  Map<String, dynamic>? body,  DateTime createdAt,  int attempts)  $default,) {final _that = this;
switch (_that) {
case _OfflineQueueItem():
return $default(_that.id,_that.method,_that.path,_that.body,_that.createdAt,_that.attempts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String method,  String path,  Map<String, dynamic>? body,  DateTime createdAt,  int attempts)?  $default,) {final _that = this;
switch (_that) {
case _OfflineQueueItem() when $default != null:
return $default(_that.id,_that.method,_that.path,_that.body,_that.createdAt,_that.attempts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OfflineQueueItem implements OfflineQueueItem {
  const _OfflineQueueItem({required this.id, required this.method, required this.path, required this.body, required this.createdAt, this.attempts = 0});
  factory _OfflineQueueItem.fromJson(Map<String, dynamic> json) => _$OfflineQueueItemFromJson(json);

@override final  String id;
@override final  String method;
@override final  String path;
@override final  Map<String, dynamic>? body;
@override final  DateTime createdAt;
@override@JsonKey() final  int attempts;

/// Create a copy of OfflineQueueItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfflineQueueItemCopyWith<_OfflineQueueItem> get copyWith => __$OfflineQueueItemCopyWithImpl<_OfflineQueueItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OfflineQueueItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfflineQueueItem&&(identical(other.id, id) || other.id == id)&&(identical(other.method, method) || other.method == method)&&(identical(other.path, path) || other.path == path)&&const DeepCollectionEquality().equals(other.body, body)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.attempts, attempts) || other.attempts == attempts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,method,path,const DeepCollectionEquality().hash(body),createdAt,attempts);

@override
String toString() {
  return 'OfflineQueueItem(id: $id, method: $method, path: $path, body: $body, createdAt: $createdAt, attempts: $attempts)';
}


}

/// @nodoc
abstract mixin class _$OfflineQueueItemCopyWith<$Res> implements $OfflineQueueItemCopyWith<$Res> {
  factory _$OfflineQueueItemCopyWith(_OfflineQueueItem value, $Res Function(_OfflineQueueItem) _then) = __$OfflineQueueItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String method, String path, Map<String, dynamic>? body, DateTime createdAt, int attempts
});




}
/// @nodoc
class __$OfflineQueueItemCopyWithImpl<$Res>
    implements _$OfflineQueueItemCopyWith<$Res> {
  __$OfflineQueueItemCopyWithImpl(this._self, this._then);

  final _OfflineQueueItem _self;
  final $Res Function(_OfflineQueueItem) _then;

/// Create a copy of OfflineQueueItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? method = null,Object? path = null,Object? body = freezed,Object? createdAt = null,Object? attempts = null,}) {
  return _then(_OfflineQueueItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,attempts: null == attempts ? _self.attempts : attempts // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
