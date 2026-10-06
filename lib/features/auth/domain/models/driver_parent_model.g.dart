// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_parent_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DriverParentOtherModel _$DriverParentOtherModelFromJson(
  Map<String, dynamic> json,
) => _DriverParentOtherModel(
  isSubscribed: json['is_subscribed'] as bool?,
  isSubscriptionActive: json['is_subscription_active'] as bool?,
  hasExceededDriverLimit: json['has_exceeded_driver_limit'] as bool?,
  hasExceededCarLimit: json['has_exceeded_car_limit'] as bool?,
  driversCount: (json['drivers_count'] as num?)?.toInt(),
  vehiclesCount: (json['vehicles_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$DriverParentOtherModelToJson(
  _DriverParentOtherModel instance,
) => <String, dynamic>{
  'is_subscribed': instance.isSubscribed,
  'is_subscription_active': instance.isSubscriptionActive,
  'has_exceeded_driver_limit': instance.hasExceededDriverLimit,
  'has_exceeded_car_limit': instance.hasExceededCarLimit,
  'drivers_count': instance.driversCount,
  'vehicles_count': instance.vehiclesCount,
};

_DriverParentModel _$DriverParentModelFromJson(Map<String, dynamic> json) =>
    _DriverParentModel(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      fullname: json['fullname'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      userType: json['user_type'] as String?,
      status: json['status'] as String?,
      profileImageUrl: json['profile_image_url'] as String?,
      other: json['other'] == null
          ? null
          : DriverParentOtherModel.fromJson(
              json['other'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$DriverParentModelToJson(_DriverParentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'fullname': instance.fullname,
      'username': instance.username,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'user_type': instance.userType,
      'status': instance.status,
      'profile_image_url': instance.profileImageUrl,
      'other': instance.other,
    };
