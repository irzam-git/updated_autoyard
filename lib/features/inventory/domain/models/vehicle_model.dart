import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../pickups/domain/models/brand_model.dart';
import '../../../pickups/domain/models/vehicle_model_option.dart';
import 'vehicle_condition_model.dart';

part 'vehicle_model.freezed.dart';
part 'vehicle_model.g.dart';

@freezed
abstract class VehicleModel with _$VehicleModel {
  const factory VehicleModel({
    required int id,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'driver_id') int? driverId,
    @JsonKey(name: 'brand_id') int? brandId,
    @JsonKey(name: 'model_id') int? modelId,
    dynamic year,
    @JsonKey(name: 'registration_number') String? registrationNumber,
    @JsonKey(name: 'registration_date') String? registrationDate,
    @JsonKey(name: 'registration_state') String? registrationState,
    @JsonKey(name: 'engine_size') String? engineSize,
    @JsonKey(name: 'engine_number') String? engineNumber,
    @JsonKey(name: 'vin_number') String? vinNumber,
    String? transmission,
    @JsonKey(name: 'body_type') String? bodyType,
    String? variant,
    String? built,
    String? odometer,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? fullname,
    @JsonKey(name: 'abn_number') String? abnNumber,
    @JsonKey(name: 'business_name') String? businessName,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'license_number') String? licenseNumber,
    @JsonKey(name: 'pickup_date') String? pickupDate,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    @JsonKey(name: 'pickup_address') String? pickupAddress,
    @JsonKey(name: 'residential_address') String? residentialAddress,
    @JsonKey(name: 'same_pickup_address') dynamic samePickupAddress,
    @JsonKey(name: 'vehicle_condition') VehicleConditionModel? vehicleCondition,
    String? note,
    dynamic price,
    @JsonKey(name: 'payment_method') String? paymentMethod,
    @JsonKey(name: 'owner_signature_url') String? ownerSignatureUrl,
    @JsonKey(name: 'buyer_signature_url') String? buyerSignatureUrl,
    String? status,
    dynamic approval,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    BrandModel? brand,
    VehicleModelOption? model,
  }) = _VehicleModel;

  const VehicleModel._();

  String get vehicleTitle {
    final y = year?.toString() ?? '';
    final b = brand?.name ?? '';
    final m = model?.name ?? '';
    final parts = [y, b, m].where((s) => s.isNotEmpty).toList();
    return parts.isNotEmpty ? parts.join(' ') : 'Vehicle #$id';
  }

  String get sellerFullName {
    if (fullname != null && fullname!.trim().isNotEmpty) return fullname!.trim();
    final f = firstName ?? '';
    final l = lastName ?? '';
    final combined = '$f $l'.trim();
    return combined.isNotEmpty ? combined : 'Private Seller';
  }

  String get regoBadge {
    final rego = registrationNumber?.trim() ?? '';
    final state = registrationState?.trim() ?? '';
    if (rego.isNotEmpty && state.isNotEmpty) {
      return '$rego - $state';
    } else if (rego.isNotEmpty) {
      return rego;
    }
    return 'UNREGISTERED';
  }

  String get formattedPrice {
    if (price == null) return '\$0';
    return '\$$price';
  }

  factory VehicleModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleModelFromJson(json);
}
