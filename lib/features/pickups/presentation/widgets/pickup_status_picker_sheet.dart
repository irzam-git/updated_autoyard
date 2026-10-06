import 'package:flutter/material.dart';
import '../../../../core/design/app_colors.dart';
import '../../../../core/design/app_radius.dart';
import '../../../../core/design/app_spacing.dart';
import '../../../../core/design/app_typography.dart';
import '../../../../core/utils/extensions.dart';
import 'pickup_status_badge.dart';

class PickupStatusPickerSheet extends StatelessWidget {
  final String currentStatus;
  final List<Map<String, String>> statusFilters;
  final ValueChanged<String> onStatusSelected;

  const PickupStatusPickerSheet({
    super.key,
    required this.currentStatus,
    required this.statusFilters,
    required this.onStatusSelected,
  });

  static Future<void> show({
    required BuildContext context,
    required String currentStatus,
    required List<Map<String, String>> statusFilters,
    required ValueChanged<String> onStatusSelected,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (context) => PickupStatusPickerSheet(
        currentStatus: currentStatus,
        statusFilters: statusFilters,
        onStatusSelected: onStatusSelected,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: AppRadius.sheet,
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + AppSpacing.md,
      ),
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Drag handle
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: AppSpacing.sm, bottom: AppSpacing.xs),
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.borderDark : AppColors.borderLight,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),

            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
              child: Text(
                'Filter by Status',
                style: AppTypography.h4.copyWith(
                  color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ),
              ),
            ),

            const SizedBox(height: AppSpacing.xs),

            // Status List Items
            ...statusFilters.map((filter) {
              final isAll = filter['id'] == 'all';
              final isSelected = currentStatus.toLowerCase() == filter['id']!.toLowerCase();

              return InkWell(
                onTap: () {
                  onStatusSelected(filter['id']!);
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: 14),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primary.withValues(alpha: 0.08)
                        : Colors.transparent,
                    border: Border(
                      bottom: BorderSide(
                        color: isDark
                            ? AppColors.borderDark.withValues(alpha: 0.5)
                            : AppColors.borderLight.withValues(alpha: 0.5),
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      if (isAll) ...[
                        Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primary
                                : (isDark ? AppColors.surfaceLight.withValues(alpha: 0.1) : AppColors.borderLight),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.all_inclusive_rounded,
                            size: 16,
                            color: isSelected
                                ? AppColors.white
                                : (isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: Text(
                            'All Statuses',
                            style: AppTypography.bodyLg.copyWith(
                              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                              color: isSelected
                                  ? AppColors.primary
                                  : (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight),
                            ),
                          ),
                        ),
                      ] else ...[
                        PickupStatusBadge(status: filter['id']!),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: Text(
                            filter['label']!,
                            style: AppTypography.bodyLg.copyWith(
                              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                              color: isSelected
                                  ? AppColors.primary
                                  : (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight),
                            ),
                          ),
                        ),
                      ],
                      if (isSelected)
                        const Icon(
                          Icons.check_circle_rounded,
                          color: AppColors.primary,
                          size: 22,
                        ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
      ),
    );
  }
}
