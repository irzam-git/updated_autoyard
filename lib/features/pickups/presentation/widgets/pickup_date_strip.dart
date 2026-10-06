import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/design/app_colors.dart';
import '../../../../core/design/app_radius.dart';
import '../../../../core/design/app_spacing.dart';
import '../../../../core/design/app_typography.dart';
import '../../../../core/utils/extensions.dart';

class PickupDateStrip extends StatelessWidget {
  final DateTime? selectedDate;
  final ValueChanged<DateTime?> onDateSelected;

  const PickupDateStrip({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    // Past 7 days to next 14 days
    final dates = List.generate(22, (index) {
      return today.add(Duration(days: index - 7));
    });

    return SizedBox(
      height: 72,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        itemCount: dates.length + 1,
        separatorBuilder: (context, index) => const SizedBox(width: AppSpacing.xs),
        itemBuilder: (context, index) {
          if (index == 0) {
            // "All Dates" Pill
            final isAllSelected = selectedDate == null;
            return GestureDetector(
              onTap: () => onDateSelected(null),
              child: Container(
                width: 60,
                decoration: BoxDecoration(
                  color: isAllSelected
                      ? AppColors.primary
                      : (isDark ? AppColors.surfaceDark : AppColors.surfaceLight),
                  borderRadius: AppRadius.card,
                  border: Border.all(
                    color: isAllSelected
                        ? AppColors.primary
                        : (isDark ? AppColors.borderDark : AppColors.borderLight),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.all_inclusive_rounded,
                      size: 20,
                      color: isAllSelected
                          ? AppColors.white
                          : (isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'All',
                      style: AppTypography.caption.copyWith(
                        fontWeight: FontWeight.w700,
                        color: isAllSelected
                            ? AppColors.white
                            : (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          final date = dates[index - 1];
          final isSelected = selectedDate != null &&
              selectedDate!.year == date.year &&
              selectedDate!.month == date.month &&
              selectedDate!.day == date.day;
          final isToday = date.year == today.year &&
              date.month == today.month &&
              date.day == today.day;

          return GestureDetector(
            onTap: () => onDateSelected(date),
            child: Container(
              width: 54,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary
                    : (isDark ? AppColors.surfaceDark : AppColors.surfaceLight),
                borderRadius: AppRadius.card,
                border: Border.all(
                  color: isSelected
                      ? AppColors.primary
                      : (isToday
                          ? AppColors.primary.withValues(alpha: 0.5)
                          : (isDark ? AppColors.borderDark : AppColors.borderLight)),
                  width: isToday && !isSelected ? 1.5 : 1,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isToday ? 'TODAY' : DateFormat('E').format(date).toUpperCase(),
                    style: AppTypography.caption.copyWith(
                      fontSize: 10,
                      fontWeight: isToday ? FontWeight.w800 : FontWeight.w600,
                      color: isSelected
                          ? AppColors.white.withValues(alpha: 0.9)
                          : (isToday
                              ? AppColors.primary
                              : (isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight)),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat('d').format(date),
                    style: AppTypography.h5.copyWith(
                      fontWeight: FontWeight.w700,
                      color: isSelected
                          ? AppColors.white
                          : (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
