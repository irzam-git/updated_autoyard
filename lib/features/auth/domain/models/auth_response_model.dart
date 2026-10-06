import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_model.dart';

part 'auth_response_model.freezed.dart';
part 'auth_response_model.g.dart';

@freezed
abstract class AuthorisationModel with _$AuthorisationModel {
  const factory AuthorisationModel({
    String? type,
    String? token,
    int? expiration,
  }) = _AuthorisationModel;

  factory AuthorisationModel.fromJson(Map<String, dynamic> json) =>
      _$AuthorisationModelFromJson(json);
}

@freezed
abstract class AuthDataModel with _$AuthDataModel {
  const factory AuthDataModel({
    UserModel? user,
    AuthorisationModel? authorisation,
  }) = _AuthDataModel;

  factory AuthDataModel.fromJson(Map<String, dynamic> json) =>
      _$AuthDataModelFromJson(json);
}

@freezed
abstract class AuthResponseModel with _$AuthResponseModel {
  const factory AuthResponseModel({
    int? error,
    AuthDataModel? data,
    String? message,
  }) = _AuthResponseModel;

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);
}
