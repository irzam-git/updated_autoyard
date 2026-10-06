// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationDataModel _$NotificationDataModelFromJson(
  Map<String, dynamic> json,
) => _NotificationDataModel(
  title: json['title'] as String?,
  url: json['url'] as String?,
  message: json['message'] as String?,
);

Map<String, dynamic> _$NotificationDataModelToJson(
  _NotificationDataModel instance,
) => <String, dynamic>{
  'title': instance.title,
  'url': instance.url,
  'message': instance.message,
};

_NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    _NotificationModel(
      id: json['id'] as String,
      type: json['type'] as String?,
      notifiableType: json['notifiable_type'] as String?,
      notifiableId: (json['notifiable_id'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : NotificationDataModel.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
      readAt: json['read_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$NotificationModelToJson(_NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'notifiable_type': instance.notifiableType,
      'notifiable_id': instance.notifiableId,
      'data': instance.data,
      'read_at': instance.readAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
