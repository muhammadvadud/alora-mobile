// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrdersResponseDto {

 String? get next; String? get previous; List<OrderDto> get results;
/// Create a copy of OrdersResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrdersResponseDtoCopyWith<OrdersResponseDto> get copyWith => _$OrdersResponseDtoCopyWithImpl<OrdersResponseDto>(this as OrdersResponseDto, _$identity);

  /// Serializes this OrdersResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrdersResponseDto&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,next,previous,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'OrdersResponseDto(next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class $OrdersResponseDtoCopyWith<$Res>  {
  factory $OrdersResponseDtoCopyWith(OrdersResponseDto value, $Res Function(OrdersResponseDto) _then) = _$OrdersResponseDtoCopyWithImpl;
@useResult
$Res call({
 String? next, String? previous, List<OrderDto> results
});




}
/// @nodoc
class _$OrdersResponseDtoCopyWithImpl<$Res>
    implements $OrdersResponseDtoCopyWith<$Res> {
  _$OrdersResponseDtoCopyWithImpl(this._self, this._then);

  final OrdersResponseDto _self;
  final $Res Function(OrdersResponseDto) _then;

/// Create a copy of OrdersResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_self.copyWith(
next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<OrderDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [OrdersResponseDto].
extension OrdersResponseDtoPatterns on OrdersResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrdersResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrdersResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrdersResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _OrdersResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrdersResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _OrdersResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? next,  String? previous,  List<OrderDto> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrdersResponseDto() when $default != null:
return $default(_that.next,_that.previous,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? next,  String? previous,  List<OrderDto> results)  $default,) {final _that = this;
switch (_that) {
case _OrdersResponseDto():
return $default(_that.next,_that.previous,_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? next,  String? previous,  List<OrderDto> results)?  $default,) {final _that = this;
switch (_that) {
case _OrdersResponseDto() when $default != null:
return $default(_that.next,_that.previous,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrdersResponseDto implements OrdersResponseDto {
  const _OrdersResponseDto({this.next, this.previous, this.results = const []});
  factory _OrdersResponseDto.fromJson(Map<String, dynamic> json) => _$OrdersResponseDtoFromJson(json);

@override final  String? next;
@override final  String? previous;
@override@JsonKey() final  List<OrderDto> results;

/// Create a copy of OrdersResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrdersResponseDtoCopyWith<_OrdersResponseDto> get copyWith => __$OrdersResponseDtoCopyWithImpl<_OrdersResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrdersResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrdersResponseDto&&(identical(other.next, next) || other.next == next)&&(identical(other.previous, previous) || other.previous == previous)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,next,previous,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'OrdersResponseDto(next: $next, previous: $previous, results: $results)';
}


}

/// @nodoc
abstract mixin class _$OrdersResponseDtoCopyWith<$Res> implements $OrdersResponseDtoCopyWith<$Res> {
  factory _$OrdersResponseDtoCopyWith(_OrdersResponseDto value, $Res Function(_OrdersResponseDto) _then) = __$OrdersResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 String? next, String? previous, List<OrderDto> results
});




}
/// @nodoc
class __$OrdersResponseDtoCopyWithImpl<$Res>
    implements _$OrdersResponseDtoCopyWith<$Res> {
  __$OrdersResponseDtoCopyWithImpl(this._self, this._then);

  final _OrdersResponseDto _self;
  final $Res Function(_OrdersResponseDto) _then;

/// Create a copy of OrdersResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? next = freezed,Object? previous = freezed,Object? results = null,}) {
  return _then(_OrdersResponseDto(
next: freezed == next ? _self.next : next // ignore: cast_nullable_to_non_nullable
as String?,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as String?,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<OrderDto>,
  ));
}


}

// dart format on
