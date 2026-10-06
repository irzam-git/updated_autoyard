import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/dio_client.dart';
import '../../pickups/domain/models/brand_model.dart';
import '../../pickups/domain/models/paginate_model.dart';
import '../../pickups/domain/models/vehicle_model_option.dart';
import '../domain/models/rego_lookup_result_model.dart';
import '../domain/models/vehicle_model.dart';

part 'inventory_remote_datasource.g.dart';

abstract class InventoryRemoteDataSource {
  Future<(List<VehicleModel>, PaginateModel)> getVehicles({
    int page = 1,
    int perPage = 10,
    String? search,
    String? status,
  });

  Future<VehicleModel> getVehicleDetail(int id);
  Future<List<BrandModel>> getBrands();
  Future<List<VehicleModelOption>> getModels(int brandId);
  Future<RegoLookupResultModel> lookupVehicleByRego({
    required String regoNumber,
    required String state,
  });
  Future<RegoLookupResultModel> decodeVin(String vinNumber);
  Future<String> createVehicle({
    required Map<String, dynamic> data,
    String? ownerSignaturePath,
    String? buyerSignaturePath,
  });
  Future<String> updateVehicle({
    required int id,
    required Map<String, dynamic> data,
    String? ownerSignaturePath,
    String? buyerSignaturePath,
  });
  Future<String> deleteVehicle(int id);
  Future<String> bulkDeleteVehicles(List<int> ids);
  Future<String> getPurchaseReceiptPdfUrl(int vehicleId);
}

class InventoryRemoteDataSourceImpl implements InventoryRemoteDataSource {
  final Dio _dio;

  InventoryRemoteDataSourceImpl(this._dio);

  @override
  Future<(List<VehicleModel>, PaginateModel)> getVehicles({
    int page = 1,
    int perPage = 10,
    String? search,
    String? status,
  }) async {
    final queryParams = <String, dynamic>{
      'orderby': 'id',
      'order': 'DESC',
      'page': page,
      'perpage': perPage,
    };

    if (search != null && search.trim().isNotEmpty) {
      queryParams['search'] = search.trim();
    }
    if (status != null && status.isNotEmpty && status.toLowerCase() != 'all') {
      queryParams['status'] = status.toLowerCase();
    }

    final response = await _dio.get(
      '/vehicle',
      queryParameters: queryParams,
      options: Options(headers: {'Accept': 'application/json'}),
    );

    final data = response.data as Map<String, dynamic>;
    final list = (data['data'] as List<dynamic>?) ?? [];
    final items = list
        .map((e) => VehicleModel.fromJson(e as Map<String, dynamic>))
        .toList();

    PaginateModel paginate = const PaginateModel();
    if (data['paginate'] != null && data['paginate'] is Map<String, dynamic>) {
      paginate = PaginateModel.fromJson(data['paginate'] as Map<String, dynamic>);
    }

    return (items, paginate);
  }

  @override
  Future<VehicleModel> getVehicleDetail(int id) async {
    final response = await _dio.get(
      '/vehicle/$id',
      options: Options(headers: {'Accept': 'application/json'}),
    );

    final data = response.data as Map<String, dynamic>;
    final itemJson = data['data'] as Map<String, dynamic>?;
    if (itemJson != null) {
      return VehicleModel.fromJson(itemJson);
    }
    throw DioException(
      requestOptions: response.requestOptions,
      response: response,
      type: DioExceptionType.badResponse,
      error: 'Vehicle details not found',
    );
  }

  @override
  Future<List<BrandModel>> getBrands() async {
    final response = await _dio.get(
      '/brand',
      queryParameters: {'status': 'active'},
      options: Options(headers: {'Accept': 'application/json'}),
    );

    final data = response.data as Map<String, dynamic>;
    final list = (data['data'] as List<dynamic>?) ?? [];
    return list.map((e) => BrandModel.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<List<VehicleModelOption>> getModels(int brandId) async {
    final response = await _dio.get(
      '/model',
      queryParameters: {'status': 'active', 'brand': brandId},
      options: Options(headers: {'Accept': 'application/json'}),
    );

    final data = response.data as Map<String, dynamic>;
    final list = (data['data'] as List<dynamic>?) ?? [];
    return list.map((e) => VehicleModelOption.fromJson(e as Map<String, dynamic>)).toList();
  }

  @override
  Future<RegoLookupResultModel> lookupVehicleByRego({
    required String state,
    required String regoNumber,
  }) async {
    try {
      final response = await _dio.get(
        '/vehicle/search-vehicle-details',
        queryParameters: {
          'registration_state': state.toUpperCase(),
          'registration_number': regoNumber.trim().toUpperCase(),
        },
        options: Options(headers: {'Accept': 'application/json'}),
      );

      final data = response.data as Map<String, dynamic>;
      final resultData = data['data'];
      if (resultData is Map<String, dynamic>) {
        final brandObj = resultData['brand'];
        final modelObj = resultData['model'];
        final brandId = brandObj is Map ? (brandObj['id'] as num?)?.toInt() : null;
        final brandName = brandObj is Map ? brandObj['name'] as String? : null;
        final modelId = modelObj is Map ? (modelObj['id'] as num?)?.toInt() : null;
        final modelName = modelObj is Map ? modelObj['name'] as String? : null;

        return RegoLookupResultModel(
          vin: resultData['vin_number'] as String? ?? resultData['vin'] as String?,
          make: brandName ?? resultData['make'] as String?,
          model: modelName ?? resultData['model_name'] as String?,
          brandId: brandId,
          modelId: modelId,
          year: resultData['year']?.toString(),
          registrationNumber: resultData['registration_number'] as String? ?? regoNumber.trim().toUpperCase(),
          registrationState: resultData['registration_state'] as String? ?? state.toUpperCase(),
          bodyType: (resultData['body_type'] ?? resultData['body_style']) as String?,
          engineNumber: resultData['engine_number'] as String?,
          engineSize: resultData['engine_size'] as String?,
          variant: resultData['variant'] as String?,
          transmission: resultData['transmission'] as String?,
        );
      }
    } catch (_) {
      // Fallback to /vehicle/vehicle-details
    }

    final response = await _dio.get(
      '/vehicle/vehicle-details',
      queryParameters: {
        'registration_state': state.toUpperCase(),
        'registration_number': regoNumber.trim().toUpperCase(),
      },
      options: Options(headers: {'Accept': 'application/json'}),
    );

    final data = response.data as Map<String, dynamic>;
    final result = data['data']?['result'];
    if (result is List<dynamic> && result.isNotEmpty) {
      final first = result.first as Map<String, dynamic>;
      return RegoLookupResultModel(
        vin: first['vin'] as String?,
        chassis: first['chassis'] as String?,
        make: first['make'] as String?,
        model: first['model'] as String?,
        colour: first['colour'] as String?,
        bodyType: (first['body_type'] ?? first['body_style']) as String?,
        vehicleType: first['vehicle_type'] as String?,
        engineNumber: (first['engine_number'] ?? first['engine']?['number']) as String?,
        registrationNumber: regoNumber.trim().toUpperCase(),
        registrationState: state.toUpperCase(),
      );
    } else if (result is Map<String, dynamic>) {
      return RegoLookupResultModel(
        vin: result['vin'] as String?,
        chassis: result['chassis'] as String?,
        make: result['make'] as String?,
        model: result['model'] as String?,
        colour: result['colour'] as String?,
        bodyType: (result['body_type'] ?? result['body_style']) as String?,
        vehicleType: result['vehicle_type'] as String?,
        engineNumber: (result['engine_number'] ?? result['engine']?['number']) as String?,
        registrationNumber: regoNumber.trim().toUpperCase(),
        registrationState: state.toUpperCase(),
      );
    }
    throw DioException(
      requestOptions: response.requestOptions,
      response: response,
      type: DioExceptionType.badResponse,
      error: 'No vehicle records found for $regoNumber ($state)',
    );
  }

  @override
  Future<RegoLookupResultModel> decodeVin(String vinNumber) async {
    final response = await _dio.get(
      '/vehicle/vin-decoder',
      queryParameters: {
        'vin_number': vinNumber.trim().toUpperCase(),
      },
      options: Options(headers: {'Accept': 'application/json'}),
    );

    final data = response.data as Map<String, dynamic>;
    final result = data['data']?['result'];
    Map<String, dynamic>? item;
    if (result is Map<String, dynamic>) {
      item = result;
    } else if (result is List<dynamic> && result.isNotEmpty) {
      item = result.first as Map<String, dynamic>;
    }

    if (item != null) {
      // Extract engine size
      String? engineSize = item['engine_size'] as String?;
      if (engineSize == null || engineSize.isEmpty) {
        final engineObj = item['engine'];
        if (engineObj is Map) {
          final litres = engineObj['size_litres'];
          if (litres != null) {
            engineSize = '${litres}L';
          }
        }
      }

      // Extract transmission
      String? transmission;
      if (item['transmission'] is String) {
        transmission = item['transmission'] as String?;
      } else if (item['transmission'] is Map) {
        transmission = item['transmission']['type'] as String?;
      }

      // Extract year
      final yearVal = item['year'] ?? item['build_year'] ?? item['model_year'];
      final yearStr = yearVal?.toString();

      // Extract engine number
      String? engNum = item['engine_number'] as String?;
      if (engNum == null && item['engine'] is Map) {
        engNum = item['engine']['number'] as String?;
      }

      return RegoLookupResultModel(
        vin: (item['vin'] as String?) ?? (item['vin_number'] as String?) ?? vinNumber.trim().toUpperCase(),
        chassis: item['chassis'] as String?,
        make: item['make'] as String?,
        model: item['model'] as String?,
        colour: item['colour'] as String?,
        bodyType: (item['body_type'] ?? item['body_style']) as String?,
        vehicleType: item['vehicle_type'] as String?,
        engineNumber: engNum,
        engineSize: engineSize,
        year: yearStr,
        variant: item['variant'] as String?,
        transmission: transmission,
      );
    }
    throw DioException(
      requestOptions: response.requestOptions,
      response: response,
      type: DioExceptionType.badResponse,
      error: 'No vehicle records found for VIN $vinNumber',
    );
  }

  @override
  Future<String> createVehicle({
    required Map<String, dynamic> data,
    String? ownerSignaturePath,
    String? buyerSignaturePath,
  }) async {
    final map = Map<String, dynamic>.from(data);
    if (ownerSignaturePath != null && ownerSignaturePath.isNotEmpty) {
      map['owner_signature'] = await MultipartFile.fromFile(
        ownerSignaturePath,
        filename: 'owner_signature.png',
      );
    }
    if (buyerSignaturePath != null && buyerSignaturePath.isNotEmpty) {
      map['buyer_signature'] = await MultipartFile.fromFile(
        buyerSignaturePath,
        filename: 'buyer_signature.png',
      );
    }

    final formData = FormData.fromMap(map);

    final response = await _dio.post(
      '/vehicle/create',
      data: formData,
      options: Options(
        headers: {
          'Content-Type': 'multipart/form-data',
          'Accept': 'application/json',
        },
      ),
    );

    final respData = response.data as Map<String, dynamic>;
    return (respData['message'] as String?) ?? 'Vehicle created successfully!';
  }

  @override
  Future<String> updateVehicle({
    required int id,
    required Map<String, dynamic> data,
    String? ownerSignaturePath,
    String? buyerSignaturePath,
  }) async {
    final map = Map<String, dynamic>.from(data);
    if (ownerSignaturePath != null && ownerSignaturePath.isNotEmpty) {
      map['owner_signature'] = await MultipartFile.fromFile(
        ownerSignaturePath,
        filename: 'owner_signature.png',
      );
    }
    if (buyerSignaturePath != null && buyerSignaturePath.isNotEmpty) {
      map['buyer_signature'] = await MultipartFile.fromFile(
        buyerSignaturePath,
        filename: 'buyer_signature.png',
      );
    }

    final formData = FormData.fromMap(map);

    final response = await _dio.post(
      '/vehicle/update/$id',
      data: formData,
      options: Options(
        headers: {
          'Content-Type': 'multipart/form-data',
          'Accept': 'application/json',
        },
      ),
    );

    final respData = response.data as Map<String, dynamic>;
    return (respData['message'] as String?) ?? 'Vehicle updated successfully!';
  }

  @override
  Future<String> deleteVehicle(int id) async {
    final response = await _dio.post(
      '/vehicle/delete/$id',
      options: Options(headers: {'Accept': 'application/json'}),
    );

    final data = response.data as Map<String, dynamic>;
    return (data['message'] as String?) ?? 'Vehicle deleted';
  }

  @override
  Future<String> bulkDeleteVehicles(List<int> ids) async {
    if (ids.isEmpty) return 'No vehicles selected';

    final formData = FormData();
    for (final id in ids) {
      formData.fields.add(MapEntry('ids[]', id.toString()));
    }

    final response = await _dio.post(
      '/vehicle/bulk_delete',
      data: formData,
      options: Options(
        headers: {
          'Content-Type': 'multipart/form-data',
          'Accept': 'application/json',
        },
      ),
    );

    final data = response.data as Map<String, dynamic>;
    return (data['message'] as String?) ?? 'Vehicles deleted';
  }

  @override
  Future<String> getPurchaseReceiptPdfUrl(int vehicleId) async {
    final response = await _dio.get(
      '/vehicle/purchase_receipt/$vehicleId',
      options: Options(headers: {'Accept': 'application/json'}),
    );

    final data = response.data as Map<String, dynamic>;
    final receiptUrl = data['data']?['receipt_url'] as String?;
    if (receiptUrl != null && receiptUrl.isNotEmpty) {
      return receiptUrl;
    }
    throw DioException(
      requestOptions: response.requestOptions,
      response: response,
      type: DioExceptionType.badResponse,
      error: 'Receipt PDF URL could not be generated',
    );
  }
}

@riverpod
InventoryRemoteDataSource inventoryRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioClientProvider);
  return InventoryRemoteDataSourceImpl(dio);
}
