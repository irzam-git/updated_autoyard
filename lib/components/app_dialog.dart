import 'package:flutter/material.dart';
import '../core/constants/app_enums.dart';
import '../core/design/app_colors.dart';
import '../core/design/app_radius.dart';
import '../core/design/app_spacing.dart';
import '../core/design/app_typography.dart';
import '../core/utils/extensions.dart';
import 'app_button.dart';

abstract class AppDialog {
  static Future<T?> show<T>(
    BuildContext context, {
    required String title,
    required String message,
    String confirmLabel = 'OK',
    String? cancelLabel,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool isDestructive = false,
  }) {
    final isDark = context.isDarkMode;

    return showDialog<T>(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      builder: (ctx) => Dialog(
        backgroundColor: isDark ? AppColors.cardDark : AppColors.surfaceLight,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.dialog),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: (isDestructive ? AppColors.error : AppColors.primary)
                          .withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isDestructive ? Icons.warning_amber_rounded : Icons.info_outline_rounded,
                      color: isDestructive ? AppColors.error : AppColors.primary,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Text(
                      title,
                      style: AppTypography.h4.copyWith(
                        fontWeight: FontWeight.w700,
                        color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                message,
                style: AppTypography.bodyMd.copyWith(
                  color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (cancelLabel != null) ...[
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      ),
                      onPressed: () {
                        Navigator.of(ctx).pop();
                        onCancel?.call();
                      },
                      child: Text(
                        cancelLabel,
                        style: AppTypography.button.copyWith(
                          color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                  ],
                  AppButton(
                    label: confirmLabel,
                    height: 44,
                    variant: isDestructive ? ButtonVariant.danger : ButtonVariant.primary,
                    onPressed: () {
                      Navigator.of(ctx).pop();
                      onConfirm?.call();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
