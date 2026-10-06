import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../components/app_bounce.dart';
import '../../../../components/app_button.dart';
import '../../../../components/app_empty_state.dart';
import '../../../../components/app_header.dart';
import '../../../../core/design/app_colors.dart';
import '../../../../core/design/app_spacing.dart';
import '../../../../core/design/app_typography.dart';
import '../../../../core/utils/extensions.dart';
import '../controllers/notifications_controller.dart';
import '../widgets/notification_item_card.dart';

class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({super.key});

  @override
  ConsumerState<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(notificationsControllerProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(notificationsControllerProvider);
    final controller = ref.read(notificationsControllerProvider.notifier);
    final isDark = context.isDarkMode;

    final bgColor = isDark ? AppColors.backgroundDark : AppColors.backgroundLight;
    final textPrimary = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
    final textSecondary = isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;

    final displayedList = state.displayedNotifications;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppHeader(
        title: 'Notifications',
        subtitle: 'Activity & trip updates',
        trailingActions: [
          if (state.unreadCount > 0)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: AppBounce(
                onTap: state.isMarkingAllRead ? null : () => controller.markAllAsRead(),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.25),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (state.isMarkingAllRead)
                        const SizedBox(
                          width: 12,
                          height: 12,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.primary,
                          ),
                        )
                      else
                        const Icon(
                          Icons.done_all_rounded,
                          size: 15,
                          color: AppColors.primary,
                        ),
                      const SizedBox(width: 4),
                      Text(
                        'Mark all read',
                        style: AppTypography.caption.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          // Filter Tabs (All / Unread)
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
            child: Row(
              children: [
                _buildFilterChip(
                  label: 'All (${state.notifications.length})',
                  isSelected: !state.filterUnreadOnly,
                  onTap: () {
                    if (state.filterUnreadOnly) {
                      controller.toggleFilterUnreadOnly();
                    }
                  },
                  isDark: isDark,
                ),
                const SizedBox(width: AppSpacing.sm),
                _buildFilterChip(
                  label: 'Unread (${state.unreadCount})',
                  isSelected: state.filterUnreadOnly,
                  badge: state.unreadCount > 0,
                  onTap: () {
                    if (!state.filterUnreadOnly) {
                      controller.toggleFilterUnreadOnly();
                    }
                  },
                  isDark: isDark,
                ),
              ],
            ),
          ),

          // Notification List / States
          Expanded(
            child: Builder(
              builder: (context) {
                if (state.isLoading && !state.isRefreshing) {
                  return const Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  );
                }

                if (state.errorMessage != null && state.notifications.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.xl),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.error.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.error_outline_rounded,
                              color: AppColors.error,
                              size: 40,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.md),
                          Text(
                            'Failed to load notifications',
                            style: AppTypography.h5.copyWith(
                              fontWeight: FontWeight.bold,
                              color: textPrimary,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            state.errorMessage!,
                            textAlign: TextAlign.center,
                            style: AppTypography.bodyMd.copyWith(
                              color: textSecondary,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          AppButton(
                            label: 'Try Again',
                            icon: const Icon(Icons.refresh_rounded, size: 18, color: Colors.white),
                            onPressed: () => controller.loadNotifications(refresh: true),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                if (displayedList.isEmpty) {
                  return AppEmptyState(
                    title: state.filterUnreadOnly
                        ? 'No Unread Notifications'
                        : 'No Notifications Yet',
                    subtitle: state.filterUnreadOnly
                        ? "You're all caught up! Great job."
                        : 'When trips are assigned or status updates occur, they will appear here.',
                    icon: Icons.notifications_none_rounded,
                  );
                }

                return RefreshIndicator(
                  color: AppColors.primary,
                  onRefresh: () => controller.loadNotifications(refresh: true),
                  child: ListView.builder(
                    controller: _scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.xs, AppSpacing.md, 140),
                    itemCount: displayedList.length + (state.hasMorePages ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == displayedList.length) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        );
                      }

                      final notification = displayedList[index];
                      return NotificationItemCard(
                        notification: notification,
                        onTap: () {
                          if (!notification.isRead) {
                            controller.markAsRead(notification.id);
                          }

                          // Navigation Deep Links
                          if (notification.pickupId != null) {
                            context.push('/pickups/${notification.pickupId}');
                          } else if (notification.vehicleId != null) {
                            context.push('/inventory/${notification.vehicleId}');
                          }
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip({
    required String label,
    required bool isSelected,
    bool badge = false,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    return AppBounce(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          gradient: isSelected ? AppColors.primaryGradient : null,
          color: isSelected
              ? null
              : (isDark ? AppColors.surfaceDark : AppColors.surfaceLight),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? Colors.transparent
                : (isDark ? AppColors.borderDark : AppColors.borderLight),
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  )
                ]
              : null,
        ),
        child: Text(
          label,
          style: AppTypography.caption.copyWith(
            color: isSelected
                ? Colors.white
                : (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight),
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
