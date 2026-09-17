// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calc_preview_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CalcPreviewRequestDto {

 List<CalcPreviewMeasurementDto> get measurements; List<String> get services;@JsonKey(name: 'discount_percent') String get discountPercent; bool get delivery;
/// Create a copy of CalcPreviewRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalcPreviewRequestDtoCopyWith<CalcPreviewRequestDto> get copyWith => _$CalcPreviewRequestDtoCopyWithImpl<CalcPreviewRequestDto>(this as CalcPreviewRequestDto, _$identity);

  /// Serializes this CalcPreviewRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalcPreviewRequestDto&&const DeepCollectionEquality().equals(other.measurements, measurements)&&const DeepCollectionEquality().equals(other.services, services)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.delivery, delivery) || other.delivery == delivery));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(measurements),const DeepCollectionEquality().hash(services),discountPercent,delivery);

@override
String toString() {
  return 'CalcPreviewRequestDto(measurements: $measurements, services: $services, discountPercent: $discountPercent, delivery: $delivery)';
}


}

/// @nodoc
abstract mixin class $CalcPreviewRequestDtoCopyWith<$Res>  {
  factory $CalcPreviewRequestDtoCopyWith(CalcPreviewRequestDto value, $Res Function(CalcPreviewRequestDto) _then) = _$CalcPreviewRequestDtoCopyWithImpl;
@useResult
$Res call({
 List<CalcPreviewMeasurementDto> measurements, List<String> services,@JsonKey(name: 'discount_percent') String discountPercent, bool delivery
});




}
/// @nodoc
class _$CalcPreviewRequestDtoCopyWithImpl<$Res>
    implements $CalcPreviewRequestDtoCopyWith<$Res> {
  _$CalcPreviewRequestDtoCopyWithImpl(this._self, this._then);

  final CalcPreviewRequestDto _self;
  final $Res Function(CalcPreviewRequestDto) _then;

/// Create a copy of CalcPreviewRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? measurements = null,Object? services = null,Object? discountPercent = null,Object? delivery = null,}) {
  return _then(_self.copyWith(
measurements: null == measurements ? _self.measurements : measurements // ignore: cast_nullable_to_non_nullable
as List<CalcPreviewMeasurementDto>,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<String>,discountPercent: null == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as String,delivery: null == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CalcPreviewRequestDto].
extension CalcPreviewRequestDtoPatterns on CalcPreviewRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalcPreviewRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalcPreviewRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalcPreviewRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _CalcPreviewRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalcPreviewRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _CalcPreviewRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CalcPreviewMeasurementDto> measurements,  List<String> services, @JsonKey(name: 'discount_percent')  String discountPercent,  bool delivery)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalcPreviewRequestDto() when $default != null:
return $default(_that.measurements,_that.services,_that.discountPercent,_that.delivery);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CalcPreviewMeasurementDto> measurements,  List<String> services, @JsonKey(name: 'discount_percent')  String discountPercent,  bool delivery)  $default,) {final _that = this;
switch (_that) {
case _CalcPreviewRequestDto():
return $default(_that.measurements,_that.services,_that.discountPercent,_that.delivery);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CalcPreviewMeasurementDto> measurements,  List<String> services, @JsonKey(name: 'discount_percent')  String discountPercent,  bool delivery)?  $default,) {final _that = this;
switch (_that) {
case _CalcPreviewRequestDto() when $default != null:
return $default(_that.measurements,_that.services,_that.discountPercent,_that.delivery);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CalcPreviewRequestDto implements CalcPreviewRequestDto {
  const _CalcPreviewRequestDto({required this.measurements, required this.services, @JsonKey(name: 'discount_percent') required this.discountPercent, required this.delivery});
  factory _CalcPreviewRequestDto.fromJson(Map<String, dynamic> json) => _$CalcPreviewRequestDtoFromJson(json);

@override final  List<CalcPreviewMeasurementDto> measurements;
@override final  List<String> services;
@override@JsonKey(name: 'discount_percent') final  String discountPercent;
@override final  bool delivery;

/// Create a copy of CalcPreviewRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalcPreviewRequestDtoCopyWith<_CalcPreviewRequestDto> get copyWith => __$CalcPreviewRequestDtoCopyWithImpl<_CalcPreviewRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalcPreviewRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalcPreviewRequestDto&&const DeepCollectionEquality().equals(other.measurements, measurements)&&const DeepCollectionEquality().equals(other.services, services)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.delivery, delivery) || other.delivery == delivery));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(measurements),const DeepCollectionEquality().hash(services),discountPercent,delivery);

@override
String toString() {
  return 'CalcPreviewRequestDto(measurements: $measurements, services: $services, discountPercent: $discountPercent, delivery: $delivery)';
}


}

/// @nodoc
abstract mixin class _$CalcPreviewRequestDtoCopyWith<$Res> implements $CalcPreviewRequestDtoCopyWith<$Res> {
  factory _$CalcPreviewRequestDtoCopyWith(_CalcPreviewRequestDto value, $Res Function(_CalcPreviewRequestDto) _then) = __$CalcPreviewRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 List<CalcPreviewMeasurementDto> measurements, List<String> services,@JsonKey(name: 'discount_percent') String discountPercent, bool delivery
});




}
/// @nodoc
class __$CalcPreviewRequestDtoCopyWithImpl<$Res>
    implements _$CalcPreviewRequestDtoCopyWith<$Res> {
  __$CalcPreviewRequestDtoCopyWithImpl(this._self, this._then);

  final _CalcPreviewRequestDto _self;
  final $Res Function(_CalcPreviewRequestDto) _then;

/// Create a copy of CalcPreviewRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? measurements = null,Object? services = null,Object? discountPercent = null,Object? delivery = null,}) {
  return _then(_CalcPreviewRequestDto(
measurements: null == measurements ? _self.measurements : measurements // ignore: cast_nullable_to_non_nullable
as List<CalcPreviewMeasurementDto>,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<String>,discountPercent: null == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as String,delivery: null == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$CalcPreviewMeasurementDto {

 String get length; String get height; List<CalcPreviewPartDto> get parts; List<CalcPreviewAccessoryDto> get accessories;
/// Create a copy of CalcPreviewMeasurementDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalcPreviewMeasurementDtoCopyWith<CalcPreviewMeasurementDto> get copyWith => _$CalcPreviewMeasurementDtoCopyWithImpl<CalcPreviewMeasurementDto>(this as CalcPreviewMeasurementDto, _$identity);

  /// Serializes this CalcPreviewMeasurementDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalcPreviewMeasurementDto&&(identical(other.length, length) || other.length == length)&&(identical(other.height, height) || other.height == height)&&const DeepCollectionEquality().equals(other.parts, parts)&&const DeepCollectionEquality().equals(other.accessories, accessories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,length,height,const DeepCollectionEquality().hash(parts),const DeepCollectionEquality().hash(accessories));

@override
String toString() {
  return 'CalcPreviewMeasurementDto(length: $length, height: $height, parts: $parts, accessories: $accessories)';
}


}

/// @nodoc
abstract mixin class $CalcPreviewMeasurementDtoCopyWith<$Res>  {
  factory $CalcPreviewMeasurementDtoCopyWith(CalcPreviewMeasurementDto value, $Res Function(CalcPreviewMeasurementDto) _then) = _$CalcPreviewMeasurementDtoCopyWithImpl;
@useResult
$Res call({
 String length, String height, List<CalcPreviewPartDto> parts, List<CalcPreviewAccessoryDto> accessories
});




}
/// @nodoc
class _$CalcPreviewMeasurementDtoCopyWithImpl<$Res>
    implements $CalcPreviewMeasurementDtoCopyWith<$Res> {
  _$CalcPreviewMeasurementDtoCopyWithImpl(this._self, this._then);

  final CalcPreviewMeasurementDto _self;
  final $Res Function(CalcPreviewMeasurementDto) _then;

/// Create a copy of CalcPreviewMeasurementDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? length = null,Object? height = null,Object? parts = null,Object? accessories = null,}) {
  return _then(_self.copyWith(
length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as String,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as String,parts: null == parts ? _self.parts : parts // ignore: cast_nullable_to_non_nullable
as List<CalcPreviewPartDto>,accessories: null == accessories ? _self.accessories : accessories // ignore: cast_nullable_to_non_nullable
as List<CalcPreviewAccessoryDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [CalcPreviewMeasurementDto].
extension CalcPreviewMeasurementDtoPatterns on CalcPreviewMeasurementDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalcPreviewMeasurementDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalcPreviewMeasurementDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalcPreviewMeasurementDto value)  $default,){
final _that = this;
switch (_that) {
case _CalcPreviewMeasurementDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalcPreviewMeasurementDto value)?  $default,){
final _that = this;
switch (_that) {
case _CalcPreviewMeasurementDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String length,  String height,  List<CalcPreviewPartDto> parts,  List<CalcPreviewAccessoryDto> accessories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalcPreviewMeasurementDto() when $default != null:
return $default(_that.length,_that.height,_that.parts,_that.accessories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String length,  String height,  List<CalcPreviewPartDto> parts,  List<CalcPreviewAccessoryDto> accessories)  $default,) {final _that = this;
switch (_that) {
case _CalcPreviewMeasurementDto():
return $default(_that.length,_that.height,_that.parts,_that.accessories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String length,  String height,  List<CalcPreviewPartDto> parts,  List<CalcPreviewAccessoryDto> accessories)?  $default,) {final _that = this;
switch (_that) {
case _CalcPreviewMeasurementDto() when $default != null:
return $default(_that.length,_that.height,_that.parts,_that.accessories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CalcPreviewMeasurementDto implements CalcPreviewMeasurementDto {
  const _CalcPreviewMeasurementDto({required this.length, required this.height, required this.parts, required this.accessories});
  factory _CalcPreviewMeasurementDto.fromJson(Map<String, dynamic> json) => _$CalcPreviewMeasurementDtoFromJson(json);

@override final  String length;
@override final  String height;
@override final  List<CalcPreviewPartDto> parts;
@override final  List<CalcPreviewAccessoryDto> accessories;

/// Create a copy of CalcPreviewMeasurementDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalcPreviewMeasurementDtoCopyWith<_CalcPreviewMeasurementDto> get copyWith => __$CalcPreviewMeasurementDtoCopyWithImpl<_CalcPreviewMeasurementDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalcPreviewMeasurementDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalcPreviewMeasurementDto&&(identical(other.length, length) || other.length == length)&&(identical(other.height, height) || other.height == height)&&const DeepCollectionEquality().equals(other.parts, parts)&&const DeepCollectionEquality().equals(other.accessories, accessories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,length,height,const DeepCollectionEquality().hash(parts),const DeepCollectionEquality().hash(accessories));

@override
String toString() {
  return 'CalcPreviewMeasurementDto(length: $length, height: $height, parts: $parts, accessories: $accessories)';
}


}

/// @nodoc
abstract mixin class _$CalcPreviewMeasurementDtoCopyWith<$Res> implements $CalcPreviewMeasurementDtoCopyWith<$Res> {
  factory _$CalcPreviewMeasurementDtoCopyWith(_CalcPreviewMeasurementDto value, $Res Function(_CalcPreviewMeasurementDto) _then) = __$CalcPreviewMeasurementDtoCopyWithImpl;
@override @useResult
$Res call({
 String length, String height, List<CalcPreviewPartDto> parts, List<CalcPreviewAccessoryDto> accessories
});




}
/// @nodoc
class __$CalcPreviewMeasurementDtoCopyWithImpl<$Res>
    implements _$CalcPreviewMeasurementDtoCopyWith<$Res> {
  __$CalcPreviewMeasurementDtoCopyWithImpl(this._self, this._then);

  final _CalcPreviewMeasurementDto _self;
  final $Res Function(_CalcPreviewMeasurementDto) _then;

/// Create a copy of CalcPreviewMeasurementDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? length = null,Object? height = null,Object? parts = null,Object? accessories = null,}) {
  return _then(_CalcPreviewMeasurementDto(
length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as String,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as String,parts: null == parts ? _self.parts : parts // ignore: cast_nullable_to_non_nullable
as List<CalcPreviewPartDto>,accessories: null == accessories ? _self.accessories : accessories // ignore: cast_nullable_to_non_nullable
as List<CalcPreviewAccessoryDto>,
  ));
}


}


/// @nodoc
mixin _$CalcPreviewPartDto {

@JsonKey(name: 'variant_id') String get variantId; String get role;@JsonKey(name: 'width_m') String get widthM;@JsonKey(name: 'height_m') String get heightM; String get coef;
/// Create a copy of CalcPreviewPartDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalcPreviewPartDtoCopyWith<CalcPreviewPartDto> get copyWith => _$CalcPreviewPartDtoCopyWithImpl<CalcPreviewPartDto>(this as CalcPreviewPartDto, _$identity);

  /// Serializes this CalcPreviewPartDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalcPreviewPartDto&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.role, role) || other.role == role)&&(identical(other.widthM, widthM) || other.widthM == widthM)&&(identical(other.heightM, heightM) || other.heightM == heightM)&&(identical(other.coef, coef) || other.coef == coef));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,variantId,role,widthM,heightM,coef);

@override
String toString() {
  return 'CalcPreviewPartDto(variantId: $variantId, role: $role, widthM: $widthM, heightM: $heightM, coef: $coef)';
}


}

/// @nodoc
abstract mixin class $CalcPreviewPartDtoCopyWith<$Res>  {
  factory $CalcPreviewPartDtoCopyWith(CalcPreviewPartDto value, $Res Function(CalcPreviewPartDto) _then) = _$CalcPreviewPartDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'variant_id') String variantId, String role,@JsonKey(name: 'width_m') String widthM,@JsonKey(name: 'height_m') String heightM, String coef
});




}
/// @nodoc
class _$CalcPreviewPartDtoCopyWithImpl<$Res>
    implements $CalcPreviewPartDtoCopyWith<$Res> {
  _$CalcPreviewPartDtoCopyWithImpl(this._self, this._then);

  final CalcPreviewPartDto _self;
  final $Res Function(CalcPreviewPartDto) _then;

/// Create a copy of CalcPreviewPartDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? variantId = null,Object? role = null,Object? widthM = null,Object? heightM = null,Object? coef = null,}) {
  return _then(_self.copyWith(
variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,widthM: null == widthM ? _self.widthM : widthM // ignore: cast_nullable_to_non_nullable
as String,heightM: null == heightM ? _self.heightM : heightM // ignore: cast_nullable_to_non_nullable
as String,coef: null == coef ? _self.coef : coef // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CalcPreviewPartDto].
extension CalcPreviewPartDtoPatterns on CalcPreviewPartDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalcPreviewPartDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalcPreviewPartDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalcPreviewPartDto value)  $default,){
final _that = this;
switch (_that) {
case _CalcPreviewPartDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalcPreviewPartDto value)?  $default,){
final _that = this;
switch (_that) {
case _CalcPreviewPartDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'variant_id')  String variantId,  String role, @JsonKey(name: 'width_m')  String widthM, @JsonKey(name: 'height_m')  String heightM,  String coef)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalcPreviewPartDto() when $default != null:
return $default(_that.variantId,_that.role,_that.widthM,_that.heightM,_that.coef);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'variant_id')  String variantId,  String role, @JsonKey(name: 'width_m')  String widthM, @JsonKey(name: 'height_m')  String heightM,  String coef)  $default,) {final _that = this;
switch (_that) {
case _CalcPreviewPartDto():
return $default(_that.variantId,_that.role,_that.widthM,_that.heightM,_that.coef);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'variant_id')  String variantId,  String role, @JsonKey(name: 'width_m')  String widthM, @JsonKey(name: 'height_m')  String heightM,  String coef)?  $default,) {final _that = this;
switch (_that) {
case _CalcPreviewPartDto() when $default != null:
return $default(_that.variantId,_that.role,_that.widthM,_that.heightM,_that.coef);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CalcPreviewPartDto implements CalcPreviewPartDto {
  const _CalcPreviewPartDto({@JsonKey(name: 'variant_id') required this.variantId, required this.role, @JsonKey(name: 'width_m') required this.widthM, @JsonKey(name: 'height_m') required this.heightM, required this.coef});
  factory _CalcPreviewPartDto.fromJson(Map<String, dynamic> json) => _$CalcPreviewPartDtoFromJson(json);

@override@JsonKey(name: 'variant_id') final  String variantId;
@override final  String role;
@override@JsonKey(name: 'width_m') final  String widthM;
@override@JsonKey(name: 'height_m') final  String heightM;
@override final  String coef;

/// Create a copy of CalcPreviewPartDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalcPreviewPartDtoCopyWith<_CalcPreviewPartDto> get copyWith => __$CalcPreviewPartDtoCopyWithImpl<_CalcPreviewPartDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalcPreviewPartDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalcPreviewPartDto&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.role, role) || other.role == role)&&(identical(other.widthM, widthM) || other.widthM == widthM)&&(identical(other.heightM, heightM) || other.heightM == heightM)&&(identical(other.coef, coef) || other.coef == coef));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,variantId,role,widthM,heightM,coef);

@override
String toString() {
  return 'CalcPreviewPartDto(variantId: $variantId, role: $role, widthM: $widthM, heightM: $heightM, coef: $coef)';
}


}

/// @nodoc
abstract mixin class _$CalcPreviewPartDtoCopyWith<$Res> implements $CalcPreviewPartDtoCopyWith<$Res> {
  factory _$CalcPreviewPartDtoCopyWith(_CalcPreviewPartDto value, $Res Function(_CalcPreviewPartDto) _then) = __$CalcPreviewPartDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'variant_id') String variantId, String role,@JsonKey(name: 'width_m') String widthM,@JsonKey(name: 'height_m') String heightM, String coef
});




}
/// @nodoc
class __$CalcPreviewPartDtoCopyWithImpl<$Res>
    implements _$CalcPreviewPartDtoCopyWith<$Res> {
  __$CalcPreviewPartDtoCopyWithImpl(this._self, this._then);

  final _CalcPreviewPartDto _self;
  final $Res Function(_CalcPreviewPartDto) _then;

/// Create a copy of CalcPreviewPartDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? variantId = null,Object? role = null,Object? widthM = null,Object? heightM = null,Object? coef = null,}) {
  return _then(_CalcPreviewPartDto(
variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,widthM: null == widthM ? _self.widthM : widthM // ignore: cast_nullable_to_non_nullable
as String,heightM: null == heightM ? _self.heightM : heightM // ignore: cast_nullable_to_non_nullable
as String,coef: null == coef ? _self.coef : coef // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CalcPreviewAccessoryDto {

@JsonKey(name: 'variant_id') String get variantId; String get qty;
/// Create a copy of CalcPreviewAccessoryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalcPreviewAccessoryDtoCopyWith<CalcPreviewAccessoryDto> get copyWith => _$CalcPreviewAccessoryDtoCopyWithImpl<CalcPreviewAccessoryDto>(this as CalcPreviewAccessoryDto, _$identity);

  /// Serializes this CalcPreviewAccessoryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalcPreviewAccessoryDto&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.qty, qty) || other.qty == qty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,variantId,qty);

@override
String toString() {
  return 'CalcPreviewAccessoryDto(variantId: $variantId, qty: $qty)';
}


}

/// @nodoc
abstract mixin class $CalcPreviewAccessoryDtoCopyWith<$Res>  {
  factory $CalcPreviewAccessoryDtoCopyWith(CalcPreviewAccessoryDto value, $Res Function(CalcPreviewAccessoryDto) _then) = _$CalcPreviewAccessoryDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'variant_id') String variantId, String qty
});




}
/// @nodoc
class _$CalcPreviewAccessoryDtoCopyWithImpl<$Res>
    implements $CalcPreviewAccessoryDtoCopyWith<$Res> {
  _$CalcPreviewAccessoryDtoCopyWithImpl(this._self, this._then);

  final CalcPreviewAccessoryDto _self;
  final $Res Function(CalcPreviewAccessoryDto) _then;

/// Create a copy of CalcPreviewAccessoryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? variantId = null,Object? qty = null,}) {
  return _then(_self.copyWith(
variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CalcPreviewAccessoryDto].
extension CalcPreviewAccessoryDtoPatterns on CalcPreviewAccessoryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalcPreviewAccessoryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalcPreviewAccessoryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalcPreviewAccessoryDto value)  $default,){
final _that = this;
switch (_that) {
case _CalcPreviewAccessoryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalcPreviewAccessoryDto value)?  $default,){
final _that = this;
switch (_that) {
case _CalcPreviewAccessoryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'variant_id')  String variantId,  String qty)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalcPreviewAccessoryDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'variant_id')  String variantId,  String qty)  $default,) {final _that = this;
switch (_that) {
case _CalcPreviewAccessoryDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'variant_id')  String variantId,  String qty)?  $default,) {final _that = this;
switch (_that) {
case _CalcPreviewAccessoryDto() when $default != null:
return $default(_that.variantId,_that.qty);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CalcPreviewAccessoryDto implements CalcPreviewAccessoryDto {
  const _CalcPreviewAccessoryDto({@JsonKey(name: 'variant_id') required this.variantId, required this.qty});
  factory _CalcPreviewAccessoryDto.fromJson(Map<String, dynamic> json) => _$CalcPreviewAccessoryDtoFromJson(json);

@override@JsonKey(name: 'variant_id') final  String variantId;
@override final  String qty;

/// Create a copy of CalcPreviewAccessoryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalcPreviewAccessoryDtoCopyWith<_CalcPreviewAccessoryDto> get copyWith => __$CalcPreviewAccessoryDtoCopyWithImpl<_CalcPreviewAccessoryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalcPreviewAccessoryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalcPreviewAccessoryDto&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.qty, qty) || other.qty == qty));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,variantId,qty);

@override
String toString() {
  return 'CalcPreviewAccessoryDto(variantId: $variantId, qty: $qty)';
}


}

/// @nodoc
abstract mixin class _$CalcPreviewAccessoryDtoCopyWith<$Res> implements $CalcPreviewAccessoryDtoCopyWith<$Res> {
  factory _$CalcPreviewAccessoryDtoCopyWith(_CalcPreviewAccessoryDto value, $Res Function(_CalcPreviewAccessoryDto) _then) = __$CalcPreviewAccessoryDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'variant_id') String variantId, String qty
});




}
/// @nodoc
class __$CalcPreviewAccessoryDtoCopyWithImpl<$Res>
    implements _$CalcPreviewAccessoryDtoCopyWith<$Res> {
  __$CalcPreviewAccessoryDtoCopyWithImpl(this._self, this._then);

  final _CalcPreviewAccessoryDto _self;
  final $Res Function(_CalcPreviewAccessoryDto) _then;

/// Create a copy of CalcPreviewAccessoryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? variantId = null,Object? qty = null,}) {
  return _then(_CalcPreviewAccessoryDto(
variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CalcPreviewResponseDto {

 List<CalcPreviewResponseMeasurementDto> get measurements; List<CalcPreviewResponseServiceDto> get services; String get subtotal;@JsonKey(name: 'tier_discount_percent') String get tierDiscountPercent;@JsonKey(name: 'manual_discount_percent') String get manualDiscountPercent;@JsonKey(name: 'discount_percent') String get discountPercent;@JsonKey(name: 'discount_amount') String get discountAmount;@JsonKey(name: 'delivery_amount') String get deliveryAmount; String get total; List<String> get warnings;
/// Create a copy of CalcPreviewResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalcPreviewResponseDtoCopyWith<CalcPreviewResponseDto> get copyWith => _$CalcPreviewResponseDtoCopyWithImpl<CalcPreviewResponseDto>(this as CalcPreviewResponseDto, _$identity);

  /// Serializes this CalcPreviewResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalcPreviewResponseDto&&const DeepCollectionEquality().equals(other.measurements, measurements)&&const DeepCollectionEquality().equals(other.services, services)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.tierDiscountPercent, tierDiscountPercent) || other.tierDiscountPercent == tierDiscountPercent)&&(identical(other.manualDiscountPercent, manualDiscountPercent) || other.manualDiscountPercent == manualDiscountPercent)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.deliveryAmount, deliveryAmount) || other.deliveryAmount == deliveryAmount)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other.warnings, warnings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(measurements),const DeepCollectionEquality().hash(services),subtotal,tierDiscountPercent,manualDiscountPercent,discountPercent,discountAmount,deliveryAmount,total,const DeepCollectionEquality().hash(warnings));

@override
String toString() {
  return 'CalcPreviewResponseDto(measurements: $measurements, services: $services, subtotal: $subtotal, tierDiscountPercent: $tierDiscountPercent, manualDiscountPercent: $manualDiscountPercent, discountPercent: $discountPercent, discountAmount: $discountAmount, deliveryAmount: $deliveryAmount, total: $total, warnings: $warnings)';
}


}

/// @nodoc
abstract mixin class $CalcPreviewResponseDtoCopyWith<$Res>  {
  factory $CalcPreviewResponseDtoCopyWith(CalcPreviewResponseDto value, $Res Function(CalcPreviewResponseDto) _then) = _$CalcPreviewResponseDtoCopyWithImpl;
@useResult
$Res call({
 List<CalcPreviewResponseMeasurementDto> measurements, List<CalcPreviewResponseServiceDto> services, String subtotal,@JsonKey(name: 'tier_discount_percent') String tierDiscountPercent,@JsonKey(name: 'manual_discount_percent') String manualDiscountPercent,@JsonKey(name: 'discount_percent') String discountPercent,@JsonKey(name: 'discount_amount') String discountAmount,@JsonKey(name: 'delivery_amount') String deliveryAmount, String total, List<String> warnings
});




}
/// @nodoc
class _$CalcPreviewResponseDtoCopyWithImpl<$Res>
    implements $CalcPreviewResponseDtoCopyWith<$Res> {
  _$CalcPreviewResponseDtoCopyWithImpl(this._self, this._then);

  final CalcPreviewResponseDto _self;
  final $Res Function(CalcPreviewResponseDto) _then;

/// Create a copy of CalcPreviewResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? measurements = null,Object? services = null,Object? subtotal = null,Object? tierDiscountPercent = null,Object? manualDiscountPercent = null,Object? discountPercent = null,Object? discountAmount = null,Object? deliveryAmount = null,Object? total = null,Object? warnings = null,}) {
  return _then(_self.copyWith(
measurements: null == measurements ? _self.measurements : measurements // ignore: cast_nullable_to_non_nullable
as List<CalcPreviewResponseMeasurementDto>,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<CalcPreviewResponseServiceDto>,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as String,tierDiscountPercent: null == tierDiscountPercent ? _self.tierDiscountPercent : tierDiscountPercent // ignore: cast_nullable_to_non_nullable
as String,manualDiscountPercent: null == manualDiscountPercent ? _self.manualDiscountPercent : manualDiscountPercent // ignore: cast_nullable_to_non_nullable
as String,discountPercent: null == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as String,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as String,deliveryAmount: null == deliveryAmount ? _self.deliveryAmount : deliveryAmount // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as String,warnings: null == warnings ? _self.warnings : warnings // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [CalcPreviewResponseDto].
extension CalcPreviewResponseDtoPatterns on CalcPreviewResponseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalcPreviewResponseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalcPreviewResponseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalcPreviewResponseDto value)  $default,){
final _that = this;
switch (_that) {
case _CalcPreviewResponseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalcPreviewResponseDto value)?  $default,){
final _that = this;
switch (_that) {
case _CalcPreviewResponseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CalcPreviewResponseMeasurementDto> measurements,  List<CalcPreviewResponseServiceDto> services,  String subtotal, @JsonKey(name: 'tier_discount_percent')  String tierDiscountPercent, @JsonKey(name: 'manual_discount_percent')  String manualDiscountPercent, @JsonKey(name: 'discount_percent')  String discountPercent, @JsonKey(name: 'discount_amount')  String discountAmount, @JsonKey(name: 'delivery_amount')  String deliveryAmount,  String total,  List<String> warnings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalcPreviewResponseDto() when $default != null:
return $default(_that.measurements,_that.services,_that.subtotal,_that.tierDiscountPercent,_that.manualDiscountPercent,_that.discountPercent,_that.discountAmount,_that.deliveryAmount,_that.total,_that.warnings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CalcPreviewResponseMeasurementDto> measurements,  List<CalcPreviewResponseServiceDto> services,  String subtotal, @JsonKey(name: 'tier_discount_percent')  String tierDiscountPercent, @JsonKey(name: 'manual_discount_percent')  String manualDiscountPercent, @JsonKey(name: 'discount_percent')  String discountPercent, @JsonKey(name: 'discount_amount')  String discountAmount, @JsonKey(name: 'delivery_amount')  String deliveryAmount,  String total,  List<String> warnings)  $default,) {final _that = this;
switch (_that) {
case _CalcPreviewResponseDto():
return $default(_that.measurements,_that.services,_that.subtotal,_that.tierDiscountPercent,_that.manualDiscountPercent,_that.discountPercent,_that.discountAmount,_that.deliveryAmount,_that.total,_that.warnings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CalcPreviewResponseMeasurementDto> measurements,  List<CalcPreviewResponseServiceDto> services,  String subtotal, @JsonKey(name: 'tier_discount_percent')  String tierDiscountPercent, @JsonKey(name: 'manual_discount_percent')  String manualDiscountPercent, @JsonKey(name: 'discount_percent')  String discountPercent, @JsonKey(name: 'discount_amount')  String discountAmount, @JsonKey(name: 'delivery_amount')  String deliveryAmount,  String total,  List<String> warnings)?  $default,) {final _that = this;
switch (_that) {
case _CalcPreviewResponseDto() when $default != null:
return $default(_that.measurements,_that.services,_that.subtotal,_that.tierDiscountPercent,_that.manualDiscountPercent,_that.discountPercent,_that.discountAmount,_that.deliveryAmount,_that.total,_that.warnings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CalcPreviewResponseDto implements CalcPreviewResponseDto {
  const _CalcPreviewResponseDto({required this.measurements, required this.services, required this.subtotal, @JsonKey(name: 'tier_discount_percent') required this.tierDiscountPercent, @JsonKey(name: 'manual_discount_percent') required this.manualDiscountPercent, @JsonKey(name: 'discount_percent') required this.discountPercent, @JsonKey(name: 'discount_amount') required this.discountAmount, @JsonKey(name: 'delivery_amount') required this.deliveryAmount, required this.total, required this.warnings});
  factory _CalcPreviewResponseDto.fromJson(Map<String, dynamic> json) => _$CalcPreviewResponseDtoFromJson(json);

@override final  List<CalcPreviewResponseMeasurementDto> measurements;
@override final  List<CalcPreviewResponseServiceDto> services;
@override final  String subtotal;
@override@JsonKey(name: 'tier_discount_percent') final  String tierDiscountPercent;
@override@JsonKey(name: 'manual_discount_percent') final  String manualDiscountPercent;
@override@JsonKey(name: 'discount_percent') final  String discountPercent;
@override@JsonKey(name: 'discount_amount') final  String discountAmount;
@override@JsonKey(name: 'delivery_amount') final  String deliveryAmount;
@override final  String total;
@override final  List<String> warnings;

/// Create a copy of CalcPreviewResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalcPreviewResponseDtoCopyWith<_CalcPreviewResponseDto> get copyWith => __$CalcPreviewResponseDtoCopyWithImpl<_CalcPreviewResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalcPreviewResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalcPreviewResponseDto&&const DeepCollectionEquality().equals(other.measurements, measurements)&&const DeepCollectionEquality().equals(other.services, services)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.tierDiscountPercent, tierDiscountPercent) || other.tierDiscountPercent == tierDiscountPercent)&&(identical(other.manualDiscountPercent, manualDiscountPercent) || other.manualDiscountPercent == manualDiscountPercent)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.deliveryAmount, deliveryAmount) || other.deliveryAmount == deliveryAmount)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other.warnings, warnings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(measurements),const DeepCollectionEquality().hash(services),subtotal,tierDiscountPercent,manualDiscountPercent,discountPercent,discountAmount,deliveryAmount,total,const DeepCollectionEquality().hash(warnings));

@override
String toString() {
  return 'CalcPreviewResponseDto(measurements: $measurements, services: $services, subtotal: $subtotal, tierDiscountPercent: $tierDiscountPercent, manualDiscountPercent: $manualDiscountPercent, discountPercent: $discountPercent, discountAmount: $discountAmount, deliveryAmount: $deliveryAmount, total: $total, warnings: $warnings)';
}


}

/// @nodoc
abstract mixin class _$CalcPreviewResponseDtoCopyWith<$Res> implements $CalcPreviewResponseDtoCopyWith<$Res> {
  factory _$CalcPreviewResponseDtoCopyWith(_CalcPreviewResponseDto value, $Res Function(_CalcPreviewResponseDto) _then) = __$CalcPreviewResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 List<CalcPreviewResponseMeasurementDto> measurements, List<CalcPreviewResponseServiceDto> services, String subtotal,@JsonKey(name: 'tier_discount_percent') String tierDiscountPercent,@JsonKey(name: 'manual_discount_percent') String manualDiscountPercent,@JsonKey(name: 'discount_percent') String discountPercent,@JsonKey(name: 'discount_amount') String discountAmount,@JsonKey(name: 'delivery_amount') String deliveryAmount, String total, List<String> warnings
});




}
/// @nodoc
class __$CalcPreviewResponseDtoCopyWithImpl<$Res>
    implements _$CalcPreviewResponseDtoCopyWith<$Res> {
  __$CalcPreviewResponseDtoCopyWithImpl(this._self, this._then);

  final _CalcPreviewResponseDto _self;
  final $Res Function(_CalcPreviewResponseDto) _then;

/// Create a copy of CalcPreviewResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? measurements = null,Object? services = null,Object? subtotal = null,Object? tierDiscountPercent = null,Object? manualDiscountPercent = null,Object? discountPercent = null,Object? discountAmount = null,Object? deliveryAmount = null,Object? total = null,Object? warnings = null,}) {
  return _then(_CalcPreviewResponseDto(
measurements: null == measurements ? _self.measurements : measurements // ignore: cast_nullable_to_non_nullable
as List<CalcPreviewResponseMeasurementDto>,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<CalcPreviewResponseServiceDto>,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as String,tierDiscountPercent: null == tierDiscountPercent ? _self.tierDiscountPercent : tierDiscountPercent // ignore: cast_nullable_to_non_nullable
as String,manualDiscountPercent: null == manualDiscountPercent ? _self.manualDiscountPercent : manualDiscountPercent // ignore: cast_nullable_to_non_nullable
as String,discountPercent: null == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as String,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as String,deliveryAmount: null == deliveryAmount ? _self.deliveryAmount : deliveryAmount // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as String,warnings: null == warnings ? _self.warnings : warnings // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$CalcPreviewResponseMeasurementDto {

@JsonKey(name: 'room_name') String get roomName; List<CalcPreviewResponsePartDto> get parts; List<CalcPreviewResponseAccessoryDto> get accessories;
/// Create a copy of CalcPreviewResponseMeasurementDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalcPreviewResponseMeasurementDtoCopyWith<CalcPreviewResponseMeasurementDto> get copyWith => _$CalcPreviewResponseMeasurementDtoCopyWithImpl<CalcPreviewResponseMeasurementDto>(this as CalcPreviewResponseMeasurementDto, _$identity);

  /// Serializes this CalcPreviewResponseMeasurementDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalcPreviewResponseMeasurementDto&&(identical(other.roomName, roomName) || other.roomName == roomName)&&const DeepCollectionEquality().equals(other.parts, parts)&&const DeepCollectionEquality().equals(other.accessories, accessories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roomName,const DeepCollectionEquality().hash(parts),const DeepCollectionEquality().hash(accessories));

@override
String toString() {
  return 'CalcPreviewResponseMeasurementDto(roomName: $roomName, parts: $parts, accessories: $accessories)';
}


}

/// @nodoc
abstract mixin class $CalcPreviewResponseMeasurementDtoCopyWith<$Res>  {
  factory $CalcPreviewResponseMeasurementDtoCopyWith(CalcPreviewResponseMeasurementDto value, $Res Function(CalcPreviewResponseMeasurementDto) _then) = _$CalcPreviewResponseMeasurementDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'room_name') String roomName, List<CalcPreviewResponsePartDto> parts, List<CalcPreviewResponseAccessoryDto> accessories
});




}
/// @nodoc
class _$CalcPreviewResponseMeasurementDtoCopyWithImpl<$Res>
    implements $CalcPreviewResponseMeasurementDtoCopyWith<$Res> {
  _$CalcPreviewResponseMeasurementDtoCopyWithImpl(this._self, this._then);

  final CalcPreviewResponseMeasurementDto _self;
  final $Res Function(CalcPreviewResponseMeasurementDto) _then;

/// Create a copy of CalcPreviewResponseMeasurementDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roomName = null,Object? parts = null,Object? accessories = null,}) {
  return _then(_self.copyWith(
roomName: null == roomName ? _self.roomName : roomName // ignore: cast_nullable_to_non_nullable
as String,parts: null == parts ? _self.parts : parts // ignore: cast_nullable_to_non_nullable
as List<CalcPreviewResponsePartDto>,accessories: null == accessories ? _self.accessories : accessories // ignore: cast_nullable_to_non_nullable
as List<CalcPreviewResponseAccessoryDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [CalcPreviewResponseMeasurementDto].
extension CalcPreviewResponseMeasurementDtoPatterns on CalcPreviewResponseMeasurementDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalcPreviewResponseMeasurementDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalcPreviewResponseMeasurementDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalcPreviewResponseMeasurementDto value)  $default,){
final _that = this;
switch (_that) {
case _CalcPreviewResponseMeasurementDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalcPreviewResponseMeasurementDto value)?  $default,){
final _that = this;
switch (_that) {
case _CalcPreviewResponseMeasurementDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'room_name')  String roomName,  List<CalcPreviewResponsePartDto> parts,  List<CalcPreviewResponseAccessoryDto> accessories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalcPreviewResponseMeasurementDto() when $default != null:
return $default(_that.roomName,_that.parts,_that.accessories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'room_name')  String roomName,  List<CalcPreviewResponsePartDto> parts,  List<CalcPreviewResponseAccessoryDto> accessories)  $default,) {final _that = this;
switch (_that) {
case _CalcPreviewResponseMeasurementDto():
return $default(_that.roomName,_that.parts,_that.accessories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'room_name')  String roomName,  List<CalcPreviewResponsePartDto> parts,  List<CalcPreviewResponseAccessoryDto> accessories)?  $default,) {final _that = this;
switch (_that) {
case _CalcPreviewResponseMeasurementDto() when $default != null:
return $default(_that.roomName,_that.parts,_that.accessories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CalcPreviewResponseMeasurementDto implements CalcPreviewResponseMeasurementDto {
  const _CalcPreviewResponseMeasurementDto({@JsonKey(name: 'room_name') required this.roomName, required this.parts, required this.accessories});
  factory _CalcPreviewResponseMeasurementDto.fromJson(Map<String, dynamic> json) => _$CalcPreviewResponseMeasurementDtoFromJson(json);

@override@JsonKey(name: 'room_name') final  String roomName;
@override final  List<CalcPreviewResponsePartDto> parts;
@override final  List<CalcPreviewResponseAccessoryDto> accessories;

/// Create a copy of CalcPreviewResponseMeasurementDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalcPreviewResponseMeasurementDtoCopyWith<_CalcPreviewResponseMeasurementDto> get copyWith => __$CalcPreviewResponseMeasurementDtoCopyWithImpl<_CalcPreviewResponseMeasurementDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalcPreviewResponseMeasurementDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalcPreviewResponseMeasurementDto&&(identical(other.roomName, roomName) || other.roomName == roomName)&&const DeepCollectionEquality().equals(other.parts, parts)&&const DeepCollectionEquality().equals(other.accessories, accessories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,roomName,const DeepCollectionEquality().hash(parts),const DeepCollectionEquality().hash(accessories));

@override
String toString() {
  return 'CalcPreviewResponseMeasurementDto(roomName: $roomName, parts: $parts, accessories: $accessories)';
}


}

/// @nodoc
abstract mixin class _$CalcPreviewResponseMeasurementDtoCopyWith<$Res> implements $CalcPreviewResponseMeasurementDtoCopyWith<$Res> {
  factory _$CalcPreviewResponseMeasurementDtoCopyWith(_CalcPreviewResponseMeasurementDto value, $Res Function(_CalcPreviewResponseMeasurementDto) _then) = __$CalcPreviewResponseMeasurementDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'room_name') String roomName, List<CalcPreviewResponsePartDto> parts, List<CalcPreviewResponseAccessoryDto> accessories
});




}
/// @nodoc
class __$CalcPreviewResponseMeasurementDtoCopyWithImpl<$Res>
    implements _$CalcPreviewResponseMeasurementDtoCopyWith<$Res> {
  __$CalcPreviewResponseMeasurementDtoCopyWithImpl(this._self, this._then);

  final _CalcPreviewResponseMeasurementDto _self;
  final $Res Function(_CalcPreviewResponseMeasurementDto) _then;

/// Create a copy of CalcPreviewResponseMeasurementDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roomName = null,Object? parts = null,Object? accessories = null,}) {
  return _then(_CalcPreviewResponseMeasurementDto(
roomName: null == roomName ? _self.roomName : roomName // ignore: cast_nullable_to_non_nullable
as String,parts: null == parts ? _self.parts : parts // ignore: cast_nullable_to_non_nullable
as List<CalcPreviewResponsePartDto>,accessories: null == accessories ? _self.accessories : accessories // ignore: cast_nullable_to_non_nullable
as List<CalcPreviewResponseAccessoryDto>,
  ));
}


}


/// @nodoc
mixin _$CalcPreviewResponsePartDto {

 String get role;@JsonKey(name: 'variant_id') String get variantId;@JsonKey(name: 'color_name') String get colorName;@JsonKey(name: 'width_m') String get widthM;@JsonKey(name: 'height_m') String get heightM; String get coef;@JsonKey(name: 'area_sqm') String get areaSqm;@JsonKey(name: 'price_per_sqm') String get pricePerSqm; String get total;
/// Create a copy of CalcPreviewResponsePartDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalcPreviewResponsePartDtoCopyWith<CalcPreviewResponsePartDto> get copyWith => _$CalcPreviewResponsePartDtoCopyWithImpl<CalcPreviewResponsePartDto>(this as CalcPreviewResponsePartDto, _$identity);

  /// Serializes this CalcPreviewResponsePartDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalcPreviewResponsePartDto&&(identical(other.role, role) || other.role == role)&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.colorName, colorName) || other.colorName == colorName)&&(identical(other.widthM, widthM) || other.widthM == widthM)&&(identical(other.heightM, heightM) || other.heightM == heightM)&&(identical(other.coef, coef) || other.coef == coef)&&(identical(other.areaSqm, areaSqm) || other.areaSqm == areaSqm)&&(identical(other.pricePerSqm, pricePerSqm) || other.pricePerSqm == pricePerSqm)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,variantId,colorName,widthM,heightM,coef,areaSqm,pricePerSqm,total);

@override
String toString() {
  return 'CalcPreviewResponsePartDto(role: $role, variantId: $variantId, colorName: $colorName, widthM: $widthM, heightM: $heightM, coef: $coef, areaSqm: $areaSqm, pricePerSqm: $pricePerSqm, total: $total)';
}


}

/// @nodoc
abstract mixin class $CalcPreviewResponsePartDtoCopyWith<$Res>  {
  factory $CalcPreviewResponsePartDtoCopyWith(CalcPreviewResponsePartDto value, $Res Function(CalcPreviewResponsePartDto) _then) = _$CalcPreviewResponsePartDtoCopyWithImpl;
@useResult
$Res call({
 String role,@JsonKey(name: 'variant_id') String variantId,@JsonKey(name: 'color_name') String colorName,@JsonKey(name: 'width_m') String widthM,@JsonKey(name: 'height_m') String heightM, String coef,@JsonKey(name: 'area_sqm') String areaSqm,@JsonKey(name: 'price_per_sqm') String pricePerSqm, String total
});




}
/// @nodoc
class _$CalcPreviewResponsePartDtoCopyWithImpl<$Res>
    implements $CalcPreviewResponsePartDtoCopyWith<$Res> {
  _$CalcPreviewResponsePartDtoCopyWithImpl(this._self, this._then);

  final CalcPreviewResponsePartDto _self;
  final $Res Function(CalcPreviewResponsePartDto) _then;

/// Create a copy of CalcPreviewResponsePartDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? role = null,Object? variantId = null,Object? colorName = null,Object? widthM = null,Object? heightM = null,Object? coef = null,Object? areaSqm = null,Object? pricePerSqm = null,Object? total = null,}) {
  return _then(_self.copyWith(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,colorName: null == colorName ? _self.colorName : colorName // ignore: cast_nullable_to_non_nullable
as String,widthM: null == widthM ? _self.widthM : widthM // ignore: cast_nullable_to_non_nullable
as String,heightM: null == heightM ? _self.heightM : heightM // ignore: cast_nullable_to_non_nullable
as String,coef: null == coef ? _self.coef : coef // ignore: cast_nullable_to_non_nullable
as String,areaSqm: null == areaSqm ? _self.areaSqm : areaSqm // ignore: cast_nullable_to_non_nullable
as String,pricePerSqm: null == pricePerSqm ? _self.pricePerSqm : pricePerSqm // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CalcPreviewResponsePartDto].
extension CalcPreviewResponsePartDtoPatterns on CalcPreviewResponsePartDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalcPreviewResponsePartDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalcPreviewResponsePartDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalcPreviewResponsePartDto value)  $default,){
final _that = this;
switch (_that) {
case _CalcPreviewResponsePartDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalcPreviewResponsePartDto value)?  $default,){
final _that = this;
switch (_that) {
case _CalcPreviewResponsePartDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String role, @JsonKey(name: 'variant_id')  String variantId, @JsonKey(name: 'color_name')  String colorName, @JsonKey(name: 'width_m')  String widthM, @JsonKey(name: 'height_m')  String heightM,  String coef, @JsonKey(name: 'area_sqm')  String areaSqm, @JsonKey(name: 'price_per_sqm')  String pricePerSqm,  String total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalcPreviewResponsePartDto() when $default != null:
return $default(_that.role,_that.variantId,_that.colorName,_that.widthM,_that.heightM,_that.coef,_that.areaSqm,_that.pricePerSqm,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String role, @JsonKey(name: 'variant_id')  String variantId, @JsonKey(name: 'color_name')  String colorName, @JsonKey(name: 'width_m')  String widthM, @JsonKey(name: 'height_m')  String heightM,  String coef, @JsonKey(name: 'area_sqm')  String areaSqm, @JsonKey(name: 'price_per_sqm')  String pricePerSqm,  String total)  $default,) {final _that = this;
switch (_that) {
case _CalcPreviewResponsePartDto():
return $default(_that.role,_that.variantId,_that.colorName,_that.widthM,_that.heightM,_that.coef,_that.areaSqm,_that.pricePerSqm,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String role, @JsonKey(name: 'variant_id')  String variantId, @JsonKey(name: 'color_name')  String colorName, @JsonKey(name: 'width_m')  String widthM, @JsonKey(name: 'height_m')  String heightM,  String coef, @JsonKey(name: 'area_sqm')  String areaSqm, @JsonKey(name: 'price_per_sqm')  String pricePerSqm,  String total)?  $default,) {final _that = this;
switch (_that) {
case _CalcPreviewResponsePartDto() when $default != null:
return $default(_that.role,_that.variantId,_that.colorName,_that.widthM,_that.heightM,_that.coef,_that.areaSqm,_that.pricePerSqm,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CalcPreviewResponsePartDto implements CalcPreviewResponsePartDto {
  const _CalcPreviewResponsePartDto({required this.role, @JsonKey(name: 'variant_id') required this.variantId, @JsonKey(name: 'color_name') required this.colorName, @JsonKey(name: 'width_m') required this.widthM, @JsonKey(name: 'height_m') required this.heightM, required this.coef, @JsonKey(name: 'area_sqm') required this.areaSqm, @JsonKey(name: 'price_per_sqm') required this.pricePerSqm, required this.total});
  factory _CalcPreviewResponsePartDto.fromJson(Map<String, dynamic> json) => _$CalcPreviewResponsePartDtoFromJson(json);

@override final  String role;
@override@JsonKey(name: 'variant_id') final  String variantId;
@override@JsonKey(name: 'color_name') final  String colorName;
@override@JsonKey(name: 'width_m') final  String widthM;
@override@JsonKey(name: 'height_m') final  String heightM;
@override final  String coef;
@override@JsonKey(name: 'area_sqm') final  String areaSqm;
@override@JsonKey(name: 'price_per_sqm') final  String pricePerSqm;
@override final  String total;

/// Create a copy of CalcPreviewResponsePartDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalcPreviewResponsePartDtoCopyWith<_CalcPreviewResponsePartDto> get copyWith => __$CalcPreviewResponsePartDtoCopyWithImpl<_CalcPreviewResponsePartDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalcPreviewResponsePartDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalcPreviewResponsePartDto&&(identical(other.role, role) || other.role == role)&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.colorName, colorName) || other.colorName == colorName)&&(identical(other.widthM, widthM) || other.widthM == widthM)&&(identical(other.heightM, heightM) || other.heightM == heightM)&&(identical(other.coef, coef) || other.coef == coef)&&(identical(other.areaSqm, areaSqm) || other.areaSqm == areaSqm)&&(identical(other.pricePerSqm, pricePerSqm) || other.pricePerSqm == pricePerSqm)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,variantId,colorName,widthM,heightM,coef,areaSqm,pricePerSqm,total);

@override
String toString() {
  return 'CalcPreviewResponsePartDto(role: $role, variantId: $variantId, colorName: $colorName, widthM: $widthM, heightM: $heightM, coef: $coef, areaSqm: $areaSqm, pricePerSqm: $pricePerSqm, total: $total)';
}


}

/// @nodoc
abstract mixin class _$CalcPreviewResponsePartDtoCopyWith<$Res> implements $CalcPreviewResponsePartDtoCopyWith<$Res> {
  factory _$CalcPreviewResponsePartDtoCopyWith(_CalcPreviewResponsePartDto value, $Res Function(_CalcPreviewResponsePartDto) _then) = __$CalcPreviewResponsePartDtoCopyWithImpl;
@override @useResult
$Res call({
 String role,@JsonKey(name: 'variant_id') String variantId,@JsonKey(name: 'color_name') String colorName,@JsonKey(name: 'width_m') String widthM,@JsonKey(name: 'height_m') String heightM, String coef,@JsonKey(name: 'area_sqm') String areaSqm,@JsonKey(name: 'price_per_sqm') String pricePerSqm, String total
});




}
/// @nodoc
class __$CalcPreviewResponsePartDtoCopyWithImpl<$Res>
    implements _$CalcPreviewResponsePartDtoCopyWith<$Res> {
  __$CalcPreviewResponsePartDtoCopyWithImpl(this._self, this._then);

  final _CalcPreviewResponsePartDto _self;
  final $Res Function(_CalcPreviewResponsePartDto) _then;

/// Create a copy of CalcPreviewResponsePartDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? role = null,Object? variantId = null,Object? colorName = null,Object? widthM = null,Object? heightM = null,Object? coef = null,Object? areaSqm = null,Object? pricePerSqm = null,Object? total = null,}) {
  return _then(_CalcPreviewResponsePartDto(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,colorName: null == colorName ? _self.colorName : colorName // ignore: cast_nullable_to_non_nullable
as String,widthM: null == widthM ? _self.widthM : widthM // ignore: cast_nullable_to_non_nullable
as String,heightM: null == heightM ? _self.heightM : heightM // ignore: cast_nullable_to_non_nullable
as String,coef: null == coef ? _self.coef : coef // ignore: cast_nullable_to_non_nullable
as String,areaSqm: null == areaSqm ? _self.areaSqm : areaSqm // ignore: cast_nullable_to_non_nullable
as String,pricePerSqm: null == pricePerSqm ? _self.pricePerSqm : pricePerSqm // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CalcPreviewResponseAccessoryDto {

@JsonKey(name: 'variant_id') String get variantId;@JsonKey(name: 'color_name') String get colorName; String get qty;@JsonKey(name: 'unit_price') String get unitPrice; String get total;
/// Create a copy of CalcPreviewResponseAccessoryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalcPreviewResponseAccessoryDtoCopyWith<CalcPreviewResponseAccessoryDto> get copyWith => _$CalcPreviewResponseAccessoryDtoCopyWithImpl<CalcPreviewResponseAccessoryDto>(this as CalcPreviewResponseAccessoryDto, _$identity);

  /// Serializes this CalcPreviewResponseAccessoryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalcPreviewResponseAccessoryDto&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.colorName, colorName) || other.colorName == colorName)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,variantId,colorName,qty,unitPrice,total);

@override
String toString() {
  return 'CalcPreviewResponseAccessoryDto(variantId: $variantId, colorName: $colorName, qty: $qty, unitPrice: $unitPrice, total: $total)';
}


}

/// @nodoc
abstract mixin class $CalcPreviewResponseAccessoryDtoCopyWith<$Res>  {
  factory $CalcPreviewResponseAccessoryDtoCopyWith(CalcPreviewResponseAccessoryDto value, $Res Function(CalcPreviewResponseAccessoryDto) _then) = _$CalcPreviewResponseAccessoryDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'variant_id') String variantId,@JsonKey(name: 'color_name') String colorName, String qty,@JsonKey(name: 'unit_price') String unitPrice, String total
});




}
/// @nodoc
class _$CalcPreviewResponseAccessoryDtoCopyWithImpl<$Res>
    implements $CalcPreviewResponseAccessoryDtoCopyWith<$Res> {
  _$CalcPreviewResponseAccessoryDtoCopyWithImpl(this._self, this._then);

  final CalcPreviewResponseAccessoryDto _self;
  final $Res Function(CalcPreviewResponseAccessoryDto) _then;

/// Create a copy of CalcPreviewResponseAccessoryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? variantId = null,Object? colorName = null,Object? qty = null,Object? unitPrice = null,Object? total = null,}) {
  return _then(_self.copyWith(
variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,colorName: null == colorName ? _self.colorName : colorName // ignore: cast_nullable_to_non_nullable
as String,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as String,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CalcPreviewResponseAccessoryDto].
extension CalcPreviewResponseAccessoryDtoPatterns on CalcPreviewResponseAccessoryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalcPreviewResponseAccessoryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalcPreviewResponseAccessoryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalcPreviewResponseAccessoryDto value)  $default,){
final _that = this;
switch (_that) {
case _CalcPreviewResponseAccessoryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalcPreviewResponseAccessoryDto value)?  $default,){
final _that = this;
switch (_that) {
case _CalcPreviewResponseAccessoryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'variant_id')  String variantId, @JsonKey(name: 'color_name')  String colorName,  String qty, @JsonKey(name: 'unit_price')  String unitPrice,  String total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalcPreviewResponseAccessoryDto() when $default != null:
return $default(_that.variantId,_that.colorName,_that.qty,_that.unitPrice,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'variant_id')  String variantId, @JsonKey(name: 'color_name')  String colorName,  String qty, @JsonKey(name: 'unit_price')  String unitPrice,  String total)  $default,) {final _that = this;
switch (_that) {
case _CalcPreviewResponseAccessoryDto():
return $default(_that.variantId,_that.colorName,_that.qty,_that.unitPrice,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'variant_id')  String variantId, @JsonKey(name: 'color_name')  String colorName,  String qty, @JsonKey(name: 'unit_price')  String unitPrice,  String total)?  $default,) {final _that = this;
switch (_that) {
case _CalcPreviewResponseAccessoryDto() when $default != null:
return $default(_that.variantId,_that.colorName,_that.qty,_that.unitPrice,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CalcPreviewResponseAccessoryDto implements CalcPreviewResponseAccessoryDto {
  const _CalcPreviewResponseAccessoryDto({@JsonKey(name: 'variant_id') required this.variantId, @JsonKey(name: 'color_name') required this.colorName, required this.qty, @JsonKey(name: 'unit_price') required this.unitPrice, required this.total});
  factory _CalcPreviewResponseAccessoryDto.fromJson(Map<String, dynamic> json) => _$CalcPreviewResponseAccessoryDtoFromJson(json);

@override@JsonKey(name: 'variant_id') final  String variantId;
@override@JsonKey(name: 'color_name') final  String colorName;
@override final  String qty;
@override@JsonKey(name: 'unit_price') final  String unitPrice;
@override final  String total;

/// Create a copy of CalcPreviewResponseAccessoryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalcPreviewResponseAccessoryDtoCopyWith<_CalcPreviewResponseAccessoryDto> get copyWith => __$CalcPreviewResponseAccessoryDtoCopyWithImpl<_CalcPreviewResponseAccessoryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalcPreviewResponseAccessoryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalcPreviewResponseAccessoryDto&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.colorName, colorName) || other.colorName == colorName)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,variantId,colorName,qty,unitPrice,total);

@override
String toString() {
  return 'CalcPreviewResponseAccessoryDto(variantId: $variantId, colorName: $colorName, qty: $qty, unitPrice: $unitPrice, total: $total)';
}


}

/// @nodoc
abstract mixin class _$CalcPreviewResponseAccessoryDtoCopyWith<$Res> implements $CalcPreviewResponseAccessoryDtoCopyWith<$Res> {
  factory _$CalcPreviewResponseAccessoryDtoCopyWith(_CalcPreviewResponseAccessoryDto value, $Res Function(_CalcPreviewResponseAccessoryDto) _then) = __$CalcPreviewResponseAccessoryDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'variant_id') String variantId,@JsonKey(name: 'color_name') String colorName, String qty,@JsonKey(name: 'unit_price') String unitPrice, String total
});




}
/// @nodoc
class __$CalcPreviewResponseAccessoryDtoCopyWithImpl<$Res>
    implements _$CalcPreviewResponseAccessoryDtoCopyWith<$Res> {
  __$CalcPreviewResponseAccessoryDtoCopyWithImpl(this._self, this._then);

  final _CalcPreviewResponseAccessoryDto _self;
  final $Res Function(_CalcPreviewResponseAccessoryDto) _then;

/// Create a copy of CalcPreviewResponseAccessoryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? variantId = null,Object? colorName = null,Object? qty = null,Object? unitPrice = null,Object? total = null,}) {
  return _then(_CalcPreviewResponseAccessoryDto(
variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,colorName: null == colorName ? _self.colorName : colorName // ignore: cast_nullable_to_non_nullable
as String,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as String,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CalcPreviewResponseServiceDto {

 String get key; String get name; String get total;
/// Create a copy of CalcPreviewResponseServiceDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CalcPreviewResponseServiceDtoCopyWith<CalcPreviewResponseServiceDto> get copyWith => _$CalcPreviewResponseServiceDtoCopyWithImpl<CalcPreviewResponseServiceDto>(this as CalcPreviewResponseServiceDto, _$identity);

  /// Serializes this CalcPreviewResponseServiceDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CalcPreviewResponseServiceDto&&(identical(other.key, key) || other.key == key)&&(identical(other.name, name) || other.name == name)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,name,total);

@override
String toString() {
  return 'CalcPreviewResponseServiceDto(key: $key, name: $name, total: $total)';
}


}

/// @nodoc
abstract mixin class $CalcPreviewResponseServiceDtoCopyWith<$Res>  {
  factory $CalcPreviewResponseServiceDtoCopyWith(CalcPreviewResponseServiceDto value, $Res Function(CalcPreviewResponseServiceDto) _then) = _$CalcPreviewResponseServiceDtoCopyWithImpl;
@useResult
$Res call({
 String key, String name, String total
});




}
/// @nodoc
class _$CalcPreviewResponseServiceDtoCopyWithImpl<$Res>
    implements $CalcPreviewResponseServiceDtoCopyWith<$Res> {
  _$CalcPreviewResponseServiceDtoCopyWithImpl(this._self, this._then);

  final CalcPreviewResponseServiceDto _self;
  final $Res Function(CalcPreviewResponseServiceDto) _then;

/// Create a copy of CalcPreviewResponseServiceDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? name = null,Object? total = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CalcPreviewResponseServiceDto].
extension CalcPreviewResponseServiceDtoPatterns on CalcPreviewResponseServiceDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CalcPreviewResponseServiceDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CalcPreviewResponseServiceDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CalcPreviewResponseServiceDto value)  $default,){
final _that = this;
switch (_that) {
case _CalcPreviewResponseServiceDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CalcPreviewResponseServiceDto value)?  $default,){
final _that = this;
switch (_that) {
case _CalcPreviewResponseServiceDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  String name,  String total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CalcPreviewResponseServiceDto() when $default != null:
return $default(_that.key,_that.name,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  String name,  String total)  $default,) {final _that = this;
switch (_that) {
case _CalcPreviewResponseServiceDto():
return $default(_that.key,_that.name,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  String name,  String total)?  $default,) {final _that = this;
switch (_that) {
case _CalcPreviewResponseServiceDto() when $default != null:
return $default(_that.key,_that.name,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CalcPreviewResponseServiceDto implements CalcPreviewResponseServiceDto {
  const _CalcPreviewResponseServiceDto({required this.key, required this.name, required this.total});
  factory _CalcPreviewResponseServiceDto.fromJson(Map<String, dynamic> json) => _$CalcPreviewResponseServiceDtoFromJson(json);

@override final  String key;
@override final  String name;
@override final  String total;

/// Create a copy of CalcPreviewResponseServiceDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CalcPreviewResponseServiceDtoCopyWith<_CalcPreviewResponseServiceDto> get copyWith => __$CalcPreviewResponseServiceDtoCopyWithImpl<_CalcPreviewResponseServiceDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CalcPreviewResponseServiceDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CalcPreviewResponseServiceDto&&(identical(other.key, key) || other.key == key)&&(identical(other.name, name) || other.name == name)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,name,total);

@override
String toString() {
  return 'CalcPreviewResponseServiceDto(key: $key, name: $name, total: $total)';
}


}

/// @nodoc
abstract mixin class _$CalcPreviewResponseServiceDtoCopyWith<$Res> implements $CalcPreviewResponseServiceDtoCopyWith<$Res> {
  factory _$CalcPreviewResponseServiceDtoCopyWith(_CalcPreviewResponseServiceDto value, $Res Function(_CalcPreviewResponseServiceDto) _then) = __$CalcPreviewResponseServiceDtoCopyWithImpl;
@override @useResult
$Res call({
 String key, String name, String total
});




}
/// @nodoc
class __$CalcPreviewResponseServiceDtoCopyWithImpl<$Res>
    implements _$CalcPreviewResponseServiceDtoCopyWith<$Res> {
  __$CalcPreviewResponseServiceDtoCopyWithImpl(this._self, this._then);

  final _CalcPreviewResponseServiceDto _self;
  final $Res Function(_CalcPreviewResponseServiceDto) _then;

/// Create a copy of CalcPreviewResponseServiceDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? name = null,Object? total = null,}) {
  return _then(_CalcPreviewResponseServiceDto(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
