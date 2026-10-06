import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/inventory_repository_impl.dart';
import '../../domain/models/vehicle_model.dart';
import 'inventory_controller.dart';

part 'vehicle_detail_controller.freezed.dart';
part 'vehicle_detail_controller.g.dart';

@freezed
abstract class VehicleDetailState with _$VehicleDetailState {
  const factory VehicleDetailState({
    @Default(true) bool isLoading,
    @Default(false) bool isDeleting,
    VehicleModel? vehicle,
    String? errorMessage,
    String? successMessage,
  }) = _VehicleDetailState;
}

@riverpod
class VehicleDetailController extends _$VehicleDetailController {
  @override
  VehicleDetailState build(int vehicleId) {
    Future.microtask(() => fetchDetail(vehicleId));
    return const VehicleDetailState();
  }

  Future<void> fetchDetail(int id) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    final repo = ref.read(inventoryRepositoryImplProvider);
    final result = await repo.getVehicleDetail(id);

    state = result.fold(
      (failure) => state.copyWith(
        isLoading: false,
        errorMessage: failure.message,
      ),
      (vehicle) => state.copyWith(
        isLoading: false,
        vehicle: vehicle,
        errorMessage: null,
      ),
    );
  }

  Future<bool> deleteVehicle() async {
    final v = state.vehicle;
    if (v == null) return false;

    state = state.copyWith(isDeleting: true);
    final repo = ref.read(inventoryRepositoryImplProvider);
    final result = await repo.deleteVehicle(v.id);

    return result.fold(
      (failure) {
        state = state.copyWith(
          isDeleting: false,
          errorMessage: failure.message,
        );
        return false;
      },
      (msg) {
        state = state.copyWith(
          isDeleting: false,
          successMessage: 'Vehicle #${v.id} deleted successfully',
        );
        ref.read(inventoryControllerProvider.notifier).fetchVehicles(refresh: true);
        return true;
      },
    );
  }
}
