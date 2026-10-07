import 'package:flutter/material.dart';
import '../../../../components/app_bounce.dart';
import '../../../../core/design/app_colors.dart';
import '../../../../core/design/app_radius.dart';
import '../../../../core/design/app_spacing.dart';
import '../../../../core/design/app_typography.dart';
import '../../../../core/utils/extensions.dart';

class InventoryStatusPickerSheet extends StatelessWidget {
  final String currentStatus;
  final List<Map<String, dynamic>> statusFilters;
  final ValueChanged<String> onStatusSelected;

  const InventoryStatusPickerSheet({
    super.key,
    required this.currentStatus,
    required this.statusFilters,
    required this.onStatusSelected,
  });

  static Future<void> show({
    required BuildContext context,
    required String currentStatus,
    required List<Map<String, dynamic>> statusFilters,
    required ValueChanged<String> onStatusSelected,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (context) => InventoryStatusPickerSheet(
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
                  margin: const EdgeInsets.only(
                    top: AppSpacing.sm,
                    bottom: AppSpacing.xs,
                  ),
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: isDark
                        ? AppColors.borderDark
                        : AppColors.borderLight,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),

              // Header
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.sm,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Filter Inventory',
                      style: AppTypography.h4.copyWith(
                        fontWeight: FontWeight.w700,
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ),
                    ),
                    if (currentStatus.toLowerCase() != 'all')
                      AppBounce(
                        onTap: () {
                          onStatusSelected('all');
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Reset',
                          style: AppTypography.caption.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              const SizedBox(height: AppSpacing.xs),

              // Status List Items
              ...statusFilters.map((filter) {
                final id = filter['id'] as String;
                final label = filter['label'] as String;
                final icon = (filter['icon'] as IconData?) ?? Icons.label_outline_rounded;
                final color = (filter['color'] as Color?) ?? AppColors.primary;
                final isSelected = currentStatus.toLowerCase() == id.toLowerCase();

                return InkWell(
                  onTap: () {
                    onStatusSelected(id);
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.lg,
                      vertical: 14,
                    ),
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
                        Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primary
                                : color.withValues(alpha: 0.12),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            icon,
                            size: 18,
                            color: isSelected ? AppColors.white : color,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: Text(
                            label,
                            style: AppTypography.bodyLg.copyWith(
                              fontWeight: isSelected
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                              color: isSelected
                                  ? AppColors.primary
                                  : (isDark
                                      ? AppColors.textPrimaryDark
                                      : AppColors.textPrimaryLight),
                            ),
                          ),
                        ),
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
              const SizedBox(height: AppSpacing.sm),
            ],
          ),
        ),
      ),
    );
  }
}
