// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthorisationModel _$AuthorisationModelFromJson(Map<String, dynamic> json) =>
    _AuthorisationModel(
      type: json['type'] as String?,
      token: json['token'] as String?,
      expiration: (json['expiration'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AuthorisationModelToJson(_AuthorisationModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'token': instance.token,
      'expiration': instance.expiration,
    };

_AuthDataModel _$AuthDataModelFromJson(Map<String, dynamic> json) =>
    _AuthDataModel(
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      authorisation: json['authorisation'] == null
          ? null
          : AuthorisationModel.fromJson(
              json['authorisation'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$AuthDataModelToJson(_AuthDataModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'authorisation': instance.authorisation,
    };

_AuthResponseModel _$AuthResponseModelFromJson(Map<String, dynamic> json) =>
    _AuthResponseModel(
      error: (json['error'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : AuthDataModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AuthResponseModelToJson(_AuthResponseModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'data': instance.data,
      'message': instance.message,
    };
