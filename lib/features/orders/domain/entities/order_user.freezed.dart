// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderUser {

 String get id; String? get fullName; String? get phone;
/// Create a copy of OrderUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderUserCopyWith<OrderUser> get copyWith => _$OrderUserCopyWithImpl<OrderUser>(this as OrderUser, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderUser&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phone, phone) || other.phone == phone));
}


@override
int get hashCode => Object.hash(runtimeType,id,fullName,phone);

@override
String toString() {
  return 'OrderUser(id: $id, fullName: $fullName, phone: $phone)';
}


}

/// @nodoc
abstract mixin class $OrderUserCopyWith<$Res>  {
  factory $OrderUserCopyWith(OrderUser value, $Res Function(OrderUser) _then) = _$OrderUserCopyWithImpl;
@useResult
$Res call({
 String id, String? fullName, String? phone
});




}
/// @nodoc
class _$OrderUserCopyWithImpl<$Res>
    implements $OrderUserCopyWith<$Res> {
  _$OrderUserCopyWithImpl(this._self, this._then);

  final OrderUser _self;
  final $Res Function(OrderUser) _then;

/// Create a copy of OrderUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullName = freezed,Object? phone = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderUser].
extension OrderUserPatterns on OrderUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderUser value)  $default,){
final _that = this;
switch (_that) {
case _OrderUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderUser value)?  $default,){
final _that = this;
switch (_that) {
case _OrderUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? fullName,  String? phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderUser() when $default != null:
return $default(_that.id,_that.fullName,_that.phone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? fullName,  String? phone)  $default,) {final _that = this;
switch (_that) {
case _OrderUser():
return $default(_that.id,_that.fullName,_that.phone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? fullName,  String? phone)?  $default,) {final _that = this;
switch (_that) {
case _OrderUser() when $default != null:
return $default(_that.id,_that.fullName,_that.phone);case _:
  return null;

}
}

}

/// @nodoc


class _OrderUser implements OrderUser {
  const _OrderUser({required this.id, this.fullName, this.phone});
  

@override final  String id;
@override final  String? fullName;
@override final  String? phone;

/// Create a copy of OrderUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderUserCopyWith<_OrderUser> get copyWith => __$OrderUserCopyWithImpl<_OrderUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderUser&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phone, phone) || other.phone == phone));
}


@override
int get hashCode => Object.hash(runtimeType,id,fullName,phone);

@override
String toString() {
  return 'OrderUser(id: $id, fullName: $fullName, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$OrderUserCopyWith<$Res> implements $OrderUserCopyWith<$Res> {
  factory _$OrderUserCopyWith(_OrderUser value, $Res Function(_OrderUser) _then) = __$OrderUserCopyWithImpl;
@override @useResult
$Res call({
 String id, String? fullName, String? phone
});




}
/// @nodoc
class __$OrderUserCopyWithImpl<$Res>
    implements _$OrderUserCopyWith<$Res> {
  __$OrderUserCopyWithImpl(this._self, this._then);

  final _OrderUser _self;
  final $Res Function(_OrderUser) _then;

/// Create a copy of OrderUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = freezed,Object? phone = freezed,}) {
  return _then(_OrderUser(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
