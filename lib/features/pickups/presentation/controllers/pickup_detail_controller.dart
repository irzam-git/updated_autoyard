import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/pickups_repository_impl.dart';
import '../../domain/models/assigned_pickup_model.dart';
import 'assigned_pickups_controller.dart';

part 'pickup_detail_controller.freezed.dart';
part 'pickup_detail_controller.g.dart';

@freezed
abstract class PickupDetailState with _$PickupDetailState {
  const factory PickupDetailState({
    @Default(true) bool isLoading,
    @Default(false) bool isUpdatingStatus,
    AssignedPickupModel? pickup,
    String? errorMessage,
    String? successMessage,
  }) = _PickupDetailState;
}

@riverpod
class PickupDetailController extends _$PickupDetailController {
  @override
  PickupDetailState build(int pickupId) {
    Future.microtask(() => fetchDetail(pickupId));
    return const PickupDetailState();
  }

  Future<void> fetchDetail(int id) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    final repo = ref.read(pickupsRepositoryImplProvider);
    final result = await repo.getPickupDetail(id);

    state = result.fold(
      (failure) => state.copyWith(
        isLoading: false,
        errorMessage: failure.message,
      ),
      (pickup) => state.copyWith(
        isLoading: false,
        pickup: pickup,
        errorMessage: null,
      ),
    );
  }

  Future<bool> updateStatus(String newStatus, {String? driverNote}) async {
    final current = state.pickup;
    if (current == null) return false;

    state = state.copyWith(isUpdatingStatus: true, errorMessage: null, successMessage: null);
    final repo = ref.read(pickupsRepositoryImplProvider);
    final result = await repo.updatePickupStatus(
      id: current.id,
      status: newStatus,
      driverNote: driverNote,
    );

    return result.fold(
      (failure) {
        state = state.copyWith(
          isUpdatingStatus: false,
          errorMessage: failure.message,
        );
        return false;
      },
      (updatedPickup) {
        state = state.copyWith(
          isUpdatingStatus: false,
          pickup: updatedPickup,
          successMessage: 'Pickup status updated to ${newStatus.toUpperCase()}',
        );
        // Also refresh list in the background
        ref.read(assignedPickupsControllerProvider.notifier).fetchPickups(refresh: true);
        return true;
      },
    );
  }
}
