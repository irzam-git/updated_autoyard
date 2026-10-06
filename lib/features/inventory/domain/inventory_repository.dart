import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/error/failure.dart';
import '../../pickups/domain/models/brand_model.dart';
import '../../pickups/domain/models/paginate_model.dart';
import '../../pickups/domain/models/vehicle_model_option.dart';
import 'models/rego_lookup_result_model.dart';
import 'models/vehicle_model.dart';

part 'inventory_repository.g.dart';

abstract class InventoryRepository {
  Future<Either<Failure, (List<VehicleModel>, PaginateModel)>> getVehicles({
    int page = 1,
    int perPage = 10,
    String? search,
    String? status,
  });

  Future<Either<Failure, VehicleModel>> getVehicleDetail(int id);

  Future<Either<Failure, List<BrandModel>>> getBrands();

  Future<Either<Failure, List<VehicleModelOption>>> getModels(int brandId);

  Future<Either<Failure, RegoLookupResultModel>> lookupVehicleByRego({
    required String regoNumber,
    required String state,
  });

  Future<Either<Failure, RegoLookupResultModel>> decodeVin(String vinNumber);

  Future<Either<Failure, String>> createVehicle({
    required Map<String, dynamic> data,
    String? ownerSignaturePath,
    String? buyerSignaturePath,
  });

  Future<Either<Failure, String>> updateVehicle({
    required int id,
    required Map<String, dynamic> data,
    String? ownerSignaturePath,
    String? buyerSignaturePath,
  });

  Future<Either<Failure, String>> deleteVehicle(int id);

  Future<Either<Failure, String>> bulkDeleteVehicles(List<int> ids);

  Future<Either<Failure, String>> getPurchaseReceiptPdfUrl(int vehicleId);
}

@riverpod
InventoryRepository inventoryRepository(Ref ref) {
  throw UnimplementedError('inventoryRepositoryProvider must be implemented in data layer');
}
