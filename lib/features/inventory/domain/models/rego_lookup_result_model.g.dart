// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rego_lookup_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegoLookupResultModel _$RegoLookupResultModelFromJson(
  Map<String, dynamic> json,
) => _RegoLookupResultModel(
  vin: json['vin'] as String?,
  chassis: json['chassis'] as String?,
  make: json['make'] as String?,
  model: json['model'] as String?,
  brandId: (json['brand_id'] as num?)?.toInt(),
  modelId: (json['model_id'] as num?)?.toInt(),
  colour: json['colour'] as String?,
  bodyType: json['body_type'] as String?,
  vehicleType: json['vehicle_type'] as String?,
  engineNumber: json['engine_number'] as String?,
  engineSize: json['engine_size'] as String?,
  year: json['year'] as String?,
  variant: json['variant'] as String?,
  transmission: json['transmission'] as String?,
  registrationNumber: json['registration_number'] as String?,
  registrationState: json['registration_state'] as String?,
);

Map<String, dynamic> _$RegoLookupResultModelToJson(
  _RegoLookupResultModel instance,
) => <String, dynamic>{
  'vin': instance.vin,
  'chassis': instance.chassis,
  'make': instance.make,
  'model': instance.model,
  'brand_id': instance.brandId,
  'model_id': instance.modelId,
  'colour': instance.colour,
  'body_type': instance.bodyType,
  'vehicle_type': instance.vehicleType,
  'engine_number': instance.engineNumber,
  'engine_size': instance.engineSize,
  'year': instance.year,
  'variant': instance.variant,
  'transmission': instance.transmission,
  'registration_number': instance.registrationNumber,
  'registration_state': instance.registrationState,
};
