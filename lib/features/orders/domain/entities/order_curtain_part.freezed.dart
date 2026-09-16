// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_curtain_part.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderCurtainPart {

 String get id; Map<String, dynamic>? get variant;// simplified for now, could be its own entity
 String? get role; double? get widthM; double? get heightM; double? get coefficient; double? get areaSqm; int? get pricePerSqm; int? get total; int? get sortOrder;
/// Create a copy of OrderCurtainPart
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderCurtainPartCopyWith<OrderCurtainPart> get copyWith => _$OrderCurtainPartCopyWithImpl<OrderCurtainPart>(this as OrderCurtainPart, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderCurtainPart&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.variant, variant)&&(identical(other.role, role) || other.role == role)&&(identical(other.widthM, widthM) || other.widthM == widthM)&&(identical(other.heightM, heightM) || other.heightM == heightM)&&(identical(other.coefficient, coefficient) || other.coefficient == coefficient)&&(identical(other.areaSqm, areaSqm) || other.areaSqm == areaSqm)&&(identical(other.pricePerSqm, pricePerSqm) || other.pricePerSqm == pricePerSqm)&&(identical(other.total, total) || other.total == total)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(variant),role,widthM,heightM,coefficient,areaSqm,pricePerSqm,total,sortOrder);

@override
String toString() {
  return 'OrderCurtainPart(id: $id, variant: $variant, role: $role, widthM: $widthM, heightM: $heightM, coefficient: $coefficient, areaSqm: $areaSqm, pricePerSqm: $pricePerSqm, total: $total, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class $OrderCurtainPartCopyWith<$Res>  {
  factory $OrderCurtainPartCopyWith(OrderCurtainPart value, $Res Function(OrderCurtainPart) _then) = _$OrderCurtainPartCopyWithImpl;
@useResult
$Res call({
 String id, Map<String, dynamic>? variant, String? role, double? widthM, double? heightM, double? coefficient, double? areaSqm, int? pricePerSqm, int? total, int? sortOrder
});




}
/// @nodoc
class _$OrderCurtainPartCopyWithImpl<$Res>
    implements $OrderCurtainPartCopyWith<$Res> {
  _$OrderCurtainPartCopyWithImpl(this._self, this._then);

  final OrderCurtainPart _self;
  final $Res Function(OrderCurtainPart) _then;

/// Create a copy of OrderCurtainPart
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? variant = freezed,Object? role = freezed,Object? widthM = freezed,Object? heightM = freezed,Object? coefficient = freezed,Object? areaSqm = freezed,Object? pricePerSqm = freezed,Object? total = freezed,Object? sortOrder = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,variant: freezed == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,widthM: freezed == widthM ? _self.widthM : widthM // ignore: cast_nullable_to_non_nullable
as double?,heightM: freezed == heightM ? _self.heightM : heightM // ignore: cast_nullable_to_non_nullable
as double?,coefficient: freezed == coefficient ? _self.coefficient : coefficient // ignore: cast_nullable_to_non_nullable
as double?,areaSqm: freezed == areaSqm ? _self.areaSqm : areaSqm // ignore: cast_nullable_to_non_nullable
as double?,pricePerSqm: freezed == pricePerSqm ? _self.pricePerSqm : pricePerSqm // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderCurtainPart].
extension OrderCurtainPartPatterns on OrderCurtainPart {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderCurtainPart value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderCurtainPart() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderCurtainPart value)  $default,){
final _that = this;
switch (_that) {
case _OrderCurtainPart():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderCurtainPart value)?  $default,){
final _that = this;
switch (_that) {
case _OrderCurtainPart() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  Map<String, dynamic>? variant,  String? role,  double? widthM,  double? heightM,  double? coefficient,  double? areaSqm,  int? pricePerSqm,  int? total,  int? sortOrder)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderCurtainPart() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  Map<String, dynamic>? variant,  String? role,  double? widthM,  double? heightM,  double? coefficient,  double? areaSqm,  int? pricePerSqm,  int? total,  int? sortOrder)  $default,) {final _that = this;
switch (_that) {
case _OrderCurtainPart():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  Map<String, dynamic>? variant,  String? role,  double? widthM,  double? heightM,  double? coefficient,  double? areaSqm,  int? pricePerSqm,  int? total,  int? sortOrder)?  $default,) {final _that = this;
switch (_that) {
case _OrderCurtainPart() when $default != null:
return $default(_that.id,_that.variant,_that.role,_that.widthM,_that.heightM,_that.coefficient,_that.areaSqm,_that.pricePerSqm,_that.total,_that.sortOrder);case _:
  return null;

}
}

}

/// @nodoc


class _OrderCurtainPart implements OrderCurtainPart {
  const _OrderCurtainPart({required this.id, this.variant, this.role, this.widthM, this.heightM, this.coefficient, this.areaSqm, this.pricePerSqm, this.total, this.sortOrder});
  

@override final  String id;
@override final  Map<String, dynamic>? variant;
// simplified for now, could be its own entity
@override final  String? role;
@override final  double? widthM;
@override final  double? heightM;
@override final  double? coefficient;
@override final  double? areaSqm;
@override final  int? pricePerSqm;
@override final  int? total;
@override final  int? sortOrder;

/// Create a copy of OrderCurtainPart
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCurtainPartCopyWith<_OrderCurtainPart> get copyWith => __$OrderCurtainPartCopyWithImpl<_OrderCurtainPart>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderCurtainPart&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.variant, variant)&&(identical(other.role, role) || other.role == role)&&(identical(other.widthM, widthM) || other.widthM == widthM)&&(identical(other.heightM, heightM) || other.heightM == heightM)&&(identical(other.coefficient, coefficient) || other.coefficient == coefficient)&&(identical(other.areaSqm, areaSqm) || other.areaSqm == areaSqm)&&(identical(other.pricePerSqm, pricePerSqm) || other.pricePerSqm == pricePerSqm)&&(identical(other.total, total) || other.total == total)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder));
}


@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(variant),role,widthM,heightM,coefficient,areaSqm,pricePerSqm,total,sortOrder);

@override
String toString() {
  return 'OrderCurtainPart(id: $id, variant: $variant, role: $role, widthM: $widthM, heightM: $heightM, coefficient: $coefficient, areaSqm: $areaSqm, pricePerSqm: $pricePerSqm, total: $total, sortOrder: $sortOrder)';
}


}

/// @nodoc
abstract mixin class _$OrderCurtainPartCopyWith<$Res> implements $OrderCurtainPartCopyWith<$Res> {
  factory _$OrderCurtainPartCopyWith(_OrderCurtainPart value, $Res Function(_OrderCurtainPart) _then) = __$OrderCurtainPartCopyWithImpl;
@override @useResult
$Res call({
 String id, Map<String, dynamic>? variant, String? role, double? widthM, double? heightM, double? coefficient, double? areaSqm, int? pricePerSqm, int? total, int? sortOrder
});




}
/// @nodoc
class __$OrderCurtainPartCopyWithImpl<$Res>
    implements _$OrderCurtainPartCopyWith<$Res> {
  __$OrderCurtainPartCopyWithImpl(this._self, this._then);

  final _OrderCurtainPart _self;
  final $Res Function(_OrderCurtainPart) _then;

/// Create a copy of OrderCurtainPart
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? variant = freezed,Object? role = freezed,Object? widthM = freezed,Object? heightM = freezed,Object? coefficient = freezed,Object? areaSqm = freezed,Object? pricePerSqm = freezed,Object? total = freezed,Object? sortOrder = freezed,}) {
  return _then(_OrderCurtainPart(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,variant: freezed == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,widthM: freezed == widthM ? _self.widthM : widthM // ignore: cast_nullable_to_non_nullable
as double?,heightM: freezed == heightM ? _self.heightM : heightM // ignore: cast_nullable_to_non_nullable
as double?,coefficient: freezed == coefficient ? _self.coefficient : coefficient // ignore: cast_nullable_to_non_nullable
as double?,areaSqm: freezed == areaSqm ? _self.areaSqm : areaSqm // ignore: cast_nullable_to_non_nullable
as double?,pricePerSqm: freezed == pricePerSqm ? _self.pricePerSqm : pricePerSqm // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,sortOrder: freezed == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
