import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/error/failure.dart';
import '../../pickups/domain/models/paginate_model.dart';
import '../domain/models/notification_model.dart';
import '../domain/notifications_repository.dart';
import 'notifications_remote_datasource.dart';

part 'notifications_repository_impl.g.dart';

class NotificationsRepositoryImpl implements NotificationsRepository {
  final NotificationsRemoteDataSource _remoteDataSource;

  NotificationsRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, ({List<NotificationModel> notifications, PaginateModel? paginate})>> getNotifications({
    int page = 1,
    int perPage = 15,
  }) async {
    try {
      final result = await _remoteDataSource.getNotifications(
        page: page,
        perPage: perPage,
      );
      return Right(result);
    } on DioException catch (e) {
      return Left(Failure.fromDioException(e));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> markAsRead(String id) async {
    try {
      await _remoteDataSource.markAsRead(id);
      return const Right(null);
    } on DioException catch (e) {
      return Left(Failure.fromDioException(e));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> bulkMarkAsRead(List<String> ids) async {
    try {
      await _remoteDataSource.bulkMarkAsRead(ids);
      return const Right(null);
    } on DioException catch (e) {
      return Left(Failure.fromDioException(e));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }
}

@riverpod
NotificationsRepository notificationsRepositoryImpl(Ref ref) {
  final remote = ref.watch(notificationsRemoteDataSourceProvider);
  return NotificationsRepositoryImpl(remote);
}
