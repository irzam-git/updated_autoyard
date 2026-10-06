import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/error/failure.dart';
import '../../pickups/domain/models/paginate_model.dart';
import 'models/notification_model.dart';

part 'notifications_repository.g.dart';

abstract class NotificationsRepository {
  Future<Either<Failure, ({List<NotificationModel> notifications, PaginateModel? paginate})>> getNotifications({
    int page = 1,
    int perPage = 15,
  });

  Future<Either<Failure, void>> markAsRead(String id);

  Future<Either<Failure, void>> bulkMarkAsRead(List<String> ids);
}

@riverpod
NotificationsRepository notificationsRepository(Ref ref) {
  throw UnimplementedError('notificationsRepository must be implemented by data layer');
}
