// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_parent_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DriverParentDetailsModel _$DriverParentDetailsModelFromJson(
  Map<String, dynamic> json,
) => _DriverParentDetailsModel(
  id: (json['id'] as num?)?.toInt(),
  userId: (json['user_id'] as num?)?.toInt(),
  companyName: json['company_name'] as String?,
  businessName: json['business_name'] as String?,
  businessAddress: json['business_address'] as String?,
  businessEmail: json['business_email'] as String?,
  abnNumber: json['abn_number'] as String?,
  crnNumber: json['crn_number'] as String?,
  businessLicense: json['business_license'] as String?,
  website: json['website'] as String?,
  activationKey: json['activation_key'] as String?,
  status: json['status'] as String?,
  businessLogoUrl: json['business_logo_url'] as String?,
);

Map<String, dynamic> _$DriverParentDetailsModelToJson(
  _DriverParentDetailsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'company_name': instance.companyName,
  'business_name': instance.businessName,
  'business_address': instance.businessAddress,
  'business_email': instance.businessEmail,
  'abn_number': instance.abnNumber,
  'crn_number': instance.crnNumber,
  'business_license': instance.businessLicense,
  'website': instance.website,
  'activation_key': instance.activationKey,
  'status': instance.status,
  'business_logo_url': instance.businessLogoUrl,
};
