import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/design/app_colors.dart';
import '../../../../core/design/app_radius.dart';
import '../../../../core/design/app_spacing.dart';
import '../../../../core/design/app_typography.dart';
import '../../../../core/utils/extensions.dart';

class PickupDatePickerSheet extends StatefulWidget {
  final DateTime? initialDate;
  final Set<String> assignedDateStrings;
  final ValueChanged<DateTime?> onDateSelected;

  const PickupDatePickerSheet({
    super.key,
    required this.initialDate,
    required this.assignedDateStrings,
    required this.onDateSelected,
  });

  static Future<void> show({
    required BuildContext context,
    required DateTime? initialDate,
    required Set<String> assignedDateStrings,
    required ValueChanged<DateTime?> onDateSelected,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (context) => PickupDatePickerSheet(
        initialDate: initialDate,
        assignedDateStrings: assignedDateStrings,
        onDateSelected: onDateSelected,
      ),
    );
  }

  @override
  State<PickupDatePickerSheet> createState() => _PickupDatePickerSheetState();
}

class _PickupDatePickerSheetState extends State<PickupDatePickerSheet> {
  DateTime? _tempSelectedDate;
  late DateTime _currentMonth;

  @override
  void initState() {
    super.initState();
    _tempSelectedDate = widget.initialDate;
    final now = DateTime.now();
    final base = widget.initialDate ?? now;
    _currentMonth = DateTime(base.year, base.month, 1);
  }

  bool _isSameDay(DateTime? a, DateTime? b) {
    if (a == null || b == null) return false;
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  bool _hasAssignedPickup(DateTime date) {
    final key = DateFormat('yyyy-MM-dd').format(date);
    return widget.assignedDateStrings.contains(key);
  }

  void _prevMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1, 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: AppRadius.sheet,
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + AppSpacing.lg,
      ),
      child: SafeArea(
        top: false,
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
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.xs),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Filter by Date',
                        style: AppTypography.h4.copyWith(
                          color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Container(
                            width: 7,
                            height: 7,
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Dates with pickups are highlighted',
                            style: AppTypography.caption.copyWith(
                              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (_tempSelectedDate != null)
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _tempSelectedDate = null;
                        });
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        'Clear',
                        style: AppTypography.label.copyWith(
                          color: AppColors.error,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.xs),

            // Quick Presets
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Row(
                children: [
                  Expanded(
                    child: _buildPresetChip(
                      label: 'All Dates',
                      icon: Icons.all_inclusive_rounded,
                      isSelected: _tempSelectedDate == null,
                      onTap: () => setState(() => _tempSelectedDate = null),
                      isDark: isDark,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Expanded(
                    child: _buildPresetChip(
                      label: 'Today',
                      icon: Icons.today_rounded,
                      isSelected: _isSameDay(_tempSelectedDate, today),
                      hasPickup: _hasAssignedPickup(today),
                      onTap: () {
                        setState(() {
                          _tempSelectedDate = today;
                          _currentMonth = DateTime(today.year, today.month, 1);
                        });
                      },
                      isDark: isDark,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Expanded(
                    child: _buildPresetChip(
                      label: 'Tomorrow',
                      icon: Icons.wb_sunny_outlined,
                      isSelected: _isSameDay(_tempSelectedDate, tomorrow),
                      hasPickup: _hasAssignedPickup(tomorrow),
                      onTap: () {
                        setState(() {
                          _tempSelectedDate = tomorrow;
                          _currentMonth = DateTime(tomorrow.year, tomorrow.month, 1);
                        });
                      },
                      isDark: isDark,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.md),
            Divider(
              height: 1,
              color: isDark ? AppColors.borderDark : AppColors.borderLight,
            ),
            const SizedBox(height: AppSpacing.xs),

            // Month navigation bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: _prevMonth,
                    icon: const Icon(Icons.chevron_left_rounded, size: 28),
                    color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                    tooltip: 'Previous Month',
                  ),
                  Text(
                    DateFormat('MMMM yyyy').format(_currentMonth),
                    style: AppTypography.h5.copyWith(
                      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  IconButton(
                    onPressed: _nextMonth,
                    icon: const Icon(Icons.chevron_right_rounded, size: 28),
                    color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                    tooltip: 'Next Month',
                  ),
                ],
              ),
            ),

            // Weekday headers
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su']
                    .map(
                      (d) => Expanded(
                        child: Center(
                          child: Text(
                            d,
                            style: AppTypography.caption.copyWith(
                              fontWeight: FontWeight.w700,
                              color: isDark ? AppColors.textTertiaryDark : AppColors.textTertiaryLight,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),

            const SizedBox(height: 6),

            // Custom Calendar Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: _buildCalendarGrid(context, isDark, today),
            ),

            const SizedBox(height: AppSpacing.md),

            // Action Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: BorderSide(
                          color: isDark ? AppColors.borderDark : AppColors.borderLight,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: AppRadius.button,
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: AppTypography.button.copyWith(
                          color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        widget.onDateSelected(_tempSelectedDate);
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: AppRadius.button,
                        ),
                      ),
                      child: Text(
                        _tempSelectedDate == null
                            ? 'Show All Dates'
                            : 'Apply (${DateFormat('MMM d').format(_tempSelectedDate!)})',
                        style: AppTypography.button.copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarGrid(BuildContext context, bool isDark, DateTime today) {
    final year = _currentMonth.year;
    final month = _currentMonth.month;
    final firstDayOfMonth = DateTime(year, month, 1);
    final daysInMonth = DateTime(year, month + 1, 0).day;

    // weekday in dart: Monday is 1, Sunday is 7
    final startWeekday = firstDayOfMonth.weekday; // 1 to 7
    final leadingEmptyCells = startWeekday - 1;

    final totalCells = leadingEmptyCells + daysInMonth;
    final totalRows = (totalCells / 7).ceil();

    return Column(
      children: List.generate(totalRows, (rowIndex) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(7, (colIndex) {
              final cellIndex = rowIndex * 7 + colIndex;
              final dayNumber = cellIndex - leadingEmptyCells + 1;

              if (dayNumber < 1 || dayNumber > daysInMonth) {
                return const Expanded(child: SizedBox(height: 38));
              }

              final cellDate = DateTime(year, month, dayNumber);
              final isSelected = _isSameDay(_tempSelectedDate, cellDate);
              final isToday = _isSameDay(cellDate, today);
              final hasPickup = _hasAssignedPickup(cellDate);

              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _tempSelectedDate = cellDate;
                    });
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Center(
                    child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected
                            ? AppColors.primary
                            : (hasPickup
                                ? AppColors.primary.withValues(alpha: 0.12)
                                : Colors.transparent),
                        border: isToday && !isSelected
                            ? Border.all(color: AppColors.primary, width: 1.5)
                            : (hasPickup && !isSelected
                                ? Border.all(color: AppColors.primary.withValues(alpha: 0.35), width: 1)
                                : null),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            '$dayNumber',
                            style: AppTypography.bodyMd.copyWith(
                              fontSize: 13,
                              fontWeight: isSelected || isToday || hasPickup
                                  ? FontWeight.w700
                                  : FontWeight.w400,
                              color: isSelected
                                  ? AppColors.white
                                  : (hasPickup
                                      ? AppColors.primary
                                      : (isDark
                                          ? AppColors.textPrimaryDark
                                          : AppColors.textPrimaryLight)),
                            ),
                          ),
                          // Highlight indicator dot for dates with pickups
                          if (hasPickup)
                            Positioned(
                              bottom: 4,
                              child: Container(
                                width: 4.5,
                                height: 4.5,
                                decoration: BoxDecoration(
                                  color: isSelected ? AppColors.white : AppColors.primary,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      }),
    );
  }

  Widget _buildPresetChip({
    required String label,
    required IconData icon,
    required bool isSelected,
    bool hasPickup = false,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary
              : (hasPickup
                  ? AppColors.primary.withValues(alpha: 0.08)
                  : (isDark ? AppColors.backgroundDark : AppColors.backgroundLight)),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : (hasPickup
                    ? AppColors.primary.withValues(alpha: 0.4)
                    : (isDark ? AppColors.borderDark : AppColors.borderLight)),
            width: isSelected || hasPickup ? 1.2 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 14,
              color: isSelected
                  ? AppColors.white
                  : (hasPickup
                      ? AppColors.primary
                      : (isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
            ),
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.caption.copyWith(
                  fontWeight: isSelected || hasPickup ? FontWeight.w700 : FontWeight.w500,
                  color: isSelected
                      ? AppColors.white
                      : (hasPickup
                          ? AppColors.primary
                          : (isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight)),
                ),
              ),
            ),
            if (hasPickup && !isSelected) ...[
              const SizedBox(width: 3),
              Container(
                width: 5,
                height: 5,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
