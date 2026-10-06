import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/pickups_repository_impl.dart';
import '../../domain/models/assigned_pickup_model.dart';
import '../../domain/models/paginate_model.dart';

part 'assigned_pickups_controller.freezed.dart';
part 'assigned_pickups_controller.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class AssignedPickupsState with _$AssignedPickupsState {
  const factory AssignedPickupsState({
    @Default(true) bool isLoading,
    @Default(false) bool isPaginationLoading,
    @Default(<AssignedPickupModel>[]) List<AssignedPickupModel> pickups,
    DateTime? selectedDate,
    @Default('all') String selectedStatus,
    @Default('') String searchQuery,
    @Default(PaginateModel()) PaginateModel paginate,
    @Default(<String>{}) Set<String> assignedDateStrings,
    String? errorMessage,
  }) = _AssignedPickupsState;
}

@riverpod
class AssignedPickupsController extends _$AssignedPickupsController {
  @override
  AssignedPickupsState build() {
    // Initial fetch on build
    Future.microtask(() {
      fetchPickups(refresh: true);
      _fetchAssignedDatesOverview();
    });
    return const AssignedPickupsState(
      selectedDate: null,
    );
  }

  Future<void> _fetchAssignedDatesOverview() async {
    try {
      final repo = ref.read(pickupsRepositoryImplProvider);
      final result = await repo.getAssignedPickups(
        page: 1,
        perPage: 50,
      );
      result.fold((_) {}, (data) {
        final (items, _) = data;
        final dates = <String>{...state.assignedDateStrings};
        for (final item in items) {
          if (item.pickupDate != null && item.pickupDate!.trim().isNotEmpty) {
            final datePart = item.pickupDate!.trim().split(' ').first;
            dates.add(datePart);
          }
        }
        state = state.copyWith(assignedDateStrings: dates);
      });
    } catch (_) {}
  }

  Future<void> fetchPickups({bool refresh = false}) async {
    final currentPage = refresh ? 1 : state.paginate.currentPage;
    state = state.copyWith(
      isLoading: refresh,
      errorMessage: null,
    );

    final repo = ref.read(pickupsRepositoryImplProvider);
    final result = await repo.getAssignedPickups(
      page: currentPage,
      perPage: 30,
      status: state.selectedStatus,
      search: state.searchQuery.isNotEmpty ? state.searchQuery : null,
    );

    state = result.fold(
      (failure) => state.copyWith(
        isLoading: false,
        errorMessage: failure.message,
      ),
      (data) {
        final (items, paginate) = data;
        final dates = <String>{...state.assignedDateStrings};
        for (final item in items) {
          if (item.pickupDate != null && item.pickupDate!.trim().isNotEmpty) {
            final datePart = item.pickupDate!.trim().split(' ').first;
            dates.add(datePart);
          }
        }
        return state.copyWith(
          isLoading: false,
          pickups: refresh ? items : [...state.pickups, ...items],
          paginate: paginate,
          assignedDateStrings: dates,
          errorMessage: null,
        );
      },
    );
  }

  void resetFilters() {
    state = state.copyWith(
      selectedDate: null,
      selectedStatus: 'all',
      searchQuery: '',
    );
    fetchPickups(refresh: true);
  }

  void changeDate(DateTime? date) {
    if (state.selectedDate == date) {
      // Toggle off if clicking the same date
      state = state.copyWith(selectedDate: null);
    } else {
      state = state.copyWith(selectedDate: date);
    }
  }

  void changeStatus(String status) {
    if (state.selectedStatus == status) return;
    state = state.copyWith(selectedStatus: status);
    fetchPickups(refresh: true);
  }

  void setSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
    fetchPickups(refresh: true);
  }

  Future<void> loadMore() async {
    if (state.isLoading || state.isPaginationLoading || !state.paginate.hasMorePages) {
      return;
    }

    state = state.copyWith(isPaginationLoading: true);

    final nextPage = state.paginate.currentPage + 1;
    final repo = ref.read(pickupsRepositoryImplProvider);
    final result = await repo.getAssignedPickups(
      page: nextPage,
      perPage: state.paginate.perPage,
      status: state.selectedStatus,
      search: state.searchQuery.isNotEmpty ? state.searchQuery : null,
    );

    state = result.fold(
      (failure) => state.copyWith(isPaginationLoading: false),
      (data) {
        final (items, paginate) = data;
        final dates = <String>{...state.assignedDateStrings};
        for (final item in items) {
          if (item.pickupDate != null && item.pickupDate!.trim().isNotEmpty) {
            final datePart = item.pickupDate!.trim().split(' ').first;
            dates.add(datePart);
          }
        }
        return state.copyWith(
          isPaginationLoading: false,
          pickups: [...state.pickups, ...items],
          paginate: paginate,
          assignedDateStrings: dates,
        );
      },
    );
  }
}
