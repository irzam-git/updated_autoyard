// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomerInfoModel _$CustomerInfoModelFromJson(Map<String, dynamic> json) =>
    _CustomerInfoModel(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      fullname: json['fullname'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      profileImageUrl: json['profile_image_url'] as String?,
    );

Map<String, dynamic> _$CustomerInfoModelToJson(_CustomerInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'fullname': instance.fullname,
      'username': instance.username,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'profile_image_url': instance.profileImageUrl,
    };
