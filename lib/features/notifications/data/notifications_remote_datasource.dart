import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/dio_client.dart';
import '../../pickups/domain/models/paginate_model.dart';
import '../domain/models/notification_model.dart';

part 'notifications_remote_datasource.g.dart';

abstract class NotificationsRemoteDataSource {
  Future<({List<NotificationModel> notifications, PaginateModel? paginate})> getNotifications({
    int page = 1,
    int perPage = 15,
  });

  Future<void> markAsRead(String id);

  Future<void> bulkMarkAsRead(List<String> ids);
}

class NotificationsRemoteDataSourceImpl implements NotificationsRemoteDataSource {
  final Dio _dio;

  NotificationsRemoteDataSourceImpl(this._dio);

  @override
  Future<({List<NotificationModel> notifications, PaginateModel? paginate})> getNotifications({
    int page = 1,
    int perPage = 15,
  }) async {
    final response = await _dio.get(
      '/notification',
      queryParameters: {
        'orderby': 'created_at',
        'order': 'DESC',
        'perpage': perPage,
        'page': page,
      },
      options: Options(
        headers: {
          'Accept': 'application/json',
        },
      ),
    );

    final data = response.data as Map<String, dynamic>;
    final rawList = data['data'] as List<dynamic>? ?? [];
    final notifications = rawList
        .map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
        .toList();

    PaginateModel? paginate;
    if (data['paginate'] != null) {
      paginate = PaginateModel.fromJson(data['paginate'] as Map<String, dynamic>);
    }

    return (notifications: notifications, paginate: paginate);
  }

  @override
  Future<void> markAsRead(String id) async {
    await _dio.post(
      '/notification/mark_read/$id',
      options: Options(
        headers: {
          'Accept': 'application/json',
        },
      ),
    );
  }

  @override
  Future<void> bulkMarkAsRead(List<String> ids) async {
    if (ids.isEmpty) return;

    final formData = FormData();
    for (final id in ids) {
      formData.fields.add(MapEntry('ids[]', id));
    }

    await _dio.post(
      '/notification/bulk_mark_read',
      data: formData,
      options: Options(
        headers: {
          'Content-Type': 'multipart/form-data',
          'Accept': 'application/json',
        },
      ),
    );
  }
}

@riverpod
NotificationsRemoteDataSource notificationsRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioClientProvider);
  return NotificationsRemoteDataSourceImpl(dio);
}
