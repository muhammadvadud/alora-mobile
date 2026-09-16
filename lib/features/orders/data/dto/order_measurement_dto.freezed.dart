// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_measurement_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderMeasurementDto {

 String get id;@JsonKey(name: 'room_name') String? get roomName;@JsonKey(name: 'cornice_length_m') String? get corniceLengthM;@JsonKey(name: 'height_m') String? get heightM; List<String>? get layers; String? get coefficient; String? get note; List<OrderCurtainPartDto> get parts; List<OrderAccessoryDto> get accessories;
/// Create a copy of OrderMeasurementDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderMeasurementDtoCopyWith<OrderMeasurementDto> get copyWith => _$OrderMeasurementDtoCopyWithImpl<OrderMeasurementDto>(this as OrderMeasurementDto, _$identity);

  /// Serializes this OrderMeasurementDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderMeasurementDto&&(identical(other.id, id) || other.id == id)&&(identical(other.roomName, roomName) || other.roomName == roomName)&&(identical(other.corniceLengthM, corniceLengthM) || other.corniceLengthM == corniceLengthM)&&(identical(other.heightM, heightM) || other.heightM == heightM)&&const DeepCollectionEquality().equals(other.layers, layers)&&(identical(other.coefficient, coefficient) || other.coefficient == coefficient)&&(identical(other.note, note) || other.note == note)&&const DeepCollectionEquality().equals(other.parts, parts)&&const DeepCollectionEquality().equals(other.accessories, accessories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,roomName,corniceLengthM,heightM,const DeepCollectionEquality().hash(layers),coefficient,note,const DeepCollectionEquality().hash(parts),const DeepCollectionEquality().hash(accessories));

@override
String toString() {
  return 'OrderMeasurementDto(id: $id, roomName: $roomName, corniceLengthM: $corniceLengthM, heightM: $heightM, layers: $layers, coefficient: $coefficient, note: $note, parts: $parts, accessories: $accessories)';
}


}

/// @nodoc
abstract mixin class $OrderMeasurementDtoCopyWith<$Res>  {
  factory $OrderMeasurementDtoCopyWith(OrderMeasurementDto value, $Res Function(OrderMeasurementDto) _then) = _$OrderMeasurementDtoCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'room_name') String? roomName,@JsonKey(name: 'cornice_length_m') String? corniceLengthM,@JsonKey(name: 'height_m') String? heightM, List<String>? layers, String? coefficient, String? note, List<OrderCurtainPartDto> parts, List<OrderAccessoryDto> accessories
});




}
/// @nodoc
class _$OrderMeasurementDtoCopyWithImpl<$Res>
    implements $OrderMeasurementDtoCopyWith<$Res> {
  _$OrderMeasurementDtoCopyWithImpl(this._self, this._then);

  final OrderMeasurementDto _self;
  final $Res Function(OrderMeasurementDto) _then;

/// Create a copy of OrderMeasurementDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? roomName = freezed,Object? corniceLengthM = freezed,Object? heightM = freezed,Object? layers = freezed,Object? coefficient = freezed,Object? note = freezed,Object? parts = null,Object? accessories = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,roomName: freezed == roomName ? _self.roomName : roomName // ignore: cast_nullable_to_non_nullable
as String?,corniceLengthM: freezed == corniceLengthM ? _self.corniceLengthM : corniceLengthM // ignore: cast_nullable_to_non_nullable
as String?,heightM: freezed == heightM ? _self.heightM : heightM // ignore: cast_nullable_to_non_nullable
as String?,layers: freezed == layers ? _self.layers : layers // ignore: cast_nullable_to_non_nullable
as List<String>?,coefficient: freezed == coefficient ? _self.coefficient : coefficient // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,parts: null == parts ? _self.parts : parts // ignore: cast_nullable_to_non_nullable
as List<OrderCurtainPartDto>,accessories: null == accessories ? _self.accessories : accessories // ignore: cast_nullable_to_non_nullable
as List<OrderAccessoryDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderMeasurementDto].
extension OrderMeasurementDtoPatterns on OrderMeasurementDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderMeasurementDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderMeasurementDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderMeasurementDto value)  $default,){
final _that = this;
switch (_that) {
case _OrderMeasurementDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderMeasurementDto value)?  $default,){
final _that = this;
switch (_that) {
case _OrderMeasurementDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'room_name')  String? roomName, @JsonKey(name: 'cornice_length_m')  String? corniceLengthM, @JsonKey(name: 'height_m')  String? heightM,  List<String>? layers,  String? coefficient,  String? note,  List<OrderCurtainPartDto> parts,  List<OrderAccessoryDto> accessories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderMeasurementDto() when $default != null:
return $default(_that.id,_that.roomName,_that.corniceLengthM,_that.heightM,_that.layers,_that.coefficient,_that.note,_that.parts,_that.accessories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'room_name')  String? roomName, @JsonKey(name: 'cornice_length_m')  String? corniceLengthM, @JsonKey(name: 'height_m')  String? heightM,  List<String>? layers,  String? coefficient,  String? note,  List<OrderCurtainPartDto> parts,  List<OrderAccessoryDto> accessories)  $default,) {final _that = this;
switch (_that) {
case _OrderMeasurementDto():
return $default(_that.id,_that.roomName,_that.corniceLengthM,_that.heightM,_that.layers,_that.coefficient,_that.note,_that.parts,_that.accessories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'room_name')  String? roomName, @JsonKey(name: 'cornice_length_m')  String? corniceLengthM, @JsonKey(name: 'height_m')  String? heightM,  List<String>? layers,  String? coefficient,  String? note,  List<OrderCurtainPartDto> parts,  List<OrderAccessoryDto> accessories)?  $default,) {final _that = this;
switch (_that) {
case _OrderMeasurementDto() when $default != null:
return $default(_that.id,_that.roomName,_that.corniceLengthM,_that.heightM,_that.layers,_that.coefficient,_that.note,_that.parts,_that.accessories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderMeasurementDto implements OrderMeasurementDto {
  const _OrderMeasurementDto({required this.id, @JsonKey(name: 'room_name') this.roomName, @JsonKey(name: 'cornice_length_m') this.corniceLengthM, @JsonKey(name: 'height_m') this.heightM, this.layers, this.coefficient, this.note, this.parts = const [], this.accessories = const []});
  factory _OrderMeasurementDto.fromJson(Map<String, dynamic> json) => _$OrderMeasurementDtoFromJson(json);

@override final  String id;
@override@JsonKey(name: 'room_name') final  String? roomName;
@override@JsonKey(name: 'cornice_length_m') final  String? corniceLengthM;
@override@JsonKey(name: 'height_m') final  String? heightM;
@override final  List<String>? layers;
@override final  String? coefficient;
@override final  String? note;
@override@JsonKey() final  List<OrderCurtainPartDto> parts;
@override@JsonKey() final  List<OrderAccessoryDto> accessories;

/// Create a copy of OrderMeasurementDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderMeasurementDtoCopyWith<_OrderMeasurementDto> get copyWith => __$OrderMeasurementDtoCopyWithImpl<_OrderMeasurementDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderMeasurementDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderMeasurementDto&&(identical(other.id, id) || other.id == id)&&(identical(other.roomName, roomName) || other.roomName == roomName)&&(identical(other.corniceLengthM, corniceLengthM) || other.corniceLengthM == corniceLengthM)&&(identical(other.heightM, heightM) || other.heightM == heightM)&&const DeepCollectionEquality().equals(other.layers, layers)&&(identical(other.coefficient, coefficient) || other.coefficient == coefficient)&&(identical(other.note, note) || other.note == note)&&const DeepCollectionEquality().equals(other.parts, parts)&&const DeepCollectionEquality().equals(other.accessories, accessories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,roomName,corniceLengthM,heightM,const DeepCollectionEquality().hash(layers),coefficient,note,const DeepCollectionEquality().hash(parts),const DeepCollectionEquality().hash(accessories));

@override
String toString() {
  return 'OrderMeasurementDto(id: $id, roomName: $roomName, corniceLengthM: $corniceLengthM, heightM: $heightM, layers: $layers, coefficient: $coefficient, note: $note, parts: $parts, accessories: $accessories)';
}


}

/// @nodoc
abstract mixin class _$OrderMeasurementDtoCopyWith<$Res> implements $OrderMeasurementDtoCopyWith<$Res> {
  factory _$OrderMeasurementDtoCopyWith(_OrderMeasurementDto value, $Res Function(_OrderMeasurementDto) _then) = __$OrderMeasurementDtoCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'room_name') String? roomName,@JsonKey(name: 'cornice_length_m') String? corniceLengthM,@JsonKey(name: 'height_m') String? heightM, List<String>? layers, String? coefficient, String? note, List<OrderCurtainPartDto> parts, List<OrderAccessoryDto> accessories
});




}
/// @nodoc
class __$OrderMeasurementDtoCopyWithImpl<$Res>
    implements _$OrderMeasurementDtoCopyWith<$Res> {
  __$OrderMeasurementDtoCopyWithImpl(this._self, this._then);

  final _OrderMeasurementDto _self;
  final $Res Function(_OrderMeasurementDto) _then;

/// Create a copy of OrderMeasurementDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? roomName = freezed,Object? corniceLengthM = freezed,Object? heightM = freezed,Object? layers = freezed,Object? coefficient = freezed,Object? note = freezed,Object? parts = null,Object? accessories = null,}) {
  return _then(_OrderMeasurementDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,roomName: freezed == roomName ? _self.roomName : roomName // ignore: cast_nullable_to_non_nullable
as String?,corniceLengthM: freezed == corniceLengthM ? _self.corniceLengthM : corniceLengthM // ignore: cast_nullable_to_non_nullable
as String?,heightM: freezed == heightM ? _self.heightM : heightM // ignore: cast_nullable_to_non_nullable
as String?,layers: freezed == layers ? _self.layers : layers // ignore: cast_nullable_to_non_nullable
as List<String>?,coefficient: freezed == coefficient ? _self.coefficient : coefficient // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,parts: null == parts ? _self.parts : parts // ignore: cast_nullable_to_non_nullable
as List<OrderCurtainPartDto>,accessories: null == accessories ? _self.accessories : accessories // ignore: cast_nullable_to_non_nullable
as List<OrderAccessoryDto>,
  ));
}


}

// dart format on
