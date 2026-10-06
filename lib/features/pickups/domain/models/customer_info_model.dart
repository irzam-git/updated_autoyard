import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_info_model.freezed.dart';
part 'customer_info_model.g.dart';

@freezed
abstract class CustomerInfoModel with _$CustomerInfoModel {
  const factory CustomerInfoModel({
    int? id,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? fullname,
    String? username,
    String? email,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'profile_image_url') String? profileImageUrl,
  }) = _CustomerInfoModel;

  const CustomerInfoModel._();

  String get displayName {
    if (fullname != null && fullname!.trim().isNotEmpty) return fullname!.trim();
    final first = firstName ?? '';
    final last = lastName ?? '';
    final combined = '$first $last'.trim();
    return combined.isNotEmpty ? combined : (email ?? 'Customer');
  }

  factory CustomerInfoModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerInfoModelFromJson(json);
}
