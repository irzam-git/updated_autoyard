import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
abstract class NotificationDataModel with _$NotificationDataModel {
  const factory NotificationDataModel({
    String? title,
    String? url,
    String? message,
  }) = _NotificationDataModel;

  factory NotificationDataModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataModelFromJson(json);
}

@freezed
abstract class NotificationModel with _$NotificationModel {
  const factory NotificationModel({
    required String id,
    String? type,
    @JsonKey(name: 'notifiable_type') String? notifiableType,
    @JsonKey(name: 'notifiable_id') int? notifiableId,
    NotificationDataModel? data,
    @JsonKey(name: 'read_at') String? readAt,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _NotificationModel;

  const NotificationModel._();

  bool get isRead => readAt != null && readAt!.isNotEmpty;

  String get displayTitle => data?.title ?? 'Notification';

  String get displayMessage => data?.message ?? '';

  int? get pickupId {
    final u = data?.url;
    if (u != null && u.contains('assigned_vehicle/')) {
      final segments = u.split('assigned_vehicle/');
      if (segments.length > 1) {
        final rawId = segments[1].split('/')[0].split('?')[0];
        return int.tryParse(rawId);
      }
    }
    return null;
  }

  int? get vehicleId {
    final u = data?.url;
    if (u != null && !u.contains('assigned_vehicle') && u.contains('vehicle/')) {
      final segments = u.split('vehicle/');
      if (segments.length > 1) {
        final rawId = segments[1].split('/')[0].split('?')[0];
        return int.tryParse(rawId);
      }
    }
    return null;
  }

  String get timeAgo {
    if (createdAt == null || createdAt!.isEmpty) return '';
    try {
      final parsed = DateTime.parse(createdAt!).toLocal();
      final diff = DateTime.now().difference(parsed);

      if (diff.inSeconds < 60) return 'Just now';
      if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
      if (diff.inHours < 24) return '${diff.inHours}h ago';
      if (diff.inDays == 1) return 'Yesterday';
      if (diff.inDays < 7) return '${diff.inDays}d ago';

      return '${parsed.day}/${parsed.month}/${parsed.year}';
    } catch (_) {
      return createdAt!;
    }
  }

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
