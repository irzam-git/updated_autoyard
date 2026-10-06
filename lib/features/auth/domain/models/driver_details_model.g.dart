// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DriverDetailsModel _$DriverDetailsModelFromJson(Map<String, dynamic> json) =>
    _DriverDetailsModel(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      sendDetailsTo: json['send_details_to'] as String?,
    );

Map<String, dynamic> _$DriverDetailsModelToJson(_DriverDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'send_details_to': instance.sendDetailsTo,
    };
