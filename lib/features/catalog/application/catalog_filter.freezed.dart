// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CatalogFilter {

 ProductType? get type; ProductStyle? get style; ProductRoom? get room; ProductPattern? get pattern; ProductTransparency? get transparency; ProductSegment? get segment; int? get minPrice; int? get maxPrice;
/// Create a copy of CatalogFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogFilterCopyWith<CatalogFilter> get copyWith => _$CatalogFilterCopyWithImpl<CatalogFilter>(this as CatalogFilter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogFilter&&(identical(other.type, type) || other.type == type)&&(identical(other.style, style) || other.style == style)&&(identical(other.room, room) || other.room == room)&&(identical(other.pattern, pattern) || other.pattern == pattern)&&(identical(other.transparency, transparency) || other.transparency == transparency)&&(identical(other.segment, segment) || other.segment == segment)&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice));
}


@override
int get hashCode => Object.hash(runtimeType,type,style,room,pattern,transparency,segment,minPrice,maxPrice);

@override
String toString() {
  return 'CatalogFilter(type: $type, style: $style, room: $room, pattern: $pattern, transparency: $transparency, segment: $segment, minPrice: $minPrice, maxPrice: $maxPrice)';
}


}

/// @nodoc
abstract mixin class $CatalogFilterCopyWith<$Res>  {
  factory $CatalogFilterCopyWith(CatalogFilter value, $Res Function(CatalogFilter) _then) = _$CatalogFilterCopyWithImpl;
@useResult
$Res call({
 ProductType? type, ProductStyle? style, ProductRoom? room, ProductPattern? pattern, ProductTransparency? transparency, ProductSegment? segment, int? minPrice, int? maxPrice
});




}
/// @nodoc
class _$CatalogFilterCopyWithImpl<$Res>
    implements $CatalogFilterCopyWith<$Res> {
  _$CatalogFilterCopyWithImpl(this._self, this._then);

  final CatalogFilter _self;
  final $Res Function(CatalogFilter) _then;

/// Create a copy of CatalogFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = freezed,Object? style = freezed,Object? room = freezed,Object? pattern = freezed,Object? transparency = freezed,Object? segment = freezed,Object? minPrice = freezed,Object? maxPrice = freezed,}) {
  return _then(_self.copyWith(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ProductType?,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as ProductStyle?,room: freezed == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as ProductRoom?,pattern: freezed == pattern ? _self.pattern : pattern // ignore: cast_nullable_to_non_nullable
as ProductPattern?,transparency: freezed == transparency ? _self.transparency : transparency // ignore: cast_nullable_to_non_nullable
as ProductTransparency?,segment: freezed == segment ? _self.segment : segment // ignore: cast_nullable_to_non_nullable
as ProductSegment?,minPrice: freezed == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as int?,maxPrice: freezed == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CatalogFilter].
extension CatalogFilterPatterns on CatalogFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogFilter value)  $default,){
final _that = this;
switch (_that) {
case _CatalogFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogFilter value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProductType? type,  ProductStyle? style,  ProductRoom? room,  ProductPattern? pattern,  ProductTransparency? transparency,  ProductSegment? segment,  int? minPrice,  int? maxPrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogFilter() when $default != null:
return $default(_that.type,_that.style,_that.room,_that.pattern,_that.transparency,_that.segment,_that.minPrice,_that.maxPrice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProductType? type,  ProductStyle? style,  ProductRoom? room,  ProductPattern? pattern,  ProductTransparency? transparency,  ProductSegment? segment,  int? minPrice,  int? maxPrice)  $default,) {final _that = this;
switch (_that) {
case _CatalogFilter():
return $default(_that.type,_that.style,_that.room,_that.pattern,_that.transparency,_that.segment,_that.minPrice,_that.maxPrice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProductType? type,  ProductStyle? style,  ProductRoom? room,  ProductPattern? pattern,  ProductTransparency? transparency,  ProductSegment? segment,  int? minPrice,  int? maxPrice)?  $default,) {final _that = this;
switch (_that) {
case _CatalogFilter() when $default != null:
return $default(_that.type,_that.style,_that.room,_that.pattern,_that.transparency,_that.segment,_that.minPrice,_that.maxPrice);case _:
  return null;

}
}

}

/// @nodoc


class _CatalogFilter extends CatalogFilter {
  const _CatalogFilter({this.type, this.style, this.room, this.pattern, this.transparency, this.segment, this.minPrice, this.maxPrice}): super._();
  

@override final  ProductType? type;
@override final  ProductStyle? style;
@override final  ProductRoom? room;
@override final  ProductPattern? pattern;
@override final  ProductTransparency? transparency;
@override final  ProductSegment? segment;
@override final  int? minPrice;
@override final  int? maxPrice;

/// Create a copy of CatalogFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogFilterCopyWith<_CatalogFilter> get copyWith => __$CatalogFilterCopyWithImpl<_CatalogFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogFilter&&(identical(other.type, type) || other.type == type)&&(identical(other.style, style) || other.style == style)&&(identical(other.room, room) || other.room == room)&&(identical(other.pattern, pattern) || other.pattern == pattern)&&(identical(other.transparency, transparency) || other.transparency == transparency)&&(identical(other.segment, segment) || other.segment == segment)&&(identical(other.minPrice, minPrice) || other.minPrice == minPrice)&&(identical(other.maxPrice, maxPrice) || other.maxPrice == maxPrice));
}


@override
int get hashCode => Object.hash(runtimeType,type,style,room,pattern,transparency,segment,minPrice,maxPrice);

@override
String toString() {
  return 'CatalogFilter(type: $type, style: $style, room: $room, pattern: $pattern, transparency: $transparency, segment: $segment, minPrice: $minPrice, maxPrice: $maxPrice)';
}


}

/// @nodoc
abstract mixin class _$CatalogFilterCopyWith<$Res> implements $CatalogFilterCopyWith<$Res> {
  factory _$CatalogFilterCopyWith(_CatalogFilter value, $Res Function(_CatalogFilter) _then) = __$CatalogFilterCopyWithImpl;
@override @useResult
$Res call({
 ProductType? type, ProductStyle? style, ProductRoom? room, ProductPattern? pattern, ProductTransparency? transparency, ProductSegment? segment, int? minPrice, int? maxPrice
});




}
/// @nodoc
class __$CatalogFilterCopyWithImpl<$Res>
    implements _$CatalogFilterCopyWith<$Res> {
  __$CatalogFilterCopyWithImpl(this._self, this._then);

  final _CatalogFilter _self;
  final $Res Function(_CatalogFilter) _then;

/// Create a copy of CatalogFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = freezed,Object? style = freezed,Object? room = freezed,Object? pattern = freezed,Object? transparency = freezed,Object? segment = freezed,Object? minPrice = freezed,Object? maxPrice = freezed,}) {
  return _then(_CatalogFilter(
type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ProductType?,style: freezed == style ? _self.style : style // ignore: cast_nullable_to_non_nullable
as ProductStyle?,room: freezed == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as ProductRoom?,pattern: freezed == pattern ? _self.pattern : pattern // ignore: cast_nullable_to_non_nullable
as ProductPattern?,transparency: freezed == transparency ? _self.transparency : transparency // ignore: cast_nullable_to_non_nullable
as ProductTransparency?,segment: freezed == segment ? _self.segment : segment // ignore: cast_nullable_to_non_nullable
as ProductSegment?,minPrice: freezed == minPrice ? _self.minPrice : minPrice // ignore: cast_nullable_to_non_nullable
as int?,maxPrice: freezed == maxPrice ? _self.maxPrice : maxPrice // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
