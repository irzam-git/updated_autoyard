import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/inventory_repository_impl.dart';
import '../../domain/models/vehicle_model.dart';
import '../../../pickups/domain/models/paginate_model.dart';

part 'inventory_controller.freezed.dart';
part 'inventory_controller.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class InventoryState with _$InventoryState {
  const factory InventoryState({
    @Default(true) bool isLoading,
    @Default(false) bool isPaginationLoading,
    @Default(<VehicleModel>[]) List<VehicleModel> vehicles,
    @Default('all') String selectedStatus,
    @Default('') String searchQuery,
    @Default(PaginateModel()) PaginateModel paginate,
    String? errorMessage,
  }) = _InventoryState;
}

@riverpod
class InventoryController extends _$InventoryController {
  @override
  InventoryState build() {
    Future.microtask(() => fetchVehicles(refresh: true));
    return const InventoryState();
  }

  Future<void> fetchVehicles({bool refresh = false}) async {
    final currentPage = refresh ? 1 : state.paginate.currentPage;
    state = state.copyWith(isLoading: refresh, errorMessage: null);

    final repo = ref.read(inventoryRepositoryImplProvider);
    final result = await repo.getVehicles(
      page: currentPage,
      perPage: 10,
      search: state.searchQuery.isNotEmpty ? state.searchQuery : null,
      status: state.selectedStatus,
    );

    state = result.fold(
      (failure) => state.copyWith(
        isLoading: false,
        errorMessage: failure.message,
      ),
      (data) {
        final (items, paginate) = data;
        return state.copyWith(
          isLoading: false,
          vehicles: refresh ? items : [...state.vehicles, ...items],
          paginate: paginate,
          errorMessage: null,
        );
      },
    );
  }

  void changeStatus(String status) {
    if (state.selectedStatus == status) return;
    state = state.copyWith(selectedStatus: status);
    fetchVehicles(refresh: true);
  }

  void search(String query) {
    state = state.copyWith(searchQuery: query);
    fetchVehicles(refresh: true);
  }

  Future<bool> deleteVehicle(int id) async {
    final repo = ref.read(inventoryRepositoryImplProvider);
    final result = await repo.deleteVehicle(id);
    return result.fold(
      (failure) => false,
      (msg) {
        fetchVehicles(refresh: true);
        return true;
      },
    );
  }

  Future<void> loadMore() async {
    if (state.isLoading || state.isPaginationLoading || !state.paginate.hasMorePages) {
      return;
    }

    state = state.copyWith(isPaginationLoading: true);
    final nextPage = state.paginate.currentPage + 1;

    final repo = ref.read(inventoryRepositoryImplProvider);
    final result = await repo.getVehicles(
      page: nextPage,
      perPage: state.paginate.perPage,
      search: state.searchQuery.isNotEmpty ? state.searchQuery : null,
      status: state.selectedStatus,
    );

    state = result.fold(
      (failure) => state.copyWith(isPaginationLoading: false),
      (data) {
        final (items, paginate) = data;
        return state.copyWith(
          isPaginationLoading: false,
          vehicles: [...state.vehicles, ...items],
          paginate: paginate,
        );
      },
    );
  }
}
