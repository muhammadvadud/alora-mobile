// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure()';
}


}

/// @nodoc
class $FailureCopyWith<$Res>  {
$FailureCopyWith(Failure _, $Res Function(Failure) __);
}


/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _NetworkFailure value)?  network,TResult Function( _ValidationFailure value)?  validation,TResult Function( _AuthFailure value)?  auth,TResult Function( _PermissionFailure value)?  permission,TResult Function( _NotFoundFailure value)?  notFound,TResult Function( _LimitFailure value)?  limit,TResult Function( _ServiceUnavailableFailure value)?  serviceUnavailable,TResult Function( _ServerFailure value)?  server,TResult Function( _UnknownFailure value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NetworkFailure() when network != null:
return network(_that);case _ValidationFailure() when validation != null:
return validation(_that);case _AuthFailure() when auth != null:
return auth(_that);case _PermissionFailure() when permission != null:
return permission(_that);case _NotFoundFailure() when notFound != null:
return notFound(_that);case _LimitFailure() when limit != null:
return limit(_that);case _ServiceUnavailableFailure() when serviceUnavailable != null:
return serviceUnavailable(_that);case _ServerFailure() when server != null:
return server(_that);case _UnknownFailure() when unknown != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _NetworkFailure value)  network,required TResult Function( _ValidationFailure value)  validation,required TResult Function( _AuthFailure value)  auth,required TResult Function( _PermissionFailure value)  permission,required TResult Function( _NotFoundFailure value)  notFound,required TResult Function( _LimitFailure value)  limit,required TResult Function( _ServiceUnavailableFailure value)  serviceUnavailable,required TResult Function( _ServerFailure value)  server,required TResult Function( _UnknownFailure value)  unknown,}){
final _that = this;
switch (_that) {
case _NetworkFailure():
return network(_that);case _ValidationFailure():
return validation(_that);case _AuthFailure():
return auth(_that);case _PermissionFailure():
return permission(_that);case _NotFoundFailure():
return notFound(_that);case _LimitFailure():
return limit(_that);case _ServiceUnavailableFailure():
return serviceUnavailable(_that);case _ServerFailure():
return server(_that);case _UnknownFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _NetworkFailure value)?  network,TResult? Function( _ValidationFailure value)?  validation,TResult? Function( _AuthFailure value)?  auth,TResult? Function( _PermissionFailure value)?  permission,TResult? Function( _NotFoundFailure value)?  notFound,TResult? Function( _LimitFailure value)?  limit,TResult? Function( _ServiceUnavailableFailure value)?  serviceUnavailable,TResult? Function( _ServerFailure value)?  server,TResult? Function( _UnknownFailure value)?  unknown,}){
final _that = this;
switch (_that) {
case _NetworkFailure() when network != null:
return network(_that);case _ValidationFailure() when validation != null:
return validation(_that);case _AuthFailure() when auth != null:
return auth(_that);case _PermissionFailure() when permission != null:
return permission(_that);case _NotFoundFailure() when notFound != null:
return notFound(_that);case _LimitFailure() when limit != null:
return limit(_that);case _ServiceUnavailableFailure() when serviceUnavailable != null:
return serviceUnavailable(_that);case _ServerFailure() when server != null:
return server(_that);case _UnknownFailure() when unknown != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  network,TResult Function( String detail,  Map<String, String> fieldErrors)?  validation,TResult Function()?  auth,TResult Function()?  permission,TResult Function()?  notFound,TResult Function( String detail)?  limit,TResult Function()?  serviceUnavailable,TResult Function()?  server,TResult Function( String detail)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NetworkFailure() when network != null:
return network();case _ValidationFailure() when validation != null:
return validation(_that.detail,_that.fieldErrors);case _AuthFailure() when auth != null:
return auth();case _PermissionFailure() when permission != null:
return permission();case _NotFoundFailure() when notFound != null:
return notFound();case _LimitFailure() when limit != null:
return limit(_that.detail);case _ServiceUnavailableFailure() when serviceUnavailable != null:
return serviceUnavailable();case _ServerFailure() when server != null:
return server();case _UnknownFailure() when unknown != null:
return unknown(_that.detail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  network,required TResult Function( String detail,  Map<String, String> fieldErrors)  validation,required TResult Function()  auth,required TResult Function()  permission,required TResult Function()  notFound,required TResult Function( String detail)  limit,required TResult Function()  serviceUnavailable,required TResult Function()  server,required TResult Function( String detail)  unknown,}) {final _that = this;
switch (_that) {
case _NetworkFailure():
return network();case _ValidationFailure():
return validation(_that.detail,_that.fieldErrors);case _AuthFailure():
return auth();case _PermissionFailure():
return permission();case _NotFoundFailure():
return notFound();case _LimitFailure():
return limit(_that.detail);case _ServiceUnavailableFailure():
return serviceUnavailable();case _ServerFailure():
return server();case _UnknownFailure():
return unknown(_that.detail);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  network,TResult? Function( String detail,  Map<String, String> fieldErrors)?  validation,TResult? Function()?  auth,TResult? Function()?  permission,TResult? Function()?  notFound,TResult? Function( String detail)?  limit,TResult? Function()?  serviceUnavailable,TResult? Function()?  server,TResult? Function( String detail)?  unknown,}) {final _that = this;
switch (_that) {
case _NetworkFailure() when network != null:
return network();case _ValidationFailure() when validation != null:
return validation(_that.detail,_that.fieldErrors);case _AuthFailure() when auth != null:
return auth();case _PermissionFailure() when permission != null:
return permission();case _NotFoundFailure() when notFound != null:
return notFound();case _LimitFailure() when limit != null:
return limit(_that.detail);case _ServiceUnavailableFailure() when serviceUnavailable != null:
return serviceUnavailable();case _ServerFailure() when server != null:
return server();case _UnknownFailure() when unknown != null:
return unknown(_that.detail);case _:
  return null;

}
}

}

/// @nodoc


class _NetworkFailure implements Failure {
  const _NetworkFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NetworkFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.network()';
}


}




/// @nodoc


class _ValidationFailure implements Failure {
  const _ValidationFailure(this.detail, this.fieldErrors);
  

 final  String detail;
 final  Map<String, String> fieldErrors;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ValidationFailureCopyWith<_ValidationFailure> get copyWith => __$ValidationFailureCopyWithImpl<_ValidationFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ValidationFailure&&(identical(other.detail, detail) || other.detail == detail)&&const DeepCollectionEquality().equals(other.fieldErrors, fieldErrors));
}


@override
int get hashCode => Object.hash(runtimeType,detail,const DeepCollectionEquality().hash(fieldErrors));

@override
String toString() {
  return 'Failure.validation(detail: $detail, fieldErrors: $fieldErrors)';
}


}

/// @nodoc
abstract mixin class _$ValidationFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$ValidationFailureCopyWith(_ValidationFailure value, $Res Function(_ValidationFailure) _then) = __$ValidationFailureCopyWithImpl;
@useResult
$Res call({
 String detail, Map<String, String> fieldErrors
});




}
/// @nodoc
class __$ValidationFailureCopyWithImpl<$Res>
    implements _$ValidationFailureCopyWith<$Res> {
  __$ValidationFailureCopyWithImpl(this._self, this._then);

  final _ValidationFailure _self;
  final $Res Function(_ValidationFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? detail = null,Object? fieldErrors = null,}) {
  return _then(_ValidationFailure(
null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,null == fieldErrors ? _self.fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}

/// @nodoc


class _AuthFailure implements Failure {
  const _AuthFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.auth()';
}


}




/// @nodoc


class _PermissionFailure implements Failure {
  const _PermissionFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PermissionFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.permission()';
}


}




/// @nodoc


class _NotFoundFailure implements Failure {
  const _NotFoundFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotFoundFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.notFound()';
}


}




/// @nodoc


class _LimitFailure implements Failure {
  const _LimitFailure(this.detail);
  

 final  String detail;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LimitFailureCopyWith<_LimitFailure> get copyWith => __$LimitFailureCopyWithImpl<_LimitFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LimitFailure&&(identical(other.detail, detail) || other.detail == detail));
}


@override
int get hashCode => Object.hash(runtimeType,detail);

@override
String toString() {
  return 'Failure.limit(detail: $detail)';
}


}

/// @nodoc
abstract mixin class _$LimitFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$LimitFailureCopyWith(_LimitFailure value, $Res Function(_LimitFailure) _then) = __$LimitFailureCopyWithImpl;
@useResult
$Res call({
 String detail
});




}
/// @nodoc
class __$LimitFailureCopyWithImpl<$Res>
    implements _$LimitFailureCopyWith<$Res> {
  __$LimitFailureCopyWithImpl(this._self, this._then);

  final _LimitFailure _self;
  final $Res Function(_LimitFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? detail = null,}) {
  return _then(_LimitFailure(
null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ServiceUnavailableFailure implements Failure {
  const _ServiceUnavailableFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceUnavailableFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.serviceUnavailable()';
}


}




/// @nodoc


class _ServerFailure implements Failure {
  const _ServerFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.server()';
}


}




/// @nodoc


class _UnknownFailure implements Failure {
  const _UnknownFailure(this.detail);
  

 final  String detail;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnknownFailureCopyWith<_UnknownFailure> get copyWith => __$UnknownFailureCopyWithImpl<_UnknownFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnknownFailure&&(identical(other.detail, detail) || other.detail == detail));
}


@override
int get hashCode => Object.hash(runtimeType,detail);

@override
String toString() {
  return 'Failure.unknown(detail: $detail)';
}


}

/// @nodoc
abstract mixin class _$UnknownFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$UnknownFailureCopyWith(_UnknownFailure value, $Res Function(_UnknownFailure) _then) = __$UnknownFailureCopyWithImpl;
@useResult
$Res call({
 String detail
});




}
/// @nodoc
class __$UnknownFailureCopyWithImpl<$Res>
    implements _$UnknownFailureCopyWith<$Res> {
  __$UnknownFailureCopyWithImpl(this._self, this._then);

  final _UnknownFailure _self;
  final $Res Function(_UnknownFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? detail = null,}) {
  return _then(_UnknownFailure(
null == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
