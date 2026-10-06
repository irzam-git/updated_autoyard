import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../components/app_button.dart';
import '../../../../components/app_empty_state.dart';
import '../../../../components/app_header.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/design/app_colors.dart';
import '../../../../core/design/app_spacing.dart';
import '../../../../core/design/app_typography.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/utils/extensions.dart';
import '../controllers/assigned_pickups_controller.dart';

import 'package:intl/intl.dart';

import '../widgets/pickup_card.dart';
import '../widgets/pickup_filter_bar.dart';

class AssignedPickupsScreen extends ConsumerWidget {
  const AssignedPickupsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = context.isDarkMode;
    final state = ref.watch(assignedPickupsControllerProvider);
    final controller = ref.read(assignedPickupsControllerProvider.notifier);

    final statusFilters = [
      {'id': 'all', 'label': 'All'},
      {'id': 'pending', 'label': 'Pending'},
      {'id': 'accepted', 'label': 'Accepted'},
      {'id': 'in transit', 'label': 'In Transit'},
      {'id': 'completed', 'label': 'Completed'},
      {'id': 'cancelled', 'label': 'Cancelled'},
    ];

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      appBar: const AppHeader(
        title: 'Assigned Pickups',
        subtitle: 'Scheduled vehicle collections',
      ),
      body: Column(
        children: [
          const SizedBox(height: AppSpacing.sm),
          // Non-scrolling Unified Date & Status Filter Bar
          PickupFilterBar(
            selectedDate: state.selectedDate,
            selectedStatus: state.selectedStatus,
            assignedDateStrings: state.assignedDateStrings,
            statusFilters: statusFilters,
            onDateChanged: (date) => controller.changeDate(date),
            onStatusChanged: (status) => controller.changeStatus(status),
            onResetFilters: () => controller.resetFilters(),
          ),
          const SizedBox(height: AppSpacing.sm),

          // 3. Main Content / List Area
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollInfo) {
                if (scrollInfo.metrics.pixels >=
                    scrollInfo.metrics.maxScrollExtent - 200) {
                  controller.loadMore();
                }
                return false;
              },
              child: RefreshIndicator(
                color: AppColors.primary,
                onRefresh: () => controller.fetchPickups(refresh: true),
                child: _buildListContent(
                  context,
                  ref,
                  state,
                  controller,
                  isDark,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListContent(
    BuildContext context,
    WidgetRef ref,
    AssignedPickupsState state,
    AssignedPickupsController controller,
    bool isDark,
  ) {
    if (state.isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 32,
              height: 32,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: AppSpacing.md),
            Text('Loading assigned pickups...'),
          ],
        ),
      );
    }

    if (state.errorMessage != null && state.pickups.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.error_outline_rounded,
                  size: 48,
                  color: AppColors.error,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Unable to Load Pickups',
                style: AppTypography.h4.copyWith(
                  color: isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                state.errorMessage!,
                textAlign: TextAlign.center,
                style: AppTypography.bodySm.copyWith(
                  color: isDark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              AppButton(
                label: 'Try Again',
                variant: ButtonVariant.secondary,
                onPressed: () => controller.fetchPickups(refresh: true),
              ),
            ],
          ),
        ),
      );
    }

    final filteredPickups = state.selectedDate == null
        ? state.pickups
        : state.pickups.where((p) {
            if (p.pickupDate == null || p.pickupDate!.trim().isEmpty) {
              return false;
            }
            final datePart = p.pickupDate!.trim().split(' ').first;
            final target = DateFormat('yyyy-MM-dd').format(state.selectedDate!);
            return datePart == target;
          }).toList();

    if (filteredPickups.isEmpty) {
      return ListView(
        children: const [
          SizedBox(height: 80),
          AppEmptyState(
            title: 'No Assigned Pickups',
            subtitle: 'There are no assigned vehicle pickups matching the selected date or filter.',
            icon: Icons.local_shipping_outlined,
          ),
        ],
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.sm,
        AppSpacing.md,
        110,
      ),
      itemCount: filteredPickups.length + (state.isPaginationLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == filteredPickups.length) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
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

        final pickup = filteredPickups[index];
        return PickupCard(
          pickup: pickup,
          onTap: () {
            context.push('${AppRoutes.pickups}/${pickup.id}');
          },
        );
      },
    );
  }
}
