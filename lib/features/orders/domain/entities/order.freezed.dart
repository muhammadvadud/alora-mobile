// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Order {

 String get id; String? get number; String? get conversationId; String? get customerName; String? get customerPhone; String? get address; OrderStatus get status; String? get statusDisplay; int? get subtotal; double? get discountPercent; int? get discountAmount; String? get discountSource; String? get discountSourceDisplay; int? get deliveryAmount; int? get total; double? get prepaymentPercent; int? get prepayment; int? get balance; PaymentStatus get paymentStatus; String? get paymentStatusDisplay; DateTime? get deadlineDate; String? get note; OrderUser? get confirmedBy; DateTime? get confirmedAt; OrderUser? get user; List<OrderMeasurement> get measurements; List<OrderItem> get items; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderCopyWith<Order> get copyWith => _$OrderCopyWithImpl<Order>(this as Order, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Order&&(identical(other.id, id) || other.id == id)&&(identical(other.number, number) || other.number == number)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.customerPhone, customerPhone) || other.customerPhone == customerPhone)&&(identical(other.address, address) || other.address == address)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusDisplay, statusDisplay) || other.statusDisplay == statusDisplay)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.discountSource, discountSource) || other.discountSource == discountSource)&&(identical(other.discountSourceDisplay, discountSourceDisplay) || other.discountSourceDisplay == discountSourceDisplay)&&(identical(other.deliveryAmount, deliveryAmount) || other.deliveryAmount == deliveryAmount)&&(identical(other.total, total) || other.total == total)&&(identical(other.prepaymentPercent, prepaymentPercent) || other.prepaymentPercent == prepaymentPercent)&&(identical(other.prepayment, prepayment) || other.prepayment == prepayment)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.paymentStatusDisplay, paymentStatusDisplay) || other.paymentStatusDisplay == paymentStatusDisplay)&&(identical(other.deadlineDate, deadlineDate) || other.deadlineDate == deadlineDate)&&(identical(other.note, note) || other.note == note)&&(identical(other.confirmedBy, confirmedBy) || other.confirmedBy == confirmedBy)&&(identical(other.confirmedAt, confirmedAt) || other.confirmedAt == confirmedAt)&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other.measurements, measurements)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,number,conversationId,customerName,customerPhone,address,status,statusDisplay,subtotal,discountPercent,discountAmount,discountSource,discountSourceDisplay,deliveryAmount,total,prepaymentPercent,prepayment,balance,paymentStatus,paymentStatusDisplay,deadlineDate,note,confirmedBy,confirmedAt,user,const DeepCollectionEquality().hash(measurements),const DeepCollectionEquality().hash(items),createdAt,updatedAt]);

@override
String toString() {
  return 'Order(id: $id, number: $number, conversationId: $conversationId, customerName: $customerName, customerPhone: $customerPhone, address: $address, status: $status, statusDisplay: $statusDisplay, subtotal: $subtotal, discountPercent: $discountPercent, discountAmount: $discountAmount, discountSource: $discountSource, discountSourceDisplay: $discountSourceDisplay, deliveryAmount: $deliveryAmount, total: $total, prepaymentPercent: $prepaymentPercent, prepayment: $prepayment, balance: $balance, paymentStatus: $paymentStatus, paymentStatusDisplay: $paymentStatusDisplay, deadlineDate: $deadlineDate, note: $note, confirmedBy: $confirmedBy, confirmedAt: $confirmedAt, user: $user, measurements: $measurements, items: $items, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $OrderCopyWith<$Res>  {
  factory $OrderCopyWith(Order value, $Res Function(Order) _then) = _$OrderCopyWithImpl;
@useResult
$Res call({
 String id, String? number, String? conversationId, String? customerName, String? customerPhone, String? address, OrderStatus status, String? statusDisplay, int? subtotal, double? discountPercent, int? discountAmount, String? discountSource, String? discountSourceDisplay, int? deliveryAmount, int? total, double? prepaymentPercent, int? prepayment, int? balance, PaymentStatus paymentStatus, String? paymentStatusDisplay, DateTime? deadlineDate, String? note, OrderUser? confirmedBy, DateTime? confirmedAt, OrderUser? user, List<OrderMeasurement> measurements, List<OrderItem> items, DateTime? createdAt, DateTime? updatedAt
});


$OrderUserCopyWith<$Res>? get confirmedBy;$OrderUserCopyWith<$Res>? get user;

}
/// @nodoc
class _$OrderCopyWithImpl<$Res>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._self, this._then);

  final Order _self;
  final $Res Function(Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? number = freezed,Object? conversationId = freezed,Object? customerName = freezed,Object? customerPhone = freezed,Object? address = freezed,Object? status = null,Object? statusDisplay = freezed,Object? subtotal = freezed,Object? discountPercent = freezed,Object? discountAmount = freezed,Object? discountSource = freezed,Object? discountSourceDisplay = freezed,Object? deliveryAmount = freezed,Object? total = freezed,Object? prepaymentPercent = freezed,Object? prepayment = freezed,Object? balance = freezed,Object? paymentStatus = null,Object? paymentStatusDisplay = freezed,Object? deadlineDate = freezed,Object? note = freezed,Object? confirmedBy = freezed,Object? confirmedAt = freezed,Object? user = freezed,Object? measurements = null,Object? items = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String?,conversationId: freezed == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,customerPhone: freezed == customerPhone ? _self.customerPhone : customerPhone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,statusDisplay: freezed == statusDisplay ? _self.statusDisplay : statusDisplay // ignore: cast_nullable_to_non_nullable
as String?,subtotal: freezed == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as int?,discountPercent: freezed == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as double?,discountAmount: freezed == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as int?,discountSource: freezed == discountSource ? _self.discountSource : discountSource // ignore: cast_nullable_to_non_nullable
as String?,discountSourceDisplay: freezed == discountSourceDisplay ? _self.discountSourceDisplay : discountSourceDisplay // ignore: cast_nullable_to_non_nullable
as String?,deliveryAmount: freezed == deliveryAmount ? _self.deliveryAmount : deliveryAmount // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,prepaymentPercent: freezed == prepaymentPercent ? _self.prepaymentPercent : prepaymentPercent // ignore: cast_nullable_to_non_nullable
as double?,prepayment: freezed == prepayment ? _self.prepayment : prepayment // ignore: cast_nullable_to_non_nullable
as int?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int?,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as PaymentStatus,paymentStatusDisplay: freezed == paymentStatusDisplay ? _self.paymentStatusDisplay : paymentStatusDisplay // ignore: cast_nullable_to_non_nullable
as String?,deadlineDate: freezed == deadlineDate ? _self.deadlineDate : deadlineDate // ignore: cast_nullable_to_non_nullable
as DateTime?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,confirmedBy: freezed == confirmedBy ? _self.confirmedBy : confirmedBy // ignore: cast_nullable_to_non_nullable
as OrderUser?,confirmedAt: freezed == confirmedAt ? _self.confirmedAt : confirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as OrderUser?,measurements: null == measurements ? _self.measurements : measurements // ignore: cast_nullable_to_non_nullable
as List<OrderMeasurement>,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderUserCopyWith<$Res>? get confirmedBy {
    if (_self.confirmedBy == null) {
    return null;
  }

  return $OrderUserCopyWith<$Res>(_self.confirmedBy!, (value) {
    return _then(_self.copyWith(confirmedBy: value));
  });
}/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $OrderUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [Order].
extension OrderPatterns on Order {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Order value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Order() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Order value)  $default,){
final _that = this;
switch (_that) {
case _Order():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Order value)?  $default,){
final _that = this;
switch (_that) {
case _Order() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? number,  String? conversationId,  String? customerName,  String? customerPhone,  String? address,  OrderStatus status,  String? statusDisplay,  int? subtotal,  double? discountPercent,  int? discountAmount,  String? discountSource,  String? discountSourceDisplay,  int? deliveryAmount,  int? total,  double? prepaymentPercent,  int? prepayment,  int? balance,  PaymentStatus paymentStatus,  String? paymentStatusDisplay,  DateTime? deadlineDate,  String? note,  OrderUser? confirmedBy,  DateTime? confirmedAt,  OrderUser? user,  List<OrderMeasurement> measurements,  List<OrderItem> items,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.number,_that.conversationId,_that.customerName,_that.customerPhone,_that.address,_that.status,_that.statusDisplay,_that.subtotal,_that.discountPercent,_that.discountAmount,_that.discountSource,_that.discountSourceDisplay,_that.deliveryAmount,_that.total,_that.prepaymentPercent,_that.prepayment,_that.balance,_that.paymentStatus,_that.paymentStatusDisplay,_that.deadlineDate,_that.note,_that.confirmedBy,_that.confirmedAt,_that.user,_that.measurements,_that.items,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? number,  String? conversationId,  String? customerName,  String? customerPhone,  String? address,  OrderStatus status,  String? statusDisplay,  int? subtotal,  double? discountPercent,  int? discountAmount,  String? discountSource,  String? discountSourceDisplay,  int? deliveryAmount,  int? total,  double? prepaymentPercent,  int? prepayment,  int? balance,  PaymentStatus paymentStatus,  String? paymentStatusDisplay,  DateTime? deadlineDate,  String? note,  OrderUser? confirmedBy,  DateTime? confirmedAt,  OrderUser? user,  List<OrderMeasurement> measurements,  List<OrderItem> items,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Order():
return $default(_that.id,_that.number,_that.conversationId,_that.customerName,_that.customerPhone,_that.address,_that.status,_that.statusDisplay,_that.subtotal,_that.discountPercent,_that.discountAmount,_that.discountSource,_that.discountSourceDisplay,_that.deliveryAmount,_that.total,_that.prepaymentPercent,_that.prepayment,_that.balance,_that.paymentStatus,_that.paymentStatusDisplay,_that.deadlineDate,_that.note,_that.confirmedBy,_that.confirmedAt,_that.user,_that.measurements,_that.items,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? number,  String? conversationId,  String? customerName,  String? customerPhone,  String? address,  OrderStatus status,  String? statusDisplay,  int? subtotal,  double? discountPercent,  int? discountAmount,  String? discountSource,  String? discountSourceDisplay,  int? deliveryAmount,  int? total,  double? prepaymentPercent,  int? prepayment,  int? balance,  PaymentStatus paymentStatus,  String? paymentStatusDisplay,  DateTime? deadlineDate,  String? note,  OrderUser? confirmedBy,  DateTime? confirmedAt,  OrderUser? user,  List<OrderMeasurement> measurements,  List<OrderItem> items,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Order() when $default != null:
return $default(_that.id,_that.number,_that.conversationId,_that.customerName,_that.customerPhone,_that.address,_that.status,_that.statusDisplay,_that.subtotal,_that.discountPercent,_that.discountAmount,_that.discountSource,_that.discountSourceDisplay,_that.deliveryAmount,_that.total,_that.prepaymentPercent,_that.prepayment,_that.balance,_that.paymentStatus,_that.paymentStatusDisplay,_that.deadlineDate,_that.note,_that.confirmedBy,_that.confirmedAt,_that.user,_that.measurements,_that.items,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _Order implements Order {
  const _Order({required this.id, this.number, this.conversationId, this.customerName, this.customerPhone, this.address, required this.status, this.statusDisplay, this.subtotal, this.discountPercent, this.discountAmount, this.discountSource, this.discountSourceDisplay, this.deliveryAmount, this.total, this.prepaymentPercent, this.prepayment, this.balance, required this.paymentStatus, this.paymentStatusDisplay, this.deadlineDate, this.note, this.confirmedBy, this.confirmedAt, this.user, this.measurements = const [], this.items = const [], this.createdAt, this.updatedAt});
  

@override final  String id;
@override final  String? number;
@override final  String? conversationId;
@override final  String? customerName;
@override final  String? customerPhone;
@override final  String? address;
@override final  OrderStatus status;
@override final  String? statusDisplay;
@override final  int? subtotal;
@override final  double? discountPercent;
@override final  int? discountAmount;
@override final  String? discountSource;
@override final  String? discountSourceDisplay;
@override final  int? deliveryAmount;
@override final  int? total;
@override final  double? prepaymentPercent;
@override final  int? prepayment;
@override final  int? balance;
@override final  PaymentStatus paymentStatus;
@override final  String? paymentStatusDisplay;
@override final  DateTime? deadlineDate;
@override final  String? note;
@override final  OrderUser? confirmedBy;
@override final  DateTime? confirmedAt;
@override final  OrderUser? user;
@override@JsonKey() final  List<OrderMeasurement> measurements;
@override@JsonKey() final  List<OrderItem> items;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCopyWith<_Order> get copyWith => __$OrderCopyWithImpl<_Order>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Order&&(identical(other.id, id) || other.id == id)&&(identical(other.number, number) || other.number == number)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.customerPhone, customerPhone) || other.customerPhone == customerPhone)&&(identical(other.address, address) || other.address == address)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusDisplay, statusDisplay) || other.statusDisplay == statusDisplay)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.discountSource, discountSource) || other.discountSource == discountSource)&&(identical(other.discountSourceDisplay, discountSourceDisplay) || other.discountSourceDisplay == discountSourceDisplay)&&(identical(other.deliveryAmount, deliveryAmount) || other.deliveryAmount == deliveryAmount)&&(identical(other.total, total) || other.total == total)&&(identical(other.prepaymentPercent, prepaymentPercent) || other.prepaymentPercent == prepaymentPercent)&&(identical(other.prepayment, prepayment) || other.prepayment == prepayment)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.paymentStatusDisplay, paymentStatusDisplay) || other.paymentStatusDisplay == paymentStatusDisplay)&&(identical(other.deadlineDate, deadlineDate) || other.deadlineDate == deadlineDate)&&(identical(other.note, note) || other.note == note)&&(identical(other.confirmedBy, confirmedBy) || other.confirmedBy == confirmedBy)&&(identical(other.confirmedAt, confirmedAt) || other.confirmedAt == confirmedAt)&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other.measurements, measurements)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,number,conversationId,customerName,customerPhone,address,status,statusDisplay,subtotal,discountPercent,discountAmount,discountSource,discountSourceDisplay,deliveryAmount,total,prepaymentPercent,prepayment,balance,paymentStatus,paymentStatusDisplay,deadlineDate,note,confirmedBy,confirmedAt,user,const DeepCollectionEquality().hash(measurements),const DeepCollectionEquality().hash(items),createdAt,updatedAt]);

@override
String toString() {
  return 'Order(id: $id, number: $number, conversationId: $conversationId, customerName: $customerName, customerPhone: $customerPhone, address: $address, status: $status, statusDisplay: $statusDisplay, subtotal: $subtotal, discountPercent: $discountPercent, discountAmount: $discountAmount, discountSource: $discountSource, discountSourceDisplay: $discountSourceDisplay, deliveryAmount: $deliveryAmount, total: $total, prepaymentPercent: $prepaymentPercent, prepayment: $prepayment, balance: $balance, paymentStatus: $paymentStatus, paymentStatusDisplay: $paymentStatusDisplay, deadlineDate: $deadlineDate, note: $note, confirmedBy: $confirmedBy, confirmedAt: $confirmedAt, user: $user, measurements: $measurements, items: $items, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$OrderCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$OrderCopyWith(_Order value, $Res Function(_Order) _then) = __$OrderCopyWithImpl;
@override @useResult
$Res call({
 String id, String? number, String? conversationId, String? customerName, String? customerPhone, String? address, OrderStatus status, String? statusDisplay, int? subtotal, double? discountPercent, int? discountAmount, String? discountSource, String? discountSourceDisplay, int? deliveryAmount, int? total, double? prepaymentPercent, int? prepayment, int? balance, PaymentStatus paymentStatus, String? paymentStatusDisplay, DateTime? deadlineDate, String? note, OrderUser? confirmedBy, DateTime? confirmedAt, OrderUser? user, List<OrderMeasurement> measurements, List<OrderItem> items, DateTime? createdAt, DateTime? updatedAt
});


@override $OrderUserCopyWith<$Res>? get confirmedBy;@override $OrderUserCopyWith<$Res>? get user;

}
/// @nodoc
class __$OrderCopyWithImpl<$Res>
    implements _$OrderCopyWith<$Res> {
  __$OrderCopyWithImpl(this._self, this._then);

  final _Order _self;
  final $Res Function(_Order) _then;

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? number = freezed,Object? conversationId = freezed,Object? customerName = freezed,Object? customerPhone = freezed,Object? address = freezed,Object? status = null,Object? statusDisplay = freezed,Object? subtotal = freezed,Object? discountPercent = freezed,Object? discountAmount = freezed,Object? discountSource = freezed,Object? discountSourceDisplay = freezed,Object? deliveryAmount = freezed,Object? total = freezed,Object? prepaymentPercent = freezed,Object? prepayment = freezed,Object? balance = freezed,Object? paymentStatus = null,Object? paymentStatusDisplay = freezed,Object? deadlineDate = freezed,Object? note = freezed,Object? confirmedBy = freezed,Object? confirmedAt = freezed,Object? user = freezed,Object? measurements = null,Object? items = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Order(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String?,conversationId: freezed == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,customerPhone: freezed == customerPhone ? _self.customerPhone : customerPhone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus,statusDisplay: freezed == statusDisplay ? _self.statusDisplay : statusDisplay // ignore: cast_nullable_to_non_nullable
as String?,subtotal: freezed == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as int?,discountPercent: freezed == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as double?,discountAmount: freezed == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as int?,discountSource: freezed == discountSource ? _self.discountSource : discountSource // ignore: cast_nullable_to_non_nullable
as String?,discountSourceDisplay: freezed == discountSourceDisplay ? _self.discountSourceDisplay : discountSourceDisplay // ignore: cast_nullable_to_non_nullable
as String?,deliveryAmount: freezed == deliveryAmount ? _self.deliveryAmount : deliveryAmount // ignore: cast_nullable_to_non_nullable
as int?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int?,prepaymentPercent: freezed == prepaymentPercent ? _self.prepaymentPercent : prepaymentPercent // ignore: cast_nullable_to_non_nullable
as double?,prepayment: freezed == prepayment ? _self.prepayment : prepayment // ignore: cast_nullable_to_non_nullable
as int?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as int?,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as PaymentStatus,paymentStatusDisplay: freezed == paymentStatusDisplay ? _self.paymentStatusDisplay : paymentStatusDisplay // ignore: cast_nullable_to_non_nullable
as String?,deadlineDate: freezed == deadlineDate ? _self.deadlineDate : deadlineDate // ignore: cast_nullable_to_non_nullable
as DateTime?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,confirmedBy: freezed == confirmedBy ? _self.confirmedBy : confirmedBy // ignore: cast_nullable_to_non_nullable
as OrderUser?,confirmedAt: freezed == confirmedAt ? _self.confirmedAt : confirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as OrderUser?,measurements: null == measurements ? _self.measurements : measurements // ignore: cast_nullable_to_non_nullable
as List<OrderMeasurement>,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderUserCopyWith<$Res>? get confirmedBy {
    if (_self.confirmedBy == null) {
    return null;
  }

  return $OrderUserCopyWith<$Res>(_self.confirmedBy!, (value) {
    return _then(_self.copyWith(confirmedBy: value));
  });
}/// Create a copy of Order
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderUserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $OrderUserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
