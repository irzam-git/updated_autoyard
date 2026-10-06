// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assigned_pickup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AssignedPickupModel _$AssignedPickupModelFromJson(Map<String, dynamic> json) =>
    _AssignedPickupModel(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      driverId: (json['driver_id'] as num?)?.toInt(),
      brandId: (json['brand_id'] as num?)?.toInt(),
      modelId: (json['model_id'] as num?)?.toInt(),
      customerName: json['customer_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      address: json['address'] as String?,
      year: json['year'],
      pickupDate: json['pickup_date'] as String?,
      pickupTime: json['pickup_time'] as String?,
      price: json['price'],
      paymentMethod: json['payment_method'] as String?,
      note: json['note'] as String?,
      status: json['status'] as String? ?? 'pending',
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      customerInfo: json['customer_info'] == null
          ? null
          : CustomerInfoModel.fromJson(
              json['customer_info'] as Map<String, dynamic>,
            ),
      brand: json['brand'] == null
          ? null
          : BrandModel.fromJson(json['brand'] as Map<String, dynamic>),
      model: json['model'] == null
          ? null
          : VehicleModelOption.fromJson(json['model'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AssignedPickupModelToJson(
  _AssignedPickupModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'driver_id': instance.driverId,
  'brand_id': instance.brandId,
  'model_id': instance.modelId,
  'customer_name': instance.customerName,
  'phone_number': instance.phoneNumber,
  'address': instance.address,
  'year': instance.year,
  'pickup_date': instance.pickupDate,
  'pickup_time': instance.pickupTime,
  'price': instance.price,
  'payment_method': instance.paymentMethod,
  'note': instance.note,
  'status': instance.status,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'customer_info': instance.customerInfo,
  'brand': instance.brand,
  'model': instance.model,
};
