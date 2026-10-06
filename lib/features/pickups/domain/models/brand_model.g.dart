// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BrandModel _$BrandModelFromJson(Map<String, dynamic> json) => _BrandModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String?,
  status: json['status'] as String?,
  imageUrl: json['image_url'] as String?,
  modelsCount: (json['models_count'] as num?)?.toInt(),
  vehiclesCount: (json['vehicles_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$BrandModelToJson(_BrandModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'status': instance.status,
      'image_url': instance.imageUrl,
      'models_count': instance.modelsCount,
      'vehicles_count': instance.vehiclesCount,
    };
