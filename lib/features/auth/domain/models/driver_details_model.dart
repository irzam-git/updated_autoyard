import 'package:freezed_annotation/freezed_annotation.dart';

part 'driver_details_model.freezed.dart';
part 'driver_details_model.g.dart';

@freezed
abstract class DriverDetailsModel with _$DriverDetailsModel {
  const factory DriverDetailsModel({
    int? id,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'send_details_to') String? sendDetailsTo,
  }) = _DriverDetailsModel;

  factory DriverDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$DriverDetailsModelFromJson(json);
}
