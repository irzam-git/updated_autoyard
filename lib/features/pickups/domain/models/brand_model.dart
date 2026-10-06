import 'package:freezed_annotation/freezed_annotation.dart';

part 'brand_model.freezed.dart';
part 'brand_model.g.dart';

@freezed
abstract class BrandModel with _$BrandModel {
  const factory BrandModel({
    required int id,
    required String name,
    String? description,
    String? status,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'models_count') int? modelsCount,
    @JsonKey(name: 'vehicles_count') int? vehiclesCount,
  }) = _BrandModel;

  factory BrandModel.fromJson(Map<String, dynamic> json) => _$BrandModelFromJson(json);
}
