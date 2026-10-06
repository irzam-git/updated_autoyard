import 'package:freezed_annotation/freezed_annotation.dart';

part 'driver_parent_details_model.freezed.dart';
part 'driver_parent_details_model.g.dart';

@freezed
abstract class DriverParentDetailsModel with _$DriverParentDetailsModel {
  const factory DriverParentDetailsModel({
    int? id,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'company_name') String? companyName,
    @JsonKey(name: 'business_name') String? businessName,
    @JsonKey(name: 'business_address') String? businessAddress,
    @JsonKey(name: 'business_email') String? businessEmail,
    @JsonKey(name: 'abn_number') String? abnNumber,
    @JsonKey(name: 'crn_number') String? crnNumber,
    @JsonKey(name: 'business_license') String? businessLicense,
    String? website,
    @JsonKey(name: 'activation_key') String? activationKey,
    String? status,
    @JsonKey(name: 'business_logo_url') String? businessLogoUrl,
  }) = _DriverParentDetailsModel;

  factory DriverParentDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$DriverParentDetailsModelFromJson(json);
}
