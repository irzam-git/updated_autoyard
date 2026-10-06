import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/notifications_repository_impl.dart';
import '../../domain/models/notification_model.dart';

part 'notifications_controller.freezed.dart';
part 'notifications_controller.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
abstract class NotificationsState with _$NotificationsState {
  const factory NotificationsState({
    @Default(true) bool isLoading,
    @Default(false) bool isRefreshing,
    @Default(false) bool isMarkingAllRead,
    @Default([]) List<NotificationModel> notifications,
    @Default(1) int currentPage,
    @Default(false) bool hasMorePages,
    @Default(false) bool filterUnreadOnly,
    String? errorMessage,
  }) = _NotificationsState;

  const NotificationsState._();

  int get unreadCount => notifications.where((n) => !n.isRead).length;

  List<NotificationModel> get displayedNotifications {
    if (filterUnreadOnly) {
      return notifications.where((n) => !n.isRead).toList();
    }
    return notifications;
  }
}

@riverpod
class NotificationsController extends _$NotificationsController {
  @override
  NotificationsState build() {
    Future.microtask(() => loadNotifications());
    return const NotificationsState();
  }

  Future<void> loadNotifications({bool refresh = false}) async {
    if (refresh) {
      state = state.copyWith(isRefreshing: true, errorMessage: null);
    } else {
      state = state.copyWith(isLoading: true, errorMessage: null);
    }

    final repo = ref.read(notificationsRepositoryImplProvider);
    final result = await repo.getNotifications(page: 1, perPage: 20);

    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          isRefreshing: false,
          errorMessage: failure.message,
        );
      },
      (data) {
        state = state.copyWith(
          isLoading: false,
          isRefreshing: false,
          notifications: data.notifications,
          currentPage: 1,
          hasMorePages: data.paginate?.hasMorePages ?? false,
          errorMessage: null,
        );
      },
    );
  }

  Future<void> loadMore() async {
    if (state.isLoading || !state.hasMorePages) return;

    final nextPage = state.currentPage + 1;
    final repo = ref.read(notificationsRepositoryImplProvider);
    final result = await repo.getNotifications(page: nextPage, perPage: 20);

    result.fold(
      (failure) => null,
      (data) {
        final merged = [...state.notifications, ...data.notifications];
        state = state.copyWith(
          notifications: merged,
          currentPage: nextPage,
          hasMorePages: data.paginate?.hasMorePages ?? false,
        );
      },
    );
  }

  void toggleFilterUnreadOnly() {
    state = state.copyWith(filterUnreadOnly: !state.filterUnreadOnly);
  }

  Future<void> markAsRead(String id) async {
    // Optimistic UI update
    final updated = state.notifications.map((n) {
      if (n.id == id) {
        return n.copyWith(readAt: DateTime.now().toIso8601String());
      }
      return n;
    }).toList();

    state = state.copyWith(notifications: updated);

    final repo = ref.read(notificationsRepositoryImplProvider);
    await repo.markAsRead(id);
  }

  Future<void> markAllAsRead() async {
    final unreadIds = state.notifications
        .where((n) => !n.isRead)
        .map((n) => n.id)
        .toList();

    if (unreadIds.isEmpty) return;

    state = state.copyWith(isMarkingAllRead: true);

    // Optimistic UI update
    final nowStr = DateTime.now().toIso8601String();
    final updated = state.notifications.map((n) {
      return n.copyWith(readAt: n.readAt ?? nowStr);
    }).toList();

    state = state.copyWith(
      notifications: updated,
      isMarkingAllRead: false,
    );

    final repo = ref.read(notificationsRepositoryImplProvider);
    await repo.bulkMarkAsRead(unreadIds);
  }
}

@riverpod
int unreadNotificationsCount(Ref ref) {
  final state = ref.watch(notificationsControllerProvider);
  return state.unreadCount;
}
