import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/error/failure.dart';
import '../domain/models/assigned_pickup_model.dart';
import '../domain/models/paginate_model.dart';
import '../domain/pickups_repository.dart';
import 'pickups_remote_datasource.dart';

part 'pickups_repository_impl.g.dart';

class PickupsRepositoryImpl implements PickupsRepository {
  final PickupsRemoteDataSource _remoteDataSource;

  PickupsRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, (List<AssignedPickupModel>, PaginateModel)>> getAssignedPickups({
    int page = 1,
    int perPage = 10,
    String? date,
    String? status,
    String? search,
  }) async {
    try {
      final result = await _remoteDataSource.getAssignedPickups(
        page: page,
        perPage: perPage,
        date: date,
        status: status,
        search: search,
      );
      return Right(result);
    } on DioException catch (e) {
      return Left(Failure.fromDioException(e));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AssignedPickupModel>> getPickupDetail(int id) async {
    try {
      final result = await _remoteDataSource.getPickupDetail(id);
      return Right(result);
    } on DioException catch (e) {
      return Left(Failure.fromDioException(e));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AssignedPickupModel>> updatePickupStatus({
    required int id,
    required String status,
    String? driverNote,
  }) async {
    try {
      final result = await _remoteDataSource.updatePickupStatus(
        id: id,
        status: status,
        driverNote: driverNote,
      );
      return Right(result);
    } on DioException catch (e) {
      return Left(Failure.fromDioException(e));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }
}

@riverpod
PickupsRepositoryImpl pickupsRepositoryImpl(Ref ref) {
  final remote = ref.watch(pickupsRemoteDataSourceProvider);
  return PickupsRepositoryImpl(remote);
}
