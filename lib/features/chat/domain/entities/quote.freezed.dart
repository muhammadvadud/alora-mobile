// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quote.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QuoteFabric {

 String get role; String get variantId; String get colorName; String get colorHex; double get widthM; double get heightM; double get coef; double get areaSqm; int get pricePerSqm; int get total;
/// Create a copy of QuoteFabric
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuoteFabricCopyWith<QuoteFabric> get copyWith => _$QuoteFabricCopyWithImpl<QuoteFabric>(this as QuoteFabric, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuoteFabric&&(identical(other.role, role) || other.role == role)&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.colorName, colorName) || other.colorName == colorName)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.widthM, widthM) || other.widthM == widthM)&&(identical(other.heightM, heightM) || other.heightM == heightM)&&(identical(other.coef, coef) || other.coef == coef)&&(identical(other.areaSqm, areaSqm) || other.areaSqm == areaSqm)&&(identical(other.pricePerSqm, pricePerSqm) || other.pricePerSqm == pricePerSqm)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,role,variantId,colorName,colorHex,widthM,heightM,coef,areaSqm,pricePerSqm,total);

@override
String toString() {
  return 'QuoteFabric(role: $role, variantId: $variantId, colorName: $colorName, colorHex: $colorHex, widthM: $widthM, heightM: $heightM, coef: $coef, areaSqm: $areaSqm, pricePerSqm: $pricePerSqm, total: $total)';
}


}

/// @nodoc
abstract mixin class $QuoteFabricCopyWith<$Res>  {
  factory $QuoteFabricCopyWith(QuoteFabric value, $Res Function(QuoteFabric) _then) = _$QuoteFabricCopyWithImpl;
@useResult
$Res call({
 String role, String variantId, String colorName, String colorHex, double widthM, double heightM, double coef, double areaSqm, int pricePerSqm, int total
});




}
/// @nodoc
class _$QuoteFabricCopyWithImpl<$Res>
    implements $QuoteFabricCopyWith<$Res> {
  _$QuoteFabricCopyWithImpl(this._self, this._then);

  final QuoteFabric _self;
  final $Res Function(QuoteFabric) _then;

/// Create a copy of QuoteFabric
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? role = null,Object? variantId = null,Object? colorName = null,Object? colorHex = null,Object? widthM = null,Object? heightM = null,Object? coef = null,Object? areaSqm = null,Object? pricePerSqm = null,Object? total = null,}) {
  return _then(_self.copyWith(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,colorName: null == colorName ? _self.colorName : colorName // ignore: cast_nullable_to_non_nullable
as String,colorHex: null == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String,widthM: null == widthM ? _self.widthM : widthM // ignore: cast_nullable_to_non_nullable
as double,heightM: null == heightM ? _self.heightM : heightM // ignore: cast_nullable_to_non_nullable
as double,coef: null == coef ? _self.coef : coef // ignore: cast_nullable_to_non_nullable
as double,areaSqm: null == areaSqm ? _self.areaSqm : areaSqm // ignore: cast_nullable_to_non_nullable
as double,pricePerSqm: null == pricePerSqm ? _self.pricePerSqm : pricePerSqm // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [QuoteFabric].
extension QuoteFabricPatterns on QuoteFabric {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuoteFabric value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuoteFabric() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuoteFabric value)  $default,){
final _that = this;
switch (_that) {
case _QuoteFabric():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuoteFabric value)?  $default,){
final _that = this;
switch (_that) {
case _QuoteFabric() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String role,  String variantId,  String colorName,  String colorHex,  double widthM,  double heightM,  double coef,  double areaSqm,  int pricePerSqm,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuoteFabric() when $default != null:
return $default(_that.role,_that.variantId,_that.colorName,_that.colorHex,_that.widthM,_that.heightM,_that.coef,_that.areaSqm,_that.pricePerSqm,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String role,  String variantId,  String colorName,  String colorHex,  double widthM,  double heightM,  double coef,  double areaSqm,  int pricePerSqm,  int total)  $default,) {final _that = this;
switch (_that) {
case _QuoteFabric():
return $default(_that.role,_that.variantId,_that.colorName,_that.colorHex,_that.widthM,_that.heightM,_that.coef,_that.areaSqm,_that.pricePerSqm,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String role,  String variantId,  String colorName,  String colorHex,  double widthM,  double heightM,  double coef,  double areaSqm,  int pricePerSqm,  int total)?  $default,) {final _that = this;
switch (_that) {
case _QuoteFabric() when $default != null:
return $default(_that.role,_that.variantId,_that.colorName,_that.colorHex,_that.widthM,_that.heightM,_that.coef,_that.areaSqm,_that.pricePerSqm,_that.total);case _:
  return null;

}
}

}

/// @nodoc


class _QuoteFabric implements QuoteFabric {
  const _QuoteFabric({required this.role, required this.variantId, required this.colorName, required this.colorHex, required this.widthM, required this.heightM, required this.coef, required this.areaSqm, required this.pricePerSqm, required this.total});
  

@override final  String role;
@override final  String variantId;
@override final  String colorName;
@override final  String colorHex;
@override final  double widthM;
@override final  double heightM;
@override final  double coef;
@override final  double areaSqm;
@override final  int pricePerSqm;
@override final  int total;

/// Create a copy of QuoteFabric
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuoteFabricCopyWith<_QuoteFabric> get copyWith => __$QuoteFabricCopyWithImpl<_QuoteFabric>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuoteFabric&&(identical(other.role, role) || other.role == role)&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.colorName, colorName) || other.colorName == colorName)&&(identical(other.colorHex, colorHex) || other.colorHex == colorHex)&&(identical(other.widthM, widthM) || other.widthM == widthM)&&(identical(other.heightM, heightM) || other.heightM == heightM)&&(identical(other.coef, coef) || other.coef == coef)&&(identical(other.areaSqm, areaSqm) || other.areaSqm == areaSqm)&&(identical(other.pricePerSqm, pricePerSqm) || other.pricePerSqm == pricePerSqm)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,role,variantId,colorName,colorHex,widthM,heightM,coef,areaSqm,pricePerSqm,total);

@override
String toString() {
  return 'QuoteFabric(role: $role, variantId: $variantId, colorName: $colorName, colorHex: $colorHex, widthM: $widthM, heightM: $heightM, coef: $coef, areaSqm: $areaSqm, pricePerSqm: $pricePerSqm, total: $total)';
}


}

/// @nodoc
abstract mixin class _$QuoteFabricCopyWith<$Res> implements $QuoteFabricCopyWith<$Res> {
  factory _$QuoteFabricCopyWith(_QuoteFabric value, $Res Function(_QuoteFabric) _then) = __$QuoteFabricCopyWithImpl;
@override @useResult
$Res call({
 String role, String variantId, String colorName, String colorHex, double widthM, double heightM, double coef, double areaSqm, int pricePerSqm, int total
});




}
/// @nodoc
class __$QuoteFabricCopyWithImpl<$Res>
    implements _$QuoteFabricCopyWith<$Res> {
  __$QuoteFabricCopyWithImpl(this._self, this._then);

  final _QuoteFabric _self;
  final $Res Function(_QuoteFabric) _then;

/// Create a copy of QuoteFabric
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? role = null,Object? variantId = null,Object? colorName = null,Object? colorHex = null,Object? widthM = null,Object? heightM = null,Object? coef = null,Object? areaSqm = null,Object? pricePerSqm = null,Object? total = null,}) {
  return _then(_QuoteFabric(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,colorName: null == colorName ? _self.colorName : colorName // ignore: cast_nullable_to_non_nullable
as String,colorHex: null == colorHex ? _self.colorHex : colorHex // ignore: cast_nullable_to_non_nullable
as String,widthM: null == widthM ? _self.widthM : widthM // ignore: cast_nullable_to_non_nullable
as double,heightM: null == heightM ? _self.heightM : heightM // ignore: cast_nullable_to_non_nullable
as double,coef: null == coef ? _self.coef : coef // ignore: cast_nullable_to_non_nullable
as double,areaSqm: null == areaSqm ? _self.areaSqm : areaSqm // ignore: cast_nullable_to_non_nullable
as double,pricePerSqm: null == pricePerSqm ? _self.pricePerSqm : pricePerSqm // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$QuoteAccessory {

 String get name; double get qty; String get unit; int get unitPrice; int get total;
/// Create a copy of QuoteAccessory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuoteAccessoryCopyWith<QuoteAccessory> get copyWith => _$QuoteAccessoryCopyWithImpl<QuoteAccessory>(this as QuoteAccessory, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuoteAccessory&&(identical(other.name, name) || other.name == name)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,name,qty,unit,unitPrice,total);

@override
String toString() {
  return 'QuoteAccessory(name: $name, qty: $qty, unit: $unit, unitPrice: $unitPrice, total: $total)';
}


}

/// @nodoc
abstract mixin class $QuoteAccessoryCopyWith<$Res>  {
  factory $QuoteAccessoryCopyWith(QuoteAccessory value, $Res Function(QuoteAccessory) _then) = _$QuoteAccessoryCopyWithImpl;
@useResult
$Res call({
 String name, double qty, String unit, int unitPrice, int total
});




}
/// @nodoc
class _$QuoteAccessoryCopyWithImpl<$Res>
    implements $QuoteAccessoryCopyWith<$Res> {
  _$QuoteAccessoryCopyWithImpl(this._self, this._then);

  final QuoteAccessory _self;
  final $Res Function(QuoteAccessory) _then;

/// Create a copy of QuoteAccessory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? qty = null,Object? unit = null,Object? unitPrice = null,Object? total = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [QuoteAccessory].
extension QuoteAccessoryPatterns on QuoteAccessory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuoteAccessory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuoteAccessory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuoteAccessory value)  $default,){
final _that = this;
switch (_that) {
case _QuoteAccessory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuoteAccessory value)?  $default,){
final _that = this;
switch (_that) {
case _QuoteAccessory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  double qty,  String unit,  int unitPrice,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuoteAccessory() when $default != null:
return $default(_that.name,_that.qty,_that.unit,_that.unitPrice,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  double qty,  String unit,  int unitPrice,  int total)  $default,) {final _that = this;
switch (_that) {
case _QuoteAccessory():
return $default(_that.name,_that.qty,_that.unit,_that.unitPrice,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  double qty,  String unit,  int unitPrice,  int total)?  $default,) {final _that = this;
switch (_that) {
case _QuoteAccessory() when $default != null:
return $default(_that.name,_that.qty,_that.unit,_that.unitPrice,_that.total);case _:
  return null;

}
}

}

/// @nodoc


class _QuoteAccessory implements QuoteAccessory {
  const _QuoteAccessory({required this.name, required this.qty, required this.unit, required this.unitPrice, required this.total});
  

@override final  String name;
@override final  double qty;
@override final  String unit;
@override final  int unitPrice;
@override final  int total;

/// Create a copy of QuoteAccessory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuoteAccessoryCopyWith<_QuoteAccessory> get copyWith => __$QuoteAccessoryCopyWithImpl<_QuoteAccessory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuoteAccessory&&(identical(other.name, name) || other.name == name)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,name,qty,unit,unitPrice,total);

@override
String toString() {
  return 'QuoteAccessory(name: $name, qty: $qty, unit: $unit, unitPrice: $unitPrice, total: $total)';
}


}

/// @nodoc
abstract mixin class _$QuoteAccessoryCopyWith<$Res> implements $QuoteAccessoryCopyWith<$Res> {
  factory _$QuoteAccessoryCopyWith(_QuoteAccessory value, $Res Function(_QuoteAccessory) _then) = __$QuoteAccessoryCopyWithImpl;
@override @useResult
$Res call({
 String name, double qty, String unit, int unitPrice, int total
});




}
/// @nodoc
class __$QuoteAccessoryCopyWithImpl<$Res>
    implements _$QuoteAccessoryCopyWith<$Res> {
  __$QuoteAccessoryCopyWithImpl(this._self, this._then);

  final _QuoteAccessory _self;
  final $Res Function(_QuoteAccessory) _then;

/// Create a copy of QuoteAccessory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? qty = null,Object? unit = null,Object? unitPrice = null,Object? total = null,}) {
  return _then(_QuoteAccessory(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,qty: null == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$QuoteService {

 String get name; double? get qty; int get total;
/// Create a copy of QuoteService
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuoteServiceCopyWith<QuoteService> get copyWith => _$QuoteServiceCopyWithImpl<QuoteService>(this as QuoteService, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuoteService&&(identical(other.name, name) || other.name == name)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,name,qty,total);

@override
String toString() {
  return 'QuoteService(name: $name, qty: $qty, total: $total)';
}


}

/// @nodoc
abstract mixin class $QuoteServiceCopyWith<$Res>  {
  factory $QuoteServiceCopyWith(QuoteService value, $Res Function(QuoteService) _then) = _$QuoteServiceCopyWithImpl;
@useResult
$Res call({
 String name, double? qty, int total
});




}
/// @nodoc
class _$QuoteServiceCopyWithImpl<$Res>
    implements $QuoteServiceCopyWith<$Res> {
  _$QuoteServiceCopyWithImpl(this._self, this._then);

  final QuoteService _self;
  final $Res Function(QuoteService) _then;

/// Create a copy of QuoteService
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? qty = freezed,Object? total = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,qty: freezed == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as double?,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [QuoteService].
extension QuoteServicePatterns on QuoteService {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuoteService value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuoteService() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuoteService value)  $default,){
final _that = this;
switch (_that) {
case _QuoteService():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuoteService value)?  $default,){
final _that = this;
switch (_that) {
case _QuoteService() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  double? qty,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuoteService() when $default != null:
return $default(_that.name,_that.qty,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  double? qty,  int total)  $default,) {final _that = this;
switch (_that) {
case _QuoteService():
return $default(_that.name,_that.qty,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  double? qty,  int total)?  $default,) {final _that = this;
switch (_that) {
case _QuoteService() when $default != null:
return $default(_that.name,_that.qty,_that.total);case _:
  return null;

}
}

}

/// @nodoc


class _QuoteService implements QuoteService {
  const _QuoteService({required this.name, this.qty, required this.total});
  

@override final  String name;
@override final  double? qty;
@override final  int total;

/// Create a copy of QuoteService
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuoteServiceCopyWith<_QuoteService> get copyWith => __$QuoteServiceCopyWithImpl<_QuoteService>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuoteService&&(identical(other.name, name) || other.name == name)&&(identical(other.qty, qty) || other.qty == qty)&&(identical(other.total, total) || other.total == total));
}


@override
int get hashCode => Object.hash(runtimeType,name,qty,total);

@override
String toString() {
  return 'QuoteService(name: $name, qty: $qty, total: $total)';
}


}

/// @nodoc
abstract mixin class _$QuoteServiceCopyWith<$Res> implements $QuoteServiceCopyWith<$Res> {
  factory _$QuoteServiceCopyWith(_QuoteService value, $Res Function(_QuoteService) _then) = __$QuoteServiceCopyWithImpl;
@override @useResult
$Res call({
 String name, double? qty, int total
});




}
/// @nodoc
class __$QuoteServiceCopyWithImpl<$Res>
    implements _$QuoteServiceCopyWith<$Res> {
  __$QuoteServiceCopyWithImpl(this._self, this._then);

  final _QuoteService _self;
  final $Res Function(_QuoteService) _then;

/// Create a copy of QuoteService
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? qty = freezed,Object? total = null,}) {
  return _then(_QuoteService(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,qty: freezed == qty ? _self.qty : qty // ignore: cast_nullable_to_non_nullable
as double?,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$QuoteMeasurement {

 String? get room; double get cornice; double get height; double get coef;
/// Create a copy of QuoteMeasurement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuoteMeasurementCopyWith<QuoteMeasurement> get copyWith => _$QuoteMeasurementCopyWithImpl<QuoteMeasurement>(this as QuoteMeasurement, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuoteMeasurement&&(identical(other.room, room) || other.room == room)&&(identical(other.cornice, cornice) || other.cornice == cornice)&&(identical(other.height, height) || other.height == height)&&(identical(other.coef, coef) || other.coef == coef));
}


@override
int get hashCode => Object.hash(runtimeType,room,cornice,height,coef);

@override
String toString() {
  return 'QuoteMeasurement(room: $room, cornice: $cornice, height: $height, coef: $coef)';
}


}

/// @nodoc
abstract mixin class $QuoteMeasurementCopyWith<$Res>  {
  factory $QuoteMeasurementCopyWith(QuoteMeasurement value, $Res Function(QuoteMeasurement) _then) = _$QuoteMeasurementCopyWithImpl;
@useResult
$Res call({
 String? room, double cornice, double height, double coef
});




}
/// @nodoc
class _$QuoteMeasurementCopyWithImpl<$Res>
    implements $QuoteMeasurementCopyWith<$Res> {
  _$QuoteMeasurementCopyWithImpl(this._self, this._then);

  final QuoteMeasurement _self;
  final $Res Function(QuoteMeasurement) _then;

/// Create a copy of QuoteMeasurement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? room = freezed,Object? cornice = null,Object? height = null,Object? coef = null,}) {
  return _then(_self.copyWith(
room: freezed == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as String?,cornice: null == cornice ? _self.cornice : cornice // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,coef: null == coef ? _self.coef : coef // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [QuoteMeasurement].
extension QuoteMeasurementPatterns on QuoteMeasurement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuoteMeasurement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuoteMeasurement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuoteMeasurement value)  $default,){
final _that = this;
switch (_that) {
case _QuoteMeasurement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuoteMeasurement value)?  $default,){
final _that = this;
switch (_that) {
case _QuoteMeasurement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? room,  double cornice,  double height,  double coef)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuoteMeasurement() when $default != null:
return $default(_that.room,_that.cornice,_that.height,_that.coef);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? room,  double cornice,  double height,  double coef)  $default,) {final _that = this;
switch (_that) {
case _QuoteMeasurement():
return $default(_that.room,_that.cornice,_that.height,_that.coef);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? room,  double cornice,  double height,  double coef)?  $default,) {final _that = this;
switch (_that) {
case _QuoteMeasurement() when $default != null:
return $default(_that.room,_that.cornice,_that.height,_that.coef);case _:
  return null;

}
}

}

/// @nodoc


class _QuoteMeasurement implements QuoteMeasurement {
  const _QuoteMeasurement({this.room, required this.cornice, required this.height, required this.coef});
  

@override final  String? room;
@override final  double cornice;
@override final  double height;
@override final  double coef;

/// Create a copy of QuoteMeasurement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuoteMeasurementCopyWith<_QuoteMeasurement> get copyWith => __$QuoteMeasurementCopyWithImpl<_QuoteMeasurement>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuoteMeasurement&&(identical(other.room, room) || other.room == room)&&(identical(other.cornice, cornice) || other.cornice == cornice)&&(identical(other.height, height) || other.height == height)&&(identical(other.coef, coef) || other.coef == coef));
}


@override
int get hashCode => Object.hash(runtimeType,room,cornice,height,coef);

@override
String toString() {
  return 'QuoteMeasurement(room: $room, cornice: $cornice, height: $height, coef: $coef)';
}


}

/// @nodoc
abstract mixin class _$QuoteMeasurementCopyWith<$Res> implements $QuoteMeasurementCopyWith<$Res> {
  factory _$QuoteMeasurementCopyWith(_QuoteMeasurement value, $Res Function(_QuoteMeasurement) _then) = __$QuoteMeasurementCopyWithImpl;
@override @useResult
$Res call({
 String? room, double cornice, double height, double coef
});




}
/// @nodoc
class __$QuoteMeasurementCopyWithImpl<$Res>
    implements _$QuoteMeasurementCopyWith<$Res> {
  __$QuoteMeasurementCopyWithImpl(this._self, this._then);

  final _QuoteMeasurement _self;
  final $Res Function(_QuoteMeasurement) _then;

/// Create a copy of QuoteMeasurement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? room = freezed,Object? cornice = null,Object? height = null,Object? coef = null,}) {
  return _then(_QuoteMeasurement(
room: freezed == room ? _self.room : room // ignore: cast_nullable_to_non_nullable
as String?,cornice: null == cornice ? _self.cornice : cornice // ignore: cast_nullable_to_non_nullable
as double,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double,coef: null == coef ? _self.coef : coef // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$Quote {

 List<QuoteFabric> get fabrics; List<QuoteAccessory> get accessories; List<QuoteService> get services; List<String> get wasteWarnings; String get formula; int get subtotal; int get discount; int get delivery; int get total; QuoteMeasurement? get measurement;
/// Create a copy of Quote
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuoteCopyWith<Quote> get copyWith => _$QuoteCopyWithImpl<Quote>(this as Quote, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Quote&&const DeepCollectionEquality().equals(other.fabrics, fabrics)&&const DeepCollectionEquality().equals(other.accessories, accessories)&&const DeepCollectionEquality().equals(other.services, services)&&const DeepCollectionEquality().equals(other.wasteWarnings, wasteWarnings)&&(identical(other.formula, formula) || other.formula == formula)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.delivery, delivery) || other.delivery == delivery)&&(identical(other.total, total) || other.total == total)&&(identical(other.measurement, measurement) || other.measurement == measurement));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(fabrics),const DeepCollectionEquality().hash(accessories),const DeepCollectionEquality().hash(services),const DeepCollectionEquality().hash(wasteWarnings),formula,subtotal,discount,delivery,total,measurement);

@override
String toString() {
  return 'Quote(fabrics: $fabrics, accessories: $accessories, services: $services, wasteWarnings: $wasteWarnings, formula: $formula, subtotal: $subtotal, discount: $discount, delivery: $delivery, total: $total, measurement: $measurement)';
}


}

/// @nodoc
abstract mixin class $QuoteCopyWith<$Res>  {
  factory $QuoteCopyWith(Quote value, $Res Function(Quote) _then) = _$QuoteCopyWithImpl;
@useResult
$Res call({
 List<QuoteFabric> fabrics, List<QuoteAccessory> accessories, List<QuoteService> services, List<String> wasteWarnings, String formula, int subtotal, int discount, int delivery, int total, QuoteMeasurement? measurement
});


$QuoteMeasurementCopyWith<$Res>? get measurement;

}
/// @nodoc
class _$QuoteCopyWithImpl<$Res>
    implements $QuoteCopyWith<$Res> {
  _$QuoteCopyWithImpl(this._self, this._then);

  final Quote _self;
  final $Res Function(Quote) _then;

/// Create a copy of Quote
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fabrics = null,Object? accessories = null,Object? services = null,Object? wasteWarnings = null,Object? formula = null,Object? subtotal = null,Object? discount = null,Object? delivery = null,Object? total = null,Object? measurement = freezed,}) {
  return _then(_self.copyWith(
fabrics: null == fabrics ? _self.fabrics : fabrics // ignore: cast_nullable_to_non_nullable
as List<QuoteFabric>,accessories: null == accessories ? _self.accessories : accessories // ignore: cast_nullable_to_non_nullable
as List<QuoteAccessory>,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<QuoteService>,wasteWarnings: null == wasteWarnings ? _self.wasteWarnings : wasteWarnings // ignore: cast_nullable_to_non_nullable
as List<String>,formula: null == formula ? _self.formula : formula // ignore: cast_nullable_to_non_nullable
as String,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as int,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as int,delivery: null == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,measurement: freezed == measurement ? _self.measurement : measurement // ignore: cast_nullable_to_non_nullable
as QuoteMeasurement?,
  ));
}
/// Create a copy of Quote
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuoteMeasurementCopyWith<$Res>? get measurement {
    if (_self.measurement == null) {
    return null;
  }

  return $QuoteMeasurementCopyWith<$Res>(_self.measurement!, (value) {
    return _then(_self.copyWith(measurement: value));
  });
}
}


/// Adds pattern-matching-related methods to [Quote].
extension QuotePatterns on Quote {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Quote value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Quote() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Quote value)  $default,){
final _that = this;
switch (_that) {
case _Quote():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Quote value)?  $default,){
final _that = this;
switch (_that) {
case _Quote() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<QuoteFabric> fabrics,  List<QuoteAccessory> accessories,  List<QuoteService> services,  List<String> wasteWarnings,  String formula,  int subtotal,  int discount,  int delivery,  int total,  QuoteMeasurement? measurement)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Quote() when $default != null:
return $default(_that.fabrics,_that.accessories,_that.services,_that.wasteWarnings,_that.formula,_that.subtotal,_that.discount,_that.delivery,_that.total,_that.measurement);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<QuoteFabric> fabrics,  List<QuoteAccessory> accessories,  List<QuoteService> services,  List<String> wasteWarnings,  String formula,  int subtotal,  int discount,  int delivery,  int total,  QuoteMeasurement? measurement)  $default,) {final _that = this;
switch (_that) {
case _Quote():
return $default(_that.fabrics,_that.accessories,_that.services,_that.wasteWarnings,_that.formula,_that.subtotal,_that.discount,_that.delivery,_that.total,_that.measurement);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<QuoteFabric> fabrics,  List<QuoteAccessory> accessories,  List<QuoteService> services,  List<String> wasteWarnings,  String formula,  int subtotal,  int discount,  int delivery,  int total,  QuoteMeasurement? measurement)?  $default,) {final _that = this;
switch (_that) {
case _Quote() when $default != null:
return $default(_that.fabrics,_that.accessories,_that.services,_that.wasteWarnings,_that.formula,_that.subtotal,_that.discount,_that.delivery,_that.total,_that.measurement);case _:
  return null;

}
}

}

/// @nodoc


class _Quote implements Quote {
  const _Quote({required this.fabrics, required this.accessories, required this.services, required this.wasteWarnings, required this.formula, required this.subtotal, required this.discount, required this.delivery, required this.total, this.measurement});
  

@override final  List<QuoteFabric> fabrics;
@override final  List<QuoteAccessory> accessories;
@override final  List<QuoteService> services;
@override final  List<String> wasteWarnings;
@override final  String formula;
@override final  int subtotal;
@override final  int discount;
@override final  int delivery;
@override final  int total;
@override final  QuoteMeasurement? measurement;

/// Create a copy of Quote
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuoteCopyWith<_Quote> get copyWith => __$QuoteCopyWithImpl<_Quote>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Quote&&const DeepCollectionEquality().equals(other.fabrics, fabrics)&&const DeepCollectionEquality().equals(other.accessories, accessories)&&const DeepCollectionEquality().equals(other.services, services)&&const DeepCollectionEquality().equals(other.wasteWarnings, wasteWarnings)&&(identical(other.formula, formula) || other.formula == formula)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.delivery, delivery) || other.delivery == delivery)&&(identical(other.total, total) || other.total == total)&&(identical(other.measurement, measurement) || other.measurement == measurement));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(fabrics),const DeepCollectionEquality().hash(accessories),const DeepCollectionEquality().hash(services),const DeepCollectionEquality().hash(wasteWarnings),formula,subtotal,discount,delivery,total,measurement);

@override
String toString() {
  return 'Quote(fabrics: $fabrics, accessories: $accessories, services: $services, wasteWarnings: $wasteWarnings, formula: $formula, subtotal: $subtotal, discount: $discount, delivery: $delivery, total: $total, measurement: $measurement)';
}


}

/// @nodoc
abstract mixin class _$QuoteCopyWith<$Res> implements $QuoteCopyWith<$Res> {
  factory _$QuoteCopyWith(_Quote value, $Res Function(_Quote) _then) = __$QuoteCopyWithImpl;
@override @useResult
$Res call({
 List<QuoteFabric> fabrics, List<QuoteAccessory> accessories, List<QuoteService> services, List<String> wasteWarnings, String formula, int subtotal, int discount, int delivery, int total, QuoteMeasurement? measurement
});


@override $QuoteMeasurementCopyWith<$Res>? get measurement;

}
/// @nodoc
class __$QuoteCopyWithImpl<$Res>
    implements _$QuoteCopyWith<$Res> {
  __$QuoteCopyWithImpl(this._self, this._then);

  final _Quote _self;
  final $Res Function(_Quote) _then;

/// Create a copy of Quote
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fabrics = null,Object? accessories = null,Object? services = null,Object? wasteWarnings = null,Object? formula = null,Object? subtotal = null,Object? discount = null,Object? delivery = null,Object? total = null,Object? measurement = freezed,}) {
  return _then(_Quote(
fabrics: null == fabrics ? _self.fabrics : fabrics // ignore: cast_nullable_to_non_nullable
as List<QuoteFabric>,accessories: null == accessories ? _self.accessories : accessories // ignore: cast_nullable_to_non_nullable
as List<QuoteAccessory>,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<QuoteService>,wasteWarnings: null == wasteWarnings ? _self.wasteWarnings : wasteWarnings // ignore: cast_nullable_to_non_nullable
as List<String>,formula: null == formula ? _self.formula : formula // ignore: cast_nullable_to_non_nullable
as String,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as int,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as int,delivery: null == delivery ? _self.delivery : delivery // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,measurement: freezed == measurement ? _self.measurement : measurement // ignore: cast_nullable_to_non_nullable
as QuoteMeasurement?,
  ));
}

/// Create a copy of Quote
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuoteMeasurementCopyWith<$Res>? get measurement {
    if (_self.measurement == null) {
    return null;
  }

  return $QuoteMeasurementCopyWith<$Res>(_self.measurement!, (value) {
    return _then(_self.copyWith(measurement: value));
  });
}
}

// dart format on
