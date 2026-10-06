import 'package:freezed_annotation/freezed_annotation.dart';

part 'rego_lookup_result_model.freezed.dart';
part 'rego_lookup_result_model.g.dart';

@freezed
abstract class RegoLookupResultModel with _$RegoLookupResultModel {
  const factory RegoLookupResultModel({
    String? vin,
    String? chassis,
    String? make,
    String? model,
    @JsonKey(name: 'brand_id') int? brandId,
    @JsonKey(name: 'model_id') int? modelId,
    String? colour,
    @JsonKey(name: 'body_type') String? bodyType,
    @JsonKey(name: 'vehicle_type') String? vehicleType,
    @JsonKey(name: 'engine_number') String? engineNumber,
    @JsonKey(name: 'engine_size') String? engineSize,
    String? year,
    String? variant,
    String? transmission,
    @JsonKey(name: 'registration_number') String? registrationNumber,
    @JsonKey(name: 'registration_state') String? registrationState,
  }) = _RegoLookupResultModel;

  factory RegoLookupResultModel.fromJson(Map<String, dynamic> json) =>
      _$RegoLookupResultModelFromJson(json);
}
