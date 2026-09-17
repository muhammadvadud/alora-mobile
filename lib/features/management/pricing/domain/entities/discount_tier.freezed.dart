// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discount_tier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DiscountTier {

 String get id; int get minAmount; double get percent; bool get isActive; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of DiscountTier
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiscountTierCopyWith<DiscountTier> get copyWith => _$DiscountTierCopyWithImpl<DiscountTier>(this as DiscountTier, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiscountTier&&(identical(other.id, id) || other.id == id)&&(identical(other.minAmount, minAmount) || other.minAmount == minAmount)&&(identical(other.percent, percent) || other.percent == percent)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,minAmount,percent,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'DiscountTier(id: $id, minAmount: $minAmount, percent: $percent, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $DiscountTierCopyWith<$Res>  {
  factory $DiscountTierCopyWith(DiscountTier value, $Res Function(DiscountTier) _then) = _$DiscountTierCopyWithImpl;
@useResult
$Res call({
 String id, int minAmount, double percent, bool isActive, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$DiscountTierCopyWithImpl<$Res>
    implements $DiscountTierCopyWith<$Res> {
  _$DiscountTierCopyWithImpl(this._self, this._then);

  final DiscountTier _self;
  final $Res Function(DiscountTier) _then;

/// Create a copy of DiscountTier
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? minAmount = null,Object? percent = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,minAmount: null == minAmount ? _self.minAmount : minAmount // ignore: cast_nullable_to_non_nullable
as int,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as double,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [DiscountTier].
extension DiscountTierPatterns on DiscountTier {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiscountTier value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiscountTier() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiscountTier value)  $default,){
final _that = this;
switch (_that) {
case _DiscountTier():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiscountTier value)?  $default,){
final _that = this;
switch (_that) {
case _DiscountTier() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int minAmount,  double percent,  bool isActive,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiscountTier() when $default != null:
return $default(_that.id,_that.minAmount,_that.percent,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int minAmount,  double percent,  bool isActive,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DiscountTier():
return $default(_that.id,_that.minAmount,_that.percent,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int minAmount,  double percent,  bool isActive,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DiscountTier() when $default != null:
return $default(_that.id,_that.minAmount,_that.percent,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _DiscountTier implements DiscountTier {
  const _DiscountTier({required this.id, required this.minAmount, required this.percent, required this.isActive, required this.createdAt, required this.updatedAt});
  

@override final  String id;
@override final  int minAmount;
@override final  double percent;
@override final  bool isActive;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of DiscountTier
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiscountTierCopyWith<_DiscountTier> get copyWith => __$DiscountTierCopyWithImpl<_DiscountTier>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiscountTier&&(identical(other.id, id) || other.id == id)&&(identical(other.minAmount, minAmount) || other.minAmount == minAmount)&&(identical(other.percent, percent) || other.percent == percent)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,minAmount,percent,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'DiscountTier(id: $id, minAmount: $minAmount, percent: $percent, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DiscountTierCopyWith<$Res> implements $DiscountTierCopyWith<$Res> {
  factory _$DiscountTierCopyWith(_DiscountTier value, $Res Function(_DiscountTier) _then) = __$DiscountTierCopyWithImpl;
@override @useResult
$Res call({
 String id, int minAmount, double percent, bool isActive, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$DiscountTierCopyWithImpl<$Res>
    implements _$DiscountTierCopyWith<$Res> {
  __$DiscountTierCopyWithImpl(this._self, this._then);

  final _DiscountTier _self;
  final $Res Function(_DiscountTier) _then;

/// Create a copy of DiscountTier
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? minAmount = null,Object? percent = null,Object? isActive = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_DiscountTier(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,minAmount: null == minAmount ? _self.minAmount : minAmount // ignore: cast_nullable_to_non_nullable
as int,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as double,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
