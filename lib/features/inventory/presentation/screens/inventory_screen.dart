import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../components/app_bounce.dart';
import '../../../../components/app_button.dart';
import '../../../../components/app_empty_state.dart';
import '../../../../components/app_header.dart';
import '../../../../core/constants/app_enums.dart';
import '../../../../core/design/app_colors.dart';
import '../../../../core/design/app_radius.dart';
import '../../../../core/design/app_spacing.dart';
import '../../../../core/design/app_typography.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/utils/extensions.dart';
import '../controllers/inventory_controller.dart';
import '../widgets/inventory_status_picker_sheet.dart';
import '../widgets/vehicle_inventory_card.dart';

class InventoryScreen extends ConsumerStatefulWidget {
  const InventoryScreen({super.key});

  @override
  ConsumerState<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends ConsumerState<InventoryScreen> {
  final _searchController = TextEditingController();
  bool _showSearch = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final state = ref.watch(inventoryControllerProvider);
    final controller = ref.read(inventoryControllerProvider.notifier);

    final statusFilters = [
      {
        'id': 'all',
        'label': 'All Statuses',
        'icon': Icons.grid_view_rounded,
        'color': AppColors.primary,
      },
      {
        'id': 'in-stock',
        'label': 'In Stock',
        'icon': Icons.inventory_2_outlined,
        'color': AppColors.info,
      },
      {
        'id': 'car-for-sell',
        'label': 'For Sale',
        'icon': Icons.sell_outlined,
        'color': AppColors.success,
      },
      {
        'id': 'sold',
        'label': 'Sold',
        'icon': Icons.check_circle_outline_rounded,
        'color': AppColors.primary,
      },
      {
        'id': 'disposed',
        'label': 'Disposed',
        'icon': Icons.delete_outline_rounded,
        'color': AppColors.textSecondaryLight,
      },
    ];

    final hasStatusFilter = state.selectedStatus.toLowerCase() != 'all';
    final activeFilterObj = statusFilters.firstWhere(
      (f) => (f['id'] as String).toLowerCase() == state.selectedStatus.toLowerCase(),
      orElse: () => statusFilters.first,
    );

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      appBar: AppHeader(
        title: 'Vehicle Inventory',
        subtitle: 'Purchased fleet & stock',
        trailingActions: [
          // 1. Search toggle button
          AppBounce(
            onTap: () {
              setState(() {
                _showSearch = !_showSearch;
                if (!_showSearch) {
                  _searchController.clear();
                  controller.search('');
                }
              });
            },
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: _showSearch
                    ? AppColors.primary.withValues(alpha: 0.12)
                    : (isDark ? AppColors.cardDark : AppColors.backgroundLight),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _showSearch
                      ? AppColors.primary.withValues(alpha: 0.3)
                      : (isDark ? AppColors.borderDark : AppColors.borderLight),
                ),
              ),
              child: Icon(
                _showSearch ? Icons.search_off_rounded : Icons.search_rounded,
                size: 19,
                color: _showSearch
                    ? AppColors.primary
                    : (isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.xs),

          // 2. Filter on-demand trigger button
          AppBounce(
            onTap: () => InventoryStatusPickerSheet.show(
              context: context,
              currentStatus: state.selectedStatus,
              statusFilters: statusFilters,
              onStatusSelected: (status) => controller.changeStatus(status),
            ),
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: hasStatusFilter
                    ? AppColors.primary.withValues(alpha: 0.15)
                    : (isDark ? AppColors.cardDark : AppColors.backgroundLight),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: hasStatusFilter
                      ? AppColors.primary
                      : (isDark ? AppColors.borderDark : AppColors.borderLight),
                  width: hasStatusFilter ? 1.4 : 1.0,
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.tune_rounded,
                    size: 19,
                    color: hasStatusFilter
                        ? AppColors.primary
                        : (isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight),
                  ),
                  if (hasStatusFilter)
                    Positioned(
                      top: 7,
                      right: 7,
                      child: Container(
                        width: 7,
                        height: 7,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.xs),

          // 3. Add Car Action Button
          AppBounce(
            onTap: () => context.push(AppRoutes.createVehicle),
            child: Container(
              height: 38,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.32),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.add_rounded, color: AppColors.white, size: 18),
                  const SizedBox(width: 4),
                  Text(
                    'Add Car',
                    style: AppTypography.labelLg.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // 1. Search Bar (if active)
          if (_showSearch)
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.sm,
                AppSpacing.md,
                AppSpacing.xs,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.surfaceDark
                      : AppColors.surfaceLight,
                  borderRadius: AppRadius.input,
                  border: Border.all(
                    color: isDark
                        ? AppColors.borderDark
                        : AppColors.borderLight,
                    width: 1.2,
                  ),
                  boxShadow: isDark
                      ? null
                      : [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                ),
                child: TextField(
                  controller: _searchController,
                  autofocus: true,
                  style: AppTypography.bodyMd.copyWith(
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Search Rego, VIN, Brand, Model, Seller...',
                    hintStyle: AppTypography.bodySm.copyWith(
                      color: isDark
                          ? AppColors.textTertiaryDark
                          : AppColors.textTertiaryLight,
                    ),
                    prefixIcon: const Icon(
                      Icons.search_rounded,
                      size: 20,
                      color: AppColors.primary,
                    ),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear_rounded, size: 18),
                            onPressed: () {
                              _searchController.clear();
                              controller.search('');
                            },
                          )
                        : null,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.md,
                      vertical: 12,
                    ),
                  ),
                  onSubmitted: (query) => controller.search(query),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      controller.search('');
                    }
                  },
                ),
              ),
            ),

          // 2. Active Filter Indicator Banner (only shown when a filter is applied)
          if (hasStatusFilter)
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                AppSpacing.xs,
                AppSpacing.md,
                AppSpacing.xs,
              ),
              child: Row(
                children: [
                  AppBounce(
                    onTap: () => InventoryStatusPickerSheet.show(
                      context: context,
                      currentStatus: state.selectedStatus,
                      statusFilters: statusFilters,
                      onStatusSelected: (status) => controller.changeStatus(status),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.10),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.primary.withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            (activeFilterObj['icon'] as IconData?) ??
                                Icons.filter_list_rounded,
                            size: 14,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Status: ${activeFilterObj['label']}',
                            style: AppTypography.caption.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(width: 6),
                          GestureDetector(
                            onTap: () => controller.changeStatus('all'),
                            child: const Icon(
                              Icons.close_rounded,
                              size: 15,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => controller.changeStatus('all'),
                    child: Text(
                      'Clear filter',
                      style: AppTypography.caption.copyWith(
                        color: isDark
                            ? AppColors.textTertiaryDark
                            : AppColors.textTertiaryLight,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          // 3. Main List
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
                onRefresh: () => controller.fetchVehicles(refresh: true),
                child: _buildListContent(context, state, controller, isDark),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListContent(
    BuildContext context,
    InventoryState state,
    InventoryController controller,
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
            Text('Loading inventory...'),
          ],
        ),
      );
    }

    if (state.errorMessage != null && state.vehicles.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline_rounded,
                size: 48,
                color: AppColors.error,
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Unable to Load Inventory',
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
                onPressed: () => controller.fetchVehicles(refresh: true),
              ),
            ],
          ),
        ),
      );
    }

    if (state.vehicles.isEmpty) {
      return ListView(
        children: const [
          SizedBox(height: 80),
          AppEmptyState(
            title: 'No Vehicles Found',
            subtitle: 'You have not added any vehicles yet or no records match your filter.',
            icon: Icons.directions_car_outlined,
          ),
        ],
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.sm,
        AppSpacing.md,
        100,
      ),
      itemCount: state.vehicles.length + (state.isPaginationLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == state.vehicles.length) {
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

        final vehicle = state.vehicles[index];
        return VehicleInventoryCard(
          vehicle: vehicle,
          onTap: () {
            context.push('${AppRoutes.inventory}/${vehicle.id}');
          },
          onViewReceipt: () {
            context.push('${AppRoutes.inventory}/${vehicle.id}/receipt');
          },
        );
      },
    );
  }
}
