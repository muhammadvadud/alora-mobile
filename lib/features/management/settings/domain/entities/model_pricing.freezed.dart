// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model_pricing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ModelPricing {

 String get id; String get provider; String get model; double get inputPer1m; double get outputPer1m; double get cachedInputPer1m; double get sttPerMinute; double get ttsPer1kChars; double get usdToUzs; bool get isActive; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of ModelPricing
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModelPricingCopyWith<ModelPricing> get copyWith => _$ModelPricingCopyWithImpl<ModelPricing>(this as ModelPricing, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModelPricing&&(identical(other.id, id) || other.id == id)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.model, model) || other.model == model)&&(identical(other.inputPer1m, inputPer1m) || other.inputPer1m == inputPer1m)&&(identical(other.outputPer1m, outputPer1m) || other.outputPer1m == outputPer1m)&&(identical(other.cachedInputPer1m, cachedInputPer1m) || other.cachedInputPer1m == cachedInputPer1m)&&(identical(other.sttPerMinute, sttPerMinute) || other.sttPerMinute == sttPerMinute)&&(identical(other.ttsPer1kChars, ttsPer1kChars) || other.ttsPer1kChars == ttsPer1kChars)&&(identical(other.usdToUzs, usdToUzs) || other.usdToUzs == usdToUzs)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,provider,model,inputPer1m,outputPer1m,cachedInputPer1m,sttPerMinute,ttsPer1kChars,usdToUzs,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'ModelPricing(id: $id, provider: $provider, model: $model, inputPer1m: $inputPer1m, outputPer1m: $outputPer1m, cachedInputPer1m: $cachedInputPer1m, sttPerMinute: $sttPerMinute, ttsPer1kChars: $ttsPer1kChars, usdToUzs: $usdToUzs, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ModelPricingCopyWith<$Res>  {
  factory $ModelPricingCopyWith(ModelPricing value, $Res Function(ModelPricing) _then) = _$ModelPricingCopyWithImpl;
@useResult
$Res call({
 String id, String provider, String model, double inputPer1m, double outputPer1m, double cachedInputPer1m, double sttPerMinute, double ttsPer1kChars, double usdToUzs, bool isActive, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$ModelPricingCopyWithImpl<$Res>
    implements $ModelPricingCopyWith<$Res> {
  _$ModelPricingCopyWithImpl(this._self, this._then);

  final ModelPricing _self;
  final $Res Function(ModelPricing) _then;

/// Create a copy of ModelPricing
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? provider = null,Object? model = null,Object? inputPer1m = null,Object? outputPer1m = null,Object? cachedInputPer1m = null,Object? sttPerMinute = null,Object? ttsPer1kChars = null,Object? usdToUzs = null,Object? isActive = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,inputPer1m: null == inputPer1m ? _self.inputPer1m : inputPer1m // ignore: cast_nullable_to_non_nullable
as double,outputPer1m: null == outputPer1m ? _self.outputPer1m : outputPer1m // ignore: cast_nullable_to_non_nullable
as double,cachedInputPer1m: null == cachedInputPer1m ? _self.cachedInputPer1m : cachedInputPer1m // ignore: cast_nullable_to_non_nullable
as double,sttPerMinute: null == sttPerMinute ? _self.sttPerMinute : sttPerMinute // ignore: cast_nullable_to_non_nullable
as double,ttsPer1kChars: null == ttsPer1kChars ? _self.ttsPer1kChars : ttsPer1kChars // ignore: cast_nullable_to_non_nullable
as double,usdToUzs: null == usdToUzs ? _self.usdToUzs : usdToUzs // ignore: cast_nullable_to_non_nullable
as double,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ModelPricing].
extension ModelPricingPatterns on ModelPricing {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModelPricing value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModelPricing() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModelPricing value)  $default,){
final _that = this;
switch (_that) {
case _ModelPricing():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModelPricing value)?  $default,){
final _that = this;
switch (_that) {
case _ModelPricing() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String provider,  String model,  double inputPer1m,  double outputPer1m,  double cachedInputPer1m,  double sttPerMinute,  double ttsPer1kChars,  double usdToUzs,  bool isActive,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModelPricing() when $default != null:
return $default(_that.id,_that.provider,_that.model,_that.inputPer1m,_that.outputPer1m,_that.cachedInputPer1m,_that.sttPerMinute,_that.ttsPer1kChars,_that.usdToUzs,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String provider,  String model,  double inputPer1m,  double outputPer1m,  double cachedInputPer1m,  double sttPerMinute,  double ttsPer1kChars,  double usdToUzs,  bool isActive,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ModelPricing():
return $default(_that.id,_that.provider,_that.model,_that.inputPer1m,_that.outputPer1m,_that.cachedInputPer1m,_that.sttPerMinute,_that.ttsPer1kChars,_that.usdToUzs,_that.isActive,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String provider,  String model,  double inputPer1m,  double outputPer1m,  double cachedInputPer1m,  double sttPerMinute,  double ttsPer1kChars,  double usdToUzs,  bool isActive,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ModelPricing() when $default != null:
return $default(_that.id,_that.provider,_that.model,_that.inputPer1m,_that.outputPer1m,_that.cachedInputPer1m,_that.sttPerMinute,_that.ttsPer1kChars,_that.usdToUzs,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _ModelPricing implements ModelPricing {
  const _ModelPricing({required this.id, required this.provider, required this.model, required this.inputPer1m, required this.outputPer1m, required this.cachedInputPer1m, required this.sttPerMinute, required this.ttsPer1kChars, required this.usdToUzs, this.isActive = true, this.createdAt, this.updatedAt});
  

@override final  String id;
@override final  String provider;
@override final  String model;
@override final  double inputPer1m;
@override final  double outputPer1m;
@override final  double cachedInputPer1m;
@override final  double sttPerMinute;
@override final  double ttsPer1kChars;
@override final  double usdToUzs;
@override@JsonKey() final  bool isActive;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of ModelPricing
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModelPricingCopyWith<_ModelPricing> get copyWith => __$ModelPricingCopyWithImpl<_ModelPricing>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModelPricing&&(identical(other.id, id) || other.id == id)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.model, model) || other.model == model)&&(identical(other.inputPer1m, inputPer1m) || other.inputPer1m == inputPer1m)&&(identical(other.outputPer1m, outputPer1m) || other.outputPer1m == outputPer1m)&&(identical(other.cachedInputPer1m, cachedInputPer1m) || other.cachedInputPer1m == cachedInputPer1m)&&(identical(other.sttPerMinute, sttPerMinute) || other.sttPerMinute == sttPerMinute)&&(identical(other.ttsPer1kChars, ttsPer1kChars) || other.ttsPer1kChars == ttsPer1kChars)&&(identical(other.usdToUzs, usdToUzs) || other.usdToUzs == usdToUzs)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,provider,model,inputPer1m,outputPer1m,cachedInputPer1m,sttPerMinute,ttsPer1kChars,usdToUzs,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'ModelPricing(id: $id, provider: $provider, model: $model, inputPer1m: $inputPer1m, outputPer1m: $outputPer1m, cachedInputPer1m: $cachedInputPer1m, sttPerMinute: $sttPerMinute, ttsPer1kChars: $ttsPer1kChars, usdToUzs: $usdToUzs, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ModelPricingCopyWith<$Res> implements $ModelPricingCopyWith<$Res> {
  factory _$ModelPricingCopyWith(_ModelPricing value, $Res Function(_ModelPricing) _then) = __$ModelPricingCopyWithImpl;
@override @useResult
$Res call({
 String id, String provider, String model, double inputPer1m, double outputPer1m, double cachedInputPer1m, double sttPerMinute, double ttsPer1kChars, double usdToUzs, bool isActive, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$ModelPricingCopyWithImpl<$Res>
    implements _$ModelPricingCopyWith<$Res> {
  __$ModelPricingCopyWithImpl(this._self, this._then);

  final _ModelPricing _self;
  final $Res Function(_ModelPricing) _then;

/// Create a copy of ModelPricing
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? provider = null,Object? model = null,Object? inputPer1m = null,Object? outputPer1m = null,Object? cachedInputPer1m = null,Object? sttPerMinute = null,Object? ttsPer1kChars = null,Object? usdToUzs = null,Object? isActive = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ModelPricing(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String,inputPer1m: null == inputPer1m ? _self.inputPer1m : inputPer1m // ignore: cast_nullable_to_non_nullable
as double,outputPer1m: null == outputPer1m ? _self.outputPer1m : outputPer1m // ignore: cast_nullable_to_non_nullable
as double,cachedInputPer1m: null == cachedInputPer1m ? _self.cachedInputPer1m : cachedInputPer1m // ignore: cast_nullable_to_non_nullable
as double,sttPerMinute: null == sttPerMinute ? _self.sttPerMinute : sttPerMinute // ignore: cast_nullable_to_non_nullable
as double,ttsPer1kChars: null == ttsPer1kChars ? _self.ttsPer1kChars : ttsPer1kChars // ignore: cast_nullable_to_non_nullable
as double,usdToUzs: null == usdToUzs ? _self.usdToUzs : usdToUzs // ignore: cast_nullable_to_non_nullable
as double,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
