// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_parent_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DriverParentOtherModel {

@JsonKey(name: 'is_subscribed') bool? get isSubscribed;@JsonKey(name: 'is_subscription_active') bool? get isSubscriptionActive;@JsonKey(name: 'has_exceeded_driver_limit') bool? get hasExceededDriverLimit;@JsonKey(name: 'has_exceeded_car_limit') bool? get hasExceededCarLimit;@JsonKey(name: 'drivers_count') int? get driversCount;@JsonKey(name: 'vehicles_count') int? get vehiclesCount;
/// Create a copy of DriverParentOtherModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DriverParentOtherModelCopyWith<DriverParentOtherModel> get copyWith => _$DriverParentOtherModelCopyWithImpl<DriverParentOtherModel>(this as DriverParentOtherModel, _$identity);

  /// Serializes this DriverParentOtherModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DriverParentOtherModel&&(identical(other.isSubscribed, isSubscribed) || other.isSubscribed == isSubscribed)&&(identical(other.isSubscriptionActive, isSubscriptionActive) || other.isSubscriptionActive == isSubscriptionActive)&&(identical(other.hasExceededDriverLimit, hasExceededDriverLimit) || other.hasExceededDriverLimit == hasExceededDriverLimit)&&(identical(other.hasExceededCarLimit, hasExceededCarLimit) || other.hasExceededCarLimit == hasExceededCarLimit)&&(identical(other.driversCount, driversCount) || other.driversCount == driversCount)&&(identical(other.vehiclesCount, vehiclesCount) || other.vehiclesCount == vehiclesCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSubscribed,isSubscriptionActive,hasExceededDriverLimit,hasExceededCarLimit,driversCount,vehiclesCount);

@override
String toString() {
  return 'DriverParentOtherModel(isSubscribed: $isSubscribed, isSubscriptionActive: $isSubscriptionActive, hasExceededDriverLimit: $hasExceededDriverLimit, hasExceededCarLimit: $hasExceededCarLimit, driversCount: $driversCount, vehiclesCount: $vehiclesCount)';
}


}

/// @nodoc
abstract mixin class $DriverParentOtherModelCopyWith<$Res>  {
  factory $DriverParentOtherModelCopyWith(DriverParentOtherModel value, $Res Function(DriverParentOtherModel) _then) = _$DriverParentOtherModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'is_subscribed') bool? isSubscribed,@JsonKey(name: 'is_subscription_active') bool? isSubscriptionActive,@JsonKey(name: 'has_exceeded_driver_limit') bool? hasExceededDriverLimit,@JsonKey(name: 'has_exceeded_car_limit') bool? hasExceededCarLimit,@JsonKey(name: 'drivers_count') int? driversCount,@JsonKey(name: 'vehicles_count') int? vehiclesCount
});




}
/// @nodoc
class _$DriverParentOtherModelCopyWithImpl<$Res>
    implements $DriverParentOtherModelCopyWith<$Res> {
  _$DriverParentOtherModelCopyWithImpl(this._self, this._then);

  final DriverParentOtherModel _self;
  final $Res Function(DriverParentOtherModel) _then;

/// Create a copy of DriverParentOtherModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSubscribed = freezed,Object? isSubscriptionActive = freezed,Object? hasExceededDriverLimit = freezed,Object? hasExceededCarLimit = freezed,Object? driversCount = freezed,Object? vehiclesCount = freezed,}) {
  return _then(_self.copyWith(
isSubscribed: freezed == isSubscribed ? _self.isSubscribed : isSubscribed // ignore: cast_nullable_to_non_nullable
as bool?,isSubscriptionActive: freezed == isSubscriptionActive ? _self.isSubscriptionActive : isSubscriptionActive // ignore: cast_nullable_to_non_nullable
as bool?,hasExceededDriverLimit: freezed == hasExceededDriverLimit ? _self.hasExceededDriverLimit : hasExceededDriverLimit // ignore: cast_nullable_to_non_nullable
as bool?,hasExceededCarLimit: freezed == hasExceededCarLimit ? _self.hasExceededCarLimit : hasExceededCarLimit // ignore: cast_nullable_to_non_nullable
as bool?,driversCount: freezed == driversCount ? _self.driversCount : driversCount // ignore: cast_nullable_to_non_nullable
as int?,vehiclesCount: freezed == vehiclesCount ? _self.vehiclesCount : vehiclesCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [DriverParentOtherModel].
extension DriverParentOtherModelPatterns on DriverParentOtherModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DriverParentOtherModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DriverParentOtherModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DriverParentOtherModel value)  $default,){
final _that = this;
switch (_that) {
case _DriverParentOtherModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DriverParentOtherModel value)?  $default,){
final _that = this;
switch (_that) {
case _DriverParentOtherModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_subscribed')  bool? isSubscribed, @JsonKey(name: 'is_subscription_active')  bool? isSubscriptionActive, @JsonKey(name: 'has_exceeded_driver_limit')  bool? hasExceededDriverLimit, @JsonKey(name: 'has_exceeded_car_limit')  bool? hasExceededCarLimit, @JsonKey(name: 'drivers_count')  int? driversCount, @JsonKey(name: 'vehicles_count')  int? vehiclesCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DriverParentOtherModel() when $default != null:
return $default(_that.isSubscribed,_that.isSubscriptionActive,_that.hasExceededDriverLimit,_that.hasExceededCarLimit,_that.driversCount,_that.vehiclesCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_subscribed')  bool? isSubscribed, @JsonKey(name: 'is_subscription_active')  bool? isSubscriptionActive, @JsonKey(name: 'has_exceeded_driver_limit')  bool? hasExceededDriverLimit, @JsonKey(name: 'has_exceeded_car_limit')  bool? hasExceededCarLimit, @JsonKey(name: 'drivers_count')  int? driversCount, @JsonKey(name: 'vehicles_count')  int? vehiclesCount)  $default,) {final _that = this;
switch (_that) {
case _DriverParentOtherModel():
return $default(_that.isSubscribed,_that.isSubscriptionActive,_that.hasExceededDriverLimit,_that.hasExceededCarLimit,_that.driversCount,_that.vehiclesCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'is_subscribed')  bool? isSubscribed, @JsonKey(name: 'is_subscription_active')  bool? isSubscriptionActive, @JsonKey(name: 'has_exceeded_driver_limit')  bool? hasExceededDriverLimit, @JsonKey(name: 'has_exceeded_car_limit')  bool? hasExceededCarLimit, @JsonKey(name: 'drivers_count')  int? driversCount, @JsonKey(name: 'vehicles_count')  int? vehiclesCount)?  $default,) {final _that = this;
switch (_that) {
case _DriverParentOtherModel() when $default != null:
return $default(_that.isSubscribed,_that.isSubscriptionActive,_that.hasExceededDriverLimit,_that.hasExceededCarLimit,_that.driversCount,_that.vehiclesCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DriverParentOtherModel implements DriverParentOtherModel {
  const _DriverParentOtherModel({@JsonKey(name: 'is_subscribed') this.isSubscribed, @JsonKey(name: 'is_subscription_active') this.isSubscriptionActive, @JsonKey(name: 'has_exceeded_driver_limit') this.hasExceededDriverLimit, @JsonKey(name: 'has_exceeded_car_limit') this.hasExceededCarLimit, @JsonKey(name: 'drivers_count') this.driversCount, @JsonKey(name: 'vehicles_count') this.vehiclesCount});
  factory _DriverParentOtherModel.fromJson(Map<String, dynamic> json) => _$DriverParentOtherModelFromJson(json);

@override@JsonKey(name: 'is_subscribed') final  bool? isSubscribed;
@override@JsonKey(name: 'is_subscription_active') final  bool? isSubscriptionActive;
@override@JsonKey(name: 'has_exceeded_driver_limit') final  bool? hasExceededDriverLimit;
@override@JsonKey(name: 'has_exceeded_car_limit') final  bool? hasExceededCarLimit;
@override@JsonKey(name: 'drivers_count') final  int? driversCount;
@override@JsonKey(name: 'vehicles_count') final  int? vehiclesCount;

/// Create a copy of DriverParentOtherModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DriverParentOtherModelCopyWith<_DriverParentOtherModel> get copyWith => __$DriverParentOtherModelCopyWithImpl<_DriverParentOtherModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DriverParentOtherModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DriverParentOtherModel&&(identical(other.isSubscribed, isSubscribed) || other.isSubscribed == isSubscribed)&&(identical(other.isSubscriptionActive, isSubscriptionActive) || other.isSubscriptionActive == isSubscriptionActive)&&(identical(other.hasExceededDriverLimit, hasExceededDriverLimit) || other.hasExceededDriverLimit == hasExceededDriverLimit)&&(identical(other.hasExceededCarLimit, hasExceededCarLimit) || other.hasExceededCarLimit == hasExceededCarLimit)&&(identical(other.driversCount, driversCount) || other.driversCount == driversCount)&&(identical(other.vehiclesCount, vehiclesCount) || other.vehiclesCount == vehiclesCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSubscribed,isSubscriptionActive,hasExceededDriverLimit,hasExceededCarLimit,driversCount,vehiclesCount);

@override
String toString() {
  return 'DriverParentOtherModel(isSubscribed: $isSubscribed, isSubscriptionActive: $isSubscriptionActive, hasExceededDriverLimit: $hasExceededDriverLimit, hasExceededCarLimit: $hasExceededCarLimit, driversCount: $driversCount, vehiclesCount: $vehiclesCount)';
}


}

/// @nodoc
abstract mixin class _$DriverParentOtherModelCopyWith<$Res> implements $DriverParentOtherModelCopyWith<$Res> {
  factory _$DriverParentOtherModelCopyWith(_DriverParentOtherModel value, $Res Function(_DriverParentOtherModel) _then) = __$DriverParentOtherModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'is_subscribed') bool? isSubscribed,@JsonKey(name: 'is_subscription_active') bool? isSubscriptionActive,@JsonKey(name: 'has_exceeded_driver_limit') bool? hasExceededDriverLimit,@JsonKey(name: 'has_exceeded_car_limit') bool? hasExceededCarLimit,@JsonKey(name: 'drivers_count') int? driversCount,@JsonKey(name: 'vehicles_count') int? vehiclesCount
});




}
/// @nodoc
class __$DriverParentOtherModelCopyWithImpl<$Res>
    implements _$DriverParentOtherModelCopyWith<$Res> {
  __$DriverParentOtherModelCopyWithImpl(this._self, this._then);

  final _DriverParentOtherModel _self;
  final $Res Function(_DriverParentOtherModel) _then;

/// Create a copy of DriverParentOtherModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSubscribed = freezed,Object? isSubscriptionActive = freezed,Object? hasExceededDriverLimit = freezed,Object? hasExceededCarLimit = freezed,Object? driversCount = freezed,Object? vehiclesCount = freezed,}) {
  return _then(_DriverParentOtherModel(
isSubscribed: freezed == isSubscribed ? _self.isSubscribed : isSubscribed // ignore: cast_nullable_to_non_nullable
as bool?,isSubscriptionActive: freezed == isSubscriptionActive ? _self.isSubscriptionActive : isSubscriptionActive // ignore: cast_nullable_to_non_nullable
as bool?,hasExceededDriverLimit: freezed == hasExceededDriverLimit ? _self.hasExceededDriverLimit : hasExceededDriverLimit // ignore: cast_nullable_to_non_nullable
as bool?,hasExceededCarLimit: freezed == hasExceededCarLimit ? _self.hasExceededCarLimit : hasExceededCarLimit // ignore: cast_nullable_to_non_nullable
as bool?,driversCount: freezed == driversCount ? _self.driversCount : driversCount // ignore: cast_nullable_to_non_nullable
as int?,vehiclesCount: freezed == vehiclesCount ? _self.vehiclesCount : vehiclesCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$DriverParentModel {

 int? get id;@JsonKey(name: 'first_name') String? get firstName;@JsonKey(name: 'last_name') String? get lastName; String? get fullname; String? get username; String? get email;@JsonKey(name: 'phone_number') String? get phoneNumber;@JsonKey(name: 'user_type') String? get userType; String? get status;@JsonKey(name: 'profile_image_url') String? get profileImageUrl; DriverParentOtherModel? get other;
/// Create a copy of DriverParentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DriverParentModelCopyWith<DriverParentModel> get copyWith => _$DriverParentModelCopyWithImpl<DriverParentModel>(this as DriverParentModel, _$identity);

  /// Serializes this DriverParentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DriverParentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fullname, fullname) || other.fullname == fullname)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.userType, userType) || other.userType == userType)&&(identical(other.status, status) || other.status == status)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&(identical(other.other, this.other) || other.other == this.other));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,fullname,username,email,phoneNumber,userType,status,profileImageUrl,other);

@override
String toString() {
  return 'DriverParentModel(id: $id, firstName: $firstName, lastName: $lastName, fullname: $fullname, username: $username, email: $email, phoneNumber: $phoneNumber, userType: $userType, status: $status, profileImageUrl: $profileImageUrl, other: $other)';
}


}

/// @nodoc
abstract mixin class $DriverParentModelCopyWith<$Res>  {
  factory $DriverParentModelCopyWith(DriverParentModel value, $Res Function(DriverParentModel) _then) = _$DriverParentModelCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName, String? fullname, String? username, String? email,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'user_type') String? userType, String? status,@JsonKey(name: 'profile_image_url') String? profileImageUrl, DriverParentOtherModel? other
});


$DriverParentOtherModelCopyWith<$Res>? get other;

}
/// @nodoc
class _$DriverParentModelCopyWithImpl<$Res>
    implements $DriverParentModelCopyWith<$Res> {
  _$DriverParentModelCopyWithImpl(this._self, this._then);

  final DriverParentModel _self;
  final $Res Function(DriverParentModel) _then;

/// Create a copy of DriverParentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? fullname = freezed,Object? username = freezed,Object? email = freezed,Object? phoneNumber = freezed,Object? userType = freezed,Object? status = freezed,Object? profileImageUrl = freezed,Object? other = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,fullname: freezed == fullname ? _self.fullname : fullname // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,userType: freezed == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,other: freezed == other ? _self.other : other // ignore: cast_nullable_to_non_nullable
as DriverParentOtherModel?,
  ));
}
/// Create a copy of DriverParentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriverParentOtherModelCopyWith<$Res>? get other {
    if (_self.other == null) {
    return null;
  }

  return $DriverParentOtherModelCopyWith<$Res>(_self.other!, (value) {
    return _then(_self.copyWith(other: value));
  });
}
}


/// Adds pattern-matching-related methods to [DriverParentModel].
extension DriverParentModelPatterns on DriverParentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DriverParentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DriverParentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DriverParentModel value)  $default,){
final _that = this;
switch (_that) {
case _DriverParentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DriverParentModel value)?  $default,){
final _that = this;
switch (_that) {
case _DriverParentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? fullname,  String? username,  String? email, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'user_type')  String? userType,  String? status, @JsonKey(name: 'profile_image_url')  String? profileImageUrl,  DriverParentOtherModel? other)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DriverParentModel() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.fullname,_that.username,_that.email,_that.phoneNumber,_that.userType,_that.status,_that.profileImageUrl,_that.other);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? fullname,  String? username,  String? email, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'user_type')  String? userType,  String? status, @JsonKey(name: 'profile_image_url')  String? profileImageUrl,  DriverParentOtherModel? other)  $default,) {final _that = this;
switch (_that) {
case _DriverParentModel():
return $default(_that.id,_that.firstName,_that.lastName,_that.fullname,_that.username,_that.email,_that.phoneNumber,_that.userType,_that.status,_that.profileImageUrl,_that.other);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? fullname,  String? username,  String? email, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'user_type')  String? userType,  String? status, @JsonKey(name: 'profile_image_url')  String? profileImageUrl,  DriverParentOtherModel? other)?  $default,) {final _that = this;
switch (_that) {
case _DriverParentModel() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.fullname,_that.username,_that.email,_that.phoneNumber,_that.userType,_that.status,_that.profileImageUrl,_that.other);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DriverParentModel extends DriverParentModel {
  const _DriverParentModel({this.id, @JsonKey(name: 'first_name') this.firstName, @JsonKey(name: 'last_name') this.lastName, this.fullname, this.username, this.email, @JsonKey(name: 'phone_number') this.phoneNumber, @JsonKey(name: 'user_type') this.userType, this.status, @JsonKey(name: 'profile_image_url') this.profileImageUrl, this.other}): super._();
  factory _DriverParentModel.fromJson(Map<String, dynamic> json) => _$DriverParentModelFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'first_name') final  String? firstName;
@override@JsonKey(name: 'last_name') final  String? lastName;
@override final  String? fullname;
@override final  String? username;
@override final  String? email;
@override@JsonKey(name: 'phone_number') final  String? phoneNumber;
@override@JsonKey(name: 'user_type') final  String? userType;
@override final  String? status;
@override@JsonKey(name: 'profile_image_url') final  String? profileImageUrl;
@override final  DriverParentOtherModel? other;

/// Create a copy of DriverParentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DriverParentModelCopyWith<_DriverParentModel> get copyWith => __$DriverParentModelCopyWithImpl<_DriverParentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DriverParentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DriverParentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fullname, fullname) || other.fullname == fullname)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.userType, userType) || other.userType == userType)&&(identical(other.status, status) || other.status == status)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&(identical(other.other, this.other) || other.other == this.other));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,fullname,username,email,phoneNumber,userType,status,profileImageUrl,other);

@override
String toString() {
  return 'DriverParentModel(id: $id, firstName: $firstName, lastName: $lastName, fullname: $fullname, username: $username, email: $email, phoneNumber: $phoneNumber, userType: $userType, status: $status, profileImageUrl: $profileImageUrl, other: $other)';
}


}

/// @nodoc
abstract mixin class _$DriverParentModelCopyWith<$Res> implements $DriverParentModelCopyWith<$Res> {
  factory _$DriverParentModelCopyWith(_DriverParentModel value, $Res Function(_DriverParentModel) _then) = __$DriverParentModelCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName, String? fullname, String? username, String? email,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'user_type') String? userType, String? status,@JsonKey(name: 'profile_image_url') String? profileImageUrl, DriverParentOtherModel? other
});


@override $DriverParentOtherModelCopyWith<$Res>? get other;

}
/// @nodoc
class __$DriverParentModelCopyWithImpl<$Res>
    implements _$DriverParentModelCopyWith<$Res> {
  __$DriverParentModelCopyWithImpl(this._self, this._then);

  final _DriverParentModel _self;
  final $Res Function(_DriverParentModel) _then;

/// Create a copy of DriverParentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? fullname = freezed,Object? username = freezed,Object? email = freezed,Object? phoneNumber = freezed,Object? userType = freezed,Object? status = freezed,Object? profileImageUrl = freezed,Object? other = freezed,}) {
  return _then(_DriverParentModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,fullname: freezed == fullname ? _self.fullname : fullname // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,userType: freezed == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,other: freezed == other ? _self.other : other // ignore: cast_nullable_to_non_nullable
as DriverParentOtherModel?,
  ));
}

/// Create a copy of DriverParentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriverParentOtherModelCopyWith<$Res>? get other {
    if (_self.other == null) {
    return null;
  }

  return $DriverParentOtherModelCopyWith<$Res>(_self.other!, (value) {
    return _then(_self.copyWith(other: value));
  });
}
}

// dart format on
