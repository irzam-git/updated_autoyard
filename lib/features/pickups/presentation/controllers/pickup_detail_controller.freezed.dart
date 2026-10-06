// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pickup_detail_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PickupDetailState {

 bool get isLoading; bool get isUpdatingStatus; AssignedPickupModel? get pickup; String? get errorMessage; String? get successMessage;
/// Create a copy of PickupDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PickupDetailStateCopyWith<PickupDetailState> get copyWith => _$PickupDetailStateCopyWithImpl<PickupDetailState>(this as PickupDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PickupDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isUpdatingStatus, isUpdatingStatus) || other.isUpdatingStatus == isUpdatingStatus)&&(identical(other.pickup, pickup) || other.pickup == pickup)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isUpdatingStatus,pickup,errorMessage,successMessage);

@override
String toString() {
  return 'PickupDetailState(isLoading: $isLoading, isUpdatingStatus: $isUpdatingStatus, pickup: $pickup, errorMessage: $errorMessage, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class $PickupDetailStateCopyWith<$Res>  {
  factory $PickupDetailStateCopyWith(PickupDetailState value, $Res Function(PickupDetailState) _then) = _$PickupDetailStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isUpdatingStatus, AssignedPickupModel? pickup, String? errorMessage, String? successMessage
});


$AssignedPickupModelCopyWith<$Res>? get pickup;

}
/// @nodoc
class _$PickupDetailStateCopyWithImpl<$Res>
    implements $PickupDetailStateCopyWith<$Res> {
  _$PickupDetailStateCopyWithImpl(this._self, this._then);

  final PickupDetailState _self;
  final $Res Function(PickupDetailState) _then;

/// Create a copy of PickupDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isUpdatingStatus = null,Object? pickup = freezed,Object? errorMessage = freezed,Object? successMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isUpdatingStatus: null == isUpdatingStatus ? _self.isUpdatingStatus : isUpdatingStatus // ignore: cast_nullable_to_non_nullable
as bool,pickup: freezed == pickup ? _self.pickup : pickup // ignore: cast_nullable_to_non_nullable
as AssignedPickupModel?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of PickupDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssignedPickupModelCopyWith<$Res>? get pickup {
    if (_self.pickup == null) {
    return null;
  }

  return $AssignedPickupModelCopyWith<$Res>(_self.pickup!, (value) {
    return _then(_self.copyWith(pickup: value));
  });
}
}


/// Adds pattern-matching-related methods to [PickupDetailState].
extension PickupDetailStatePatterns on PickupDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PickupDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PickupDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PickupDetailState value)  $default,){
final _that = this;
switch (_that) {
case _PickupDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PickupDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _PickupDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isUpdatingStatus,  AssignedPickupModel? pickup,  String? errorMessage,  String? successMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PickupDetailState() when $default != null:
return $default(_that.isLoading,_that.isUpdatingStatus,_that.pickup,_that.errorMessage,_that.successMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isUpdatingStatus,  AssignedPickupModel? pickup,  String? errorMessage,  String? successMessage)  $default,) {final _that = this;
switch (_that) {
case _PickupDetailState():
return $default(_that.isLoading,_that.isUpdatingStatus,_that.pickup,_that.errorMessage,_that.successMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isUpdatingStatus,  AssignedPickupModel? pickup,  String? errorMessage,  String? successMessage)?  $default,) {final _that = this;
switch (_that) {
case _PickupDetailState() when $default != null:
return $default(_that.isLoading,_that.isUpdatingStatus,_that.pickup,_that.errorMessage,_that.successMessage);case _:
  return null;

}
}

}

/// @nodoc


class _PickupDetailState implements PickupDetailState {
  const _PickupDetailState({this.isLoading = true, this.isUpdatingStatus = false, this.pickup, this.errorMessage, this.successMessage});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isUpdatingStatus;
@override final  AssignedPickupModel? pickup;
@override final  String? errorMessage;
@override final  String? successMessage;

/// Create a copy of PickupDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PickupDetailStateCopyWith<_PickupDetailState> get copyWith => __$PickupDetailStateCopyWithImpl<_PickupDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PickupDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isUpdatingStatus, isUpdatingStatus) || other.isUpdatingStatus == isUpdatingStatus)&&(identical(other.pickup, pickup) || other.pickup == pickup)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isUpdatingStatus,pickup,errorMessage,successMessage);

@override
String toString() {
  return 'PickupDetailState(isLoading: $isLoading, isUpdatingStatus: $isUpdatingStatus, pickup: $pickup, errorMessage: $errorMessage, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class _$PickupDetailStateCopyWith<$Res> implements $PickupDetailStateCopyWith<$Res> {
  factory _$PickupDetailStateCopyWith(_PickupDetailState value, $Res Function(_PickupDetailState) _then) = __$PickupDetailStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isUpdatingStatus, AssignedPickupModel? pickup, String? errorMessage, String? successMessage
});


@override $AssignedPickupModelCopyWith<$Res>? get pickup;

}
/// @nodoc
class __$PickupDetailStateCopyWithImpl<$Res>
    implements _$PickupDetailStateCopyWith<$Res> {
  __$PickupDetailStateCopyWithImpl(this._self, this._then);

  final _PickupDetailState _self;
  final $Res Function(_PickupDetailState) _then;

/// Create a copy of PickupDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isUpdatingStatus = null,Object? pickup = freezed,Object? errorMessage = freezed,Object? successMessage = freezed,}) {
  return _then(_PickupDetailState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isUpdatingStatus: null == isUpdatingStatus ? _self.isUpdatingStatus : isUpdatingStatus // ignore: cast_nullable_to_non_nullable
as bool,pickup: freezed == pickup ? _self.pickup : pickup // ignore: cast_nullable_to_non_nullable
as AssignedPickupModel?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PickupDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssignedPickupModelCopyWith<$Res>? get pickup {
    if (_self.pickup == null) {
    return null;
  }

  return $AssignedPickupModelCopyWith<$Res>(_self.pickup!, (value) {
    return _then(_self.copyWith(pickup: value));
  });
}
}

// dart format on
