import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/network/dio_client.dart';
import '../domain/models/assigned_pickup_model.dart';
import '../domain/models/paginate_model.dart';

part 'pickups_remote_datasource.g.dart';

abstract class PickupsRemoteDataSource {
  Future<(List<AssignedPickupModel>, PaginateModel)> getAssignedPickups({
    int page = 1,
    int perPage = 10,
    String? date,
    String? status,
    String? search,
  });

  Future<AssignedPickupModel> getPickupDetail(int id);

  Future<AssignedPickupModel> updatePickupStatus({
    required int id,
    required String status,
    String? driverNote,
  });
}

class PickupsRemoteDataSourceImpl implements PickupsRemoteDataSource {
  final Dio _dio;

  PickupsRemoteDataSourceImpl(this._dio);

  @override
  Future<(List<AssignedPickupModel>, PaginateModel)> getAssignedPickups({
    int page = 1,
    int perPage = 10,
    String? date,
    String? status,
    String? search,
  }) async {
    final queryParams = <String, dynamic>{
      'orderby': 'id',
      'order': 'DESC',
      'page': page,
      'perpage': perPage,
    };

    if (date != null && date.isNotEmpty) {
      queryParams['date'] = date;
    }
    if (status != null && status.isNotEmpty && status.toLowerCase() != 'all') {
      queryParams['status'] = status.toLowerCase();
    }
    if (search != null && search.trim().isNotEmpty) {
      queryParams['search'] = search.trim();
    }

    final response = await _dio.get(
      '/assign_vehicle',
      queryParameters: queryParams,
      options: Options(
        headers: {
          'Accept': 'application/json',
        },
      ),
    );

    final data = response.data as Map<String, dynamic>;
    final itemsJson = (data['data'] as List<dynamic>?) ?? [];
    final items = itemsJson
        .map((item) => AssignedPickupModel.fromJson(item as Map<String, dynamic>))
        .toList();

    PaginateModel paginate = const PaginateModel();
    if (data['paginate'] != null && data['paginate'] is Map<String, dynamic>) {
      paginate = PaginateModel.fromJson(data['paginate'] as Map<String, dynamic>);
    }

    return (items, paginate);
  }

  @override
  Future<AssignedPickupModel> getPickupDetail(int id) async {
    final response = await _dio.get(
      '/assign_vehicle/$id',
      options: Options(
        headers: {
          'Accept': 'application/json',
        },
      ),
    );

    final data = response.data as Map<String, dynamic>;
    final itemJson = data['data'] as Map<String, dynamic>?;
    if (itemJson != null) {
      return AssignedPickupModel.fromJson(itemJson);
    }
    throw DioException(
      requestOptions: response.requestOptions,
      response: response,
      type: DioExceptionType.badResponse,
      error: 'Pickup assignment details not found',
    );
  }

  @override
  Future<AssignedPickupModel> updatePickupStatus({
    required int id,
    required String status,
    String? driverNote,
  }) async {
    final bodyMap = <String, dynamic>{
      'status': status.toLowerCase(),
    };
    if (driverNote != null && driverNote.trim().isNotEmpty) {
      bodyMap['driver_note'] = driverNote.trim();
    }

    final formData = FormData.fromMap(bodyMap);

    final response = await _dio.post(
      '/assign_vehicle/status/$id',
      data: formData,
      options: Options(
        headers: {
          'Content-Type': 'multipart/form-data',
          'Accept': 'application/json',
        },
      ),
    );

    final data = response.data as Map<String, dynamic>;
    final itemJson = data['data'] as Map<String, dynamic>?;
    if (itemJson != null) {
      return AssignedPickupModel.fromJson(itemJson);
    }
    throw DioException(
      requestOptions: response.requestOptions,
      response: response,
      type: DioExceptionType.badResponse,
      error: data['message'] ?? 'Failed to update pickup status',
    );
  }
}

@riverpod
PickupsRemoteDataSource pickupsRemoteDataSource(Ref ref) {
  final dio = ref.watch(dioClientProvider);
  return PickupsRemoteDataSourceImpl(dio);
}
