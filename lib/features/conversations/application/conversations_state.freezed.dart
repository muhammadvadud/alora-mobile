// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversations_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConversationsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationsState()';
}


}

/// @nodoc
class $ConversationsStateCopyWith<$Res>  {
$ConversationsStateCopyWith(ConversationsState _, $Res Function(ConversationsState) __);
}


/// Adds pattern-matching-related methods to [ConversationsState].
extension ConversationsStatePatterns on ConversationsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Empty value)?  empty,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Empty() when empty != null:
return empty(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Empty value)  empty,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Empty():
return empty(_that);case _Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Empty value)?  empty,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Empty() when empty != null:
return empty(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String searchQuery,  ConversationFilterType filterType)?  loading,TResult Function( List<Conversation> items,  String? nextCursor,  bool isLoadingMore,  String searchQuery,  ConversationFilterType filterType)?  loaded,TResult Function( String searchQuery,  ConversationFilterType filterType)?  empty,TResult Function( Failure failure,  String searchQuery,  ConversationFilterType filterType)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading(_that.searchQuery,_that.filterType);case _Loaded() when loaded != null:
return loaded(_that.items,_that.nextCursor,_that.isLoadingMore,_that.searchQuery,_that.filterType);case _Empty() when empty != null:
return empty(_that.searchQuery,_that.filterType);case _Error() when error != null:
return error(_that.failure,_that.searchQuery,_that.filterType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String searchQuery,  ConversationFilterType filterType)  loading,required TResult Function( List<Conversation> items,  String? nextCursor,  bool isLoadingMore,  String searchQuery,  ConversationFilterType filterType)  loaded,required TResult Function( String searchQuery,  ConversationFilterType filterType)  empty,required TResult Function( Failure failure,  String searchQuery,  ConversationFilterType filterType)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading(_that.searchQuery,_that.filterType);case _Loaded():
return loaded(_that.items,_that.nextCursor,_that.isLoadingMore,_that.searchQuery,_that.filterType);case _Empty():
return empty(_that.searchQuery,_that.filterType);case _Error():
return error(_that.failure,_that.searchQuery,_that.filterType);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String searchQuery,  ConversationFilterType filterType)?  loading,TResult? Function( List<Conversation> items,  String? nextCursor,  bool isLoadingMore,  String searchQuery,  ConversationFilterType filterType)?  loaded,TResult? Function( String searchQuery,  ConversationFilterType filterType)?  empty,TResult? Function( Failure failure,  String searchQuery,  ConversationFilterType filterType)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading(_that.searchQuery,_that.filterType);case _Loaded() when loaded != null:
return loaded(_that.items,_that.nextCursor,_that.isLoadingMore,_that.searchQuery,_that.filterType);case _Empty() when empty != null:
return empty(_that.searchQuery,_that.filterType);case _Error() when error != null:
return error(_that.failure,_that.searchQuery,_that.filterType);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements ConversationsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ConversationsState.initial()';
}


}




/// @nodoc


class _Loading implements ConversationsState {
  const _Loading({this.searchQuery = '', this.filterType = ConversationFilterType.all});
  

@JsonKey() final  String searchQuery;
@JsonKey() final  ConversationFilterType filterType;

/// Create a copy of ConversationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadingCopyWith<_Loading> get copyWith => __$LoadingCopyWithImpl<_Loading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.filterType, filterType) || other.filterType == filterType));
}


@override
int get hashCode => Object.hash(runtimeType,searchQuery,filterType);

@override
String toString() {
  return 'ConversationsState.loading(searchQuery: $searchQuery, filterType: $filterType)';
}


}

/// @nodoc
abstract mixin class _$LoadingCopyWith<$Res> implements $ConversationsStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) _then) = __$LoadingCopyWithImpl;
@useResult
$Res call({
 String searchQuery, ConversationFilterType filterType
});




}
/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading _self;
  final $Res Function(_Loading) _then;

/// Create a copy of ConversationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? searchQuery = null,Object? filterType = null,}) {
  return _then(_Loading(
searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,filterType: null == filterType ? _self.filterType : filterType // ignore: cast_nullable_to_non_nullable
as ConversationFilterType,
  ));
}


}

/// @nodoc


class _Loaded implements ConversationsState {
  const _Loaded({required this.items, this.nextCursor, this.isLoadingMore = false, this.searchQuery = '', this.filterType = ConversationFilterType.all});
  

 final  List<Conversation> items;
 final  String? nextCursor;
@JsonKey() final  bool isLoadingMore;
@JsonKey() final  String searchQuery;
@JsonKey() final  ConversationFilterType filterType;

/// Create a copy of ConversationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.filterType, filterType) || other.filterType == filterType));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),nextCursor,isLoadingMore,searchQuery,filterType);

@override
String toString() {
  return 'ConversationsState.loaded(items: $items, nextCursor: $nextCursor, isLoadingMore: $isLoadingMore, searchQuery: $searchQuery, filterType: $filterType)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $ConversationsStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<Conversation> items, String? nextCursor, bool isLoadingMore, String searchQuery, ConversationFilterType filterType
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of ConversationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,Object? nextCursor = freezed,Object? isLoadingMore = null,Object? searchQuery = null,Object? filterType = null,}) {
  return _then(_Loaded(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<Conversation>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,filterType: null == filterType ? _self.filterType : filterType // ignore: cast_nullable_to_non_nullable
as ConversationFilterType,
  ));
}


}

/// @nodoc


class _Empty implements ConversationsState {
  const _Empty({this.searchQuery = '', this.filterType = ConversationFilterType.all});
  

@JsonKey() final  String searchQuery;
@JsonKey() final  ConversationFilterType filterType;

/// Create a copy of ConversationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmptyCopyWith<_Empty> get copyWith => __$EmptyCopyWithImpl<_Empty>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Empty&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.filterType, filterType) || other.filterType == filterType));
}


@override
int get hashCode => Object.hash(runtimeType,searchQuery,filterType);

@override
String toString() {
  return 'ConversationsState.empty(searchQuery: $searchQuery, filterType: $filterType)';
}


}

/// @nodoc
abstract mixin class _$EmptyCopyWith<$Res> implements $ConversationsStateCopyWith<$Res> {
  factory _$EmptyCopyWith(_Empty value, $Res Function(_Empty) _then) = __$EmptyCopyWithImpl;
@useResult
$Res call({
 String searchQuery, ConversationFilterType filterType
});




}
/// @nodoc
class __$EmptyCopyWithImpl<$Res>
    implements _$EmptyCopyWith<$Res> {
  __$EmptyCopyWithImpl(this._self, this._then);

  final _Empty _self;
  final $Res Function(_Empty) _then;

/// Create a copy of ConversationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? searchQuery = null,Object? filterType = null,}) {
  return _then(_Empty(
searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,filterType: null == filterType ? _self.filterType : filterType // ignore: cast_nullable_to_non_nullable
as ConversationFilterType,
  ));
}


}

/// @nodoc


class _Error implements ConversationsState {
  const _Error({required this.failure, this.searchQuery = '', this.filterType = ConversationFilterType.all});
  

 final  Failure failure;
@JsonKey() final  String searchQuery;
@JsonKey() final  ConversationFilterType filterType;

/// Create a copy of ConversationsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.filterType, filterType) || other.filterType == filterType));
}


@override
int get hashCode => Object.hash(runtimeType,failure,searchQuery,filterType);

@override
String toString() {
  return 'ConversationsState.error(failure: $failure, searchQuery: $searchQuery, filterType: $filterType)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $ConversationsStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure, String searchQuery, ConversationFilterType filterType
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of ConversationsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,Object? searchQuery = null,Object? filterType = null,}) {
  return _then(_Error(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,filterType: null == filterType ? _self.filterType : filterType // ignore: cast_nullable_to_non_nullable
as ConversationFilterType,
  ));
}

/// Create a copy of ConversationsState
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
