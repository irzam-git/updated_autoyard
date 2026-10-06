// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {

 dynamic get id;@JsonKey(name: 'first_name') String? get firstName;@JsonKey(name: 'last_name') String? get lastName; String? get fullname; String? get name; String? get username; String get email;@JsonKey(name: 'phone_number') String? get phoneNumber;@JsonKey(name: 'user_type') String? get userType;@JsonKey(name: 'profile_image') String? get profileImage;@JsonKey(name: 'profile_image_url') String? get profileImageUrl;@JsonKey(name: 'avatar_color') String? get avatarColor; String? get status; bool? get verified; String? get token;@JsonKey(name: 'driver_details') DriverDetailsModel? get driverDetails;@JsonKey(name: 'driver_parent') DriverParentModel? get driverParent;@JsonKey(name: 'driver_parent_details') DriverParentDetailsModel? get driverParentDetails;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&const DeepCollectionEquality().equals(other.id, id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fullname, fullname) || other.fullname == fullname)&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.userType, userType) || other.userType == userType)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&(identical(other.avatarColor, avatarColor) || other.avatarColor == avatarColor)&&(identical(other.status, status) || other.status == status)&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.token, token) || other.token == token)&&(identical(other.driverDetails, driverDetails) || other.driverDetails == driverDetails)&&(identical(other.driverParent, driverParent) || other.driverParent == driverParent)&&(identical(other.driverParentDetails, driverParentDetails) || other.driverParentDetails == driverParentDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(id),firstName,lastName,fullname,name,username,email,phoneNumber,userType,profileImage,profileImageUrl,avatarColor,status,verified,token,driverDetails,driverParent,driverParentDetails);

@override
String toString() {
  return 'UserModel(id: $id, firstName: $firstName, lastName: $lastName, fullname: $fullname, name: $name, username: $username, email: $email, phoneNumber: $phoneNumber, userType: $userType, profileImage: $profileImage, profileImageUrl: $profileImageUrl, avatarColor: $avatarColor, status: $status, verified: $verified, token: $token, driverDetails: $driverDetails, driverParent: $driverParent, driverParentDetails: $driverParentDetails)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 dynamic id,@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName, String? fullname, String? name, String? username, String email,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'user_type') String? userType,@JsonKey(name: 'profile_image') String? profileImage,@JsonKey(name: 'profile_image_url') String? profileImageUrl,@JsonKey(name: 'avatar_color') String? avatarColor, String? status, bool? verified, String? token,@JsonKey(name: 'driver_details') DriverDetailsModel? driverDetails,@JsonKey(name: 'driver_parent') DriverParentModel? driverParent,@JsonKey(name: 'driver_parent_details') DriverParentDetailsModel? driverParentDetails
});


$DriverDetailsModelCopyWith<$Res>? get driverDetails;$DriverParentModelCopyWith<$Res>? get driverParent;$DriverParentDetailsModelCopyWith<$Res>? get driverParentDetails;

}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? fullname = freezed,Object? name = freezed,Object? username = freezed,Object? email = null,Object? phoneNumber = freezed,Object? userType = freezed,Object? profileImage = freezed,Object? profileImageUrl = freezed,Object? avatarColor = freezed,Object? status = freezed,Object? verified = freezed,Object? token = freezed,Object? driverDetails = freezed,Object? driverParent = freezed,Object? driverParentDetails = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as dynamic,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,fullname: freezed == fullname ? _self.fullname : fullname // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,userType: freezed == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as String?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,avatarColor: freezed == avatarColor ? _self.avatarColor : avatarColor // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,verified: freezed == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,driverDetails: freezed == driverDetails ? _self.driverDetails : driverDetails // ignore: cast_nullable_to_non_nullable
as DriverDetailsModel?,driverParent: freezed == driverParent ? _self.driverParent : driverParent // ignore: cast_nullable_to_non_nullable
as DriverParentModel?,driverParentDetails: freezed == driverParentDetails ? _self.driverParentDetails : driverParentDetails // ignore: cast_nullable_to_non_nullable
as DriverParentDetailsModel?,
  ));
}
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriverDetailsModelCopyWith<$Res>? get driverDetails {
    if (_self.driverDetails == null) {
    return null;
  }

  return $DriverDetailsModelCopyWith<$Res>(_self.driverDetails!, (value) {
    return _then(_self.copyWith(driverDetails: value));
  });
}/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriverParentModelCopyWith<$Res>? get driverParent {
    if (_self.driverParent == null) {
    return null;
  }

  return $DriverParentModelCopyWith<$Res>(_self.driverParent!, (value) {
    return _then(_self.copyWith(driverParent: value));
  });
}/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriverParentDetailsModelCopyWith<$Res>? get driverParentDetails {
    if (_self.driverParentDetails == null) {
    return null;
  }

  return $DriverParentDetailsModelCopyWith<$Res>(_self.driverParentDetails!, (value) {
    return _then(_self.copyWith(driverParentDetails: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserModel value)  $default,){
final _that = this;
switch (_that) {
case _UserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( dynamic id, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? fullname,  String? name,  String? username,  String email, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'user_type')  String? userType, @JsonKey(name: 'profile_image')  String? profileImage, @JsonKey(name: 'profile_image_url')  String? profileImageUrl, @JsonKey(name: 'avatar_color')  String? avatarColor,  String? status,  bool? verified,  String? token, @JsonKey(name: 'driver_details')  DriverDetailsModel? driverDetails, @JsonKey(name: 'driver_parent')  DriverParentModel? driverParent, @JsonKey(name: 'driver_parent_details')  DriverParentDetailsModel? driverParentDetails)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.fullname,_that.name,_that.username,_that.email,_that.phoneNumber,_that.userType,_that.profileImage,_that.profileImageUrl,_that.avatarColor,_that.status,_that.verified,_that.token,_that.driverDetails,_that.driverParent,_that.driverParentDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( dynamic id, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? fullname,  String? name,  String? username,  String email, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'user_type')  String? userType, @JsonKey(name: 'profile_image')  String? profileImage, @JsonKey(name: 'profile_image_url')  String? profileImageUrl, @JsonKey(name: 'avatar_color')  String? avatarColor,  String? status,  bool? verified,  String? token, @JsonKey(name: 'driver_details')  DriverDetailsModel? driverDetails, @JsonKey(name: 'driver_parent')  DriverParentModel? driverParent, @JsonKey(name: 'driver_parent_details')  DriverParentDetailsModel? driverParentDetails)  $default,) {final _that = this;
switch (_that) {
case _UserModel():
return $default(_that.id,_that.firstName,_that.lastName,_that.fullname,_that.name,_that.username,_that.email,_that.phoneNumber,_that.userType,_that.profileImage,_that.profileImageUrl,_that.avatarColor,_that.status,_that.verified,_that.token,_that.driverDetails,_that.driverParent,_that.driverParentDetails);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( dynamic id, @JsonKey(name: 'first_name')  String? firstName, @JsonKey(name: 'last_name')  String? lastName,  String? fullname,  String? name,  String? username,  String email, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'user_type')  String? userType, @JsonKey(name: 'profile_image')  String? profileImage, @JsonKey(name: 'profile_image_url')  String? profileImageUrl, @JsonKey(name: 'avatar_color')  String? avatarColor,  String? status,  bool? verified,  String? token, @JsonKey(name: 'driver_details')  DriverDetailsModel? driverDetails, @JsonKey(name: 'driver_parent')  DriverParentModel? driverParent, @JsonKey(name: 'driver_parent_details')  DriverParentDetailsModel? driverParentDetails)?  $default,) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.fullname,_that.name,_that.username,_that.email,_that.phoneNumber,_that.userType,_that.profileImage,_that.profileImageUrl,_that.avatarColor,_that.status,_that.verified,_that.token,_that.driverDetails,_that.driverParent,_that.driverParentDetails);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserModel extends UserModel {
  const _UserModel({this.id, @JsonKey(name: 'first_name') this.firstName, @JsonKey(name: 'last_name') this.lastName, this.fullname, this.name, this.username, required this.email, @JsonKey(name: 'phone_number') this.phoneNumber, @JsonKey(name: 'user_type') this.userType, @JsonKey(name: 'profile_image') this.profileImage, @JsonKey(name: 'profile_image_url') this.profileImageUrl, @JsonKey(name: 'avatar_color') this.avatarColor, this.status, this.verified, this.token, @JsonKey(name: 'driver_details') this.driverDetails, @JsonKey(name: 'driver_parent') this.driverParent, @JsonKey(name: 'driver_parent_details') this.driverParentDetails}): super._();
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override final  dynamic id;
@override@JsonKey(name: 'first_name') final  String? firstName;
@override@JsonKey(name: 'last_name') final  String? lastName;
@override final  String? fullname;
@override final  String? name;
@override final  String? username;
@override final  String email;
@override@JsonKey(name: 'phone_number') final  String? phoneNumber;
@override@JsonKey(name: 'user_type') final  String? userType;
@override@JsonKey(name: 'profile_image') final  String? profileImage;
@override@JsonKey(name: 'profile_image_url') final  String? profileImageUrl;
@override@JsonKey(name: 'avatar_color') final  String? avatarColor;
@override final  String? status;
@override final  bool? verified;
@override final  String? token;
@override@JsonKey(name: 'driver_details') final  DriverDetailsModel? driverDetails;
@override@JsonKey(name: 'driver_parent') final  DriverParentModel? driverParent;
@override@JsonKey(name: 'driver_parent_details') final  DriverParentDetailsModel? driverParentDetails;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&const DeepCollectionEquality().equals(other.id, id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.fullname, fullname) || other.fullname == fullname)&&(identical(other.name, name) || other.name == name)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.userType, userType) || other.userType == userType)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.profileImageUrl, profileImageUrl) || other.profileImageUrl == profileImageUrl)&&(identical(other.avatarColor, avatarColor) || other.avatarColor == avatarColor)&&(identical(other.status, status) || other.status == status)&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.token, token) || other.token == token)&&(identical(other.driverDetails, driverDetails) || other.driverDetails == driverDetails)&&(identical(other.driverParent, driverParent) || other.driverParent == driverParent)&&(identical(other.driverParentDetails, driverParentDetails) || other.driverParentDetails == driverParentDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(id),firstName,lastName,fullname,name,username,email,phoneNumber,userType,profileImage,profileImageUrl,avatarColor,status,verified,token,driverDetails,driverParent,driverParentDetails);

@override
String toString() {
  return 'UserModel(id: $id, firstName: $firstName, lastName: $lastName, fullname: $fullname, name: $name, username: $username, email: $email, phoneNumber: $phoneNumber, userType: $userType, profileImage: $profileImage, profileImageUrl: $profileImageUrl, avatarColor: $avatarColor, status: $status, verified: $verified, token: $token, driverDetails: $driverDetails, driverParent: $driverParent, driverParentDetails: $driverParentDetails)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 dynamic id,@JsonKey(name: 'first_name') String? firstName,@JsonKey(name: 'last_name') String? lastName, String? fullname, String? name, String? username, String email,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'user_type') String? userType,@JsonKey(name: 'profile_image') String? profileImage,@JsonKey(name: 'profile_image_url') String? profileImageUrl,@JsonKey(name: 'avatar_color') String? avatarColor, String? status, bool? verified, String? token,@JsonKey(name: 'driver_details') DriverDetailsModel? driverDetails,@JsonKey(name: 'driver_parent') DriverParentModel? driverParent,@JsonKey(name: 'driver_parent_details') DriverParentDetailsModel? driverParentDetails
});


@override $DriverDetailsModelCopyWith<$Res>? get driverDetails;@override $DriverParentModelCopyWith<$Res>? get driverParent;@override $DriverParentDetailsModelCopyWith<$Res>? get driverParentDetails;

}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? firstName = freezed,Object? lastName = freezed,Object? fullname = freezed,Object? name = freezed,Object? username = freezed,Object? email = null,Object? phoneNumber = freezed,Object? userType = freezed,Object? profileImage = freezed,Object? profileImageUrl = freezed,Object? avatarColor = freezed,Object? status = freezed,Object? verified = freezed,Object? token = freezed,Object? driverDetails = freezed,Object? driverParent = freezed,Object? driverParentDetails = freezed,}) {
  return _then(_UserModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as dynamic,firstName: freezed == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String?,lastName: freezed == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String?,fullname: freezed == fullname ? _self.fullname : fullname // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,userType: freezed == userType ? _self.userType : userType // ignore: cast_nullable_to_non_nullable
as String?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,profileImageUrl: freezed == profileImageUrl ? _self.profileImageUrl : profileImageUrl // ignore: cast_nullable_to_non_nullable
as String?,avatarColor: freezed == avatarColor ? _self.avatarColor : avatarColor // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,verified: freezed == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,driverDetails: freezed == driverDetails ? _self.driverDetails : driverDetails // ignore: cast_nullable_to_non_nullable
as DriverDetailsModel?,driverParent: freezed == driverParent ? _self.driverParent : driverParent // ignore: cast_nullable_to_non_nullable
as DriverParentModel?,driverParentDetails: freezed == driverParentDetails ? _self.driverParentDetails : driverParentDetails // ignore: cast_nullable_to_non_nullable
as DriverParentDetailsModel?,
  ));
}

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriverDetailsModelCopyWith<$Res>? get driverDetails {
    if (_self.driverDetails == null) {
    return null;
  }

  return $DriverDetailsModelCopyWith<$Res>(_self.driverDetails!, (value) {
    return _then(_self.copyWith(driverDetails: value));
  });
}/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriverParentModelCopyWith<$Res>? get driverParent {
    if (_self.driverParent == null) {
    return null;
  }

  return $DriverParentModelCopyWith<$Res>(_self.driverParent!, (value) {
    return _then(_self.copyWith(driverParent: value));
  });
}/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DriverParentDetailsModelCopyWith<$Res>? get driverParentDetails {
    if (_self.driverParentDetails == null) {
    return null;
  }

  return $DriverParentDetailsModelCopyWith<$Res>(_self.driverParentDetails!, (value) {
    return _then(_self.copyWith(driverParentDetails: value));
  });
}
}

// dart format on
