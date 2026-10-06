import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/error/failure.dart';
import '../../pickups/domain/models/brand_model.dart';
import '../../pickups/domain/models/paginate_model.dart';
import '../../pickups/domain/models/vehicle_model_option.dart';
import '../domain/inventory_repository.dart';
import '../domain/models/rego_lookup_result_model.dart';
import '../domain/models/vehicle_model.dart';
import 'inventory_remote_datasource.dart';

part 'inventory_repository_impl.g.dart';

class InventoryRepositoryImpl implements InventoryRepository {
  final InventoryRemoteDataSource _remoteDataSource;

  InventoryRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, (List<VehicleModel>, PaginateModel)>> getVehicles({
    int page = 1,
    int perPage = 10,
    String? search,
    String? status,
  }) async {
    try {
      final result = await _remoteDataSource.getVehicles(
        page: page,
        perPage: perPage,
        search: search,
        status: status,
      );
      return Right(result);
    } on DioException catch (e) {
      return Left(Failure.fromDioException(e));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, VehicleModel>> getVehicleDetail(int id) async {
    try {
      final result = await _remoteDataSource.getVehicleDetail(id);
      return Right(result);
    } on DioException catch (e) {
      return Left(Failure.fromDioException(e));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BrandModel>>> getBrands() async {
    try {
      final result = await _remoteDataSource.getBrands();
      return Right(result);
    } on DioException catch (e) {
      return Left(Failure.fromDioException(e));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<VehicleModelOption>>> getModels(int brandId) async {
    try {
      final result = await _remoteDataSource.getModels(brandId);
      return Right(result);
    } on DioException catch (e) {
      return Left(Failure.fromDioException(e));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RegoLookupResultModel>> lookupVehicleByRego({
    required String regoNumber,
    required String state,
  }) async {
    try {
      final result = await _remoteDataSource.lookupVehicleByRego(
        regoNumber: regoNumber,
        state: state,
      );
      return Right(result);
    } on DioException catch (e) {
      return Left(Failure.fromDioException(e));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, RegoLookupResultModel>> decodeVin(String vinNumber) async {
    try {
      final result = await _remoteDataSource.decodeVin(vinNumber);
      return Right(result);
    } on DioException catch (e) {
      return Left(Failure.fromDioException(e));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> createVehicle({
    required Map<String, dynamic> data,
    String? ownerSignaturePath,
    String? buyerSignaturePath,
  }) async {
    try {
      final result = await _remoteDataSource.createVehicle(
        data: data,
        ownerSignaturePath: ownerSignaturePath,
        buyerSignaturePath: buyerSignaturePath,
      );
      return Right(result);
    } on DioException catch (e) {
      return Left(Failure.fromDioException(e));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updateVehicle({
    required int id,
    required Map<String, dynamic> data,
    String? ownerSignaturePath,
    String? buyerSignaturePath,
  }) async {
    try {
      final result = await _remoteDataSource.updateVehicle(
        id: id,
        data: data,
        ownerSignaturePath: ownerSignaturePath,
        buyerSignaturePath: buyerSignaturePath,
      );
      return Right(result);
    } on DioException catch (e) {
      return Left(Failure.fromDioException(e));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteVehicle(int id) async {
    try {
      final result = await _remoteDataSource.deleteVehicle(id);
      return Right(result);
    } on DioException catch (e) {
      return Left(Failure.fromDioException(e));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> bulkDeleteVehicles(List<int> ids) async {
    try {
      final result = await _remoteDataSource.bulkDeleteVehicles(ids);
      return Right(result);
    } on DioException catch (e) {
      return Left(Failure.fromDioException(e));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getPurchaseReceiptPdfUrl(int vehicleId) async {
    try {
      final result = await _remoteDataSource.getPurchaseReceiptPdfUrl(vehicleId);
      return Right(result);
    } on DioException catch (e) {
      return Left(Failure.fromDioException(e));
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }
}

@riverpod
InventoryRepositoryImpl inventoryRepositoryImpl(Ref ref) {
  final remote = ref.watch(inventoryRemoteDataSourceProvider);
  return InventoryRepositoryImpl(remote);
}
