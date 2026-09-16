// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderUserDto {

 String get id;@JsonKey(name: 'full_name') String? get fullName; String? get phone;
/// Create a copy of OrderUserDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderUserDtoCopyWith<OrderUserDto> get copyWith => _$OrderUserDtoCopyWithImpl<OrderUserDto>(this as OrderUserDto, _$identity);

  /// Serializes this OrderUserDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderUserDto&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,phone);

@override
String toString() {
  return 'OrderUserDto(id: $id, fullName: $fullName, phone: $phone)';
}


}

/// @nodoc
abstract mixin class $OrderUserDtoCopyWith<$Res>  {
  factory $OrderUserDtoCopyWith(OrderUserDto value, $Res Function(OrderUserDto) _then) = _$OrderUserDtoCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'full_name') String? fullName, String? phone
});




}
/// @nodoc
class _$OrderUserDtoCopyWithImpl<$Res>
    implements $OrderUserDtoCopyWith<$Res> {
  _$OrderUserDtoCopyWithImpl(this._self, this._then);

  final OrderUserDto _self;
  final $Res Function(OrderUserDto) _then;

/// Create a copy of OrderUserDto
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


/// Adds pattern-matching-related methods to [OrderUserDto].
extension OrderUserDtoPatterns on OrderUserDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderUserDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderUserDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderUserDto value)  $default,){
final _that = this;
switch (_that) {
case _OrderUserDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderUserDto value)?  $default,){
final _that = this;
switch (_that) {
case _OrderUserDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'full_name')  String? fullName,  String? phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderUserDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'full_name')  String? fullName,  String? phone)  $default,) {final _that = this;
switch (_that) {
case _OrderUserDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'full_name')  String? fullName,  String? phone)?  $default,) {final _that = this;
switch (_that) {
case _OrderUserDto() when $default != null:
return $default(_that.id,_that.fullName,_that.phone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderUserDto implements OrderUserDto {
  const _OrderUserDto({required this.id, @JsonKey(name: 'full_name') this.fullName, this.phone});
  factory _OrderUserDto.fromJson(Map<String, dynamic> json) => _$OrderUserDtoFromJson(json);

@override final  String id;
@override@JsonKey(name: 'full_name') final  String? fullName;
@override final  String? phone;

/// Create a copy of OrderUserDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderUserDtoCopyWith<_OrderUserDto> get copyWith => __$OrderUserDtoCopyWithImpl<_OrderUserDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderUserDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderUserDto&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,phone);

@override
String toString() {
  return 'OrderUserDto(id: $id, fullName: $fullName, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$OrderUserDtoCopyWith<$Res> implements $OrderUserDtoCopyWith<$Res> {
  factory _$OrderUserDtoCopyWith(_OrderUserDto value, $Res Function(_OrderUserDto) _then) = __$OrderUserDtoCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'full_name') String? fullName, String? phone
});




}
/// @nodoc
class __$OrderUserDtoCopyWithImpl<$Res>
    implements _$OrderUserDtoCopyWith<$Res> {
  __$OrderUserDtoCopyWithImpl(this._self, this._then);

  final _OrderUserDto _self;
  final $Res Function(_OrderUserDto) _then;

/// Create a copy of OrderUserDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = freezed,Object? phone = freezed,}) {
  return _then(_OrderUserDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
