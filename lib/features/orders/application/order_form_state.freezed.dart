// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderFormState {

 Map<String, dynamic> get initialValues; Map<String, dynamic> get values; Map<String, String> get fieldErrors; bool get isSubmitting; bool get isSuccess; String? get submitError;
/// Create a copy of OrderFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderFormStateCopyWith<OrderFormState> get copyWith => _$OrderFormStateCopyWithImpl<OrderFormState>(this as OrderFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderFormState&&const DeepCollectionEquality().equals(other.initialValues, initialValues)&&const DeepCollectionEquality().equals(other.values, values)&&const DeepCollectionEquality().equals(other.fieldErrors, fieldErrors)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.submitError, submitError) || other.submitError == submitError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(initialValues),const DeepCollectionEquality().hash(values),const DeepCollectionEquality().hash(fieldErrors),isSubmitting,isSuccess,submitError);

@override
String toString() {
  return 'OrderFormState(initialValues: $initialValues, values: $values, fieldErrors: $fieldErrors, isSubmitting: $isSubmitting, isSuccess: $isSuccess, submitError: $submitError)';
}


}

/// @nodoc
abstract mixin class $OrderFormStateCopyWith<$Res>  {
  factory $OrderFormStateCopyWith(OrderFormState value, $Res Function(OrderFormState) _then) = _$OrderFormStateCopyWithImpl;
@useResult
$Res call({
 Map<String, dynamic> initialValues, Map<String, dynamic> values, Map<String, String> fieldErrors, bool isSubmitting, bool isSuccess, String? submitError
});




}
/// @nodoc
class _$OrderFormStateCopyWithImpl<$Res>
    implements $OrderFormStateCopyWith<$Res> {
  _$OrderFormStateCopyWithImpl(this._self, this._then);

  final OrderFormState _self;
  final $Res Function(OrderFormState) _then;

/// Create a copy of OrderFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? initialValues = null,Object? values = null,Object? fieldErrors = null,Object? isSubmitting = null,Object? isSuccess = null,Object? submitError = freezed,}) {
  return _then(_self.copyWith(
initialValues: null == initialValues ? _self.initialValues : initialValues // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,values: null == values ? _self.values : values // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,fieldErrors: null == fieldErrors ? _self.fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,submitError: freezed == submitError ? _self.submitError : submitError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderFormState].
extension OrderFormStatePatterns on OrderFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderFormState value)  $default,){
final _that = this;
switch (_that) {
case _OrderFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderFormState value)?  $default,){
final _that = this;
switch (_that) {
case _OrderFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, dynamic> initialValues,  Map<String, dynamic> values,  Map<String, String> fieldErrors,  bool isSubmitting,  bool isSuccess,  String? submitError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderFormState() when $default != null:
return $default(_that.initialValues,_that.values,_that.fieldErrors,_that.isSubmitting,_that.isSuccess,_that.submitError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, dynamic> initialValues,  Map<String, dynamic> values,  Map<String, String> fieldErrors,  bool isSubmitting,  bool isSuccess,  String? submitError)  $default,) {final _that = this;
switch (_that) {
case _OrderFormState():
return $default(_that.initialValues,_that.values,_that.fieldErrors,_that.isSubmitting,_that.isSuccess,_that.submitError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, dynamic> initialValues,  Map<String, dynamic> values,  Map<String, String> fieldErrors,  bool isSubmitting,  bool isSuccess,  String? submitError)?  $default,) {final _that = this;
switch (_that) {
case _OrderFormState() when $default != null:
return $default(_that.initialValues,_that.values,_that.fieldErrors,_that.isSubmitting,_that.isSuccess,_that.submitError);case _:
  return null;

}
}

}

/// @nodoc


class _OrderFormState extends OrderFormState {
  const _OrderFormState({this.initialValues = const {}, this.values = const {}, this.fieldErrors = const {}, this.isSubmitting = false, this.isSuccess = false, this.submitError}): super._();
  

@override@JsonKey() final  Map<String, dynamic> initialValues;
@override@JsonKey() final  Map<String, dynamic> values;
@override@JsonKey() final  Map<String, String> fieldErrors;
@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  bool isSuccess;
@override final  String? submitError;

/// Create a copy of OrderFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderFormStateCopyWith<_OrderFormState> get copyWith => __$OrderFormStateCopyWithImpl<_OrderFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderFormState&&const DeepCollectionEquality().equals(other.initialValues, initialValues)&&const DeepCollectionEquality().equals(other.values, values)&&const DeepCollectionEquality().equals(other.fieldErrors, fieldErrors)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isSuccess, isSuccess) || other.isSuccess == isSuccess)&&(identical(other.submitError, submitError) || other.submitError == submitError));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(initialValues),const DeepCollectionEquality().hash(values),const DeepCollectionEquality().hash(fieldErrors),isSubmitting,isSuccess,submitError);

@override
String toString() {
  return 'OrderFormState(initialValues: $initialValues, values: $values, fieldErrors: $fieldErrors, isSubmitting: $isSubmitting, isSuccess: $isSuccess, submitError: $submitError)';
}


}

/// @nodoc
abstract mixin class _$OrderFormStateCopyWith<$Res> implements $OrderFormStateCopyWith<$Res> {
  factory _$OrderFormStateCopyWith(_OrderFormState value, $Res Function(_OrderFormState) _then) = __$OrderFormStateCopyWithImpl;
@override @useResult
$Res call({
 Map<String, dynamic> initialValues, Map<String, dynamic> values, Map<String, String> fieldErrors, bool isSubmitting, bool isSuccess, String? submitError
});




}
/// @nodoc
class __$OrderFormStateCopyWithImpl<$Res>
    implements _$OrderFormStateCopyWith<$Res> {
  __$OrderFormStateCopyWithImpl(this._self, this._then);

  final _OrderFormState _self;
  final $Res Function(_OrderFormState) _then;

/// Create a copy of OrderFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? initialValues = null,Object? values = null,Object? fieldErrors = null,Object? isSubmitting = null,Object? isSuccess = null,Object? submitError = freezed,}) {
  return _then(_OrderFormState(
initialValues: null == initialValues ? _self.initialValues : initialValues // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,values: null == values ? _self.values : values // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,fieldErrors: null == fieldErrors ? _self.fieldErrors : fieldErrors // ignore: cast_nullable_to_non_nullable
as Map<String, String>,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isSuccess: null == isSuccess ? _self.isSuccess : isSuccess // ignore: cast_nullable_to_non_nullable
as bool,submitError: freezed == submitError ? _self.submitError : submitError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
