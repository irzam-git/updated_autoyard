// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_detail_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VehicleDetailState {

 bool get isLoading; bool get isDeleting; VehicleModel? get vehicle; String? get errorMessage; String? get successMessage;
/// Create a copy of VehicleDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleDetailStateCopyWith<VehicleDetailState> get copyWith => _$VehicleDetailStateCopyWithImpl<VehicleDetailState>(this as VehicleDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isDeleting, isDeleting) || other.isDeleting == isDeleting)&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isDeleting,vehicle,errorMessage,successMessage);

@override
String toString() {
  return 'VehicleDetailState(isLoading: $isLoading, isDeleting: $isDeleting, vehicle: $vehicle, errorMessage: $errorMessage, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class $VehicleDetailStateCopyWith<$Res>  {
  factory $VehicleDetailStateCopyWith(VehicleDetailState value, $Res Function(VehicleDetailState) _then) = _$VehicleDetailStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool isDeleting, VehicleModel? vehicle, String? errorMessage, String? successMessage
});


$VehicleModelCopyWith<$Res>? get vehicle;

}
/// @nodoc
class _$VehicleDetailStateCopyWithImpl<$Res>
    implements $VehicleDetailStateCopyWith<$Res> {
  _$VehicleDetailStateCopyWithImpl(this._self, this._then);

  final VehicleDetailState _self;
  final $Res Function(VehicleDetailState) _then;

/// Create a copy of VehicleDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? isDeleting = null,Object? vehicle = freezed,Object? errorMessage = freezed,Object? successMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isDeleting: null == isDeleting ? _self.isDeleting : isDeleting // ignore: cast_nullable_to_non_nullable
as bool,vehicle: freezed == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as VehicleModel?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of VehicleDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleModelCopyWith<$Res>? get vehicle {
    if (_self.vehicle == null) {
    return null;
  }

  return $VehicleModelCopyWith<$Res>(_self.vehicle!, (value) {
    return _then(_self.copyWith(vehicle: value));
  });
}
}


/// Adds pattern-matching-related methods to [VehicleDetailState].
extension VehicleDetailStatePatterns on VehicleDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleDetailState value)  $default,){
final _that = this;
switch (_that) {
case _VehicleDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool isDeleting,  VehicleModel? vehicle,  String? errorMessage,  String? successMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleDetailState() when $default != null:
return $default(_that.isLoading,_that.isDeleting,_that.vehicle,_that.errorMessage,_that.successMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool isDeleting,  VehicleModel? vehicle,  String? errorMessage,  String? successMessage)  $default,) {final _that = this;
switch (_that) {
case _VehicleDetailState():
return $default(_that.isLoading,_that.isDeleting,_that.vehicle,_that.errorMessage,_that.successMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool isDeleting,  VehicleModel? vehicle,  String? errorMessage,  String? successMessage)?  $default,) {final _that = this;
switch (_that) {
case _VehicleDetailState() when $default != null:
return $default(_that.isLoading,_that.isDeleting,_that.vehicle,_that.errorMessage,_that.successMessage);case _:
  return null;

}
}

}

/// @nodoc


class _VehicleDetailState implements VehicleDetailState {
  const _VehicleDetailState({this.isLoading = true, this.isDeleting = false, this.vehicle, this.errorMessage, this.successMessage});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isDeleting;
@override final  VehicleModel? vehicle;
@override final  String? errorMessage;
@override final  String? successMessage;

/// Create a copy of VehicleDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleDetailStateCopyWith<_VehicleDetailState> get copyWith => __$VehicleDetailStateCopyWithImpl<_VehicleDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleDetailState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isDeleting, isDeleting) || other.isDeleting == isDeleting)&&(identical(other.vehicle, vehicle) || other.vehicle == vehicle)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,isDeleting,vehicle,errorMessage,successMessage);

@override
String toString() {
  return 'VehicleDetailState(isLoading: $isLoading, isDeleting: $isDeleting, vehicle: $vehicle, errorMessage: $errorMessage, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class _$VehicleDetailStateCopyWith<$Res> implements $VehicleDetailStateCopyWith<$Res> {
  factory _$VehicleDetailStateCopyWith(_VehicleDetailState value, $Res Function(_VehicleDetailState) _then) = __$VehicleDetailStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool isDeleting, VehicleModel? vehicle, String? errorMessage, String? successMessage
});


@override $VehicleModelCopyWith<$Res>? get vehicle;

}
/// @nodoc
class __$VehicleDetailStateCopyWithImpl<$Res>
    implements _$VehicleDetailStateCopyWith<$Res> {
  __$VehicleDetailStateCopyWithImpl(this._self, this._then);

  final _VehicleDetailState _self;
  final $Res Function(_VehicleDetailState) _then;

/// Create a copy of VehicleDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? isDeleting = null,Object? vehicle = freezed,Object? errorMessage = freezed,Object? successMessage = freezed,}) {
  return _then(_VehicleDetailState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isDeleting: null == isDeleting ? _self.isDeleting : isDeleting // ignore: cast_nullable_to_non_nullable
as bool,vehicle: freezed == vehicle ? _self.vehicle : vehicle // ignore: cast_nullable_to_non_nullable
as VehicleModel?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of VehicleDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VehicleModelCopyWith<$Res>? get vehicle {
    if (_self.vehicle == null) {
    return null;
  }

  return $VehicleModelCopyWith<$Res>(_self.vehicle!, (value) {
    return _then(_self.copyWith(vehicle: value));
  });
}
}

// dart format on
