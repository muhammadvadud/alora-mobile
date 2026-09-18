// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pricing_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PricingState {

 List<CalcRule> get calcRules; List<ServicePrice> get services; List<DiscountTier> get discountTiers; DiscountPolicy? get discountPolicy; OrderDefaults? get orderDefaults; bool get isLoading; String? get error;
/// Create a copy of PricingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PricingStateCopyWith<PricingState> get copyWith => _$PricingStateCopyWithImpl<PricingState>(this as PricingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PricingState&&const DeepCollectionEquality().equals(other.calcRules, calcRules)&&const DeepCollectionEquality().equals(other.services, services)&&const DeepCollectionEquality().equals(other.discountTiers, discountTiers)&&(identical(other.discountPolicy, discountPolicy) || other.discountPolicy == discountPolicy)&&(identical(other.orderDefaults, orderDefaults) || other.orderDefaults == orderDefaults)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(calcRules),const DeepCollectionEquality().hash(services),const DeepCollectionEquality().hash(discountTiers),discountPolicy,orderDefaults,isLoading,error);

@override
String toString() {
  return 'PricingState(calcRules: $calcRules, services: $services, discountTiers: $discountTiers, discountPolicy: $discountPolicy, orderDefaults: $orderDefaults, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $PricingStateCopyWith<$Res>  {
  factory $PricingStateCopyWith(PricingState value, $Res Function(PricingState) _then) = _$PricingStateCopyWithImpl;
@useResult
$Res call({
 List<CalcRule> calcRules, List<ServicePrice> services, List<DiscountTier> discountTiers, DiscountPolicy? discountPolicy, OrderDefaults? orderDefaults, bool isLoading, String? error
});


$DiscountPolicyCopyWith<$Res>? get discountPolicy;$OrderDefaultsCopyWith<$Res>? get orderDefaults;

}
/// @nodoc
class _$PricingStateCopyWithImpl<$Res>
    implements $PricingStateCopyWith<$Res> {
  _$PricingStateCopyWithImpl(this._self, this._then);

  final PricingState _self;
  final $Res Function(PricingState) _then;

/// Create a copy of PricingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? calcRules = null,Object? services = null,Object? discountTiers = null,Object? discountPolicy = freezed,Object? orderDefaults = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
calcRules: null == calcRules ? _self.calcRules : calcRules // ignore: cast_nullable_to_non_nullable
as List<CalcRule>,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<ServicePrice>,discountTiers: null == discountTiers ? _self.discountTiers : discountTiers // ignore: cast_nullable_to_non_nullable
as List<DiscountTier>,discountPolicy: freezed == discountPolicy ? _self.discountPolicy : discountPolicy // ignore: cast_nullable_to_non_nullable
as DiscountPolicy?,orderDefaults: freezed == orderDefaults ? _self.orderDefaults : orderDefaults // ignore: cast_nullable_to_non_nullable
as OrderDefaults?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of PricingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiscountPolicyCopyWith<$Res>? get discountPolicy {
    if (_self.discountPolicy == null) {
    return null;
  }

  return $DiscountPolicyCopyWith<$Res>(_self.discountPolicy!, (value) {
    return _then(_self.copyWith(discountPolicy: value));
  });
}/// Create a copy of PricingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderDefaultsCopyWith<$Res>? get orderDefaults {
    if (_self.orderDefaults == null) {
    return null;
  }

  return $OrderDefaultsCopyWith<$Res>(_self.orderDefaults!, (value) {
    return _then(_self.copyWith(orderDefaults: value));
  });
}
}


/// Adds pattern-matching-related methods to [PricingState].
extension PricingStatePatterns on PricingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PricingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PricingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PricingState value)  $default,){
final _that = this;
switch (_that) {
case _PricingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PricingState value)?  $default,){
final _that = this;
switch (_that) {
case _PricingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CalcRule> calcRules,  List<ServicePrice> services,  List<DiscountTier> discountTiers,  DiscountPolicy? discountPolicy,  OrderDefaults? orderDefaults,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PricingState() when $default != null:
return $default(_that.calcRules,_that.services,_that.discountTiers,_that.discountPolicy,_that.orderDefaults,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CalcRule> calcRules,  List<ServicePrice> services,  List<DiscountTier> discountTiers,  DiscountPolicy? discountPolicy,  OrderDefaults? orderDefaults,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _PricingState():
return $default(_that.calcRules,_that.services,_that.discountTiers,_that.discountPolicy,_that.orderDefaults,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CalcRule> calcRules,  List<ServicePrice> services,  List<DiscountTier> discountTiers,  DiscountPolicy? discountPolicy,  OrderDefaults? orderDefaults,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _PricingState() when $default != null:
return $default(_that.calcRules,_that.services,_that.discountTiers,_that.discountPolicy,_that.orderDefaults,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _PricingState implements PricingState {
  const _PricingState({this.calcRules = const [], this.services = const [], this.discountTiers = const [], this.discountPolicy, this.orderDefaults, this.isLoading = false, this.error});
  

@override@JsonKey() final  List<CalcRule> calcRules;
@override@JsonKey() final  List<ServicePrice> services;
@override@JsonKey() final  List<DiscountTier> discountTiers;
@override final  DiscountPolicy? discountPolicy;
@override final  OrderDefaults? orderDefaults;
@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of PricingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PricingStateCopyWith<_PricingState> get copyWith => __$PricingStateCopyWithImpl<_PricingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PricingState&&const DeepCollectionEquality().equals(other.calcRules, calcRules)&&const DeepCollectionEquality().equals(other.services, services)&&const DeepCollectionEquality().equals(other.discountTiers, discountTiers)&&(identical(other.discountPolicy, discountPolicy) || other.discountPolicy == discountPolicy)&&(identical(other.orderDefaults, orderDefaults) || other.orderDefaults == orderDefaults)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(calcRules),const DeepCollectionEquality().hash(services),const DeepCollectionEquality().hash(discountTiers),discountPolicy,orderDefaults,isLoading,error);

@override
String toString() {
  return 'PricingState(calcRules: $calcRules, services: $services, discountTiers: $discountTiers, discountPolicy: $discountPolicy, orderDefaults: $orderDefaults, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$PricingStateCopyWith<$Res> implements $PricingStateCopyWith<$Res> {
  factory _$PricingStateCopyWith(_PricingState value, $Res Function(_PricingState) _then) = __$PricingStateCopyWithImpl;
@override @useResult
$Res call({
 List<CalcRule> calcRules, List<ServicePrice> services, List<DiscountTier> discountTiers, DiscountPolicy? discountPolicy, OrderDefaults? orderDefaults, bool isLoading, String? error
});


@override $DiscountPolicyCopyWith<$Res>? get discountPolicy;@override $OrderDefaultsCopyWith<$Res>? get orderDefaults;

}
/// @nodoc
class __$PricingStateCopyWithImpl<$Res>
    implements _$PricingStateCopyWith<$Res> {
  __$PricingStateCopyWithImpl(this._self, this._then);

  final _PricingState _self;
  final $Res Function(_PricingState) _then;

/// Create a copy of PricingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? calcRules = null,Object? services = null,Object? discountTiers = null,Object? discountPolicy = freezed,Object? orderDefaults = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_PricingState(
calcRules: null == calcRules ? _self.calcRules : calcRules // ignore: cast_nullable_to_non_nullable
as List<CalcRule>,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<ServicePrice>,discountTiers: null == discountTiers ? _self.discountTiers : discountTiers // ignore: cast_nullable_to_non_nullable
as List<DiscountTier>,discountPolicy: freezed == discountPolicy ? _self.discountPolicy : discountPolicy // ignore: cast_nullable_to_non_nullable
as DiscountPolicy?,orderDefaults: freezed == orderDefaults ? _self.orderDefaults : orderDefaults // ignore: cast_nullable_to_non_nullable
as OrderDefaults?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PricingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiscountPolicyCopyWith<$Res>? get discountPolicy {
    if (_self.discountPolicy == null) {
    return null;
  }

  return $DiscountPolicyCopyWith<$Res>(_self.discountPolicy!, (value) {
    return _then(_self.copyWith(discountPolicy: value));
  });
}/// Create a copy of PricingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderDefaultsCopyWith<$Res>? get orderDefaults {
    if (_self.orderDefaults == null) {
    return null;
  }

  return $OrderDefaultsCopyWith<$Res>(_self.orderDefaults!, (value) {
    return _then(_self.copyWith(orderDefaults: value));
  });
}
}

// dart format on
