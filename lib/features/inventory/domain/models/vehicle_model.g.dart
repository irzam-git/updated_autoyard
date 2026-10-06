// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VehicleModel _$VehicleModelFromJson(Map<String, dynamic> json) =>
    _VehicleModel(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      driverId: (json['driver_id'] as num?)?.toInt(),
      brandId: (json['brand_id'] as num?)?.toInt(),
      modelId: (json['model_id'] as num?)?.toInt(),
      year: json['year'],
      registrationNumber: json['registration_number'] as String?,
      registrationDate: json['registration_date'] as String?,
      registrationState: json['registration_state'] as String?,
      engineSize: json['engine_size'] as String?,
      engineNumber: json['engine_number'] as String?,
      vinNumber: json['vin_number'] as String?,
      transmission: json['transmission'] as String?,
      bodyType: json['body_type'] as String?,
      variant: json['variant'] as String?,
      built: json['built'] as String?,
      odometer: json['odometer'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      fullname: json['fullname'] as String?,
      abnNumber: json['abn_number'] as String?,
      businessName: json['business_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      licenseNumber: json['license_number'] as String?,
      pickupDate: json['pickup_date'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      pickupAddress: json['pickup_address'] as String?,
      residentialAddress: json['residential_address'] as String?,
      samePickupAddress: json['same_pickup_address'],
      vehicleCondition: json['vehicle_condition'] == null
          ? null
          : VehicleConditionModel.fromJson(
              json['vehicle_condition'] as Map<String, dynamic>,
            ),
      note: json['note'] as String?,
      price: json['price'],
      paymentMethod: json['payment_method'] as String?,
      ownerSignatureUrl: json['owner_signature_url'] as String?,
      buyerSignatureUrl: json['buyer_signature_url'] as String?,
      status: json['status'] as String?,
      approval: json['approval'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      brand: json['brand'] == null
          ? null
          : BrandModel.fromJson(json['brand'] as Map<String, dynamic>),
      model: json['model'] == null
          ? null
          : VehicleModelOption.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VehicleModelToJson(_VehicleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'driver_id': instance.driverId,
      'brand_id': instance.brandId,
      'model_id': instance.modelId,
      'year': instance.year,
      'registration_number': instance.registrationNumber,
      'registration_date': instance.registrationDate,
      'registration_state': instance.registrationState,
      'engine_size': instance.engineSize,
      'engine_number': instance.engineNumber,
      'vin_number': instance.vinNumber,
      'transmission': instance.transmission,
      'body_type': instance.bodyType,
      'variant': instance.variant,
      'built': instance.built,
      'odometer': instance.odometer,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'fullname': instance.fullname,
      'abn_number': instance.abnNumber,
      'business_name': instance.businessName,
      'phone_number': instance.phoneNumber,
      'license_number': instance.licenseNumber,
      'pickup_date': instance.pickupDate,
      'date_of_birth': instance.dateOfBirth,
      'pickup_address': instance.pickupAddress,
      'residential_address': instance.residentialAddress,
      'same_pickup_address': instance.samePickupAddress,
      'vehicle_condition': instance.vehicleCondition,
      'note': instance.note,
      'price': instance.price,
      'payment_method': instance.paymentMethod,
      'owner_signature_url': instance.ownerSignatureUrl,
      'buyer_signature_url': instance.buyerSignatureUrl,
      'status': instance.status,
      'approval': instance.approval,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'brand': instance.brand,
      'model': instance.model,
    };
