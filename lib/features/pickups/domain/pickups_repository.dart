import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/error/failure.dart';
import 'models/assigned_pickup_model.dart';
import 'models/paginate_model.dart';

part 'pickups_repository.g.dart';

abstract class PickupsRepository {
  Future<Either<Failure, (List<AssignedPickupModel>, PaginateModel)>> getAssignedPickups({
    int page = 1,
    int perPage = 10,
    String? date,
    String? status,
    String? search,
  });

  Future<Either<Failure, AssignedPickupModel>> getPickupDetail(int id);

  Future<Either<Failure, AssignedPickupModel>> updatePickupStatus({
    required int id,
    required String status,
    String? driverNote,
  });
}

@riverpod
PickupsRepository pickupsRepository(Ref ref) {
  throw UnimplementedError('pickupsRepositoryProvider must be implemented in data layer');
}
