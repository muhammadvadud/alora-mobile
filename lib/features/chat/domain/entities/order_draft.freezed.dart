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
mixin _$OrderDraftMeasurement {

 String? get roomName; double? get cornice; double? get height;
/// Create a copy of OrderDraftMeasurement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDraftMeasurementCopyWith<OrderDraftMeasurement> get copyWith => _$OrderDraftMeasurementCopyWithImpl<OrderDraftMeasurement>(this as OrderDraftMeasurement, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDraftMeasurement&&(identical(other.roomName, roomName) || other.roomName == roomName)&&(identical(other.cornice, cornice) || other.cornice == cornice)&&(identical(other.height, height) || other.height == height));
}


@override
int get hashCode => Object.hash(runtimeType,roomName,cornice,height);

@override
String toString() {
  return 'OrderDraftMeasurement(roomName: $roomName, cornice: $cornice, height: $height)';
}


}

/// @nodoc
abstract mixin class $OrderDraftMeasurementCopyWith<$Res>  {
  factory $OrderDraftMeasurementCopyWith(OrderDraftMeasurement value, $Res Function(OrderDraftMeasurement) _then) = _$OrderDraftMeasurementCopyWithImpl;
@useResult
$Res call({
 String? roomName, double? cornice, double? height
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
@pragma('vm:prefer-inline') @override $Res call({Object? roomName = freezed,Object? cornice = freezed,Object? height = freezed,}) {
  return _then(_self.copyWith(
roomName: freezed == roomName ? _self.roomName : roomName // ignore: cast_nullable_to_non_nullable
as String?,cornice: freezed == cornice ? _self.cornice : cornice // ignore: cast_nullable_to_non_nullable
as double?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? roomName,  double? cornice,  double? height)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderDraftMeasurement() when $default != null:
return $default(_that.roomName,_that.cornice,_that.height);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? roomName,  double? cornice,  double? height)  $default,) {final _that = this;
switch (_that) {
case _OrderDraftMeasurement():
return $default(_that.roomName,_that.cornice,_that.height);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? roomName,  double? cornice,  double? height)?  $default,) {final _that = this;
switch (_that) {
case _OrderDraftMeasurement() when $default != null:
return $default(_that.roomName,_that.cornice,_that.height);case _:
  return null;

}
}

}

/// @nodoc


class _OrderDraftMeasurement implements OrderDraftMeasurement {
  const _OrderDraftMeasurement({this.roomName, this.cornice, this.height});
  

@override final  String? roomName;
@override final  double? cornice;
@override final  double? height;

/// Create a copy of OrderDraftMeasurement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDraftMeasurementCopyWith<_OrderDraftMeasurement> get copyWith => __$OrderDraftMeasurementCopyWithImpl<_OrderDraftMeasurement>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDraftMeasurement&&(identical(other.roomName, roomName) || other.roomName == roomName)&&(identical(other.cornice, cornice) || other.cornice == cornice)&&(identical(other.height, height) || other.height == height));
}


@override
int get hashCode => Object.hash(runtimeType,roomName,cornice,height);

@override
String toString() {
  return 'OrderDraftMeasurement(roomName: $roomName, cornice: $cornice, height: $height)';
}


}

/// @nodoc
abstract mixin class _$OrderDraftMeasurementCopyWith<$Res> implements $OrderDraftMeasurementCopyWith<$Res> {
  factory _$OrderDraftMeasurementCopyWith(_OrderDraftMeasurement value, $Res Function(_OrderDraftMeasurement) _then) = __$OrderDraftMeasurementCopyWithImpl;
@override @useResult
$Res call({
 String? roomName, double? cornice, double? height
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
@override @pragma('vm:prefer-inline') $Res call({Object? roomName = freezed,Object? cornice = freezed,Object? height = freezed,}) {
  return _then(_OrderDraftMeasurement(
roomName: freezed == roomName ? _self.roomName : roomName // ignore: cast_nullable_to_non_nullable
as String?,cornice: freezed == cornice ? _self.cornice : cornice // ignore: cast_nullable_to_non_nullable
as double?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc
mixin _$OrderDraft {

 String? get customerName; String? get phone; String? get address; List<OrderDraftMeasurement> get measurements; int get total; int? get prepayment; DateTime? get deadline; List<String> get missingFields;
/// Create a copy of OrderDraft
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDraftCopyWith<OrderDraft> get copyWith => _$OrderDraftCopyWithImpl<OrderDraft>(this as OrderDraft, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDraft&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other.measurements, measurements)&&(identical(other.total, total) || other.total == total)&&(identical(other.prepayment, prepayment) || other.prepayment == prepayment)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&const DeepCollectionEquality().equals(other.missingFields, missingFields));
}


@override
int get hashCode => Object.hash(runtimeType,customerName,phone,address,const DeepCollectionEquality().hash(measurements),total,prepayment,deadline,const DeepCollectionEquality().hash(missingFields));

@override
String toString() {
  return 'OrderDraft(customerName: $customerName, phone: $phone, address: $address, measurements: $measurements, total: $total, prepayment: $prepayment, deadline: $deadline, missingFields: $missingFields)';
}


}

/// @nodoc
abstract mixin class $OrderDraftCopyWith<$Res>  {
  factory $OrderDraftCopyWith(OrderDraft value, $Res Function(OrderDraft) _then) = _$OrderDraftCopyWithImpl;
@useResult
$Res call({
 String? customerName, String? phone, String? address, List<OrderDraftMeasurement> measurements, int total, int? prepayment, DateTime? deadline, List<String> missingFields
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
@pragma('vm:prefer-inline') @override $Res call({Object? customerName = freezed,Object? phone = freezed,Object? address = freezed,Object? measurements = null,Object? total = null,Object? prepayment = freezed,Object? deadline = freezed,Object? missingFields = null,}) {
  return _then(_self.copyWith(
customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,measurements: null == measurements ? _self.measurements : measurements // ignore: cast_nullable_to_non_nullable
as List<OrderDraftMeasurement>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,prepayment: freezed == prepayment ? _self.prepayment : prepayment // ignore: cast_nullable_to_non_nullable
as int?,deadline: freezed == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as DateTime?,missingFields: null == missingFields ? _self.missingFields : missingFields // ignore: cast_nullable_to_non_nullable
as List<String>,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? customerName,  String? phone,  String? address,  List<OrderDraftMeasurement> measurements,  int total,  int? prepayment,  DateTime? deadline,  List<String> missingFields)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderDraft() when $default != null:
return $default(_that.customerName,_that.phone,_that.address,_that.measurements,_that.total,_that.prepayment,_that.deadline,_that.missingFields);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? customerName,  String? phone,  String? address,  List<OrderDraftMeasurement> measurements,  int total,  int? prepayment,  DateTime? deadline,  List<String> missingFields)  $default,) {final _that = this;
switch (_that) {
case _OrderDraft():
return $default(_that.customerName,_that.phone,_that.address,_that.measurements,_that.total,_that.prepayment,_that.deadline,_that.missingFields);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? customerName,  String? phone,  String? address,  List<OrderDraftMeasurement> measurements,  int total,  int? prepayment,  DateTime? deadline,  List<String> missingFields)?  $default,) {final _that = this;
switch (_that) {
case _OrderDraft() when $default != null:
return $default(_that.customerName,_that.phone,_that.address,_that.measurements,_that.total,_that.prepayment,_that.deadline,_that.missingFields);case _:
  return null;

}
}

}

/// @nodoc


class _OrderDraft implements OrderDraft {
  const _OrderDraft({this.customerName, this.phone, this.address, required this.measurements, required this.total, this.prepayment, this.deadline, required this.missingFields});
  

@override final  String? customerName;
@override final  String? phone;
@override final  String? address;
@override final  List<OrderDraftMeasurement> measurements;
@override final  int total;
@override final  int? prepayment;
@override final  DateTime? deadline;
@override final  List<String> missingFields;

/// Create a copy of OrderDraft
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDraftCopyWith<_OrderDraft> get copyWith => __$OrderDraftCopyWithImpl<_OrderDraft>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDraft&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other.measurements, measurements)&&(identical(other.total, total) || other.total == total)&&(identical(other.prepayment, prepayment) || other.prepayment == prepayment)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&const DeepCollectionEquality().equals(other.missingFields, missingFields));
}


@override
int get hashCode => Object.hash(runtimeType,customerName,phone,address,const DeepCollectionEquality().hash(measurements),total,prepayment,deadline,const DeepCollectionEquality().hash(missingFields));

@override
String toString() {
  return 'OrderDraft(customerName: $customerName, phone: $phone, address: $address, measurements: $measurements, total: $total, prepayment: $prepayment, deadline: $deadline, missingFields: $missingFields)';
}


}

/// @nodoc
abstract mixin class _$OrderDraftCopyWith<$Res> implements $OrderDraftCopyWith<$Res> {
  factory _$OrderDraftCopyWith(_OrderDraft value, $Res Function(_OrderDraft) _then) = __$OrderDraftCopyWithImpl;
@override @useResult
$Res call({
 String? customerName, String? phone, String? address, List<OrderDraftMeasurement> measurements, int total, int? prepayment, DateTime? deadline, List<String> missingFields
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
@override @pragma('vm:prefer-inline') $Res call({Object? customerName = freezed,Object? phone = freezed,Object? address = freezed,Object? measurements = null,Object? total = null,Object? prepayment = freezed,Object? deadline = freezed,Object? missingFields = null,}) {
  return _then(_OrderDraft(
customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,measurements: null == measurements ? _self.measurements : measurements // ignore: cast_nullable_to_non_nullable
as List<OrderDraftMeasurement>,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,prepayment: freezed == prepayment ? _self.prepayment : prepayment // ignore: cast_nullable_to_non_nullable
as int?,deadline: freezed == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as DateTime?,missingFields: null == missingFields ? _self.missingFields : missingFields // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
