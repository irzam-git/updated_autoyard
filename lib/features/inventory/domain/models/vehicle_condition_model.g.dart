// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_condition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VehicleConditionModel _$VehicleConditionModelFromJson(
  Map<String, dynamic> json,
) => _VehicleConditionModel(
  drivable: json['drivable'] as String? ?? 'yes',
  accidental: json['accidental'] as String? ?? 'no',
  wovi: json['wovi'] as String? ?? 'no',
  underFinance: json['under_finance'] as String? ?? 'no',
);

Map<String, dynamic> _$VehicleConditionModelToJson(
  _VehicleConditionModel instance,
) => <String, dynamic>{
  'drivable': instance.drivable,
  'accidental': instance.accidental,
  'wovi': instance.wovi,
  'under_finance': instance.underFinance,
};
