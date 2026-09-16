// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RichBlock {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RichBlock);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RichBlock()';
}


}

/// @nodoc
class $RichBlockCopyWith<$Res>  {
$RichBlockCopyWith(RichBlock _, $Res Function(RichBlock) __);
}


/// Adds pattern-matching-related methods to [RichBlock].
extension RichBlockPatterns on RichBlock {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ToolChip value)?  toolChip,TResult Function( _Products value)?  products,TResult Function( _QuoteBlock value)?  quote,TResult Function( _Options value)?  options,TResult Function( _OrderDraftBlock value)?  orderDraft,TResult Function( _Warning value)?  warning,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToolChip() when toolChip != null:
return toolChip(_that);case _Products() when products != null:
return products(_that);case _QuoteBlock() when quote != null:
return quote(_that);case _Options() when options != null:
return options(_that);case _OrderDraftBlock() when orderDraft != null:
return orderDraft(_that);case _Warning() when warning != null:
return warning(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ToolChip value)  toolChip,required TResult Function( _Products value)  products,required TResult Function( _QuoteBlock value)  quote,required TResult Function( _Options value)  options,required TResult Function( _OrderDraftBlock value)  orderDraft,required TResult Function( _Warning value)  warning,}){
final _that = this;
switch (_that) {
case _ToolChip():
return toolChip(_that);case _Products():
return products(_that);case _QuoteBlock():
return quote(_that);case _Options():
return options(_that);case _OrderDraftBlock():
return orderDraft(_that);case _Warning():
return warning(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ToolChip value)?  toolChip,TResult? Function( _Products value)?  products,TResult? Function( _QuoteBlock value)?  quote,TResult? Function( _Options value)?  options,TResult? Function( _OrderDraftBlock value)?  orderDraft,TResult? Function( _Warning value)?  warning,}){
final _that = this;
switch (_that) {
case _ToolChip() when toolChip != null:
return toolChip(_that);case _Products() when products != null:
return products(_that);case _QuoteBlock() when quote != null:
return quote(_that);case _Options() when options != null:
return options(_that);case _OrderDraftBlock() when orderDraft != null:
return orderDraft(_that);case _Warning() when warning != null:
return warning(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String tool,  ToolChipState state,  String? resultText,  String? rawArgs,  String? rawResult)?  toolChip,TResult Function( List<ProductRef> products)?  products,TResult Function( Quote quote)?  quote,TResult Function( PricingOptions options)?  options,TResult Function( OrderDraft draft)?  orderDraft,TResult Function( String message)?  warning,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToolChip() when toolChip != null:
return toolChip(_that.tool,_that.state,_that.resultText,_that.rawArgs,_that.rawResult);case _Products() when products != null:
return products(_that.products);case _QuoteBlock() when quote != null:
return quote(_that.quote);case _Options() when options != null:
return options(_that.options);case _OrderDraftBlock() when orderDraft != null:
return orderDraft(_that.draft);case _Warning() when warning != null:
return warning(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String tool,  ToolChipState state,  String? resultText,  String? rawArgs,  String? rawResult)  toolChip,required TResult Function( List<ProductRef> products)  products,required TResult Function( Quote quote)  quote,required TResult Function( PricingOptions options)  options,required TResult Function( OrderDraft draft)  orderDraft,required TResult Function( String message)  warning,}) {final _that = this;
switch (_that) {
case _ToolChip():
return toolChip(_that.tool,_that.state,_that.resultText,_that.rawArgs,_that.rawResult);case _Products():
return products(_that.products);case _QuoteBlock():
return quote(_that.quote);case _Options():
return options(_that.options);case _OrderDraftBlock():
return orderDraft(_that.draft);case _Warning():
return warning(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String tool,  ToolChipState state,  String? resultText,  String? rawArgs,  String? rawResult)?  toolChip,TResult? Function( List<ProductRef> products)?  products,TResult? Function( Quote quote)?  quote,TResult? Function( PricingOptions options)?  options,TResult? Function( OrderDraft draft)?  orderDraft,TResult? Function( String message)?  warning,}) {final _that = this;
switch (_that) {
case _ToolChip() when toolChip != null:
return toolChip(_that.tool,_that.state,_that.resultText,_that.rawArgs,_that.rawResult);case _Products() when products != null:
return products(_that.products);case _QuoteBlock() when quote != null:
return quote(_that.quote);case _Options() when options != null:
return options(_that.options);case _OrderDraftBlock() when orderDraft != null:
return orderDraft(_that.draft);case _Warning() when warning != null:
return warning(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _ToolChip implements RichBlock {
  const _ToolChip({required this.tool, required this.state, this.resultText, this.rawArgs, this.rawResult});
  

 final  String tool;
 final  ToolChipState state;
 final  String? resultText;
 final  String? rawArgs;
 final  String? rawResult;

/// Create a copy of RichBlock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToolChipCopyWith<_ToolChip> get copyWith => __$ToolChipCopyWithImpl<_ToolChip>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToolChip&&(identical(other.tool, tool) || other.tool == tool)&&(identical(other.state, state) || other.state == state)&&(identical(other.resultText, resultText) || other.resultText == resultText)&&(identical(other.rawArgs, rawArgs) || other.rawArgs == rawArgs)&&(identical(other.rawResult, rawResult) || other.rawResult == rawResult));
}


@override
int get hashCode => Object.hash(runtimeType,tool,state,resultText,rawArgs,rawResult);

@override
String toString() {
  return 'RichBlock.toolChip(tool: $tool, state: $state, resultText: $resultText, rawArgs: $rawArgs, rawResult: $rawResult)';
}


}

/// @nodoc
abstract mixin class _$ToolChipCopyWith<$Res> implements $RichBlockCopyWith<$Res> {
  factory _$ToolChipCopyWith(_ToolChip value, $Res Function(_ToolChip) _then) = __$ToolChipCopyWithImpl;
@useResult
$Res call({
 String tool, ToolChipState state, String? resultText, String? rawArgs, String? rawResult
});




}
/// @nodoc
class __$ToolChipCopyWithImpl<$Res>
    implements _$ToolChipCopyWith<$Res> {
  __$ToolChipCopyWithImpl(this._self, this._then);

  final _ToolChip _self;
  final $Res Function(_ToolChip) _then;

/// Create a copy of RichBlock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tool = null,Object? state = null,Object? resultText = freezed,Object? rawArgs = freezed,Object? rawResult = freezed,}) {
  return _then(_ToolChip(
tool: null == tool ? _self.tool : tool // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as ToolChipState,resultText: freezed == resultText ? _self.resultText : resultText // ignore: cast_nullable_to_non_nullable
as String?,rawArgs: freezed == rawArgs ? _self.rawArgs : rawArgs // ignore: cast_nullable_to_non_nullable
as String?,rawResult: freezed == rawResult ? _self.rawResult : rawResult // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _Products implements RichBlock {
  const _Products({required this.products});
  

 final  List<ProductRef> products;

/// Create a copy of RichBlock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductsCopyWith<_Products> get copyWith => __$ProductsCopyWithImpl<_Products>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Products&&const DeepCollectionEquality().equals(other.products, products));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(products));

@override
String toString() {
  return 'RichBlock.products(products: $products)';
}


}

/// @nodoc
abstract mixin class _$ProductsCopyWith<$Res> implements $RichBlockCopyWith<$Res> {
  factory _$ProductsCopyWith(_Products value, $Res Function(_Products) _then) = __$ProductsCopyWithImpl;
@useResult
$Res call({
 List<ProductRef> products
});




}
/// @nodoc
class __$ProductsCopyWithImpl<$Res>
    implements _$ProductsCopyWith<$Res> {
  __$ProductsCopyWithImpl(this._self, this._then);

  final _Products _self;
  final $Res Function(_Products) _then;

/// Create a copy of RichBlock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? products = null,}) {
  return _then(_Products(
products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductRef>,
  ));
}


}

/// @nodoc


class _QuoteBlock implements RichBlock {
  const _QuoteBlock({required this.quote});
  

 final  Quote quote;

/// Create a copy of RichBlock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuoteBlockCopyWith<_QuoteBlock> get copyWith => __$QuoteBlockCopyWithImpl<_QuoteBlock>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuoteBlock&&(identical(other.quote, quote) || other.quote == quote));
}


@override
int get hashCode => Object.hash(runtimeType,quote);

@override
String toString() {
  return 'RichBlock.quote(quote: $quote)';
}


}

/// @nodoc
abstract mixin class _$QuoteBlockCopyWith<$Res> implements $RichBlockCopyWith<$Res> {
  factory _$QuoteBlockCopyWith(_QuoteBlock value, $Res Function(_QuoteBlock) _then) = __$QuoteBlockCopyWithImpl;
@useResult
$Res call({
 Quote quote
});


$QuoteCopyWith<$Res> get quote;

}
/// @nodoc
class __$QuoteBlockCopyWithImpl<$Res>
    implements _$QuoteBlockCopyWith<$Res> {
  __$QuoteBlockCopyWithImpl(this._self, this._then);

  final _QuoteBlock _self;
  final $Res Function(_QuoteBlock) _then;

/// Create a copy of RichBlock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? quote = null,}) {
  return _then(_QuoteBlock(
quote: null == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as Quote,
  ));
}

/// Create a copy of RichBlock
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuoteCopyWith<$Res> get quote {
  
  return $QuoteCopyWith<$Res>(_self.quote, (value) {
    return _then(_self.copyWith(quote: value));
  });
}
}

/// @nodoc


class _Options implements RichBlock {
  const _Options({required this.options});
  

 final  PricingOptions options;

/// Create a copy of RichBlock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OptionsCopyWith<_Options> get copyWith => __$OptionsCopyWithImpl<_Options>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Options&&(identical(other.options, options) || other.options == options));
}


@override
int get hashCode => Object.hash(runtimeType,options);

@override
String toString() {
  return 'RichBlock.options(options: $options)';
}


}

/// @nodoc
abstract mixin class _$OptionsCopyWith<$Res> implements $RichBlockCopyWith<$Res> {
  factory _$OptionsCopyWith(_Options value, $Res Function(_Options) _then) = __$OptionsCopyWithImpl;
@useResult
$Res call({
 PricingOptions options
});


$PricingOptionsCopyWith<$Res> get options;

}
/// @nodoc
class __$OptionsCopyWithImpl<$Res>
    implements _$OptionsCopyWith<$Res> {
  __$OptionsCopyWithImpl(this._self, this._then);

  final _Options _self;
  final $Res Function(_Options) _then;

/// Create a copy of RichBlock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? options = null,}) {
  return _then(_Options(
options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as PricingOptions,
  ));
}

/// Create a copy of RichBlock
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PricingOptionsCopyWith<$Res> get options {
  
  return $PricingOptionsCopyWith<$Res>(_self.options, (value) {
    return _then(_self.copyWith(options: value));
  });
}
}

/// @nodoc


class _OrderDraftBlock implements RichBlock {
  const _OrderDraftBlock({required this.draft});
  

 final  OrderDraft draft;

/// Create a copy of RichBlock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDraftBlockCopyWith<_OrderDraftBlock> get copyWith => __$OrderDraftBlockCopyWithImpl<_OrderDraftBlock>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDraftBlock&&(identical(other.draft, draft) || other.draft == draft));
}


@override
int get hashCode => Object.hash(runtimeType,draft);

@override
String toString() {
  return 'RichBlock.orderDraft(draft: $draft)';
}


}

/// @nodoc
abstract mixin class _$OrderDraftBlockCopyWith<$Res> implements $RichBlockCopyWith<$Res> {
  factory _$OrderDraftBlockCopyWith(_OrderDraftBlock value, $Res Function(_OrderDraftBlock) _then) = __$OrderDraftBlockCopyWithImpl;
@useResult
$Res call({
 OrderDraft draft
});


$OrderDraftCopyWith<$Res> get draft;

}
/// @nodoc
class __$OrderDraftBlockCopyWithImpl<$Res>
    implements _$OrderDraftBlockCopyWith<$Res> {
  __$OrderDraftBlockCopyWithImpl(this._self, this._then);

  final _OrderDraftBlock _self;
  final $Res Function(_OrderDraftBlock) _then;

/// Create a copy of RichBlock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? draft = null,}) {
  return _then(_OrderDraftBlock(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as OrderDraft,
  ));
}

/// Create a copy of RichBlock
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderDraftCopyWith<$Res> get draft {
  
  return $OrderDraftCopyWith<$Res>(_self.draft, (value) {
    return _then(_self.copyWith(draft: value));
  });
}
}

/// @nodoc


class _Warning implements RichBlock {
  const _Warning({required this.message});
  

 final  String message;

/// Create a copy of RichBlock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WarningCopyWith<_Warning> get copyWith => __$WarningCopyWithImpl<_Warning>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Warning&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'RichBlock.warning(message: $message)';
}


}

/// @nodoc
abstract mixin class _$WarningCopyWith<$Res> implements $RichBlockCopyWith<$Res> {
  factory _$WarningCopyWith(_Warning value, $Res Function(_Warning) _then) = __$WarningCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$WarningCopyWithImpl<$Res>
    implements _$WarningCopyWith<$Res> {
  __$WarningCopyWithImpl(this._self, this._then);

  final _Warning _self;
  final $Res Function(_Warning) _then;

/// Create a copy of RichBlock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Warning(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$Message {

 String get id; MessageRole get role; String get content; DateTime get createdAt; MessageStatus get status; List<RichBlock> get richBlocks;
/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageCopyWith<Message> get copyWith => _$MessageCopyWithImpl<Message>(this as Message, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Message&&(identical(other.id, id) || other.id == id)&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.richBlocks, richBlocks));
}


@override
int get hashCode => Object.hash(runtimeType,id,role,content,createdAt,status,const DeepCollectionEquality().hash(richBlocks));

@override
String toString() {
  return 'Message(id: $id, role: $role, content: $content, createdAt: $createdAt, status: $status, richBlocks: $richBlocks)';
}


}

/// @nodoc
abstract mixin class $MessageCopyWith<$Res>  {
  factory $MessageCopyWith(Message value, $Res Function(Message) _then) = _$MessageCopyWithImpl;
@useResult
$Res call({
 String id, MessageRole role, String content, DateTime createdAt, MessageStatus status, List<RichBlock> richBlocks
});




}
/// @nodoc
class _$MessageCopyWithImpl<$Res>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._self, this._then);

  final Message _self;
  final $Res Function(Message) _then;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? role = null,Object? content = null,Object? createdAt = null,Object? status = null,Object? richBlocks = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as MessageRole,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MessageStatus,richBlocks: null == richBlocks ? _self.richBlocks : richBlocks // ignore: cast_nullable_to_non_nullable
as List<RichBlock>,
  ));
}

}


/// Adds pattern-matching-related methods to [Message].
extension MessagePatterns on Message {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Message value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Message() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Message value)  $default,){
final _that = this;
switch (_that) {
case _Message():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Message value)?  $default,){
final _that = this;
switch (_that) {
case _Message() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  MessageRole role,  String content,  DateTime createdAt,  MessageStatus status,  List<RichBlock> richBlocks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Message() when $default != null:
return $default(_that.id,_that.role,_that.content,_that.createdAt,_that.status,_that.richBlocks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  MessageRole role,  String content,  DateTime createdAt,  MessageStatus status,  List<RichBlock> richBlocks)  $default,) {final _that = this;
switch (_that) {
case _Message():
return $default(_that.id,_that.role,_that.content,_that.createdAt,_that.status,_that.richBlocks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  MessageRole role,  String content,  DateTime createdAt,  MessageStatus status,  List<RichBlock> richBlocks)?  $default,) {final _that = this;
switch (_that) {
case _Message() when $default != null:
return $default(_that.id,_that.role,_that.content,_that.createdAt,_that.status,_that.richBlocks);case _:
  return null;

}
}

}

/// @nodoc


class _Message implements Message {
  const _Message({required this.id, required this.role, required this.content, required this.createdAt, required this.status, this.richBlocks = const []});
  

@override final  String id;
@override final  MessageRole role;
@override final  String content;
@override final  DateTime createdAt;
@override final  MessageStatus status;
@override@JsonKey() final  List<RichBlock> richBlocks;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageCopyWith<_Message> get copyWith => __$MessageCopyWithImpl<_Message>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Message&&(identical(other.id, id) || other.id == id)&&(identical(other.role, role) || other.role == role)&&(identical(other.content, content) || other.content == content)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.richBlocks, richBlocks));
}


@override
int get hashCode => Object.hash(runtimeType,id,role,content,createdAt,status,const DeepCollectionEquality().hash(richBlocks));

@override
String toString() {
  return 'Message(id: $id, role: $role, content: $content, createdAt: $createdAt, status: $status, richBlocks: $richBlocks)';
}


}

/// @nodoc
abstract mixin class _$MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$MessageCopyWith(_Message value, $Res Function(_Message) _then) = __$MessageCopyWithImpl;
@override @useResult
$Res call({
 String id, MessageRole role, String content, DateTime createdAt, MessageStatus status, List<RichBlock> richBlocks
});




}
/// @nodoc
class __$MessageCopyWithImpl<$Res>
    implements _$MessageCopyWith<$Res> {
  __$MessageCopyWithImpl(this._self, this._then);

  final _Message _self;
  final $Res Function(_Message) _then;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? role = null,Object? content = null,Object? createdAt = null,Object? status = null,Object? richBlocks = null,}) {
  return _then(_Message(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as MessageRole,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MessageStatus,richBlocks: null == richBlocks ? _self.richBlocks : richBlocks // ignore: cast_nullable_to_non_nullable
as List<RichBlock>,
  ));
}


}

// dart format on
