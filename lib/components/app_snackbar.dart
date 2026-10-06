import 'package:flutter/material.dart';
import '../core/constants/app_enums.dart';
import '../core/design/app_colors.dart';
import '../core/design/app_radius.dart';
import '../core/design/app_spacing.dart';
import '../core/design/app_typography.dart';

abstract class AppSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    SnackBarType type = SnackBarType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    Color backgroundColor;
    IconData iconData;

    switch (type) {
      case SnackBarType.success:
        backgroundColor = AppColors.success;
        iconData = Icons.check_circle_outline_rounded;
        break;
      case SnackBarType.error:
        backgroundColor = AppColors.error;
        iconData = Icons.error_outline_rounded;
        break;
      case SnackBarType.warning:
        backgroundColor = AppColors.warning;
        iconData = Icons.warning_amber_rounded;
        break;
      case SnackBarType.info:
        backgroundColor = AppColors.info;
        iconData = Icons.info_outline_rounded;
        break;
    }

    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        duration: duration,
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.card),
        margin: const EdgeInsets.all(AppSpacing.md),
        content: Row(
          children: [
            Icon(iconData, color: AppColors.white, size: 22),
            const SizedBox(width: AppSpacing.sm + 2),
            Expanded(
              child: Text(
                message,
                style: AppTypography.bodyMd.copyWith(color: AppColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
