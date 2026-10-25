// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderDraftPart {

 String get variantId; String get role; double? get widthM; double? get heightM; double? get coefficient;
/// Create a copy of OrderDraftPart
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDraftPartCopyWith<OrderDraftPart> get copyWith => _$OrderDraftPartCopyWithImpl<OrderDraftPart>(this as OrderDraftPart, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDraftPart&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.role, role) || other.role == role)&&(identical(other.widthM, widthM) || other.widthM == widthM)&&(identical(other.heightM, heightM) || other.heightM == heightM)&&(identical(other.coefficient, coefficient) || other.coefficient == coefficient));
}


@override
int get hashCode => Object.hash(runtimeType,variantId,role,widthM,heightM,coefficient);

@override
String toString() {
  return 'OrderDraftPart(variantId: $variantId, role: $role, widthM: $widthM, heightM: $heightM, coefficient: $coefficient)';
}


}

/// @nodoc
abstract mixin class $OrderDraftPartCopyWith<$Res>  {
  factory $OrderDraftPartCopyWith(OrderDraftPart value, $Res Function(OrderDraftPart) _then) = _$OrderDraftPartCopyWithImpl;
@useResult
$Res call({
 String variantId, String role, double? widthM, double? heightM, double? coefficient
});




}
/// @nodoc
class _$OrderDraftPartCopyWithImpl<$Res>
    implements $OrderDraftPartCopyWith<$Res> {
  _$OrderDraftPartCopyWithImpl(this._self, this._then);

  final OrderDraftPart _self;
  final $Res Function(OrderDraftPart) _then;

/// Create a copy of OrderDraftPart
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? variantId = null,Object? role = null,Object? widthM = freezed,Object? heightM = freezed,Object? coefficient = freezed,}) {
  return _then(_self.copyWith(
variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,widthM: freezed == widthM ? _self.widthM : widthM // ignore: cast_nullable_to_non_nullable
as double?,heightM: freezed == heightM ? _self.heightM : heightM // ignore: cast_nullable_to_non_nullable
as double?,coefficient: freezed == coefficient ? _self.coefficient : coefficient // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderDraftPart].
extension OrderDraftPartPatterns on OrderDraftPart {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderDraftPart value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderDraftPart() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderDraftPart value)  $default,){
final _that = this;
switch (_that) {
case _OrderDraftPart():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderDraftPart value)?  $default,){
final _that = this;
switch (_that) {
case _OrderDraftPart() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String variantId,  String role,  double? widthM,  double? heightM,  double? coefficient)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderDraftPart() when $default != null:
return $default(_that.variantId,_that.role,_that.widthM,_that.heightM,_that.coefficient);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String variantId,  String role,  double? widthM,  double? heightM,  double? coefficient)  $default,) {final _that = this;
switch (_that) {
case _OrderDraftPart():
return $default(_that.variantId,_that.role,_that.widthM,_that.heightM,_that.coefficient);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String variantId,  String role,  double? widthM,  double? heightM,  double? coefficient)?  $default,) {final _that = this;
switch (_that) {
case _OrderDraftPart() when $default != null:
return $default(_that.variantId,_that.role,_that.widthM,_that.heightM,_that.coefficient);case _:
  return null;

}
}

}

/// @nodoc


class _OrderDraftPart implements OrderDraftPart {
  const _OrderDraftPart({required this.variantId, required this.role, this.widthM, this.heightM, this.coefficient});
  

@override final  String variantId;
@override final  String role;
@override final  double? widthM;
@override final  double? heightM;
@override final  double? coefficient;

/// Create a copy of OrderDraftPart
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDraftPartCopyWith<_OrderDraftPart> get copyWith => __$OrderDraftPartCopyWithImpl<_OrderDraftPart>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDraftPart&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.role, role) || other.role == role)&&(identical(other.widthM, widthM) || other.widthM == widthM)&&(identical(other.heightM, heightM) || other.heightM == heightM)&&(identical(other.coefficient, coefficient) || other.coefficient == coefficient));
}


@override
int get hashCode => Object.hash(runtimeType,variantId,role,widthM,heightM,coefficient);

@override
String toString() {
  return 'OrderDraftPart(variantId: $variantId, role: $role, widthM: $widthM, heightM: $heightM, coefficient: $coefficient)';
}


}

/// @nodoc
abstract mixin class _$OrderDraftPartCopyWith<$Res> implements $OrderDraftPartCopyWith<$Res> {
  factory _$OrderDraftPartCopyWith(_OrderDraftPart value, $Res Function(_OrderDraftPart) _then) = __$OrderDraftPartCopyWithImpl;
@override @useResult
$Res call({
 String variantId, String role, double? widthM, double? heightM, double? coefficient
});




}
/// @nodoc
class __$OrderDraftPartCopyWithImpl<$Res>
    implements _$OrderDraftPartCopyWith<$Res> {
  __$OrderDraftPartCopyWithImpl(this._self, this._then);

  final _OrderDraftPart _self;
  final $Res Function(_OrderDraftPart) _then;

/// Create a copy of OrderDraftPart
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? variantId = null,Object? role = null,Object? widthM = freezed,Object? heightM = freezed,Object? coefficient = freezed,}) {
  return _then(_OrderDraftPart(
variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,widthM: freezed == widthM ? _self.widthM : widthM // ignore: cast_nullable_to_non_nullable
as double?,heightM: freezed == heightM ? _self.heightM : heightM // ignore: cast_nullable_to_non_nullable
as double?,coefficient: freezed == coefficient ? _self.coefficient : coefficient // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc
mixin _$OrderDraftAccessory {

 String get variantId; double get qty;
/// Create a copy of OrderDraftAccessory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDraftAccessoryCopyWith<OrderDraftAccessory> get copyWith => _$OrderDraftAccessoryCopyWithImpl<OrderDraftAccessory>(this as OrderDraftAccessory, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDraftAccessory&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.qty, qty) || other.qty == qty));
}


@override
int get hashCode => Object.hash(runtimeType,variantId,qty);

@override
String toString() {
  return 'OrderDraftAccessory(variantId: $variantId, qty: $qty)';
}


}

/// @nodoc
abstract mixin class $OrderDraftAccessoryCopyWith<$Res>  {
  factory $OrderDraftAccessoryCopyWith(OrderDraftAccessory value, $Res Function(OrderDraftAccessory) _then) = _$OrderDraftAccessoryCopyWithImpl;
@useResult
$Res call({
 String variantId, double qty
});




}
/// @nodoc
class _$OrderDraftAccessoryCopyWithImpl<$Res>
    implements $OrderDraftAccessoryCopyWith<$Res> {
  _$OrderDraftAccessoryCopyWithImpl(this._self, this._then);

  final OrderDraftAccessory _self;
  final $Res Function(OrderDraftAccessory) _then;

/// Create a copy of OrderDraftAccessory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? variantId = null,Object? qty = null,}) {
  return _then(_self.copyWith(
variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderDraftAccessory].
extension OrderDraftAccessoryPatterns on OrderDraftAccessory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderDraftAccessory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderDraftAccessory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderDraftAccessory value)  $default,){
final _that = this;
switch (_that) {
case _OrderDraftAccessory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderDraftAccessory value)?  $default,){
final _that = this;
switch (_that) {
case _OrderDraftAccessory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String variantId,  double qty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderDraftAccessory() when $default != null:
return $default(_that.variantId,_that.qty);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String variantId,  double qty)  $default,) {final _that = this;
switch (_that) {
case _OrderDraftAccessory():
return $default(_that.variantId,_that.qty);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String variantId,  double qty)?  $default,) {final _that = this;
switch (_that) {
case _OrderDraftAccessory() when $default != null:
return $default(_that.variantId,_that.qty);case _:
  return null;

}
}

}

/// @nodoc


class _OrderDraftAccessory implements OrderDraftAccessory {
  const _OrderDraftAccessory({required this.variantId, required this.qty});
  

@override final  String variantId;
@override final  double qty;

/// Create a copy of OrderDraftAccessory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDraftAccessoryCopyWith<_OrderDraftAccessory> get copyWith => __$OrderDraftAccessoryCopyWithImpl<_OrderDraftAccessory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDraftAccessory&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.qty, qty) || other.qty == qty));
}


@override
int get hashCode => Object.hash(runtimeType,variantId,qty);

@override
String toString() {
  return 'OrderDraftAccessory(variantId: $variantId, qty: $qty)';
}


}

/// @nodoc
abstract mixin class _$OrderDraftAccessoryCopyWith<$Res> implements $OrderDraftAccessoryCopyWith<$Res> {
  factory _$OrderDraftAccessoryCopyWith(_OrderDraftAccessory value, $Res Function(_OrderDraftAccessory) _then) = __$OrderDraftAccessoryCopyWithImpl;
@override @useResult
$Res call({
 String variantId, double qty
});




}
/// @nodoc
class __$OrderDraftAccessoryCopyWithImpl<$Res>
    implements _$OrderDraftAccessoryCopyWith<$Res> {
  __$OrderDraftAccessoryCopyWithImpl(this._self, this._then);

  final _OrderDraftAccessory _self;
  final $Res Function(_OrderDraftAccessory) _then;

/// Create a copy of OrderDraftAccessory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? variantId = null,Object? qty = null,}) {
  return _then(_OrderDraftAccessory(
variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$OrderDraftMeasurement {

 String? get roomName; double? get cornice; double? get height; double? get coefficient; List<OrderDraftPart> get parts; List<OrderDraftAccessory> get accessories;
/// Create a copy of OrderDraftMeasurement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDraftMeasurementCopyWith<OrderDraftMeasurement> get copyWith => _$OrderDraftMeasurementCopyWithImpl<OrderDraftMeasurement>(this as OrderDraftMeasurement, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDraftMeasurement&&(identical(other.roomName, roomName) || other.roomName == roomName)&&(identical(other.cornice, cornice) || other.cornice == cornice)&&(identical(other.height, height) || other.height == height)&&(identical(other.coefficient, coefficient) || other.coefficient == coefficient)&&const DeepCollectionEquality().equals(other.parts, parts)&&const DeepCollectionEquality().equals(other.accessories, accessories));
}


@override
int get hashCode => Object.hash(runtimeType,roomName,cornice,height,coefficient,const DeepCollectionEquality().hash(parts),const DeepCollectionEquality().hash(accessories));

@override
String toString() {
  return 'OrderDraftMeasurement(roomName: $roomName, cornice: $cornice, height: $height, coefficient: $coefficient, parts: $parts, accessories: $accessories)';
}


}

/// @nodoc
abstract mixin class $OrderDraftMeasurementCopyWith<$Res>  {
  factory $OrderDraftMeasurementCopyWith(OrderDraftMeasurement value, $Res Function(OrderDraftMeasurement) _then) = _$OrderDraftMeasurementCopyWithImpl;
@useResult
$Res call({
 String? roomName, double? cornice, double? height, double? coefficient, List<OrderDraftPart> parts, List<OrderDraftAccessory> accessories
});




}
/// @nodoc
class _$OrderDraftMeasurementCopyWithImpl<$Res>
    implements $OrderDraftMeasurementCopyWith<$Res> {
  _$OrderDraftMeasurementCopyWithImpl(this._self, this._then);

  final OrderDraftMeasurement _self;
  final $Res Function(OrderDraftMeasurement) _then;

/// Create a copy of OrderDraftMeasurement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roomName = freezed,Object? cornice = freezed,Object? height = freezed,Object? coefficient = freezed,Object? parts = null,Object? accessories = null,}) {
  return _then(_self.copyWith(
roomName: freezed == roomName ? _self.roomName : roomName // ignore: cast_nullable_to_non_nullable
as String?,cornice: freezed == cornice ? _self.cornice : cornice // ignore: cast_nullable_to_non_nullable
as double?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,coefficient: freezed == coefficient ? _self.coefficient : coefficient // ignore: cast_nullable_to_non_nullable
as double?,parts: null == parts ? _self.parts : parts // ignore: cast_nullable_to_non_nullable
as List<OrderDraftPart>,accessories: null == accessories ? _self.accessories : accessories // ignore: cast_nullable_to_non_nullable
as List<OrderDraftAccessory>,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderDraftMeasurement].
extension OrderDraftMeasurementPatterns on OrderDraftMeasurement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderDraftMeasurement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderDraftMeasurement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderDraftMeasurement value)  $default,){
final _that = this;
switch (_that) {
case _OrderDraftMeasurement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderDraftMeasurement value)?  $default,){
final _that = this;
switch (_that) {
case _OrderDraftMeasurement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? roomName,  double? cornice,  double? height,  double? coefficient,  List<OrderDraftPart> parts,  List<OrderDraftAccessory> accessories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderDraftMeasurement() when $default != null:
return $default(_that.roomName,_that.cornice,_that.height,_that.coefficient,_that.parts,_that.accessories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? roomName,  double? cornice,  double? height,  double? coefficient,  List<OrderDraftPart> parts,  List<OrderDraftAccessory> accessories)  $default,) {final _that = this;
switch (_that) {
case _OrderDraftMeasurement():
return $default(_that.roomName,_that.cornice,_that.height,_that.coefficient,_that.parts,_that.accessories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? roomName,  double? cornice,  double? height,  double? coefficient,  List<OrderDraftPart> parts,  List<OrderDraftAccessory> accessories)?  $default,) {final _that = this;
switch (_that) {
case _OrderDraftMeasurement() when $default != null:
return $default(_that.roomName,_that.cornice,_that.height,_that.coefficient,_that.parts,_that.accessories);case _:
  return null;

}
}

}

/// @nodoc


class _OrderDraftMeasurement implements OrderDraftMeasurement {
  const _OrderDraftMeasurement({this.roomName, this.cornice, this.height, this.coefficient, this.parts = const [], this.accessories = const []});
  

@override final  String? roomName;
@override final  double? cornice;
@override final  double? height;
@override final  double? coefficient;
@override@JsonKey() final  List<OrderDraftPart> parts;
@override@JsonKey() final  List<OrderDraftAccessory> accessories;

/// Create a copy of OrderDraftMeasurement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDraftMeasurementCopyWith<_OrderDraftMeasurement> get copyWith => __$OrderDraftMeasurementCopyWithImpl<_OrderDraftMeasurement>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDraftMeasurement&&(identical(other.roomName, roomName) || other.roomName == roomName)&&(identical(other.cornice, cornice) || other.cornice == cornice)&&(identical(other.height, height) || other.height == height)&&(identical(other.coefficient, coefficient) || other.coefficient == coefficient)&&const DeepCollectionEquality().equals(other.parts, parts)&&const DeepCollectionEquality().equals(other.accessories, accessories));
}


@override
int get hashCode => Object.hash(runtimeType,roomName,cornice,height,coefficient,const DeepCollectionEquality().hash(parts),const DeepCollectionEquality().hash(accessories));

@override
String toString() {
  return 'OrderDraftMeasurement(roomName: $roomName, cornice: $cornice, height: $height, coefficient: $coefficient, parts: $parts, accessories: $accessories)';
}


}

/// @nodoc
abstract mixin class _$OrderDraftMeasurementCopyWith<$Res> implements $OrderDraftMeasurementCopyWith<$Res> {
  factory _$OrderDraftMeasurementCopyWith(_OrderDraftMeasurement value, $Res Function(_OrderDraftMeasurement) _then) = __$OrderDraftMeasurementCopyWithImpl;
@override @useResult
$Res call({
 String? roomName, double? cornice, double? height, double? coefficient, List<OrderDraftPart> parts, List<OrderDraftAccessory> accessories
});




}
/// @nodoc
class __$OrderDraftMeasurementCopyWithImpl<$Res>
    implements _$OrderDraftMeasurementCopyWith<$Res> {
  __$OrderDraftMeasurementCopyWithImpl(this._self, this._then);

  final _OrderDraftMeasurement _self;
  final $Res Function(_OrderDraftMeasurement) _then;

/// Create a copy of OrderDraftMeasurement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roomName = freezed,Object? cornice = freezed,Object? height = freezed,Object? coefficient = freezed,Object? parts = null,Object? accessories = null,}) {
  return _then(_OrderDraftMeasurement(
roomName: freezed == roomName ? _self.roomName : roomName // ignore: cast_nullable_to_non_nullable
as String?,cornice: freezed == cornice ? _self.cornice : cornice // ignore: cast_nullable_to_non_nullable
as double?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,coefficient: freezed == coefficient ? _self.coefficient : coefficient // ignore: cast_nullable_to_non_nullable
as double?,parts: null == parts ? _self.parts : parts // ignore: cast_nullable_to_non_nullable
as List<OrderDraftPart>,accessories: null == accessories ? _self.accessories : accessories // ignore: cast_nullable_to_non_nullable
as List<OrderDraftAccessory>,
  ));
}


}

/// @nodoc
mixin _$OrderDraft {

 String? get customerName; String? get phone; String? get address; List<OrderDraftMeasurement> get measurements; int get total; int? get prepayment; DateTime? get deadline; List<String> get missingFields; List<String> get services; bool get delivery; double? get discountPercent; double? get prepaymentPercent; bool get customerFormRequired;
/// Create a copy of OrderDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDraftCopyWith<OrderDraft> get copyWith => _$OrderDraftCopyWithImpl<OrderDraft>(this as OrderDraft, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDraft&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other.measurements, measurements)&&(identical(other.total, total) || other.total == total)&&(identical(other.prepayment, prepayment) || other.prepayment == prepayment)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&const DeepCollectionEquality().equals(other.missingFields, missingFields)&&const DeepCollectionEquality().equals(other.services, services)&&(identical(other.delivery, delivery) || other.delivery == delivery)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.prepaymentPercent, prepaymentPercent) || other.prepaymentPercent == prepaymentPercent)&&(identical(other.customerFormRequired, customerFormRequired) || other.customerFormRequired == customerFormRequired));
}


@override
int get hashCode => Object.hash(runtimeType,customerName,phone,address,const DeepCollectionEquality().hash(measurements),total,prepayment,deadline,const DeepCollectionEquality().hash(missingFields),const DeepCollectionEquality().hash(services),delivery,discountPercent,prepaymentPercent,customerFormRequired);

@override
String toString() {
  return 'OrderDraft(customerName: $customerName, phone: $phone, address: $address, measurements: $measurements, total: $total, prepayment: $prepayment, deadline: $deadline, missingFields: $missingFields, services: $services, delivery: $delivery, discountPercent: $discountPercent, prepaymentPercent: $prepaymentPercent, customerFormRequired: $customerFormRequired)';
}


}

/// @nodoc
abstract mixin class $OrderDraftCopyWith<$Res>  {
  factory $OrderDraftCopyWith(OrderDraft value, $Res Function(OrderDraft) _then) = _$OrderDraftCopyWithImpl;
@useResult
$Res call({
 String? customerName, String? phone, String? address, List<OrderDraftMeasurement> measurements, int total, int? prepayment, DateTime? deadline, List<String> missingFields, List<String> services, bool delivery, double? discountPercent, double? prepaymentPercent, bool customerFormRequired
});




}
/// @nodoc
class _$OrderDraftCopyWithImpl<$Res>
    implements $OrderDraftCopyWith<$Res> {
  _$OrderDraftCopyWithImpl(this._self, this._then);

  final OrderDraft _self;
  final $Res Function(OrderDraft) _then;

/// Create a copy of OrderDraft
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customerName = freezed,Object? phone = freezed,Object? address = freezed,Object? measurements = null,Object? total = null,Object? prepayment = freezed,Object? deadline = freezed,Object? missingFields = null,Object? services = null,Object? delivery = null,Object? discountPercent = freezed,Object? prepaymentPercent = freezed,Object? customerFormRequired = null,}) {
  return _then(_self.copyWith(
customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,measurements: null == measurements ? _self.measurements : measurements // ignore: cast_nullable_to_non_nullable
as List<OrderDraftMeasurement>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,prepayment: freezed == prepayment ? _self.prepayment : prepayment // ignore: cast_nullable_to_non_nullable
as int?,deadline: freezed == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as DateTime?,missingFields: null == missingFields ? _self.missingFields : missingFields // ignore: cast_nullable_to_non_nullable
as List<String>,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<String>,delivery: null == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as bool,discountPercent: freezed == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as double?,prepaymentPercent: freezed == prepaymentPercent ? _self.prepaymentPercent : prepaymentPercent // ignore: cast_nullable_to_non_nullable
as double?,customerFormRequired: null == customerFormRequired ? _self.customerFormRequired : customerFormRequired // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderDraft].
extension OrderDraftPatterns on OrderDraft {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderDraft value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderDraft() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderDraft value)  $default,){
final _that = this;
switch (_that) {
case _OrderDraft():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderDraft value)?  $default,){
final _that = this;
switch (_that) {
case _OrderDraft() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? customerName,  String? phone,  String? address,  List<OrderDraftMeasurement> measurements,  int total,  int? prepayment,  DateTime? deadline,  List<String> missingFields,  List<String> services,  bool delivery,  double? discountPercent,  double? prepaymentPercent,  bool customerFormRequired)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderDraft() when $default != null:
return $default(_that.customerName,_that.phone,_that.address,_that.measurements,_that.total,_that.prepayment,_that.deadline,_that.missingFields,_that.services,_that.delivery,_that.discountPercent,_that.prepaymentPercent,_that.customerFormRequired);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? customerName,  String? phone,  String? address,  List<OrderDraftMeasurement> measurements,  int total,  int? prepayment,  DateTime? deadline,  List<String> missingFields,  List<String> services,  bool delivery,  double? discountPercent,  double? prepaymentPercent,  bool customerFormRequired)  $default,) {final _that = this;
switch (_that) {
case _OrderDraft():
return $default(_that.customerName,_that.phone,_that.address,_that.measurements,_that.total,_that.prepayment,_that.deadline,_that.missingFields,_that.services,_that.delivery,_that.discountPercent,_that.prepaymentPercent,_that.customerFormRequired);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? customerName,  String? phone,  String? address,  List<OrderDraftMeasurement> measurements,  int total,  int? prepayment,  DateTime? deadline,  List<String> missingFields,  List<String> services,  bool delivery,  double? discountPercent,  double? prepaymentPercent,  bool customerFormRequired)?  $default,) {final _that = this;
switch (_that) {
case _OrderDraft() when $default != null:
return $default(_that.customerName,_that.phone,_that.address,_that.measurements,_that.total,_that.prepayment,_that.deadline,_that.missingFields,_that.services,_that.delivery,_that.discountPercent,_that.prepaymentPercent,_that.customerFormRequired);case _:
  return null;

}
}

}

/// @nodoc


class _OrderDraft implements OrderDraft {
  const _OrderDraft({this.customerName, this.phone, this.address, required this.measurements, required this.total, this.prepayment, this.deadline, required this.missingFields, this.services = const [], this.delivery = false, this.discountPercent, this.prepaymentPercent, this.customerFormRequired = false});
  

@override final  String? customerName;
@override final  String? phone;
@override final  String? address;
@override final  List<OrderDraftMeasurement> measurements;
@override final  int total;
@override final  int? prepayment;
@override final  DateTime? deadline;
@override final  List<String> missingFields;
@override@JsonKey() final  List<String> services;
@override@JsonKey() final  bool delivery;
@override final  double? discountPercent;
@override final  double? prepaymentPercent;
@override@JsonKey() final  bool customerFormRequired;

/// Create a copy of OrderDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDraftCopyWith<_OrderDraft> get copyWith => __$OrderDraftCopyWithImpl<_OrderDraft>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDraft&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other.measurements, measurements)&&(identical(other.total, total) || other.total == total)&&(identical(other.prepayment, prepayment) || other.prepayment == prepayment)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&const DeepCollectionEquality().equals(other.missingFields, missingFields)&&const DeepCollectionEquality().equals(other.services, services)&&(identical(other.delivery, delivery) || other.delivery == delivery)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.prepaymentPercent, prepaymentPercent) || other.prepaymentPercent == prepaymentPercent)&&(identical(other.customerFormRequired, customerFormRequired) || other.customerFormRequired == customerFormRequired));
}


@override
int get hashCode => Object.hash(runtimeType,customerName,phone,address,const DeepCollectionEquality().hash(measurements),total,prepayment,deadline,const DeepCollectionEquality().hash(missingFields),const DeepCollectionEquality().hash(services),delivery,discountPercent,prepaymentPercent,customerFormRequired);

@override
String toString() {
  return 'OrderDraft(customerName: $customerName, phone: $phone, address: $address, measurements: $measurements, total: $total, prepayment: $prepayment, deadline: $deadline, missingFields: $missingFields, services: $services, delivery: $delivery, discountPercent: $discountPercent, prepaymentPercent: $prepaymentPercent, customerFormRequired: $customerFormRequired)';
}


}

/// @nodoc
abstract mixin class _$OrderDraftCopyWith<$Res> implements $OrderDraftCopyWith<$Res> {
  factory _$OrderDraftCopyWith(_OrderDraft value, $Res Function(_OrderDraft) _then) = __$OrderDraftCopyWithImpl;
@override @useResult
$Res call({
 String? customerName, String? phone, String? address, List<OrderDraftMeasurement> measurements, int total, int? prepayment, DateTime? deadline, List<String> missingFields, List<String> services, bool delivery, double? discountPercent, double? prepaymentPercent, bool customerFormRequired
});




}
/// @nodoc
class __$OrderDraftCopyWithImpl<$Res>
    implements _$OrderDraftCopyWith<$Res> {
  __$OrderDraftCopyWithImpl(this._self, this._then);

  final _OrderDraft _self;
  final $Res Function(_OrderDraft) _then;

/// Create a copy of OrderDraft
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customerName = freezed,Object? phone = freezed,Object? address = freezed,Object? measurements = null,Object? total = null,Object? prepayment = freezed,Object? deadline = freezed,Object? missingFields = null,Object? services = null,Object? delivery = null,Object? discountPercent = freezed,Object? prepaymentPercent = freezed,Object? customerFormRequired = null,}) {
  return _then(_OrderDraft(
customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,measurements: null == measurements ? _self.measurements : measurements // ignore: cast_nullable_to_non_nullable
as List<OrderDraftMeasurement>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,prepayment: freezed == prepayment ? _self.prepayment : prepayment // ignore: cast_nullable_to_non_nullable
as int?,deadline: freezed == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as DateTime?,missingFields: null == missingFields ? _self.missingFields : missingFields // ignore: cast_nullable_to_non_nullable
as List<String>,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<String>,delivery: null == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as bool,discountPercent: freezed == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as double?,prepaymentPercent: freezed == prepaymentPercent ? _self.prepaymentPercent : prepaymentPercent // ignore: cast_nullable_to_non_nullable
as double?,customerFormRequired: null == customerFormRequired ? _self.customerFormRequired : customerFormRequired // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
