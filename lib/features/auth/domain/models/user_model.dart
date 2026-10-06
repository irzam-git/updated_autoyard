import 'package:freezed_annotation/freezed_annotation.dart';
import 'driver_details_model.dart';
import 'driver_parent_model.dart';
import 'driver_parent_details_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    dynamic id,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? fullname,
    String? name,
    String? username,
    required String email,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'user_type') String? userType,
    @JsonKey(name: 'profile_image') String? profileImage,
    @JsonKey(name: 'profile_image_url') String? profileImageUrl,
    @JsonKey(name: 'avatar_color') String? avatarColor,
    String? status,
    bool? verified,
    String? token,
    @JsonKey(name: 'driver_details') DriverDetailsModel? driverDetails,
    @JsonKey(name: 'driver_parent') DriverParentModel? driverParent,
    @JsonKey(name: 'driver_parent_details') DriverParentDetailsModel? driverParentDetails,
  }) = _UserModel;

  const UserModel._();

  String get displayName {
    if (fullname != null && fullname!.trim().isNotEmpty) return fullname!.trim();
    if (name != null && name!.trim().isNotEmpty) return name!.trim();
    final first = firstName ?? '';
    final last = lastName ?? '';
    final combined = '$first $last'.trim();
    return combined.isNotEmpty ? combined : email.split('@').first;
  }

  String get initials {
    final parts = displayName.split(' ').where((s) => s.isNotEmpty).toList();
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    } else if (parts.isNotEmpty && parts[0].isNotEmpty) {
      return parts[0][0].toUpperCase();
    }
    return 'D';
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
