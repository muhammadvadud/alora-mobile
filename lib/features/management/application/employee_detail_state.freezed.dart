// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EmployeeDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EmployeeDetailState()';
}


}

/// @nodoc
class $EmployeeDetailStateCopyWith<$Res>  {
$EmployeeDetailStateCopyWith(EmployeeDetailState _, $Res Function(EmployeeDetailState) __);
}


/// Adds pattern-matching-related methods to [EmployeeDetailState].
extension EmployeeDetailStatePatterns on EmployeeDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EmployeeDetailInitial value)?  initial,TResult Function( _EmployeeDetailLoading value)?  loading,TResult Function( _EmployeeDetailLoaded value)?  loaded,TResult Function( _EmployeeDetailError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmployeeDetailInitial() when initial != null:
return initial(_that);case _EmployeeDetailLoading() when loading != null:
return loading(_that);case _EmployeeDetailLoaded() when loaded != null:
return loaded(_that);case _EmployeeDetailError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EmployeeDetailInitial value)  initial,required TResult Function( _EmployeeDetailLoading value)  loading,required TResult Function( _EmployeeDetailLoaded value)  loaded,required TResult Function( _EmployeeDetailError value)  error,}){
final _that = this;
switch (_that) {
case _EmployeeDetailInitial():
return initial(_that);case _EmployeeDetailLoading():
return loading(_that);case _EmployeeDetailLoaded():
return loaded(_that);case _EmployeeDetailError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EmployeeDetailInitial value)?  initial,TResult? Function( _EmployeeDetailLoading value)?  loading,TResult? Function( _EmployeeDetailLoaded value)?  loaded,TResult? Function( _EmployeeDetailError value)?  error,}){
final _that = this;
switch (_that) {
case _EmployeeDetailInitial() when initial != null:
return initial(_that);case _EmployeeDetailLoading() when loading != null:
return loading(_that);case _EmployeeDetailLoaded() when loaded != null:
return loaded(_that);case _EmployeeDetailError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Employee employee,  UsageLimit? limit)?  loaded,TResult Function( Failure failure)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmployeeDetailInitial() when initial != null:
return initial();case _EmployeeDetailLoading() when loading != null:
return loading();case _EmployeeDetailLoaded() when loaded != null:
return loaded(_that.employee,_that.limit);case _EmployeeDetailError() when error != null:
return error(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Employee employee,  UsageLimit? limit)  loaded,required TResult Function( Failure failure)  error,}) {final _that = this;
switch (_that) {
case _EmployeeDetailInitial():
return initial();case _EmployeeDetailLoading():
return loading();case _EmployeeDetailLoaded():
return loaded(_that.employee,_that.limit);case _EmployeeDetailError():
return error(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Employee employee,  UsageLimit? limit)?  loaded,TResult? Function( Failure failure)?  error,}) {final _that = this;
switch (_that) {
case _EmployeeDetailInitial() when initial != null:
return initial();case _EmployeeDetailLoading() when loading != null:
return loading();case _EmployeeDetailLoaded() when loaded != null:
return loaded(_that.employee,_that.limit);case _EmployeeDetailError() when error != null:
return error(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _EmployeeDetailInitial implements EmployeeDetailState {
  const _EmployeeDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeeDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EmployeeDetailState.initial()';
}


}




/// @nodoc


class _EmployeeDetailLoading implements EmployeeDetailState {
  const _EmployeeDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeeDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EmployeeDetailState.loading()';
}


}




/// @nodoc


class _EmployeeDetailLoaded implements EmployeeDetailState {
  const _EmployeeDetailLoaded({required this.employee, this.limit});
  

 final  Employee employee;
 final  UsageLimit? limit;

/// Create a copy of EmployeeDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeeDetailLoadedCopyWith<_EmployeeDetailLoaded> get copyWith => __$EmployeeDetailLoadedCopyWithImpl<_EmployeeDetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeeDetailLoaded&&(identical(other.employee, employee) || other.employee == employee)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,employee,limit);

@override
String toString() {
  return 'EmployeeDetailState.loaded(employee: $employee, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$EmployeeDetailLoadedCopyWith<$Res> implements $EmployeeDetailStateCopyWith<$Res> {
  factory _$EmployeeDetailLoadedCopyWith(_EmployeeDetailLoaded value, $Res Function(_EmployeeDetailLoaded) _then) = __$EmployeeDetailLoadedCopyWithImpl;
@useResult
$Res call({
 Employee employee, UsageLimit? limit
});




}
/// @nodoc
class __$EmployeeDetailLoadedCopyWithImpl<$Res>
    implements _$EmployeeDetailLoadedCopyWith<$Res> {
  __$EmployeeDetailLoadedCopyWithImpl(this._self, this._then);

  final _EmployeeDetailLoaded _self;
  final $Res Function(_EmployeeDetailLoaded) _then;

/// Create a copy of EmployeeDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? employee = null,Object? limit = freezed,}) {
  return _then(_EmployeeDetailLoaded(
employee: null == employee ? _self.employee : employee // ignore: cast_nullable_to_non_nullable
as Employee,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as UsageLimit?,
  ));
}


}

/// @nodoc


class _EmployeeDetailError implements EmployeeDetailState {
  const _EmployeeDetailError({required this.failure});
  

 final  Failure failure;

/// Create a copy of EmployeeDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeeDetailErrorCopyWith<_EmployeeDetailError> get copyWith => __$EmployeeDetailErrorCopyWithImpl<_EmployeeDetailError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeeDetailError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'EmployeeDetailState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$EmployeeDetailErrorCopyWith<$Res> implements $EmployeeDetailStateCopyWith<$Res> {
  factory _$EmployeeDetailErrorCopyWith(_EmployeeDetailError value, $Res Function(_EmployeeDetailError) _then) = __$EmployeeDetailErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class __$EmployeeDetailErrorCopyWithImpl<$Res>
    implements _$EmployeeDetailErrorCopyWith<$Res> {
  __$EmployeeDetailErrorCopyWithImpl(this._self, this._then);

  final _EmployeeDetailError _self;
  final $Res Function(_EmployeeDetailError) _then;

/// Create a copy of EmployeeDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_EmployeeDetailError(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of EmployeeDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res> get failure {
  
  return $FailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
