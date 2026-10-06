import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../components/app_bounce.dart';
import '../../../../core/design/app_colors.dart';
import '../../../../core/design/app_radius.dart';
import '../../../../core/design/app_spacing.dart';
import '../../../../core/design/app_typography.dart';
import '../../../../core/utils/extensions.dart';
import 'pickup_date_picker_sheet.dart';
import 'pickup_status_picker_sheet.dart';

class PickupFilterBar extends StatelessWidget {
  final DateTime? selectedDate;
  final String selectedStatus;
  final Set<String> assignedDateStrings;
  final List<Map<String, String>> statusFilters;
  final ValueChanged<DateTime?> onDateChanged;
  final ValueChanged<String> onStatusChanged;
  final VoidCallback? onResetFilters;

  const PickupFilterBar({
    super.key,
    required this.selectedDate,
    required this.selectedStatus,
    required this.assignedDateStrings,
    required this.statusFilters,
    required this.onDateChanged,
    required this.onStatusChanged,
    this.onResetFilters,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final hasDateFilter = selectedDate != null;
    final hasStatusFilter = selectedStatus.toLowerCase() != 'all';
    final hasAnyFilter = hasDateFilter || hasStatusFilter;

    final String dateLabel;
    if (selectedDate == null) {
      dateLabel = 'All Dates';
    } else {
      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final sel = DateTime(selectedDate!.year, selectedDate!.month, selectedDate!.day);
      if (sel == today) {
        dateLabel = 'Today';
      } else if (sel == today.add(const Duration(days: 1))) {
        dateLabel = 'Tomorrow';
      } else {
        dateLabel = DateFormat('MMM d, yyyy').format(selectedDate!);
      }
    }

    final statusFilterObj = statusFilters.firstWhere(
      (f) => f['id']!.toLowerCase() == selectedStatus.toLowerCase(),
      orElse: () => {'id': 'all', 'label': 'All Statuses'},
    );
    final statusLabel = selectedStatus.toLowerCase() == 'all'
        ? 'All Statuses'
        : statusFilterObj['label']!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Non-scrolling 2-column Filter Card row (100% width)
          Row(
            children: [
              // 1. Date Filter Selector Button
              Expanded(
                child: AppBounce(
                  onTap: () {
                    PickupDatePickerSheet.show(
                      context: context,
                      initialDate: selectedDate,
                      assignedDateStrings: assignedDateStrings,
                      onDateSelected: onDateChanged,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: hasDateFilter
                          ? AppColors.primary.withValues(alpha: 0.12)
                          : (isDark ? AppColors.surfaceDark : AppColors.surfaceLight),
                      borderRadius: AppRadius.card,
                      border: Border.all(
                        color: hasDateFilter
                            ? AppColors.primary
                            : (isDark ? AppColors.borderDark : AppColors.borderLight),
                        width: hasDateFilter ? 1.5 : 1,
                      ),
                      boxShadow: hasDateFilter
                          ? [
                              BoxShadow(
                                color: AppColors.primary.withValues(alpha: 0.15),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              )
                            ]
                          : null,
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: hasDateFilter
                                ? AppColors.primary
                                : (isDark
                                    ? AppColors.surfaceLight.withValues(alpha: 0.1)
                                    : AppColors.backgroundLight),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.calendar_month_rounded,
                            size: 16,
                            color: hasDateFilter
                                ? AppColors.white
                                : (isDark
                                    ? AppColors.textSecondaryDark
                                    : AppColors.textSecondaryLight),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'DATE',
                                style: AppTypography.caption.copyWith(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.5,
                                  color: hasDateFilter
                                      ? AppColors.primary
                                      : (isDark
                                          ? AppColors.textTertiaryDark
                                          : AppColors.textTertiaryLight),
                                ),
                              ),
                              const SizedBox(height: 1),
                              Text(
                                dateLabel,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTypography.caption.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: hasDateFilter
                                      ? AppColors.primary
                                      : (isDark
                                          ? AppColors.textPrimaryDark
                                          : AppColors.textPrimaryLight),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (hasDateFilter)
                          GestureDetector(
                            onTap: () => onDateChanged(null),
                            behavior: HitTestBehavior.opaque,
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withValues(alpha: 0.15),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.close_rounded,
                                size: 13,
                                color: AppColors.primary,
                              ),
                            ),
                          )
                        else
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 18,
                            color: isDark
                                ? AppColors.textTertiaryDark
                                : AppColors.textTertiaryLight,
                          ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(width: AppSpacing.sm),

              // 2. Status Filter Selector Button
              Expanded(
                child: AppBounce(
                  onTap: () {
                    PickupStatusPickerSheet.show(
                      context: context,
                      currentStatus: selectedStatus,
                      statusFilters: statusFilters,
                      onStatusSelected: onStatusChanged,
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: hasStatusFilter
                          ? AppColors.primary.withValues(alpha: 0.12)
                          : (isDark ? AppColors.surfaceDark : AppColors.surfaceLight),
                      borderRadius: AppRadius.card,
                      border: Border.all(
                        color: hasStatusFilter
                            ? AppColors.primary
                            : (isDark ? AppColors.borderDark : AppColors.borderLight),
                        width: hasStatusFilter ? 1.5 : 1,
                      ),
                      boxShadow: hasStatusFilter
                          ? [
                              BoxShadow(
                                color: AppColors.primary.withValues(alpha: 0.15),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              )
                            ]
                          : null,
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: hasStatusFilter
                                ? AppColors.primary
                                : (isDark
                                    ? AppColors.surfaceLight.withValues(alpha: 0.1)
                                    : AppColors.backgroundLight),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.filter_list_rounded,
                            size: 16,
                            color: hasStatusFilter
                                ? AppColors.white
                                : (isDark
                                    ? AppColors.textSecondaryDark
                                    : AppColors.textSecondaryLight),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'STATUS',
                                style: AppTypography.caption.copyWith(
                                  fontSize: 9,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.5,
                                  color: hasStatusFilter
                                      ? AppColors.primary
                                      : (isDark
                                          ? AppColors.textTertiaryDark
                                          : AppColors.textTertiaryLight),
                                ),
                              ),
                              const SizedBox(height: 1),
                              Text(
                                statusLabel,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTypography.caption.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: hasStatusFilter
                                      ? AppColors.primary
                                      : (isDark
                                          ? AppColors.textPrimaryDark
                                          : AppColors.textPrimaryLight),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (hasStatusFilter)
                          GestureDetector(
                            onTap: () => onStatusChanged('all'),
                            behavior: HitTestBehavior.opaque,
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withValues(alpha: 0.15),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.close_rounded,
                                size: 13,
                                color: AppColors.primary,
                              ),
                            ),
                          )
                        else
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 18,
                            color: isDark
                                ? AppColors.textTertiaryDark
                                : AppColors.textTertiaryLight,
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Active filter indicator & Clear All button (if any filter is applied)
          if (hasAnyFilter && onResetFilters != null) ...[
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Filtered Pickups',
                      style: AppTypography.caption.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: onResetFilters,
                  child: Text(
                    'Reset all filters',
                    style: AppTypography.caption.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
