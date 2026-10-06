// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VehicleModelOption _$VehicleModelOptionFromJson(Map<String, dynamic> json) =>
    _VehicleModelOption(
      id: (json['id'] as num).toInt(),
      brandId: (json['brand_id'] as num?)?.toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$VehicleModelOptionToJson(_VehicleModelOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brand_id': instance.brandId,
      'name': instance.name,
      'description': instance.description,
      'status': instance.status,
    };
