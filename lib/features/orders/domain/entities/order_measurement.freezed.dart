// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_measurement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderMeasurement {

 String get id; String? get roomName; double? get corniceLengthM; double? get heightM; List<String> get layers; double? get coefficient; String? get note; List<OrderCurtainPart> get parts; List<OrderAccessory> get accessories;
/// Create a copy of OrderMeasurement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderMeasurementCopyWith<OrderMeasurement> get copyWith => _$OrderMeasurementCopyWithImpl<OrderMeasurement>(this as OrderMeasurement, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderMeasurement&&(identical(other.id, id) || other.id == id)&&(identical(other.roomName, roomName) || other.roomName == roomName)&&(identical(other.corniceLengthM, corniceLengthM) || other.corniceLengthM == corniceLengthM)&&(identical(other.heightM, heightM) || other.heightM == heightM)&&const DeepCollectionEquality().equals(other.layers, layers)&&(identical(other.coefficient, coefficient) || other.coefficient == coefficient)&&(identical(other.note, note) || other.note == note)&&const DeepCollectionEquality().equals(other.parts, parts)&&const DeepCollectionEquality().equals(other.accessories, accessories));
}


@override
int get hashCode => Object.hash(runtimeType,id,roomName,corniceLengthM,heightM,const DeepCollectionEquality().hash(layers),coefficient,note,const DeepCollectionEquality().hash(parts),const DeepCollectionEquality().hash(accessories));

@override
String toString() {
  return 'OrderMeasurement(id: $id, roomName: $roomName, corniceLengthM: $corniceLengthM, heightM: $heightM, layers: $layers, coefficient: $coefficient, note: $note, parts: $parts, accessories: $accessories)';
}


}

/// @nodoc
abstract mixin class $OrderMeasurementCopyWith<$Res>  {
  factory $OrderMeasurementCopyWith(OrderMeasurement value, $Res Function(OrderMeasurement) _then) = _$OrderMeasurementCopyWithImpl;
@useResult
$Res call({
 String id, String? roomName, double? corniceLengthM, double? heightM, List<String> layers, double? coefficient, String? note, List<OrderCurtainPart> parts, List<OrderAccessory> accessories
});




}
/// @nodoc
class _$OrderMeasurementCopyWithImpl<$Res>
    implements $OrderMeasurementCopyWith<$Res> {
  _$OrderMeasurementCopyWithImpl(this._self, this._then);

  final OrderMeasurement _self;
  final $Res Function(OrderMeasurement) _then;

/// Create a copy of OrderMeasurement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? roomName = freezed,Object? corniceLengthM = freezed,Object? heightM = freezed,Object? layers = null,Object? coefficient = freezed,Object? note = freezed,Object? parts = null,Object? accessories = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,roomName: freezed == roomName ? _self.roomName : roomName // ignore: cast_nullable_to_non_nullable
as String?,corniceLengthM: freezed == corniceLengthM ? _self.corniceLengthM : corniceLengthM // ignore: cast_nullable_to_non_nullable
as double?,heightM: freezed == heightM ? _self.heightM : heightM // ignore: cast_nullable_to_non_nullable
as double?,layers: null == layers ? _self.layers : layers // ignore: cast_nullable_to_non_nullable
as List<String>,coefficient: freezed == coefficient ? _self.coefficient : coefficient // ignore: cast_nullable_to_non_nullable
as double?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,parts: null == parts ? _self.parts : parts // ignore: cast_nullable_to_non_nullable
as List<OrderCurtainPart>,accessories: null == accessories ? _self.accessories : accessories // ignore: cast_nullable_to_non_nullable
as List<OrderAccessory>,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderMeasurement].
extension OrderMeasurementPatterns on OrderMeasurement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderMeasurement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderMeasurement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderMeasurement value)  $default,){
final _that = this;
switch (_that) {
case _OrderMeasurement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderMeasurement value)?  $default,){
final _that = this;
switch (_that) {
case _OrderMeasurement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? roomName,  double? corniceLengthM,  double? heightM,  List<String> layers,  double? coefficient,  String? note,  List<OrderCurtainPart> parts,  List<OrderAccessory> accessories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderMeasurement() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? roomName,  double? corniceLengthM,  double? heightM,  List<String> layers,  double? coefficient,  String? note,  List<OrderCurtainPart> parts,  List<OrderAccessory> accessories)  $default,) {final _that = this;
switch (_that) {
case _OrderMeasurement():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? roomName,  double? corniceLengthM,  double? heightM,  List<String> layers,  double? coefficient,  String? note,  List<OrderCurtainPart> parts,  List<OrderAccessory> accessories)?  $default,) {final _that = this;
switch (_that) {
case _OrderMeasurement() when $default != null:
return $default(_that.id,_that.roomName,_that.corniceLengthM,_that.heightM,_that.layers,_that.coefficient,_that.note,_that.parts,_that.accessories);case _:
  return null;

}
}

}

/// @nodoc


class _OrderMeasurement implements OrderMeasurement {
  const _OrderMeasurement({required this.id, this.roomName, this.corniceLengthM, this.heightM, this.layers = const [], this.coefficient, this.note, this.parts = const [], this.accessories = const []});
  

@override final  String id;
@override final  String? roomName;
@override final  double? corniceLengthM;
@override final  double? heightM;
@override@JsonKey() final  List<String> layers;
@override final  double? coefficient;
@override final  String? note;
@override@JsonKey() final  List<OrderCurtainPart> parts;
@override@JsonKey() final  List<OrderAccessory> accessories;

/// Create a copy of OrderMeasurement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderMeasurementCopyWith<_OrderMeasurement> get copyWith => __$OrderMeasurementCopyWithImpl<_OrderMeasurement>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderMeasurement&&(identical(other.id, id) || other.id == id)&&(identical(other.roomName, roomName) || other.roomName == roomName)&&(identical(other.corniceLengthM, corniceLengthM) || other.corniceLengthM == corniceLengthM)&&(identical(other.heightM, heightM) || other.heightM == heightM)&&const DeepCollectionEquality().equals(other.layers, layers)&&(identical(other.coefficient, coefficient) || other.coefficient == coefficient)&&(identical(other.note, note) || other.note == note)&&const DeepCollectionEquality().equals(other.parts, parts)&&const DeepCollectionEquality().equals(other.accessories, accessories));
}


@override
int get hashCode => Object.hash(runtimeType,id,roomName,corniceLengthM,heightM,const DeepCollectionEquality().hash(layers),coefficient,note,const DeepCollectionEquality().hash(parts),const DeepCollectionEquality().hash(accessories));

@override
String toString() {
  return 'OrderMeasurement(id: $id, roomName: $roomName, corniceLengthM: $corniceLengthM, heightM: $heightM, layers: $layers, coefficient: $coefficient, note: $note, parts: $parts, accessories: $accessories)';
}


}

/// @nodoc
abstract mixin class _$OrderMeasurementCopyWith<$Res> implements $OrderMeasurementCopyWith<$Res> {
  factory _$OrderMeasurementCopyWith(_OrderMeasurement value, $Res Function(_OrderMeasurement) _then) = __$OrderMeasurementCopyWithImpl;
@override @useResult
$Res call({
 String id, String? roomName, double? corniceLengthM, double? heightM, List<String> layers, double? coefficient, String? note, List<OrderCurtainPart> parts, List<OrderAccessory> accessories
});




}
/// @nodoc
class __$OrderMeasurementCopyWithImpl<$Res>
    implements _$OrderMeasurementCopyWith<$Res> {
  __$OrderMeasurementCopyWithImpl(this._self, this._then);

  final _OrderMeasurement _self;
  final $Res Function(_OrderMeasurement) _then;

/// Create a copy of OrderMeasurement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? roomName = freezed,Object? corniceLengthM = freezed,Object? heightM = freezed,Object? layers = null,Object? coefficient = freezed,Object? note = freezed,Object? parts = null,Object? accessories = null,}) {
  return _then(_OrderMeasurement(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,roomName: freezed == roomName ? _self.roomName : roomName // ignore: cast_nullable_to_non_nullable
as String?,corniceLengthM: freezed == corniceLengthM ? _self.corniceLengthM : corniceLengthM // ignore: cast_nullable_to_non_nullable
as double?,heightM: freezed == heightM ? _self.heightM : heightM // ignore: cast_nullable_to_non_nullable
as double?,layers: null == layers ? _self.layers : layers // ignore: cast_nullable_to_non_nullable
as List<String>,coefficient: freezed == coefficient ? _self.coefficient : coefficient // ignore: cast_nullable_to_non_nullable
as double?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,parts: null == parts ? _self.parts : parts // ignore: cast_nullable_to_non_nullable
as List<OrderCurtainPart>,accessories: null == accessories ? _self.accessories : accessories // ignore: cast_nullable_to_non_nullable
as List<OrderAccessory>,
  ));
}


}

// dart format on
