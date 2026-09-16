// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderDto {

 String get id; String? get number; String? get conversation;@JsonKey(name: 'customer_name') String? get customerName;@JsonKey(name: 'customer_phone') String? get customerPhone; String? get address;@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus? get status;@JsonKey(name: 'status_display') String? get statusDisplay; String? get subtotal;@JsonKey(name: 'discount_percent') String? get discountPercent;@JsonKey(name: 'discount_amount') String? get discountAmount;@JsonKey(name: 'discount_source') String? get discountSource;@JsonKey(name: 'discount_source_display') String? get discountSourceDisplay;@JsonKey(name: 'delivery_amount') String? get deliveryAmount; String? get total;@JsonKey(name: 'prepayment_percent') String? get prepaymentPercent; String? get prepayment; String? get balance;@JsonKey(name: 'payment_status', unknownEnumValue: PaymentStatus.unknown) PaymentStatus? get paymentStatus;@JsonKey(name: 'payment_status_display') String? get paymentStatusDisplay;@JsonKey(name: 'deadline_date') String? get deadlineDate; String? get note;@JsonKey(name: 'confirmed_by') OrderUserDto? get confirmedBy;@JsonKey(name: 'confirmed_at') String? get confirmedAt; OrderUserDto? get user; List<OrderMeasurementDto> get measurements; List<OrderItemDto> get items;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of OrderDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDtoCopyWith<OrderDto> get copyWith => _$OrderDtoCopyWithImpl<OrderDto>(this as OrderDto, _$identity);

  /// Serializes this OrderDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDto&&(identical(other.id, id) || other.id == id)&&(identical(other.number, number) || other.number == number)&&(identical(other.conversation, conversation) || other.conversation == conversation)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.customerPhone, customerPhone) || other.customerPhone == customerPhone)&&(identical(other.address, address) || other.address == address)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusDisplay, statusDisplay) || other.statusDisplay == statusDisplay)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.discountSource, discountSource) || other.discountSource == discountSource)&&(identical(other.discountSourceDisplay, discountSourceDisplay) || other.discountSourceDisplay == discountSourceDisplay)&&(identical(other.deliveryAmount, deliveryAmount) || other.deliveryAmount == deliveryAmount)&&(identical(other.total, total) || other.total == total)&&(identical(other.prepaymentPercent, prepaymentPercent) || other.prepaymentPercent == prepaymentPercent)&&(identical(other.prepayment, prepayment) || other.prepayment == prepayment)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.paymentStatusDisplay, paymentStatusDisplay) || other.paymentStatusDisplay == paymentStatusDisplay)&&(identical(other.deadlineDate, deadlineDate) || other.deadlineDate == deadlineDate)&&(identical(other.note, note) || other.note == note)&&(identical(other.confirmedBy, confirmedBy) || other.confirmedBy == confirmedBy)&&(identical(other.confirmedAt, confirmedAt) || other.confirmedAt == confirmedAt)&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other.measurements, measurements)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,number,conversation,customerName,customerPhone,address,status,statusDisplay,subtotal,discountPercent,discountAmount,discountSource,discountSourceDisplay,deliveryAmount,total,prepaymentPercent,prepayment,balance,paymentStatus,paymentStatusDisplay,deadlineDate,note,confirmedBy,confirmedAt,user,const DeepCollectionEquality().hash(measurements),const DeepCollectionEquality().hash(items),createdAt,updatedAt]);

@override
String toString() {
  return 'OrderDto(id: $id, number: $number, conversation: $conversation, customerName: $customerName, customerPhone: $customerPhone, address: $address, status: $status, statusDisplay: $statusDisplay, subtotal: $subtotal, discountPercent: $discountPercent, discountAmount: $discountAmount, discountSource: $discountSource, discountSourceDisplay: $discountSourceDisplay, deliveryAmount: $deliveryAmount, total: $total, prepaymentPercent: $prepaymentPercent, prepayment: $prepayment, balance: $balance, paymentStatus: $paymentStatus, paymentStatusDisplay: $paymentStatusDisplay, deadlineDate: $deadlineDate, note: $note, confirmedBy: $confirmedBy, confirmedAt: $confirmedAt, user: $user, measurements: $measurements, items: $items, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $OrderDtoCopyWith<$Res>  {
  factory $OrderDtoCopyWith(OrderDto value, $Res Function(OrderDto) _then) = _$OrderDtoCopyWithImpl;
@useResult
$Res call({
 String id, String? number, String? conversation,@JsonKey(name: 'customer_name') String? customerName,@JsonKey(name: 'customer_phone') String? customerPhone, String? address,@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus? status,@JsonKey(name: 'status_display') String? statusDisplay, String? subtotal,@JsonKey(name: 'discount_percent') String? discountPercent,@JsonKey(name: 'discount_amount') String? discountAmount,@JsonKey(name: 'discount_source') String? discountSource,@JsonKey(name: 'discount_source_display') String? discountSourceDisplay,@JsonKey(name: 'delivery_amount') String? deliveryAmount, String? total,@JsonKey(name: 'prepayment_percent') String? prepaymentPercent, String? prepayment, String? balance,@JsonKey(name: 'payment_status', unknownEnumValue: PaymentStatus.unknown) PaymentStatus? paymentStatus,@JsonKey(name: 'payment_status_display') String? paymentStatusDisplay,@JsonKey(name: 'deadline_date') String? deadlineDate, String? note,@JsonKey(name: 'confirmed_by') OrderUserDto? confirmedBy,@JsonKey(name: 'confirmed_at') String? confirmedAt, OrderUserDto? user, List<OrderMeasurementDto> measurements, List<OrderItemDto> items,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});


$OrderUserDtoCopyWith<$Res>? get confirmedBy;$OrderUserDtoCopyWith<$Res>? get user;

}
/// @nodoc
class _$OrderDtoCopyWithImpl<$Res>
    implements $OrderDtoCopyWith<$Res> {
  _$OrderDtoCopyWithImpl(this._self, this._then);

  final OrderDto _self;
  final $Res Function(OrderDto) _then;

/// Create a copy of OrderDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? number = freezed,Object? conversation = freezed,Object? customerName = freezed,Object? customerPhone = freezed,Object? address = freezed,Object? status = freezed,Object? statusDisplay = freezed,Object? subtotal = freezed,Object? discountPercent = freezed,Object? discountAmount = freezed,Object? discountSource = freezed,Object? discountSourceDisplay = freezed,Object? deliveryAmount = freezed,Object? total = freezed,Object? prepaymentPercent = freezed,Object? prepayment = freezed,Object? balance = freezed,Object? paymentStatus = freezed,Object? paymentStatusDisplay = freezed,Object? deadlineDate = freezed,Object? note = freezed,Object? confirmedBy = freezed,Object? confirmedAt = freezed,Object? user = freezed,Object? measurements = null,Object? items = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String?,conversation: freezed == conversation ? _self.conversation : conversation // ignore: cast_nullable_to_non_nullable
as String?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,customerPhone: freezed == customerPhone ? _self.customerPhone : customerPhone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus?,statusDisplay: freezed == statusDisplay ? _self.statusDisplay : statusDisplay // ignore: cast_nullable_to_non_nullable
as String?,subtotal: freezed == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as String?,discountPercent: freezed == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as String?,discountAmount: freezed == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as String?,discountSource: freezed == discountSource ? _self.discountSource : discountSource // ignore: cast_nullable_to_non_nullable
as String?,discountSourceDisplay: freezed == discountSourceDisplay ? _self.discountSourceDisplay : discountSourceDisplay // ignore: cast_nullable_to_non_nullable
as String?,deliveryAmount: freezed == deliveryAmount ? _self.deliveryAmount : deliveryAmount // ignore: cast_nullable_to_non_nullable
as String?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as String?,prepaymentPercent: freezed == prepaymentPercent ? _self.prepaymentPercent : prepaymentPercent // ignore: cast_nullable_to_non_nullable
as String?,prepayment: freezed == prepayment ? _self.prepayment : prepayment // ignore: cast_nullable_to_non_nullable
as String?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String?,paymentStatus: freezed == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as PaymentStatus?,paymentStatusDisplay: freezed == paymentStatusDisplay ? _self.paymentStatusDisplay : paymentStatusDisplay // ignore: cast_nullable_to_non_nullable
as String?,deadlineDate: freezed == deadlineDate ? _self.deadlineDate : deadlineDate // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,confirmedBy: freezed == confirmedBy ? _self.confirmedBy : confirmedBy // ignore: cast_nullable_to_non_nullable
as OrderUserDto?,confirmedAt: freezed == confirmedAt ? _self.confirmedAt : confirmedAt // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as OrderUserDto?,measurements: null == measurements ? _self.measurements : measurements // ignore: cast_nullable_to_non_nullable
as List<OrderMeasurementDto>,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemDto>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of OrderDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderUserDtoCopyWith<$Res>? get confirmedBy {
    if (_self.confirmedBy == null) {
    return null;
  }

  return $OrderUserDtoCopyWith<$Res>(_self.confirmedBy!, (value) {
    return _then(_self.copyWith(confirmedBy: value));
  });
}/// Create a copy of OrderDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderUserDtoCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $OrderUserDtoCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderDto].
extension OrderDtoPatterns on OrderDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderDto value)  $default,){
final _that = this;
switch (_that) {
case _OrderDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderDto value)?  $default,){
final _that = this;
switch (_that) {
case _OrderDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? number,  String? conversation, @JsonKey(name: 'customer_name')  String? customerName, @JsonKey(name: 'customer_phone')  String? customerPhone,  String? address, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus? status, @JsonKey(name: 'status_display')  String? statusDisplay,  String? subtotal, @JsonKey(name: 'discount_percent')  String? discountPercent, @JsonKey(name: 'discount_amount')  String? discountAmount, @JsonKey(name: 'discount_source')  String? discountSource, @JsonKey(name: 'discount_source_display')  String? discountSourceDisplay, @JsonKey(name: 'delivery_amount')  String? deliveryAmount,  String? total, @JsonKey(name: 'prepayment_percent')  String? prepaymentPercent,  String? prepayment,  String? balance, @JsonKey(name: 'payment_status', unknownEnumValue: PaymentStatus.unknown)  PaymentStatus? paymentStatus, @JsonKey(name: 'payment_status_display')  String? paymentStatusDisplay, @JsonKey(name: 'deadline_date')  String? deadlineDate,  String? note, @JsonKey(name: 'confirmed_by')  OrderUserDto? confirmedBy, @JsonKey(name: 'confirmed_at')  String? confirmedAt,  OrderUserDto? user,  List<OrderMeasurementDto> measurements,  List<OrderItemDto> items, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderDto() when $default != null:
return $default(_that.id,_that.number,_that.conversation,_that.customerName,_that.customerPhone,_that.address,_that.status,_that.statusDisplay,_that.subtotal,_that.discountPercent,_that.discountAmount,_that.discountSource,_that.discountSourceDisplay,_that.deliveryAmount,_that.total,_that.prepaymentPercent,_that.prepayment,_that.balance,_that.paymentStatus,_that.paymentStatusDisplay,_that.deadlineDate,_that.note,_that.confirmedBy,_that.confirmedAt,_that.user,_that.measurements,_that.items,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? number,  String? conversation, @JsonKey(name: 'customer_name')  String? customerName, @JsonKey(name: 'customer_phone')  String? customerPhone,  String? address, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus? status, @JsonKey(name: 'status_display')  String? statusDisplay,  String? subtotal, @JsonKey(name: 'discount_percent')  String? discountPercent, @JsonKey(name: 'discount_amount')  String? discountAmount, @JsonKey(name: 'discount_source')  String? discountSource, @JsonKey(name: 'discount_source_display')  String? discountSourceDisplay, @JsonKey(name: 'delivery_amount')  String? deliveryAmount,  String? total, @JsonKey(name: 'prepayment_percent')  String? prepaymentPercent,  String? prepayment,  String? balance, @JsonKey(name: 'payment_status', unknownEnumValue: PaymentStatus.unknown)  PaymentStatus? paymentStatus, @JsonKey(name: 'payment_status_display')  String? paymentStatusDisplay, @JsonKey(name: 'deadline_date')  String? deadlineDate,  String? note, @JsonKey(name: 'confirmed_by')  OrderUserDto? confirmedBy, @JsonKey(name: 'confirmed_at')  String? confirmedAt,  OrderUserDto? user,  List<OrderMeasurementDto> measurements,  List<OrderItemDto> items, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _OrderDto():
return $default(_that.id,_that.number,_that.conversation,_that.customerName,_that.customerPhone,_that.address,_that.status,_that.statusDisplay,_that.subtotal,_that.discountPercent,_that.discountAmount,_that.discountSource,_that.discountSourceDisplay,_that.deliveryAmount,_that.total,_that.prepaymentPercent,_that.prepayment,_that.balance,_that.paymentStatus,_that.paymentStatusDisplay,_that.deadlineDate,_that.note,_that.confirmedBy,_that.confirmedAt,_that.user,_that.measurements,_that.items,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? number,  String? conversation, @JsonKey(name: 'customer_name')  String? customerName, @JsonKey(name: 'customer_phone')  String? customerPhone,  String? address, @JsonKey(unknownEnumValue: OrderStatus.unknown)  OrderStatus? status, @JsonKey(name: 'status_display')  String? statusDisplay,  String? subtotal, @JsonKey(name: 'discount_percent')  String? discountPercent, @JsonKey(name: 'discount_amount')  String? discountAmount, @JsonKey(name: 'discount_source')  String? discountSource, @JsonKey(name: 'discount_source_display')  String? discountSourceDisplay, @JsonKey(name: 'delivery_amount')  String? deliveryAmount,  String? total, @JsonKey(name: 'prepayment_percent')  String? prepaymentPercent,  String? prepayment,  String? balance, @JsonKey(name: 'payment_status', unknownEnumValue: PaymentStatus.unknown)  PaymentStatus? paymentStatus, @JsonKey(name: 'payment_status_display')  String? paymentStatusDisplay, @JsonKey(name: 'deadline_date')  String? deadlineDate,  String? note, @JsonKey(name: 'confirmed_by')  OrderUserDto? confirmedBy, @JsonKey(name: 'confirmed_at')  String? confirmedAt,  OrderUserDto? user,  List<OrderMeasurementDto> measurements,  List<OrderItemDto> items, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _OrderDto() when $default != null:
return $default(_that.id,_that.number,_that.conversation,_that.customerName,_that.customerPhone,_that.address,_that.status,_that.statusDisplay,_that.subtotal,_that.discountPercent,_that.discountAmount,_that.discountSource,_that.discountSourceDisplay,_that.deliveryAmount,_that.total,_that.prepaymentPercent,_that.prepayment,_that.balance,_that.paymentStatus,_that.paymentStatusDisplay,_that.deadlineDate,_that.note,_that.confirmedBy,_that.confirmedAt,_that.user,_that.measurements,_that.items,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderDto implements OrderDto {
  const _OrderDto({required this.id, this.number, this.conversation, @JsonKey(name: 'customer_name') this.customerName, @JsonKey(name: 'customer_phone') this.customerPhone, this.address, @JsonKey(unknownEnumValue: OrderStatus.unknown) this.status, @JsonKey(name: 'status_display') this.statusDisplay, this.subtotal, @JsonKey(name: 'discount_percent') this.discountPercent, @JsonKey(name: 'discount_amount') this.discountAmount, @JsonKey(name: 'discount_source') this.discountSource, @JsonKey(name: 'discount_source_display') this.discountSourceDisplay, @JsonKey(name: 'delivery_amount') this.deliveryAmount, this.total, @JsonKey(name: 'prepayment_percent') this.prepaymentPercent, this.prepayment, this.balance, @JsonKey(name: 'payment_status', unknownEnumValue: PaymentStatus.unknown) this.paymentStatus, @JsonKey(name: 'payment_status_display') this.paymentStatusDisplay, @JsonKey(name: 'deadline_date') this.deadlineDate, this.note, @JsonKey(name: 'confirmed_by') this.confirmedBy, @JsonKey(name: 'confirmed_at') this.confirmedAt, this.user, this.measurements = const [], this.items = const [], @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _OrderDto.fromJson(Map<String, dynamic> json) => _$OrderDtoFromJson(json);

@override final  String id;
@override final  String? number;
@override final  String? conversation;
@override@JsonKey(name: 'customer_name') final  String? customerName;
@override@JsonKey(name: 'customer_phone') final  String? customerPhone;
@override final  String? address;
@override@JsonKey(unknownEnumValue: OrderStatus.unknown) final  OrderStatus? status;
@override@JsonKey(name: 'status_display') final  String? statusDisplay;
@override final  String? subtotal;
@override@JsonKey(name: 'discount_percent') final  String? discountPercent;
@override@JsonKey(name: 'discount_amount') final  String? discountAmount;
@override@JsonKey(name: 'discount_source') final  String? discountSource;
@override@JsonKey(name: 'discount_source_display') final  String? discountSourceDisplay;
@override@JsonKey(name: 'delivery_amount') final  String? deliveryAmount;
@override final  String? total;
@override@JsonKey(name: 'prepayment_percent') final  String? prepaymentPercent;
@override final  String? prepayment;
@override final  String? balance;
@override@JsonKey(name: 'payment_status', unknownEnumValue: PaymentStatus.unknown) final  PaymentStatus? paymentStatus;
@override@JsonKey(name: 'payment_status_display') final  String? paymentStatusDisplay;
@override@JsonKey(name: 'deadline_date') final  String? deadlineDate;
@override final  String? note;
@override@JsonKey(name: 'confirmed_by') final  OrderUserDto? confirmedBy;
@override@JsonKey(name: 'confirmed_at') final  String? confirmedAt;
@override final  OrderUserDto? user;
@override@JsonKey() final  List<OrderMeasurementDto> measurements;
@override@JsonKey() final  List<OrderItemDto> items;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of OrderDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDtoCopyWith<_OrderDto> get copyWith => __$OrderDtoCopyWithImpl<_OrderDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDto&&(identical(other.id, id) || other.id == id)&&(identical(other.number, number) || other.number == number)&&(identical(other.conversation, conversation) || other.conversation == conversation)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.customerPhone, customerPhone) || other.customerPhone == customerPhone)&&(identical(other.address, address) || other.address == address)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusDisplay, statusDisplay) || other.statusDisplay == statusDisplay)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.discountPercent, discountPercent) || other.discountPercent == discountPercent)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.discountSource, discountSource) || other.discountSource == discountSource)&&(identical(other.discountSourceDisplay, discountSourceDisplay) || other.discountSourceDisplay == discountSourceDisplay)&&(identical(other.deliveryAmount, deliveryAmount) || other.deliveryAmount == deliveryAmount)&&(identical(other.total, total) || other.total == total)&&(identical(other.prepaymentPercent, prepaymentPercent) || other.prepaymentPercent == prepaymentPercent)&&(identical(other.prepayment, prepayment) || other.prepayment == prepayment)&&(identical(other.balance, balance) || other.balance == balance)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.paymentStatusDisplay, paymentStatusDisplay) || other.paymentStatusDisplay == paymentStatusDisplay)&&(identical(other.deadlineDate, deadlineDate) || other.deadlineDate == deadlineDate)&&(identical(other.note, note) || other.note == note)&&(identical(other.confirmedBy, confirmedBy) || other.confirmedBy == confirmedBy)&&(identical(other.confirmedAt, confirmedAt) || other.confirmedAt == confirmedAt)&&(identical(other.user, user) || other.user == user)&&const DeepCollectionEquality().equals(other.measurements, measurements)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,number,conversation,customerName,customerPhone,address,status,statusDisplay,subtotal,discountPercent,discountAmount,discountSource,discountSourceDisplay,deliveryAmount,total,prepaymentPercent,prepayment,balance,paymentStatus,paymentStatusDisplay,deadlineDate,note,confirmedBy,confirmedAt,user,const DeepCollectionEquality().hash(measurements),const DeepCollectionEquality().hash(items),createdAt,updatedAt]);

@override
String toString() {
  return 'OrderDto(id: $id, number: $number, conversation: $conversation, customerName: $customerName, customerPhone: $customerPhone, address: $address, status: $status, statusDisplay: $statusDisplay, subtotal: $subtotal, discountPercent: $discountPercent, discountAmount: $discountAmount, discountSource: $discountSource, discountSourceDisplay: $discountSourceDisplay, deliveryAmount: $deliveryAmount, total: $total, prepaymentPercent: $prepaymentPercent, prepayment: $prepayment, balance: $balance, paymentStatus: $paymentStatus, paymentStatusDisplay: $paymentStatusDisplay, deadlineDate: $deadlineDate, note: $note, confirmedBy: $confirmedBy, confirmedAt: $confirmedAt, user: $user, measurements: $measurements, items: $items, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$OrderDtoCopyWith<$Res> implements $OrderDtoCopyWith<$Res> {
  factory _$OrderDtoCopyWith(_OrderDto value, $Res Function(_OrderDto) _then) = __$OrderDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String? number, String? conversation,@JsonKey(name: 'customer_name') String? customerName,@JsonKey(name: 'customer_phone') String? customerPhone, String? address,@JsonKey(unknownEnumValue: OrderStatus.unknown) OrderStatus? status,@JsonKey(name: 'status_display') String? statusDisplay, String? subtotal,@JsonKey(name: 'discount_percent') String? discountPercent,@JsonKey(name: 'discount_amount') String? discountAmount,@JsonKey(name: 'discount_source') String? discountSource,@JsonKey(name: 'discount_source_display') String? discountSourceDisplay,@JsonKey(name: 'delivery_amount') String? deliveryAmount, String? total,@JsonKey(name: 'prepayment_percent') String? prepaymentPercent, String? prepayment, String? balance,@JsonKey(name: 'payment_status', unknownEnumValue: PaymentStatus.unknown) PaymentStatus? paymentStatus,@JsonKey(name: 'payment_status_display') String? paymentStatusDisplay,@JsonKey(name: 'deadline_date') String? deadlineDate, String? note,@JsonKey(name: 'confirmed_by') OrderUserDto? confirmedBy,@JsonKey(name: 'confirmed_at') String? confirmedAt, OrderUserDto? user, List<OrderMeasurementDto> measurements, List<OrderItemDto> items,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});


@override $OrderUserDtoCopyWith<$Res>? get confirmedBy;@override $OrderUserDtoCopyWith<$Res>? get user;

}
/// @nodoc
class __$OrderDtoCopyWithImpl<$Res>
    implements _$OrderDtoCopyWith<$Res> {
  __$OrderDtoCopyWithImpl(this._self, this._then);

  final _OrderDto _self;
  final $Res Function(_OrderDto) _then;

/// Create a copy of OrderDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? number = freezed,Object? conversation = freezed,Object? customerName = freezed,Object? customerPhone = freezed,Object? address = freezed,Object? status = freezed,Object? statusDisplay = freezed,Object? subtotal = freezed,Object? discountPercent = freezed,Object? discountAmount = freezed,Object? discountSource = freezed,Object? discountSourceDisplay = freezed,Object? deliveryAmount = freezed,Object? total = freezed,Object? prepaymentPercent = freezed,Object? prepayment = freezed,Object? balance = freezed,Object? paymentStatus = freezed,Object? paymentStatusDisplay = freezed,Object? deadlineDate = freezed,Object? note = freezed,Object? confirmedBy = freezed,Object? confirmedAt = freezed,Object? user = freezed,Object? measurements = null,Object? items = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_OrderDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,number: freezed == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String?,conversation: freezed == conversation ? _self.conversation : conversation // ignore: cast_nullable_to_non_nullable
as String?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,customerPhone: freezed == customerPhone ? _self.customerPhone : customerPhone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as OrderStatus?,statusDisplay: freezed == statusDisplay ? _self.statusDisplay : statusDisplay // ignore: cast_nullable_to_non_nullable
as String?,subtotal: freezed == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as String?,discountPercent: freezed == discountPercent ? _self.discountPercent : discountPercent // ignore: cast_nullable_to_non_nullable
as String?,discountAmount: freezed == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as String?,discountSource: freezed == discountSource ? _self.discountSource : discountSource // ignore: cast_nullable_to_non_nullable
as String?,discountSourceDisplay: freezed == discountSourceDisplay ? _self.discountSourceDisplay : discountSourceDisplay // ignore: cast_nullable_to_non_nullable
as String?,deliveryAmount: freezed == deliveryAmount ? _self.deliveryAmount : deliveryAmount // ignore: cast_nullable_to_non_nullable
as String?,total: freezed == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as String?,prepaymentPercent: freezed == prepaymentPercent ? _self.prepaymentPercent : prepaymentPercent // ignore: cast_nullable_to_non_nullable
as String?,prepayment: freezed == prepayment ? _self.prepayment : prepayment // ignore: cast_nullable_to_non_nullable
as String?,balance: freezed == balance ? _self.balance : balance // ignore: cast_nullable_to_non_nullable
as String?,paymentStatus: freezed == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as PaymentStatus?,paymentStatusDisplay: freezed == paymentStatusDisplay ? _self.paymentStatusDisplay : paymentStatusDisplay // ignore: cast_nullable_to_non_nullable
as String?,deadlineDate: freezed == deadlineDate ? _self.deadlineDate : deadlineDate // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,confirmedBy: freezed == confirmedBy ? _self.confirmedBy : confirmedBy // ignore: cast_nullable_to_non_nullable
as OrderUserDto?,confirmedAt: freezed == confirmedAt ? _self.confirmedAt : confirmedAt // ignore: cast_nullable_to_non_nullable
as String?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as OrderUserDto?,measurements: null == measurements ? _self.measurements : measurements // ignore: cast_nullable_to_non_nullable
as List<OrderMeasurementDto>,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItemDto>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of OrderDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderUserDtoCopyWith<$Res>? get confirmedBy {
    if (_self.confirmedBy == null) {
    return null;
  }

  return $OrderUserDtoCopyWith<$Res>(_self.confirmedBy!, (value) {
    return _then(_self.copyWith(confirmedBy: value));
  });
}/// Create a copy of OrderDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderUserDtoCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $OrderUserDtoCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}

// dart format on
