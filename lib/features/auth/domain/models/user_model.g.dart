// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: json['id'],
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  fullname: json['fullname'] as String?,
  name: json['name'] as String?,
  username: json['username'] as String?,
  email: json['email'] as String,
  phoneNumber: json['phone_number'] as String?,
  userType: json['user_type'] as String?,
  profileImage: json['profile_image'] as String?,
  profileImageUrl: json['profile_image_url'] as String?,
  avatarColor: json['avatar_color'] as String?,
  status: json['status'] as String?,
  verified: json['verified'] as bool?,
  token: json['token'] as String?,
  driverDetails: json['driver_details'] == null
      ? null
      : DriverDetailsModel.fromJson(
          json['driver_details'] as Map<String, dynamic>,
        ),
  driverParent: json['driver_parent'] == null
      ? null
      : DriverParentModel.fromJson(
          json['driver_parent'] as Map<String, dynamic>,
        ),
  driverParentDetails: json['driver_parent_details'] == null
      ? null
      : DriverParentDetailsModel.fromJson(
          json['driver_parent_details'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'fullname': instance.fullname,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'user_type': instance.userType,
      'profile_image': instance.profileImage,
      'profile_image_url': instance.profileImageUrl,
      'avatar_color': instance.avatarColor,
      'status': instance.status,
      'verified': instance.verified,
      'token': instance.token,
      'driver_details': instance.driverDetails,
      'driver_parent': instance.driverParent,
      'driver_parent_details': instance.driverParentDetails,
    };
