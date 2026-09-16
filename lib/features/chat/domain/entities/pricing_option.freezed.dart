// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pricing_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PricingOptionLine {

 String get title; String get value;
/// Create a copy of PricingOptionLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PricingOptionLineCopyWith<PricingOptionLine> get copyWith => _$PricingOptionLineCopyWithImpl<PricingOptionLine>(this as PricingOptionLine, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PricingOptionLine&&(identical(other.title, title) || other.title == title)&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,title,value);

@override
String toString() {
  return 'PricingOptionLine(title: $title, value: $value)';
}


}

/// @nodoc
abstract mixin class $PricingOptionLineCopyWith<$Res>  {
  factory $PricingOptionLineCopyWith(PricingOptionLine value, $Res Function(PricingOptionLine) _then) = _$PricingOptionLineCopyWithImpl;
@useResult
$Res call({
 String title, String value
});




}
/// @nodoc
class _$PricingOptionLineCopyWithImpl<$Res>
    implements $PricingOptionLineCopyWith<$Res> {
  _$PricingOptionLineCopyWithImpl(this._self, this._then);

  final PricingOptionLine _self;
  final $Res Function(PricingOptionLine) _then;

/// Create a copy of PricingOptionLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? value = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PricingOptionLine].
extension PricingOptionLinePatterns on PricingOptionLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PricingOptionLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PricingOptionLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PricingOptionLine value)  $default,){
final _that = this;
switch (_that) {
case _PricingOptionLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PricingOptionLine value)?  $default,){
final _that = this;
switch (_that) {
case _PricingOptionLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PricingOptionLine() when $default != null:
return $default(_that.title,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String value)  $default,) {final _that = this;
switch (_that) {
case _PricingOptionLine():
return $default(_that.title,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String value)?  $default,) {final _that = this;
switch (_that) {
case _PricingOptionLine() when $default != null:
return $default(_that.title,_that.value);case _:
  return null;

}
}

}

/// @nodoc


class _PricingOptionLine implements PricingOptionLine {
  const _PricingOptionLine({required this.title, required this.value});
  

@override final  String title;
@override final  String value;

/// Create a copy of PricingOptionLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PricingOptionLineCopyWith<_PricingOptionLine> get copyWith => __$PricingOptionLineCopyWithImpl<_PricingOptionLine>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PricingOptionLine&&(identical(other.title, title) || other.title == title)&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,title,value);

@override
String toString() {
  return 'PricingOptionLine(title: $title, value: $value)';
}


}

/// @nodoc
abstract mixin class _$PricingOptionLineCopyWith<$Res> implements $PricingOptionLineCopyWith<$Res> {
  factory _$PricingOptionLineCopyWith(_PricingOptionLine value, $Res Function(_PricingOptionLine) _then) = __$PricingOptionLineCopyWithImpl;
@override @useResult
$Res call({
 String title, String value
});




}
/// @nodoc
class __$PricingOptionLineCopyWithImpl<$Res>
    implements _$PricingOptionLineCopyWith<$Res> {
  __$PricingOptionLineCopyWithImpl(this._self, this._then);

  final _PricingOptionLine _self;
  final $Res Function(_PricingOptionLine) _then;

/// Create a copy of PricingOptionLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? value = null,}) {
  return _then(_PricingOptionLine(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$PricingOption {

 PricingTier get tier; String get title; int get total; List<PricingOptionLine> get lines; int? get difference;
/// Create a copy of PricingOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PricingOptionCopyWith<PricingOption> get copyWith => _$PricingOptionCopyWithImpl<PricingOption>(this as PricingOption, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PricingOption&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.title, title) || other.title == title)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other.lines, lines)&&(identical(other.difference, difference) || other.difference == difference));
}


@override
int get hashCode => Object.hash(runtimeType,tier,title,total,const DeepCollectionEquality().hash(lines),difference);

@override
String toString() {
  return 'PricingOption(tier: $tier, title: $title, total: $total, lines: $lines, difference: $difference)';
}


}

/// @nodoc
abstract mixin class $PricingOptionCopyWith<$Res>  {
  factory $PricingOptionCopyWith(PricingOption value, $Res Function(PricingOption) _then) = _$PricingOptionCopyWithImpl;
@useResult
$Res call({
 PricingTier tier, String title, int total, List<PricingOptionLine> lines, int? difference
});




}
/// @nodoc
class _$PricingOptionCopyWithImpl<$Res>
    implements $PricingOptionCopyWith<$Res> {
  _$PricingOptionCopyWithImpl(this._self, this._then);

  final PricingOption _self;
  final $Res Function(PricingOption) _then;

/// Create a copy of PricingOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tier = null,Object? title = null,Object? total = null,Object? lines = null,Object? difference = freezed,}) {
  return _then(_self.copyWith(
tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as PricingTier,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<PricingOptionLine>,difference: freezed == difference ? _self.difference : difference // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PricingOption].
extension PricingOptionPatterns on PricingOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PricingOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PricingOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PricingOption value)  $default,){
final _that = this;
switch (_that) {
case _PricingOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PricingOption value)?  $default,){
final _that = this;
switch (_that) {
case _PricingOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PricingTier tier,  String title,  int total,  List<PricingOptionLine> lines,  int? difference)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PricingOption() when $default != null:
return $default(_that.tier,_that.title,_that.total,_that.lines,_that.difference);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PricingTier tier,  String title,  int total,  List<PricingOptionLine> lines,  int? difference)  $default,) {final _that = this;
switch (_that) {
case _PricingOption():
return $default(_that.tier,_that.title,_that.total,_that.lines,_that.difference);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PricingTier tier,  String title,  int total,  List<PricingOptionLine> lines,  int? difference)?  $default,) {final _that = this;
switch (_that) {
case _PricingOption() when $default != null:
return $default(_that.tier,_that.title,_that.total,_that.lines,_that.difference);case _:
  return null;

}
}

}

/// @nodoc


class _PricingOption implements PricingOption {
  const _PricingOption({required this.tier, required this.title, required this.total, required this.lines, this.difference});
  

@override final  PricingTier tier;
@override final  String title;
@override final  int total;
@override final  List<PricingOptionLine> lines;
@override final  int? difference;

/// Create a copy of PricingOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PricingOptionCopyWith<_PricingOption> get copyWith => __$PricingOptionCopyWithImpl<_PricingOption>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PricingOption&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.title, title) || other.title == title)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other.lines, lines)&&(identical(other.difference, difference) || other.difference == difference));
}


@override
int get hashCode => Object.hash(runtimeType,tier,title,total,const DeepCollectionEquality().hash(lines),difference);

@override
String toString() {
  return 'PricingOption(tier: $tier, title: $title, total: $total, lines: $lines, difference: $difference)';
}


}

/// @nodoc
abstract mixin class _$PricingOptionCopyWith<$Res> implements $PricingOptionCopyWith<$Res> {
  factory _$PricingOptionCopyWith(_PricingOption value, $Res Function(_PricingOption) _then) = __$PricingOptionCopyWithImpl;
@override @useResult
$Res call({
 PricingTier tier, String title, int total, List<PricingOptionLine> lines, int? difference
});




}
/// @nodoc
class __$PricingOptionCopyWithImpl<$Res>
    implements _$PricingOptionCopyWith<$Res> {
  __$PricingOptionCopyWithImpl(this._self, this._then);

  final _PricingOption _self;
  final $Res Function(_PricingOption) _then;

/// Create a copy of PricingOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tier = null,Object? title = null,Object? total = null,Object? lines = null,Object? difference = freezed,}) {
  return _then(_PricingOption(
tier: null == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as PricingTier,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<PricingOptionLine>,difference: freezed == difference ? _self.difference : difference // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
mixin _$PricingOptions {

 List<PricingOption> get options;
/// Create a copy of PricingOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PricingOptionsCopyWith<PricingOptions> get copyWith => _$PricingOptionsCopyWithImpl<PricingOptions>(this as PricingOptions, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PricingOptions&&const DeepCollectionEquality().equals(other.options, options));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'PricingOptions(options: $options)';
}


}

/// @nodoc
abstract mixin class $PricingOptionsCopyWith<$Res>  {
  factory $PricingOptionsCopyWith(PricingOptions value, $Res Function(PricingOptions) _then) = _$PricingOptionsCopyWithImpl;
@useResult
$Res call({
 List<PricingOption> options
});




}
/// @nodoc
class _$PricingOptionsCopyWithImpl<$Res>
    implements $PricingOptionsCopyWith<$Res> {
  _$PricingOptionsCopyWithImpl(this._self, this._then);

  final PricingOptions _self;
  final $Res Function(PricingOptions) _then;

/// Create a copy of PricingOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? options = null,}) {
  return _then(_self.copyWith(
options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<PricingOption>,
  ));
}

}


/// Adds pattern-matching-related methods to [PricingOptions].
extension PricingOptionsPatterns on PricingOptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PricingOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PricingOptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PricingOptions value)  $default,){
final _that = this;
switch (_that) {
case _PricingOptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PricingOptions value)?  $default,){
final _that = this;
switch (_that) {
case _PricingOptions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PricingOption> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PricingOptions() when $default != null:
return $default(_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PricingOption> options)  $default,) {final _that = this;
switch (_that) {
case _PricingOptions():
return $default(_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PricingOption> options)?  $default,) {final _that = this;
switch (_that) {
case _PricingOptions() when $default != null:
return $default(_that.options);case _:
  return null;

}
}

}

/// @nodoc


class _PricingOptions implements PricingOptions {
  const _PricingOptions({required this.options});
  

@override final  List<PricingOption> options;

/// Create a copy of PricingOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PricingOptionsCopyWith<_PricingOptions> get copyWith => __$PricingOptionsCopyWithImpl<_PricingOptions>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PricingOptions&&const DeepCollectionEquality().equals(other.options, options));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'PricingOptions(options: $options)';
}


}

/// @nodoc
abstract mixin class _$PricingOptionsCopyWith<$Res> implements $PricingOptionsCopyWith<$Res> {
  factory _$PricingOptionsCopyWith(_PricingOptions value, $Res Function(_PricingOptions) _then) = __$PricingOptionsCopyWithImpl;
@override @useResult
$Res call({
 List<PricingOption> options
});




}
/// @nodoc
class __$PricingOptionsCopyWithImpl<$Res>
    implements _$PricingOptionsCopyWith<$Res> {
  __$PricingOptionsCopyWithImpl(this._self, this._then);

  final _PricingOptions _self;
  final $Res Function(_PricingOptions) _then;

/// Create a copy of PricingOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? options = null,}) {
  return _then(_PricingOptions(
options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<PricingOption>,
  ));
}


}

// dart format on
