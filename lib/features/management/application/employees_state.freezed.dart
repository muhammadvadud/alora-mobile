// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employees_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EmployeesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EmployeesState()';
}


}

/// @nodoc
class $EmployeesStateCopyWith<$Res>  {
$EmployeesStateCopyWith(EmployeesState _, $Res Function(EmployeesState) __);
}


/// Adds pattern-matching-related methods to [EmployeesState].
extension EmployeesStatePatterns on EmployeesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EmployeesInitial value)?  initial,TResult Function( _EmployeesLoading value)?  loading,TResult Function( _EmployeesLoaded value)?  loaded,TResult Function( _EmployeesEmpty value)?  empty,TResult Function( _EmployeesError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmployeesInitial() when initial != null:
return initial(_that);case _EmployeesLoading() when loading != null:
return loading(_that);case _EmployeesLoaded() when loaded != null:
return loaded(_that);case _EmployeesEmpty() when empty != null:
return empty(_that);case _EmployeesError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EmployeesInitial value)  initial,required TResult Function( _EmployeesLoading value)  loading,required TResult Function( _EmployeesLoaded value)  loaded,required TResult Function( _EmployeesEmpty value)  empty,required TResult Function( _EmployeesError value)  error,}){
final _that = this;
switch (_that) {
case _EmployeesInitial():
return initial(_that);case _EmployeesLoading():
return loading(_that);case _EmployeesLoaded():
return loaded(_that);case _EmployeesEmpty():
return empty(_that);case _EmployeesError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EmployeesInitial value)?  initial,TResult? Function( _EmployeesLoading value)?  loading,TResult? Function( _EmployeesLoaded value)?  loaded,TResult? Function( _EmployeesEmpty value)?  empty,TResult? Function( _EmployeesError value)?  error,}){
final _that = this;
switch (_that) {
case _EmployeesInitial() when initial != null:
return initial(_that);case _EmployeesLoading() when loading != null:
return loading(_that);case _EmployeesLoaded() when loaded != null:
return loaded(_that);case _EmployeesEmpty() when empty != null:
return empty(_that);case _EmployeesError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String searchQuery)?  loading,TResult Function( List<Employee> items,  String searchQuery)?  loaded,TResult Function( String searchQuery)?  empty,TResult Function( Failure failure,  String searchQuery)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmployeesInitial() when initial != null:
return initial();case _EmployeesLoading() when loading != null:
return loading(_that.searchQuery);case _EmployeesLoaded() when loaded != null:
return loaded(_that.items,_that.searchQuery);case _EmployeesEmpty() when empty != null:
return empty(_that.searchQuery);case _EmployeesError() when error != null:
return error(_that.failure,_that.searchQuery);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String searchQuery)  loading,required TResult Function( List<Employee> items,  String searchQuery)  loaded,required TResult Function( String searchQuery)  empty,required TResult Function( Failure failure,  String searchQuery)  error,}) {final _that = this;
switch (_that) {
case _EmployeesInitial():
return initial();case _EmployeesLoading():
return loading(_that.searchQuery);case _EmployeesLoaded():
return loaded(_that.items,_that.searchQuery);case _EmployeesEmpty():
return empty(_that.searchQuery);case _EmployeesError():
return error(_that.failure,_that.searchQuery);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String searchQuery)?  loading,TResult? Function( List<Employee> items,  String searchQuery)?  loaded,TResult? Function( String searchQuery)?  empty,TResult? Function( Failure failure,  String searchQuery)?  error,}) {final _that = this;
switch (_that) {
case _EmployeesInitial() when initial != null:
return initial();case _EmployeesLoading() when loading != null:
return loading(_that.searchQuery);case _EmployeesLoaded() when loaded != null:
return loaded(_that.items,_that.searchQuery);case _EmployeesEmpty() when empty != null:
return empty(_that.searchQuery);case _EmployeesError() when error != null:
return error(_that.failure,_that.searchQuery);case _:
  return null;

}
}

}

/// @nodoc


class _EmployeesInitial implements EmployeesState {
  const _EmployeesInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeesInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'EmployeesState.initial()';
}


}




/// @nodoc


class _EmployeesLoading implements EmployeesState {
  const _EmployeesLoading({this.searchQuery = ''});
  

@JsonKey() final  String searchQuery;

/// Create a copy of EmployeesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeesLoadingCopyWith<_EmployeesLoading> get copyWith => __$EmployeesLoadingCopyWithImpl<_EmployeesLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeesLoading&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery));
}


@override
int get hashCode => Object.hash(runtimeType,searchQuery);

@override
String toString() {
  return 'EmployeesState.loading(searchQuery: $searchQuery)';
}


}

/// @nodoc
abstract mixin class _$EmployeesLoadingCopyWith<$Res> implements $EmployeesStateCopyWith<$Res> {
  factory _$EmployeesLoadingCopyWith(_EmployeesLoading value, $Res Function(_EmployeesLoading) _then) = __$EmployeesLoadingCopyWithImpl;
@useResult
$Res call({
 String searchQuery
});




}
/// @nodoc
class __$EmployeesLoadingCopyWithImpl<$Res>
    implements _$EmployeesLoadingCopyWith<$Res> {
  __$EmployeesLoadingCopyWithImpl(this._self, this._then);

  final _EmployeesLoading _self;
  final $Res Function(_EmployeesLoading) _then;

/// Create a copy of EmployeesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? searchQuery = null,}) {
  return _then(_EmployeesLoading(
searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _EmployeesLoaded implements EmployeesState {
  const _EmployeesLoaded({required this.items, this.searchQuery = ''});
  

 final  List<Employee> items;
@JsonKey() final  String searchQuery;

/// Create a copy of EmployeesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeesLoadedCopyWith<_EmployeesLoaded> get copyWith => __$EmployeesLoadedCopyWithImpl<_EmployeesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeesLoaded&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),searchQuery);

@override
String toString() {
  return 'EmployeesState.loaded(items: $items, searchQuery: $searchQuery)';
}


}

/// @nodoc
abstract mixin class _$EmployeesLoadedCopyWith<$Res> implements $EmployeesStateCopyWith<$Res> {
  factory _$EmployeesLoadedCopyWith(_EmployeesLoaded value, $Res Function(_EmployeesLoaded) _then) = __$EmployeesLoadedCopyWithImpl;
@useResult
$Res call({
 List<Employee> items, String searchQuery
});




}
/// @nodoc
class __$EmployeesLoadedCopyWithImpl<$Res>
    implements _$EmployeesLoadedCopyWith<$Res> {
  __$EmployeesLoadedCopyWithImpl(this._self, this._then);

  final _EmployeesLoaded _self;
  final $Res Function(_EmployeesLoaded) _then;

/// Create a copy of EmployeesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,Object? searchQuery = null,}) {
  return _then(_EmployeesLoaded(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<Employee>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _EmployeesEmpty implements EmployeesState {
  const _EmployeesEmpty({this.searchQuery = ''});
  

@JsonKey() final  String searchQuery;

/// Create a copy of EmployeesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeesEmptyCopyWith<_EmployeesEmpty> get copyWith => __$EmployeesEmptyCopyWithImpl<_EmployeesEmpty>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeesEmpty&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery));
}


@override
int get hashCode => Object.hash(runtimeType,searchQuery);

@override
String toString() {
  return 'EmployeesState.empty(searchQuery: $searchQuery)';
}


}

/// @nodoc
abstract mixin class _$EmployeesEmptyCopyWith<$Res> implements $EmployeesStateCopyWith<$Res> {
  factory _$EmployeesEmptyCopyWith(_EmployeesEmpty value, $Res Function(_EmployeesEmpty) _then) = __$EmployeesEmptyCopyWithImpl;
@useResult
$Res call({
 String searchQuery
});




}
/// @nodoc
class __$EmployeesEmptyCopyWithImpl<$Res>
    implements _$EmployeesEmptyCopyWith<$Res> {
  __$EmployeesEmptyCopyWithImpl(this._self, this._then);

  final _EmployeesEmpty _self;
  final $Res Function(_EmployeesEmpty) _then;

/// Create a copy of EmployeesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? searchQuery = null,}) {
  return _then(_EmployeesEmpty(
searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _EmployeesError implements EmployeesState {
  const _EmployeesError({required this.failure, this.searchQuery = ''});
  

 final  Failure failure;
@JsonKey() final  String searchQuery;

/// Create a copy of EmployeesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeesErrorCopyWith<_EmployeesError> get copyWith => __$EmployeesErrorCopyWithImpl<_EmployeesError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeesError&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery));
}


@override
int get hashCode => Object.hash(runtimeType,failure,searchQuery);

@override
String toString() {
  return 'EmployeesState.error(failure: $failure, searchQuery: $searchQuery)';
}


}

/// @nodoc
abstract mixin class _$EmployeesErrorCopyWith<$Res> implements $EmployeesStateCopyWith<$Res> {
  factory _$EmployeesErrorCopyWith(_EmployeesError value, $Res Function(_EmployeesError) _then) = __$EmployeesErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure, String searchQuery
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class __$EmployeesErrorCopyWithImpl<$Res>
    implements _$EmployeesErrorCopyWith<$Res> {
  __$EmployeesErrorCopyWithImpl(this._self, this._then);

  final _EmployeesError _self;
  final $Res Function(_EmployeesError) _then;

/// Create a copy of EmployeesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,Object? searchQuery = null,}) {
  return _then(_EmployeesError(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of EmployeesState
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
