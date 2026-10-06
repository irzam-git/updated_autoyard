import 'package:freezed_annotation/freezed_annotation.dart';

part 'driver_parent_model.freezed.dart';
part 'driver_parent_model.g.dart';

@freezed
abstract class DriverParentOtherModel with _$DriverParentOtherModel {
  const factory DriverParentOtherModel({
    @JsonKey(name: 'is_subscribed') bool? isSubscribed,
    @JsonKey(name: 'is_subscription_active') bool? isSubscriptionActive,
    @JsonKey(name: 'has_exceeded_driver_limit') bool? hasExceededDriverLimit,
    @JsonKey(name: 'has_exceeded_car_limit') bool? hasExceededCarLimit,
    @JsonKey(name: 'drivers_count') int? driversCount,
    @JsonKey(name: 'vehicles_count') int? vehiclesCount,
  }) = _DriverParentOtherModel;

  factory DriverParentOtherModel.fromJson(Map<String, dynamic> json) =>
      _$DriverParentOtherModelFromJson(json);
}

@Freezed(makeCollectionsUnmodifiable: false)
abstract class DriverParentModel with _$DriverParentModel {
  const factory DriverParentModel({
    int? id,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? fullname,
    String? username,
    String? email,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'user_type') String? userType,
    String? status,
    @JsonKey(name: 'profile_image_url') String? profileImageUrl,
    DriverParentOtherModel? other,
  }) = _DriverParentModel;

  const DriverParentModel._();

  String get displayName {
    if (fullname != null && fullname!.trim().isNotEmpty) return fullname!.trim();
    final first = firstName ?? '';
    final last = lastName ?? '';
    final combined = '$first $last'.trim();
    return combined.isNotEmpty ? combined : (email ?? 'Parent Dealer');
  }

  factory DriverParentModel.fromJson(Map<String, dynamic> json) =>
      _$DriverParentModelFromJson(json);
}
