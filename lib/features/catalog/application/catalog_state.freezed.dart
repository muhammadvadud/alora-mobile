// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CatalogState {

 List<Category> get categories; CatalogFilter get filter; String get searchQuery; String? get categoryId; List<Product> get products; String? get nextUrl; bool get isLoading; bool get isLoadingMore; Failure? get error;
/// Create a copy of CatalogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogStateCopyWith<CatalogState> get copyWith => _$CatalogStateCopyWithImpl<CatalogState>(this as CatalogState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogState&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.nextUrl, nextUrl) || other.nextUrl == nextUrl)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories),filter,searchQuery,categoryId,const DeepCollectionEquality().hash(products),nextUrl,isLoading,isLoadingMore,error);

@override
String toString() {
  return 'CatalogState(categories: $categories, filter: $filter, searchQuery: $searchQuery, categoryId: $categoryId, products: $products, nextUrl: $nextUrl, isLoading: $isLoading, isLoadingMore: $isLoadingMore, error: $error)';
}


}

/// @nodoc
abstract mixin class $CatalogStateCopyWith<$Res>  {
  factory $CatalogStateCopyWith(CatalogState value, $Res Function(CatalogState) _then) = _$CatalogStateCopyWithImpl;
@useResult
$Res call({
 List<Category> categories, CatalogFilter filter, String searchQuery, String? categoryId, List<Product> products, String? nextUrl, bool isLoading, bool isLoadingMore, Failure? error
});


$CatalogFilterCopyWith<$Res> get filter;$FailureCopyWith<$Res>? get error;

}
/// @nodoc
class _$CatalogStateCopyWithImpl<$Res>
    implements $CatalogStateCopyWith<$Res> {
  _$CatalogStateCopyWithImpl(this._self, this._then);

  final CatalogState _self;
  final $Res Function(CatalogState) _then;

/// Create a copy of CatalogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = null,Object? filter = null,Object? searchQuery = null,Object? categoryId = freezed,Object? products = null,Object? nextUrl = freezed,Object? isLoading = null,Object? isLoadingMore = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<Category>,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as CatalogFilter,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,nextUrl: freezed == nextUrl ? _self.nextUrl : nextUrl // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of CatalogState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatalogFilterCopyWith<$Res> get filter {
  
  return $CatalogFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}/// Create a copy of CatalogState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}


/// Adds pattern-matching-related methods to [CatalogState].
extension CatalogStatePatterns on CatalogState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogState value)  $default,){
final _that = this;
switch (_that) {
case _CatalogState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogState value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Category> categories,  CatalogFilter filter,  String searchQuery,  String? categoryId,  List<Product> products,  String? nextUrl,  bool isLoading,  bool isLoadingMore,  Failure? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogState() when $default != null:
return $default(_that.categories,_that.filter,_that.searchQuery,_that.categoryId,_that.products,_that.nextUrl,_that.isLoading,_that.isLoadingMore,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Category> categories,  CatalogFilter filter,  String searchQuery,  String? categoryId,  List<Product> products,  String? nextUrl,  bool isLoading,  bool isLoadingMore,  Failure? error)  $default,) {final _that = this;
switch (_that) {
case _CatalogState():
return $default(_that.categories,_that.filter,_that.searchQuery,_that.categoryId,_that.products,_that.nextUrl,_that.isLoading,_that.isLoadingMore,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Category> categories,  CatalogFilter filter,  String searchQuery,  String? categoryId,  List<Product> products,  String? nextUrl,  bool isLoading,  bool isLoadingMore,  Failure? error)?  $default,) {final _that = this;
switch (_that) {
case _CatalogState() when $default != null:
return $default(_that.categories,_that.filter,_that.searchQuery,_that.categoryId,_that.products,_that.nextUrl,_that.isLoading,_that.isLoadingMore,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _CatalogState extends CatalogState {
  const _CatalogState({this.categories = const [], this.filter = const CatalogFilter(), this.searchQuery = '', this.categoryId, this.products = const [], this.nextUrl, this.isLoading = false, this.isLoadingMore = false, this.error}): super._();
  

@override@JsonKey() final  List<Category> categories;
@override@JsonKey() final  CatalogFilter filter;
@override@JsonKey() final  String searchQuery;
@override final  String? categoryId;
@override@JsonKey() final  List<Product> products;
@override final  String? nextUrl;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isLoadingMore;
@override final  Failure? error;

/// Create a copy of CatalogState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogStateCopyWith<_CatalogState> get copyWith => __$CatalogStateCopyWithImpl<_CatalogState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogState&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.nextUrl, nextUrl) || other.nextUrl == nextUrl)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories),filter,searchQuery,categoryId,const DeepCollectionEquality().hash(products),nextUrl,isLoading,isLoadingMore,error);

@override
String toString() {
  return 'CatalogState(categories: $categories, filter: $filter, searchQuery: $searchQuery, categoryId: $categoryId, products: $products, nextUrl: $nextUrl, isLoading: $isLoading, isLoadingMore: $isLoadingMore, error: $error)';
}


}

/// @nodoc
abstract mixin class _$CatalogStateCopyWith<$Res> implements $CatalogStateCopyWith<$Res> {
  factory _$CatalogStateCopyWith(_CatalogState value, $Res Function(_CatalogState) _then) = __$CatalogStateCopyWithImpl;
@override @useResult
$Res call({
 List<Category> categories, CatalogFilter filter, String searchQuery, String? categoryId, List<Product> products, String? nextUrl, bool isLoading, bool isLoadingMore, Failure? error
});


@override $CatalogFilterCopyWith<$Res> get filter;@override $FailureCopyWith<$Res>? get error;

}
/// @nodoc
class __$CatalogStateCopyWithImpl<$Res>
    implements _$CatalogStateCopyWith<$Res> {
  __$CatalogStateCopyWithImpl(this._self, this._then);

  final _CatalogState _self;
  final $Res Function(_CatalogState) _then;

/// Create a copy of CatalogState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = null,Object? filter = null,Object? searchQuery = null,Object? categoryId = freezed,Object? products = null,Object? nextUrl = freezed,Object? isLoading = null,Object? isLoadingMore = null,Object? error = freezed,}) {
  return _then(_CatalogState(
categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<Category>,filter: null == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as CatalogFilter,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,nextUrl: freezed == nextUrl ? _self.nextUrl : nextUrl // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of CatalogState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatalogFilterCopyWith<$Res> get filter {
  
  return $CatalogFilterCopyWith<$Res>(_self.filter, (value) {
    return _then(_self.copyWith(filter: value));
  });
}/// Create a copy of CatalogState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res>? get error {
    if (_self.error == null) {
    return null;
  }

  return $FailureCopyWith<$Res>(_self.error!, (value) {
    return _then(_self.copyWith(error: value));
  });
}
}

// dart format on
