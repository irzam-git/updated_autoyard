import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_model_option.freezed.dart';
part 'vehicle_model_option.g.dart';

@freezed
abstract class VehicleModelOption with _$VehicleModelOption {
  const factory VehicleModelOption({
    required int id,
    @JsonKey(name: 'brand_id') int? brandId,
    required String name,
    String? description,
    String? status,
  }) = _VehicleModelOption;

  factory VehicleModelOption.fromJson(Map<String, dynamic> json) =>
      _$VehicleModelOptionFromJson(json);
}
