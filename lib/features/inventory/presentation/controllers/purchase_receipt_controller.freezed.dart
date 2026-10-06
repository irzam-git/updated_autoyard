// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_receipt_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PurchaseReceiptState {

 bool get isLoading; bool get isDownloading; String? get receiptUrl; String? get localPdfPath; String? get errorMessage;
/// Create a copy of PurchaseReceiptState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchaseReceiptStateCopyWith<PurchaseReceiptState> get copyWith => _$PurchaseReceiptStateCopyWithImpl<PurchaseReceiptState>(this as PurchaseReceiptState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchaseReceiptState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isDownloading, isDownloading) || other.isDownloading == isDownloading)&&(identical(other.receiptUrl, receiptUrl) || other.receiptUrl == receiptUrl)&&(identical(other.localPdfPath, localPdfPath) || other.localPdfPath == localPdfPath)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isDownloading,receiptUrl,localPdfPath,errorMessage);

@override
String toString() {
  return 'PurchaseReceiptState(isLoading: $isLoading, isDownloading: $isDownloading, receiptUrl: $receiptUrl, localPdfPath: $localPdfPath, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $PurchaseReceiptStateCopyWith<$Res>  {
  factory $PurchaseReceiptStateCopyWith(PurchaseReceiptState value, $Res Function(PurchaseReceiptState) _then) = _$PurchaseReceiptStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isDownloading, String? receiptUrl, String? localPdfPath, String? errorMessage
});




}
/// @nodoc
class _$PurchaseReceiptStateCopyWithImpl<$Res>
    implements $PurchaseReceiptStateCopyWith<$Res> {
  _$PurchaseReceiptStateCopyWithImpl(this._self, this._then);

  final PurchaseReceiptState _self;
  final $Res Function(PurchaseReceiptState) _then;

/// Create a copy of PurchaseReceiptState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isDownloading = null,Object? receiptUrl = freezed,Object? localPdfPath = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isDownloading: null == isDownloading ? _self.isDownloading : isDownloading // ignore: cast_nullable_to_non_nullable
as bool,receiptUrl: freezed == receiptUrl ? _self.receiptUrl : receiptUrl // ignore: cast_nullable_to_non_nullable
as String?,localPdfPath: freezed == localPdfPath ? _self.localPdfPath : localPdfPath // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PurchaseReceiptState].
extension PurchaseReceiptStatePatterns on PurchaseReceiptState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PurchaseReceiptState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PurchaseReceiptState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PurchaseReceiptState value)  $default,){
final _that = this;
switch (_that) {
case _PurchaseReceiptState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PurchaseReceiptState value)?  $default,){
final _that = this;
switch (_that) {
case _PurchaseReceiptState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isDownloading,  String? receiptUrl,  String? localPdfPath,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurchaseReceiptState() when $default != null:
return $default(_that.isLoading,_that.isDownloading,_that.receiptUrl,_that.localPdfPath,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isDownloading,  String? receiptUrl,  String? localPdfPath,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _PurchaseReceiptState():
return $default(_that.isLoading,_that.isDownloading,_that.receiptUrl,_that.localPdfPath,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isDownloading,  String? receiptUrl,  String? localPdfPath,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _PurchaseReceiptState() when $default != null:
return $default(_that.isLoading,_that.isDownloading,_that.receiptUrl,_that.localPdfPath,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _PurchaseReceiptState implements PurchaseReceiptState {
  const _PurchaseReceiptState({this.isLoading = true, this.isDownloading = false, this.receiptUrl, this.localPdfPath, this.errorMessage});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isDownloading;
@override final  String? receiptUrl;
@override final  String? localPdfPath;
@override final  String? errorMessage;

/// Create a copy of PurchaseReceiptState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseReceiptStateCopyWith<_PurchaseReceiptState> get copyWith => __$PurchaseReceiptStateCopyWithImpl<_PurchaseReceiptState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchaseReceiptState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isDownloading, isDownloading) || other.isDownloading == isDownloading)&&(identical(other.receiptUrl, receiptUrl) || other.receiptUrl == receiptUrl)&&(identical(other.localPdfPath, localPdfPath) || other.localPdfPath == localPdfPath)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isDownloading,receiptUrl,localPdfPath,errorMessage);

@override
String toString() {
  return 'PurchaseReceiptState(isLoading: $isLoading, isDownloading: $isDownloading, receiptUrl: $receiptUrl, localPdfPath: $localPdfPath, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$PurchaseReceiptStateCopyWith<$Res> implements $PurchaseReceiptStateCopyWith<$Res> {
  factory _$PurchaseReceiptStateCopyWith(_PurchaseReceiptState value, $Res Function(_PurchaseReceiptState) _then) = __$PurchaseReceiptStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isDownloading, String? receiptUrl, String? localPdfPath, String? errorMessage
});




}
/// @nodoc
class __$PurchaseReceiptStateCopyWithImpl<$Res>
    implements _$PurchaseReceiptStateCopyWith<$Res> {
  __$PurchaseReceiptStateCopyWithImpl(this._self, this._then);

  final _PurchaseReceiptState _self;
  final $Res Function(_PurchaseReceiptState) _then;

/// Create a copy of PurchaseReceiptState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isDownloading = null,Object? receiptUrl = freezed,Object? localPdfPath = freezed,Object? errorMessage = freezed,}) {
  return _then(_PurchaseReceiptState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isDownloading: null == isDownloading ? _self.isDownloading : isDownloading // ignore: cast_nullable_to_non_nullable
as bool,receiptUrl: freezed == receiptUrl ? _self.receiptUrl : receiptUrl // ignore: cast_nullable_to_non_nullable
as String?,localPdfPath: freezed == localPdfPath ? _self.localPdfPath : localPdfPath // ignore: cast_nullable_to_non_nullable
as String?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
