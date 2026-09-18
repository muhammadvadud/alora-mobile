// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductFormState {

 String get name; String get code; String get category; String get price; PriceUnit get priceUnit; List<VariantWriteDto> get variants; String get description; String get fabricType; String get composition; String get care; String get segment; List<String> get recommendedRooms; bool get isDirty; bool get isSaving; Map<String, String> get errors;
/// Create a copy of ProductFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductFormStateCopyWith<ProductFormState> get copyWith => _$ProductFormStateCopyWithImpl<ProductFormState>(this as ProductFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductFormState&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.category, category) || other.category == category)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceUnit, priceUnit) || other.priceUnit == priceUnit)&&const DeepCollectionEquality().equals(other.variants, variants)&&(identical(other.description, description) || other.description == description)&&(identical(other.fabricType, fabricType) || other.fabricType == fabricType)&&(identical(other.composition, composition) || other.composition == composition)&&(identical(other.care, care) || other.care == care)&&(identical(other.segment, segment) || other.segment == segment)&&const DeepCollectionEquality().equals(other.recommendedRooms, recommendedRooms)&&(identical(other.isDirty, isDirty) || other.isDirty == isDirty)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&const DeepCollectionEquality().equals(other.errors, errors));
}


@override
int get hashCode => Object.hash(runtimeType,name,code,category,price,priceUnit,const DeepCollectionEquality().hash(variants),description,fabricType,composition,care,segment,const DeepCollectionEquality().hash(recommendedRooms),isDirty,isSaving,const DeepCollectionEquality().hash(errors));

@override
String toString() {
  return 'ProductFormState(name: $name, code: $code, category: $category, price: $price, priceUnit: $priceUnit, variants: $variants, description: $description, fabricType: $fabricType, composition: $composition, care: $care, segment: $segment, recommendedRooms: $recommendedRooms, isDirty: $isDirty, isSaving: $isSaving, errors: $errors)';
}


}

/// @nodoc
abstract mixin class $ProductFormStateCopyWith<$Res>  {
  factory $ProductFormStateCopyWith(ProductFormState value, $Res Function(ProductFormState) _then) = _$ProductFormStateCopyWithImpl;
@useResult
$Res call({
 String name, String code, String category, String price, PriceUnit priceUnit, List<VariantWriteDto> variants, String description, String fabricType, String composition, String care, String segment, List<String> recommendedRooms, bool isDirty, bool isSaving, Map<String, String> errors
});




}
/// @nodoc
class _$ProductFormStateCopyWithImpl<$Res>
    implements $ProductFormStateCopyWith<$Res> {
  _$ProductFormStateCopyWithImpl(this._self, this._then);

  final ProductFormState _self;
  final $Res Function(ProductFormState) _then;

/// Create a copy of ProductFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? code = null,Object? category = null,Object? price = null,Object? priceUnit = null,Object? variants = null,Object? description = null,Object? fabricType = null,Object? composition = null,Object? care = null,Object? segment = null,Object? recommendedRooms = null,Object? isDirty = null,Object? isSaving = null,Object? errors = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,priceUnit: null == priceUnit ? _self.priceUnit : priceUnit // ignore: cast_nullable_to_non_nullable
as PriceUnit,variants: null == variants ? _self.variants : variants // ignore: cast_nullable_to_non_nullable
as List<VariantWriteDto>,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,fabricType: null == fabricType ? _self.fabricType : fabricType // ignore: cast_nullable_to_non_nullable
as String,composition: null == composition ? _self.composition : composition // ignore: cast_nullable_to_non_nullable
as String,care: null == care ? _self.care : care // ignore: cast_nullable_to_non_nullable
as String,segment: null == segment ? _self.segment : segment // ignore: cast_nullable_to_non_nullable
as String,recommendedRooms: null == recommendedRooms ? _self.recommendedRooms : recommendedRooms // ignore: cast_nullable_to_non_nullable
as List<String>,isDirty: null == isDirty ? _self.isDirty : isDirty // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,errors: null == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductFormState].
extension ProductFormStatePatterns on ProductFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductFormState value)  $default,){
final _that = this;
switch (_that) {
case _ProductFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductFormState value)?  $default,){
final _that = this;
switch (_that) {
case _ProductFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String code,  String category,  String price,  PriceUnit priceUnit,  List<VariantWriteDto> variants,  String description,  String fabricType,  String composition,  String care,  String segment,  List<String> recommendedRooms,  bool isDirty,  bool isSaving,  Map<String, String> errors)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductFormState() when $default != null:
return $default(_that.name,_that.code,_that.category,_that.price,_that.priceUnit,_that.variants,_that.description,_that.fabricType,_that.composition,_that.care,_that.segment,_that.recommendedRooms,_that.isDirty,_that.isSaving,_that.errors);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String code,  String category,  String price,  PriceUnit priceUnit,  List<VariantWriteDto> variants,  String description,  String fabricType,  String composition,  String care,  String segment,  List<String> recommendedRooms,  bool isDirty,  bool isSaving,  Map<String, String> errors)  $default,) {final _that = this;
switch (_that) {
case _ProductFormState():
return $default(_that.name,_that.code,_that.category,_that.price,_that.priceUnit,_that.variants,_that.description,_that.fabricType,_that.composition,_that.care,_that.segment,_that.recommendedRooms,_that.isDirty,_that.isSaving,_that.errors);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String code,  String category,  String price,  PriceUnit priceUnit,  List<VariantWriteDto> variants,  String description,  String fabricType,  String composition,  String care,  String segment,  List<String> recommendedRooms,  bool isDirty,  bool isSaving,  Map<String, String> errors)?  $default,) {final _that = this;
switch (_that) {
case _ProductFormState() when $default != null:
return $default(_that.name,_that.code,_that.category,_that.price,_that.priceUnit,_that.variants,_that.description,_that.fabricType,_that.composition,_that.care,_that.segment,_that.recommendedRooms,_that.isDirty,_that.isSaving,_that.errors);case _:
  return null;

}
}

}

/// @nodoc


class _ProductFormState implements ProductFormState {
  const _ProductFormState({required this.name, required this.code, required this.category, required this.price, required this.priceUnit, required this.variants, this.description = '', this.fabricType = '', this.composition = '', this.care = '', this.segment = '', this.recommendedRooms = const [], this.isDirty = false, this.isSaving = false, this.errors = const {}});
  

@override final  String name;
@override final  String code;
@override final  String category;
@override final  String price;
@override final  PriceUnit priceUnit;
@override final  List<VariantWriteDto> variants;
@override@JsonKey() final  String description;
@override@JsonKey() final  String fabricType;
@override@JsonKey() final  String composition;
@override@JsonKey() final  String care;
@override@JsonKey() final  String segment;
@override@JsonKey() final  List<String> recommendedRooms;
@override@JsonKey() final  bool isDirty;
@override@JsonKey() final  bool isSaving;
@override@JsonKey() final  Map<String, String> errors;

/// Create a copy of ProductFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductFormStateCopyWith<_ProductFormState> get copyWith => __$ProductFormStateCopyWithImpl<_ProductFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductFormState&&(identical(other.name, name) || other.name == name)&&(identical(other.code, code) || other.code == code)&&(identical(other.category, category) || other.category == category)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceUnit, priceUnit) || other.priceUnit == priceUnit)&&const DeepCollectionEquality().equals(other.variants, variants)&&(identical(other.description, description) || other.description == description)&&(identical(other.fabricType, fabricType) || other.fabricType == fabricType)&&(identical(other.composition, composition) || other.composition == composition)&&(identical(other.care, care) || other.care == care)&&(identical(other.segment, segment) || other.segment == segment)&&const DeepCollectionEquality().equals(other.recommendedRooms, recommendedRooms)&&(identical(other.isDirty, isDirty) || other.isDirty == isDirty)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&const DeepCollectionEquality().equals(other.errors, errors));
}


@override
int get hashCode => Object.hash(runtimeType,name,code,category,price,priceUnit,const DeepCollectionEquality().hash(variants),description,fabricType,composition,care,segment,const DeepCollectionEquality().hash(recommendedRooms),isDirty,isSaving,const DeepCollectionEquality().hash(errors));

@override
String toString() {
  return 'ProductFormState(name: $name, code: $code, category: $category, price: $price, priceUnit: $priceUnit, variants: $variants, description: $description, fabricType: $fabricType, composition: $composition, care: $care, segment: $segment, recommendedRooms: $recommendedRooms, isDirty: $isDirty, isSaving: $isSaving, errors: $errors)';
}


}

/// @nodoc
abstract mixin class _$ProductFormStateCopyWith<$Res> implements $ProductFormStateCopyWith<$Res> {
  factory _$ProductFormStateCopyWith(_ProductFormState value, $Res Function(_ProductFormState) _then) = __$ProductFormStateCopyWithImpl;
@override @useResult
$Res call({
 String name, String code, String category, String price, PriceUnit priceUnit, List<VariantWriteDto> variants, String description, String fabricType, String composition, String care, String segment, List<String> recommendedRooms, bool isDirty, bool isSaving, Map<String, String> errors
});




}
/// @nodoc
class __$ProductFormStateCopyWithImpl<$Res>
    implements _$ProductFormStateCopyWith<$Res> {
  __$ProductFormStateCopyWithImpl(this._self, this._then);

  final _ProductFormState _self;
  final $Res Function(_ProductFormState) _then;

/// Create a copy of ProductFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? code = null,Object? category = null,Object? price = null,Object? priceUnit = null,Object? variants = null,Object? description = null,Object? fabricType = null,Object? composition = null,Object? care = null,Object? segment = null,Object? recommendedRooms = null,Object? isDirty = null,Object? isSaving = null,Object? errors = null,}) {
  return _then(_ProductFormState(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as String,priceUnit: null == priceUnit ? _self.priceUnit : priceUnit // ignore: cast_nullable_to_non_nullable
as PriceUnit,variants: null == variants ? _self.variants : variants // ignore: cast_nullable_to_non_nullable
as List<VariantWriteDto>,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,fabricType: null == fabricType ? _self.fabricType : fabricType // ignore: cast_nullable_to_non_nullable
as String,composition: null == composition ? _self.composition : composition // ignore: cast_nullable_to_non_nullable
as String,care: null == care ? _self.care : care // ignore: cast_nullable_to_non_nullable
as String,segment: null == segment ? _self.segment : segment // ignore: cast_nullable_to_non_nullable
as String,recommendedRooms: null == recommendedRooms ? _self.recommendedRooms : recommendedRooms // ignore: cast_nullable_to_non_nullable
as List<String>,isDirty: null == isDirty ? _self.isDirty : isDirty // ignore: cast_nullable_to_non_nullable
as bool,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,errors: null == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,
  ));
}


}

// dart format on
