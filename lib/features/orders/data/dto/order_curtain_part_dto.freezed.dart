// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_curtain_part_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderCurtainPartDto {

 String get id; Map<String, dynamic>? get variant; String? get role;@JsonKey(name: 'width_m') String? get widthM;@JsonKey(name: 'height_m') String? get heightM; String? get coefficient;@JsonKey(name: 'area_sqm') String? get areaSqm;@JsonKey(name: 'price_per_sqm') String? get pricePerSqm; String? get total;@JsonKey(name: 'sort_order') int? get sortOrder;
/// Create a copy of OrderCurtainPartDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderCurtainPartDtoCopyWith<OrderCurtainPartDto> get copyWith => _$OrderCurtainPartDtoCopyWithImpl<OrderCurtainPartDto>(this as OrderCurtainPartDto, _$identity);

  /// Serializes this OrderCurtainPartDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderCurtainPartDto&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.variant, variant)&&(identical(other.role, role) || other.role == role)&&(identical(other.widthM, widthM) || other.widthM == widthM)&&(identical(other.heightM, heightM) || other.heightM == heightM)&&(identical(other.coefficient, coefficient) || other.coefficient == coefficient)&&(identical(other.areaSqm, areaSqm) || other.areaSqm == areaSqm)&&(identical(other.pricePerSqm, pricePerSqm) || other.pricePerSqm == pricePerSqm)&&(identical(other.total, total) || other.total == total)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(variant),role,widthM,heightM,coefficient,areaSqm,pricePerSqm,total,sortOrder);

@override
String toString() {
  return 'OrderCurtainPartDto(id: $id, variant: $variant, role: $role, widthM: $widthM, heightM: $heightM, coefficient: $coefficient, areaSqm: $areaSqm, pricePerSqm: $pricePerSqm, total: $total, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $OrderCurtainPartDtoCopyWith<$Res>  {
  factory $OrderCurtainPartDtoCopyWith(OrderCurtainPartDto value, $Res Function(OrderCurtainPartDto) _then) = _$OrderCurtainPartDtoCopyWithImpl;
@useResult
$Res call({
 String id, Map<String, dynamic>? variant, String? role,@JsonKey(name: 'width_m') String? widthM,@JsonKey(name: 'height_m') String? heightM, String? coefficient,@JsonKey(name: 'area_sqm') String? areaSqm,@JsonKey(name: 'price_per_sqm') String? pricePerSqm, String? total,@JsonKey(name: 'sort_order') int? sortOrder
});




}
/// @nodoc
class _$OrderCurtainPartDtoCopyWithImpl<$Res>
    implements $OrderCurtainPartDtoCopyWith<$Res> {
  _$OrderCurtainPartDtoCopyWithImpl(this._self, this._then);

  final OrderCurtainPartDto _self;
  final $Res Function(OrderCurtainPartDto) _then;

/// Create a copy of OrderCurtainPartDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? variant = freezed,Object? role = freezed,Object? widthM = freezed,Object? heightM = freezed,Object? coefficient = freezed,Object? areaSqm = freezed,Object? pricePerSqm = freezed,Object? total = freezed,Object? sortOrder = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,variant: freezed == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,widthM: freezed == widthM ? _self.widthM : widthM // ignore: cast_nullable_to_non_nullable
as String?,heightM: freezed == heightM ? _self.heightM : heightM // ignore: cast_nullable_to_non_nullable
as String?,coefficient: freezed == coefficient ? _self.coefficient : coefficient // ignore: cast_nullable_to_non_nullable
as String?,areaSqm: freezed == areaSqm ? _self.areaSqm : areaSqm // ignore: cast_nullable_to_non_nullable
as String?,pricePerSqm: freezed == pricePerSqm ? _self.pricePerSqm : pricePerSqm // ignore: cast_nullable_to_non_nullable
as String?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderCurtainPartDto].
extension OrderCurtainPartDtoPatterns on OrderCurtainPartDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderCurtainPartDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderCurtainPartDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderCurtainPartDto value)  $default,){
final _that = this;
switch (_that) {
case _OrderCurtainPartDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderCurtainPartDto value)?  $default,){
final _that = this;
switch (_that) {
case _OrderCurtainPartDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  Map<String, dynamic>? variant,  String? role, @JsonKey(name: 'width_m')  String? widthM, @JsonKey(name: 'height_m')  String? heightM,  String? coefficient, @JsonKey(name: 'area_sqm')  String? areaSqm, @JsonKey(name: 'price_per_sqm')  String? pricePerSqm,  String? total, @JsonKey(name: 'sort_order')  int? sortOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderCurtainPartDto() when $default != null:
return $default(_that.id,_that.variant,_that.role,_that.widthM,_that.heightM,_that.coefficient,_that.areaSqm,_that.pricePerSqm,_that.total,_that.sortOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  Map<String, dynamic>? variant,  String? role, @JsonKey(name: 'width_m')  String? widthM, @JsonKey(name: 'height_m')  String? heightM,  String? coefficient, @JsonKey(name: 'area_sqm')  String? areaSqm, @JsonKey(name: 'price_per_sqm')  String? pricePerSqm,  String? total, @JsonKey(name: 'sort_order')  int? sortOrder)  $default,) {final _that = this;
switch (_that) {
case _OrderCurtainPartDto():
return $default(_that.id,_that.variant,_that.role,_that.widthM,_that.heightM,_that.coefficient,_that.areaSqm,_that.pricePerSqm,_that.total,_that.sortOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  Map<String, dynamic>? variant,  String? role, @JsonKey(name: 'width_m')  String? widthM, @JsonKey(name: 'height_m')  String? heightM,  String? coefficient, @JsonKey(name: 'area_sqm')  String? areaSqm, @JsonKey(name: 'price_per_sqm')  String? pricePerSqm,  String? total, @JsonKey(name: 'sort_order')  int? sortOrder)?  $default,) {final _that = this;
switch (_that) {
case _OrderCurtainPartDto() when $default != null:
return $default(_that.id,_that.variant,_that.role,_that.widthM,_that.heightM,_that.coefficient,_that.areaSqm,_that.pricePerSqm,_that.total,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderCurtainPartDto implements OrderCurtainPartDto {
  const _OrderCurtainPartDto({required this.id, this.variant, this.role, @JsonKey(name: 'width_m') this.widthM, @JsonKey(name: 'height_m') this.heightM, this.coefficient, @JsonKey(name: 'area_sqm') this.areaSqm, @JsonKey(name: 'price_per_sqm') this.pricePerSqm, this.total, @JsonKey(name: 'sort_order') this.sortOrder});
  factory _OrderCurtainPartDto.fromJson(Map<String, dynamic> json) => _$OrderCurtainPartDtoFromJson(json);

@override final  String id;
@override final  Map<String, dynamic>? variant;
@override final  String? role;
@override@JsonKey(name: 'width_m') final  String? widthM;
@override@JsonKey(name: 'height_m') final  String? heightM;
@override final  String? coefficient;
@override@JsonKey(name: 'area_sqm') final  String? areaSqm;
@override@JsonKey(name: 'price_per_sqm') final  String? pricePerSqm;
@override final  String? total;
@override@JsonKey(name: 'sort_order') final  int? sortOrder;

/// Create a copy of OrderCurtainPartDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCurtainPartDtoCopyWith<_OrderCurtainPartDto> get copyWith => __$OrderCurtainPartDtoCopyWithImpl<_OrderCurtainPartDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderCurtainPartDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderCurtainPartDto&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.variant, variant)&&(identical(other.role, role) || other.role == role)&&(identical(other.widthM, widthM) || other.widthM == widthM)&&(identical(other.heightM, heightM) || other.heightM == heightM)&&(identical(other.coefficient, coefficient) || other.coefficient == coefficient)&&(identical(other.areaSqm, areaSqm) || other.areaSqm == areaSqm)&&(identical(other.pricePerSqm, pricePerSqm) || other.pricePerSqm == pricePerSqm)&&(identical(other.total, total) || other.total == total)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(variant),role,widthM,heightM,coefficient,areaSqm,pricePerSqm,total,sortOrder);

@override
String toString() {
  return 'OrderCurtainPartDto(id: $id, variant: $variant, role: $role, widthM: $widthM, heightM: $heightM, coefficient: $coefficient, areaSqm: $areaSqm, pricePerSqm: $pricePerSqm, total: $total, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class _$OrderCurtainPartDtoCopyWith<$Res> implements $OrderCurtainPartDtoCopyWith<$Res> {
  factory _$OrderCurtainPartDtoCopyWith(_OrderCurtainPartDto value, $Res Function(_OrderCurtainPartDto) _then) = __$OrderCurtainPartDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, Map<String, dynamic>? variant, String? role,@JsonKey(name: 'width_m') String? widthM,@JsonKey(name: 'height_m') String? heightM, String? coefficient,@JsonKey(name: 'area_sqm') String? areaSqm,@JsonKey(name: 'price_per_sqm') String? pricePerSqm, String? total,@JsonKey(name: 'sort_order') int? sortOrder
});




}
/// @nodoc
class __$OrderCurtainPartDtoCopyWithImpl<$Res>
    implements _$OrderCurtainPartDtoCopyWith<$Res> {
  __$OrderCurtainPartDtoCopyWithImpl(this._self, this._then);

  final _OrderCurtainPartDto _self;
  final $Res Function(_OrderCurtainPartDto) _then;

/// Create a copy of OrderCurtainPartDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? variant = freezed,Object? role = freezed,Object? widthM = freezed,Object? heightM = freezed,Object? coefficient = freezed,Object? areaSqm = freezed,Object? pricePerSqm = freezed,Object? total = freezed,Object? sortOrder = freezed,}) {
  return _then(_OrderCurtainPartDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,variant: freezed == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,widthM: freezed == widthM ? _self.widthM : widthM // ignore: cast_nullable_to_non_nullable
as String?,heightM: freezed == heightM ? _self.heightM : heightM // ignore: cast_nullable_to_non_nullable
as String?,coefficient: freezed == coefficient ? _self.coefficient : coefficient // ignore: cast_nullable_to_non_nullable
as String?,areaSqm: freezed == areaSqm ? _self.areaSqm : areaSqm // ignore: cast_nullable_to_non_nullable
as String?,pricePerSqm: freezed == pricePerSqm ? _self.pricePerSqm : pricePerSqm // ignore: cast_nullable_to_non_nullable
as String?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as String?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
