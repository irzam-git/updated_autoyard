import 'package:freezed_annotation/freezed_annotation.dart';
import 'brand_model.dart';
import 'customer_info_model.dart';
import 'vehicle_model_option.dart';

part 'assigned_pickup_model.freezed.dart';
part 'assigned_pickup_model.g.dart';

@freezed
abstract class AssignedPickupModel with _$AssignedPickupModel {
  const factory AssignedPickupModel({
    required int id,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'driver_id') int? driverId,
    @JsonKey(name: 'brand_id') int? brandId,
    @JsonKey(name: 'model_id') int? modelId,
    @JsonKey(name: 'customer_name') String? customerName,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    String? address,
    dynamic year,
    @JsonKey(name: 'pickup_date') String? pickupDate,
    @JsonKey(name: 'pickup_time') String? pickupTime,
    dynamic price,
    @JsonKey(name: 'payment_method') String? paymentMethod,
    String? note,
    @Default('pending') String status,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'customer_info') CustomerInfoModel? customerInfo,
    BrandModel? brand,
    VehicleModelOption? model,
  }) = _AssignedPickupModel;

  const AssignedPickupModel._();

  String get vehicleTitle {
    final y = year?.toString() ?? '';
    final b = brand?.name ?? '';
    final m = model?.name ?? '';
    final parts = [y, b, m].where((s) => s.isNotEmpty).toList();
    return parts.isNotEmpty ? parts.join(' ') : 'Vehicle Pickup #$id';
  }

  String get effectiveCustomerName {
    if (customerName != null && customerName!.trim().isNotEmpty) {
      return customerName!.trim();
    }
    if (customerInfo?.displayName != null && customerInfo!.displayName.isNotEmpty) {
      return customerInfo!.displayName;
    }
    return 'Customer';
  }

  String get effectivePhoneNumber {
    if (phoneNumber != null && phoneNumber!.trim().isNotEmpty) {
      return phoneNumber!.trim();
    }
    return customerInfo?.phoneNumber ?? '';
  }

  String get formattedPrice {
    if (price == null) return '\$0';
    return '\$$price';
  }

  bool get isPending => status.toLowerCase() == 'pending';
  bool get isAccepted => status.toLowerCase() == 'accepted';
  bool get isInTransit => status.toLowerCase() == 'in transit' || status.toLowerCase() == 'in_transit';
  bool get isCompleted => status.toLowerCase() == 'completed';
  bool get isCancelled => status.toLowerCase() == 'cancelled';

  factory AssignedPickupModel.fromJson(Map<String, dynamic> json) =>
      _$AssignedPickupModelFromJson(json);
}
